import 'package:flutter/material.dart';
import 'package:mekom_w_elykom/features/hello_from_palstic_world/hello_model.dart';

class SallaProvider extends ChangeNotifier {
  List<HelloModel> helloList = [
    HelloModel(
        id: 1122,
        name: 'بلاستيك',
        details: 'مخلفات مدرسية',
        price: 600,
        weight: 13),
    HelloModel(
        id: 1123,
        name: 'بلاستيك',
        details: 'مخلفات مصنع',
        price: 600,
        weight: 50),
    HelloModel(
        id: 1124,
        name: 'بلاستيك',
        details: 'مخلفات فندقية',
        price: 600,
        weight: 20),
    HelloModel(
        id: 1125,
        name: 'بلاستيك',
        details: 'مخلفات دكان',
        price: 600,
        weight: 13),
  ];
  List<HelloModel> sallaList = [];
  List<HelloModel> get helloListData => helloList;

  List<HelloModel> get sallaListData => sallaList;

  void addToList(HelloModel model) {
    sallaList.removeWhere((element) => element.details == model.details);
    sallaList.add(model);
    notifyListeners();
  }
}
