import 'package:flutter/material.dart';

class SizeController extends ChangeNotifier {
  int index = 0;
  indexchange(int selectedidx) {
    index = selectedidx;
    notifyListeners();
  }
}