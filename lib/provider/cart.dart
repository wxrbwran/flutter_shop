import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import '../model/cart_info.dart';

class CartProvider with ChangeNotifier {
  String cartString = '[]';
  List<CartInfoModel> cartList = [];
  double allPrice = 0;
  int allGoodsCount = 0;
  bool isAllCheck = true;

  save(goodsId, goodsName, count, price, images) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    cartString = prefs.getString('cartInfo');
    var tmp = cartString == null ? [] : json.decode(cartString.toString());
    List tmpList = (tmp as List).cast();
    bool isHave = false;
    int length = tmpList.length;
    for (int i = 0; i < length; i++) {
      var item = tmpList[i];
      if (item['goodsId'] == goodsId) {
        item['count'] = item['count'] + 1;
        // tmpList[i].count++;
        isHave = true;
        break;
      }
    }
    if (!isHave) {
      Map<String, dynamic> newGoods = {
        'goodsId': goodsId,
        'goodsName': goodsName,
        'count': count,
        'price': price,
        'images': images,
        'isCheck': true,
      };
      tmpList.add(newGoods);
      cartList.add(CartInfoModel.fromJson(newGoods));
    }
    cartString = json.encode(tmpList).toString();
    // print('字符串 $cartString');
    // print('数据模型 $cartList');
    // print('添加购物车成功');
    prefs.setString('cartInfo', cartString);
    await getCartInfo();
    // notifyListeners();
  }

  remove() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('cartInfo');
    cartList = [];
    print('清空购物车成功');
    notifyListeners();
  }

  getCartInfo() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    cartString = prefs.getString('cartInfo');
    cartList = [];
    print('getCartInfo cartString ${cartString}');
    // print('${cartString != null}');
    if (cartString != null) {
      // print(1);
      allPrice = 0;
      allGoodsCount = 0;
      isAllCheck = true;
      List<Map> tempList = (json.decode(cartString.toString()) as List).cast();
      print('getCartInfo tempList ${cartList}');
      tempList.forEach((item) {
        cartList.add(CartInfoModel.fromJson(item));
        if (item['isCheck']) {
          allGoodsCount++;
          allPrice += (item['count'] * item['price']);
        } else {
          isAllCheck = false;
        }
      });
      print('getCartInfo cartList ${cartList}');
    }
    notifyListeners();
  }

  // 删除单个购物车商品
  deleteOneGoods(String goodsId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    cartString = prefs.getString('cartInfo');
    List<Map> tmpList = (json.decode(cartString) as List).cast();
    int length = tmpList.length;
    for (int i = 0; i < length; i++) {
      var item = tmpList[i];
      if (item['goodsId'] == goodsId) {
        tmpList.removeAt(i);
        break;
      }
    }
    cartString = json.encode(tmpList).toString();
    prefs.setString('cartInfo', cartString);
    await getCartInfo();
    // notifyListeners();
  }

  changeCheckState(CartInfoModel cartItem) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    cartString = prefs.getString('cartInfo');
    List<Map> tmpList = (json.decode(cartString) as List).cast();
    int length = tmpList.length;
    for (int i = 0; i < length; i++) {
      var item = tmpList[i];
      if (item['goodsId'] == cartItem.goodsId) {
        item['isCheck'] = cartItem.isCheck;
        break;
      }
    }
    cartString = json.encode(tmpList).toString();
    prefs.setString('cartInfo', cartString);
    await getCartInfo();
  }

  changeAllChaeckBtnState(bool isCheck) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    cartString = prefs.getString('cartInfo');
    List<Map> tmpList = (json.decode(cartString) as List).cast();
    int length = tmpList.length;
    for (int i = 0; i < length; i++) {
      var item = tmpList[i];
      item['isCheck'] = isCheck;
    }
    cartString = json.encode(tmpList).toString();
    prefs.setString('cartInfo', cartString);
    await getCartInfo();
  }

  // 商品数量加减
  addOrReduceAction(var cartItem, String todo) async {
    // print('cartItem $cartItem');
    // print('todo $todo');
    SharedPreferences prefs = await SharedPreferences.getInstance();
    cartString = prefs.getString('cartInfo');
    List<Map> tmpList = (json.decode(cartString) as List).cast();
    int length = tmpList.length;
    for (int i = 0; i < length; i++) {
      var item = tmpList[i];
      // print('item  ${item['goodsId']}');
      // print('cartItem  ${cartItem.goodsId}');
      if (item['goodsId'] == cartItem.goodsId) {
        // print('add  ${todo}');
        if (todo == 'add') {
          item['count'] = item['count'] + 1;
        } else if (item['count'] > 1) {
          item['count'] = item['count'] - 1;
        }
      }
    }
    cartString = json.encode(tmpList).toString();
    prefs.setString('cartInfo', cartString);
    await getCartInfo();
  }
}
