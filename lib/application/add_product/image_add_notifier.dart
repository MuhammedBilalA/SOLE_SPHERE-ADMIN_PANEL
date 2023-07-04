import 'package:flutter/material.dart';

class ImageAddNotifier extends ChangeNotifier {
  List<String> imageList = [];
  int? selectedIndex;

  imageAdd({required String imagePath, required int index}) {
    imageList.add(imagePath);
    selectedIndex = index;
    notifyListeners();
  }

  changeIndex({required int index}) {
    selectedIndex = index;
    notifyListeners();
  }

  imageRemove({required int imageIndex}) {
    imageList.removeAt(imageIndex);
    notifyListeners();
  }
}
