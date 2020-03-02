import 'package:flutter/material.dart';

// 混入
class CurrentIndexProvider with ChangeNotifier {
  int currentIndex = 0;

  void changeIndex(int newIndex) {
    currentIndex = newIndex;
    notifyListeners();
  }
}
