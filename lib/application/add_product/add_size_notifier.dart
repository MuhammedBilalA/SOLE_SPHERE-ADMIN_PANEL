import 'package:flutter/material.dart';

class AddSizeNotifier extends ChangeNotifier {
  int size = 0;
  int quantity = 0;

  increment({required bool isSize}) {
    if (isSize) {
      size++;
    } else {
      quantity++;
    }

    notifyListeners();
  }

  decrement({required bool isSize}) {
    if (isSize) {
      if (size > 0) {
        size--;
      }
    } else {
      if (quantity > 0) {
        quantity--;
      }
    }
    notifyListeners();
  }
}
