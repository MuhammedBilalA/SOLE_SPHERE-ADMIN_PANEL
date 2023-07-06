import 'dart:developer';

import 'package:flutter/material.dart';

class SizeController extends ChangeNotifier {
  int index = 0;

  dynamic quandity;
  indexchange(int selectedidx, List<dynamic> quanditylist) {
    index = selectedidx;
    quanditychange(quanditylist[index]);
    notifyListeners();
  }

  quanditychange(dynamic quanditynew) {
    quandity = quanditynew;
    log('new new : $quandity');
    notifyListeners();
  }
}
