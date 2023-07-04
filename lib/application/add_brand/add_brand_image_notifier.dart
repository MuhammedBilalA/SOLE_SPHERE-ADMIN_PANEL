import 'package:flutter/material.dart';

class AddBrandImageNotifier extends ChangeNotifier {
  String imagePath = 'x';

  getImage(String newPath) {
    imagePath = newPath;
    notifyListeners();
  }
}
