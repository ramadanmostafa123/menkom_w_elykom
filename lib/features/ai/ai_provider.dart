import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mekom_w_elykom/features/home/home.dart';
import 'package:tflite_v2/tflite_v2.dart';

class AiProvider extends ChangeNotifier {
  final ImagePicker _picker = ImagePicker();
  String name = "";
  double ratio = 0.0;
  XFile? image;
  File? file;
  Timer? timer;
  TextEditingController controller = TextEditingController();
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

      GlobalKey<FormState> get formKey => _formKey;

  // ignore: prefer_typing_uninitialized_variables
  var recognitions;


TextEditingController get controllerText => controller;
  void startTimerAndNavigate(BuildContext context) {
    timer = Timer(const Duration(seconds: 3), () {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return const Home();
      }));
    });
  }

  Future<void> pickImageFromGallery() async {
    try {
      final XFile? image = await _picker.pickImage(source: ImageSource.gallery);

      this.image = image;
      file = File(image!.path);
      notifyListeners();
      detectimage(file!);
    } catch (e) {
      // print('Error picking image: $e');
    }
  }

  Future detectimage(File image) async {
    int startTime = DateTime.now().millisecondsSinceEpoch;
    var recognitions = await Tflite.runModelOnImage(
      path: image.path,
      // numResults: 6,
      numResults: 2,
      threshold: .2,
      //threshold: 0.05,
      imageMean: 0.0,
      imageStd: 255.0,
      // imageMean: 127.5,
      // imageStd: 127.5,
      asynch: false,
    );

    this.recognitions = recognitions;
    notifyListeners();
    // v = recognitions.toString();

    print("User Recognitions:");

    for (var recognition in recognitions!) {
      name = recognition['label'] ?? 'not found';
      ratio = recognition['confidence'] ?? 0.0;

      String label = recognition['label'] ?? 'not found';
      double confidence = recognition['confidence'] ?? 0.0;

      print(
          "  - Label: $label \n (Confidence: ${confidence.toStringAsFixed(2)})");
      print('dddddddddddddddddddd');
      print("  - name: $name (ratio: ${ratio.toStringAsFixed(2)})");
    }

    print("//////////////////////////////////////////////////");
    int endTime = DateTime.now().millisecondsSinceEpoch;
    print("Inference took ${endTime - startTime}ms");
  }

  Future<void> pickImageFromCamera() async {
    try {
      final XFile? image = await _picker.pickImage(source: ImageSource.camera);

      this.image = image;
      file = File(image!.path);
      notifyListeners();
      detectimage(file!);
    } catch (e) {
      //print('Error picking image: $e');
    }
  }
}
