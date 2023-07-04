import 'package:flutter/material.dart';

class BrandSelectionNotifier extends ChangeNotifier {
  String? selectedOption;

  getBrand(String? newBrand) {
    selectedOption = newBrand;
  }
}
