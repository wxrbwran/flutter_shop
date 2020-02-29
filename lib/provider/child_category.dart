import 'package:flutter/material.dart';
import '../model/category.dart';

// 混入
class ChildCategoryProvider with ChangeNotifier {
  List<BxMallSubDto> childCategoryList = [];
  int childIndex = 0; //
  String categoryId = '0'; // 大类Id
  String subId = '';
  int page = 1; // 列表页数
  String noMoreText = '';
 
  List get value => childCategoryList;

  // 大类切换逻辑
  setChildCategory(List<BxMallSubDto> list, String id) {
    categoryId = id;
    childIndex = 0;
    page = 1;
    noMoreText = '';
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
  changeChildIndex(int index, String id) {
    childIndex = index;
    subId = id;
    page = 1;
    noMoreText = '';
    notifyListeners();
  }

  // 增加page的方法
  addPage() {
    page++;
    // UI数据不需要此数据，不需要通知
  }

  changeNoMoreText(String str) {
    noMoreText = str;
    notifyListeners();
  }
}
