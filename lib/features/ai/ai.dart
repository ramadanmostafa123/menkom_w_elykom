import 'dart:io';

import 'package:flutter/material.dart';
import 'package:mekom_w_elykom/core/extensions/num_extensions.dart';
import 'package:mekom_w_elykom/core/helpers/spacing.dart';
import 'package:mekom_w_elykom/core/routing/routes.dart';
import 'package:mekom_w_elykom/core/theming/text_styles.dart';
import 'package:mekom_w_elykom/core/widgets/text_bottom_with_icon.dart';
import 'package:mekom_w_elykom/features/ai/ai_provider.dart';
import 'package:mekom_w_elykom/features/ai/widgets/image_processing.dart';
import 'package:mekom_w_elykom/features/ai/widgets/pick_image_bottom.dart';
import 'package:mekom_w_elykom/features/ai/widgets/product_weight.dart';
import 'package:provider/provider.dart';
import 'package:tflite_v2/tflite_v2.dart';

class ImageRecognizer extends StatefulWidget {
  const ImageRecognizer({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ImageRecognizer createState() => _ImageRecognizer();
}

class _ImageRecognizer extends State<ImageRecognizer> {
  @override
  void initState() {
    super.initState();
    loadmodel().then((value) {
      setState(() {});
    });
  }

  loadmodel() async {
    await Tflite.loadModel(
      model: "assets/ai/model_unquant.tflite",
      labels: "assets/ai/labels.txt",
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        title: const Text(''),
      ),
      body: Consumer<AiProvider>(builder: (context, ai, child) {
        return Padding(
          padding: const EdgeInsets.all(12.0),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  const ProductWeight(),
                  verticalSpace(50),
                  if (ai.image != null)
                    Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: const Offset(
                                0, 5), // changes position of shadow
                          )
                        ],
                        borderRadius: BorderRadius.circular(20.r),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20.r),
                        child: Image.file(
                          File(ai.image!.path),
                          height: 200.h,
                          width: 200.w,
                          fit: BoxFit.cover,
                        ),
                      ),
                    )
                  else
                    SizedBox(
                      height: 200.h,
                      child: Center(
                        child: Text(
                          'قم بتصوير المخلفات أو ارفق صورة المخلفات من الجهاز',
                          style: AppTextstyles.textFamilyMadaniSize12Weight400,
                        ),
                      ),
                    ),
                  verticalSpace(50),
                  const PickImageBotttoms(),
                  verticalSpace(50),
                  if (ai.recognitions != null)
                    Align(
                      alignment: Alignment.centerLeft,
                      child: AppTextButtonWithIcon(
                        buttonWidth: 160.w,
                        buttonText: 'تحليل الصورة',
                        textStyle: AppTextstyles.textFamilyMadaniSize16Weight400
                            .copyWith(
                          color: Colors.white,
                        ),
                        onPressed: () {
                        if(  ai.formKey.currentState!.validate()){
                            push(const ImageProcessing());
                        }
                        
                        },
                        icon: const Icon(
                          Icons.arrow_left_rounded,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  const SizedBox(height: 20),
                  // ...(ai.recognitions != null
                  //     ? ai.recognitions.map((recognition) {
                  //         return Text(
                  //           'نوع النفايات :${recognition['label']} (نسبتها فى الصورة تقريباً: ${recognition['confidence'].toStringAsFixed(2)})',
                  //         );
                  //       },
                  //       ).toList()
                  //     : []),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
