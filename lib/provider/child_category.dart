import 'package:flutter/material.dart';
import '../model/category.dart';

// 混入
class ChildCategory with ChangeNotifier {
  List<BxMallSubDto> childCategoryList = [];
  List get value => childCategoryList;
  int childIndex = 0; //

  // 大类切换逻辑
  setChildCategory(List<BxMallSubDto> list) {
    childIndex = 0;
    BxMallSubDto allGoods = BxMallSubDto();
    allGoods.mallSubId = 0;
    allGoods.mallCategoryId = 0;
    allGoods.comments = 'asdasd';
    allGoods.mallSubName = '全部';
    childCategoryList = [allGoods];
    childCategoryList.addAll(list);
    notifyListeners();
  }

  // 改变子类索引
  changeChildIndex(int index) {
    childIndex = index;
    notifyListeners();
  }
}
