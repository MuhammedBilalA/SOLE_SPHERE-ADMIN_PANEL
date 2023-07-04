import 'package:flutter/foundation.dart';

class SizeBuilder extends ChangeNotifier {
  Map<String, String> sizeQuantityMap = {};

  addingSize({required String size, required String quantity}) {
    sizeQuantityMap[size] = quantity;
    notifyListeners();
  }
}
