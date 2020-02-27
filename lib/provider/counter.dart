import 'package:flutter/material.dart';

// 混入
class Counter with ChangeNotifier {
  int _count = 0;
  int get value => _count;

  void increment() {
    _count++;
    notifyListeners();
  }
}
