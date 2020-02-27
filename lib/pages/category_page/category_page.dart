import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_shop/provider/category_goods_list.dart';
import 'package:flutter_shop/provider/child_category.dart';
import 'dart:convert';
import 'package:provider/provider.dart';
import '../../model/category.dart';
import '../../model/categoryGoodsList.dart';
import '../../services/api/cartgory.dart';

class CategoryPage extends StatefulWidget {
  CategoryPage({Key key}) : super(key: key);

  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('商品分类'),
      ),
      body: Container(
          child: Row(
        children: <Widget>[
          LeftCategoryNav(),
          Column(
            children: <Widget>[
              RightCategoryNav(),
              CategoryGoodsListView(),
            ],
          )
        ],
      )),
    );
  }
}

// 左侧大类导航
class LeftCategoryNav extends StatefulWidget {
  LeftCategoryNav({Key key}) : super(key: key);

  @override
  _LeftCategoryNavState createState() => _LeftCategoryNavState();
}

class _LeftCategoryNavState extends State<LeftCategoryNav> {
  List list = [];
  int currentIndex = 0;
  @override
  void initState() {
    _getCategory();
    _getGoodsList();
    super.initState();
  }

  void _getGoodsList({String categoryId}) async {
    var params = {
      'categoryId': categoryId == null ? '4' : categoryId,
      'categorySubId': '',
      'page': 1,
    };
    var res = await CateApi().getMallGoods(params);
    var data = json.decode(res.toString());
    CategoryGoodsListModel goodsList = CategoryGoodsListModel.fromJson(data);
    // setState(() {
    //   list = goodsList.data;
    // });
    // print('分类商品列表');
    // print(goodsList.data);
    Provider.of<CategoryGoodsListProvider>(context, listen: false)
        .setGoodsList(goodsList.data);
  }

  void _getCategory() async {
    var val = await CateApi().getCategory();
    var data = json.decode(val.toString());
    CategoryModel categroys = CategoryModel.fromJson(data);
    setState(() {
      list = categroys.data.info;
    });
    Provider.of<ChildCategory>(context, listen: false)
        .setChildCategory(categroys.data.info[0].bxMallSubDto);
  }

  Widget _leftInkWell(int index) {
    bool isTaped = currentIndex == index;
    return InkWell(
        onTap: () {
          setState(() {
            currentIndex = index;
          });
          var childList = list[index].bxMallSubDto;
          Provider.of<ChildCategory>(context, listen: false)
              .setChildCategory(childList);
          var categoryId = list[index].mallCategoryId;
          _getGoodsList(categoryId: '$categoryId');
        },
        child: Container(
          height: ScreenUtil().setHeight(100),
          padding: EdgeInsets.only(left: 10, top: 20),
          decoration: BoxDecoration(
              color: isTaped ? Color.fromRGBO(236, 236, 236, 1) : Colors.white,
              border: Border(
                bottom: BorderSide(width: 1, color: Colors.black12),
              )),
          child: Text(
            list[index].mallCategoryName,
            style: TextStyle(
              fontSize: ScreenUtil().setSp(32),
            ),
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil().setWidth(200),
      decoration: BoxDecoration(
        border: Border(
          right: BorderSide(width: 1, color: Colors.black12),
        ),
      ),
      child: ListView.builder(
        itemCount: list.length,
        itemBuilder: (BuildContext context, int index) {
          return _leftInkWell(index);
        },
      ),
    );
  }
}

// 右侧小类导航
class RightCategoryNav extends StatefulWidget {
  RightCategoryNav({Key key}) : super(key: key);

  @override
  _RightCategoryNavState createState() => _RightCategoryNavState();
}

class _RightCategoryNavState extends State<RightCategoryNav> {
  // List navList = ['名酒', '宝丰', '北京二锅头', '汾酒', '西凤酒', '杏花村', '五粮液', '剑南春'];
  @override
  Widget build(BuildContext context) {
    final childCategory = Provider.of<ChildCategory>(context);
    return Container(
      height: ScreenUtil().setHeight(70),
      width: ScreenUtil().setWidth(550),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: childCategory.value.length,
        itemBuilder: (BuildContext context, int index) =>
            _rightInkWell(index, childCategory.value[index]),
      ),
    );
  }

  Widget _rightInkWell(int index, BxMallSubDto item) {
    bool isTaped = index == Provider
      .of<ChildCategory>(context).childIndex;
    return InkWell(
        onTap: () {
          
        },
        child: Container(
          padding: EdgeInsets.fromLTRB(5, 10, 5, 10),
          decoration: BoxDecoration(
              // color: Colors.white,
              border: Border(
                bottom: BorderSide(width: 1, color: Colors.black12),
              )),
          child: Text(
            '${item.mallSubName}',
            style: TextStyle(
              color: isTaped ? Colors.pink : Colors.black,
              fontSize: ScreenUtil().setSp(28),
            ),
          ),
        ));
  }
}

// 商品列表
class CategoryGoodsListView extends StatefulWidget {
  CategoryGoodsListView({Key key}) : super(key: key);

  @override
  _CategoryGoodsListViewState createState() => _CategoryGoodsListViewState();
}

class _CategoryGoodsListViewState extends State<CategoryGoodsListView> {
  Widget _goodsImage(List list, int index) {
    return Container(
      width: ScreenUtil().setWidth(200),
      child: Image.network(list[index].image),
    );
  }

  Widget _goodsName(List list, int index) {
    return Container(
      padding: EdgeInsets.all(5),
      width: ScreenUtil().setWidth(200),
      child: Text(
        list[index].goodsName,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          fontSize: ScreenUtil().setSp(32),
        ),
      ),
    );
  }

  Widget _goodsPrice(List list, int index) {
    return Container(
      margin: EdgeInsets.only(top: ScreenUtil().setHeight(20)),
      child: Row(
        children: <Widget>[
          Text(
            '价格 ¥${list[index].presentPrice}',
            style: TextStyle(
              color: Colors.pink,
              fontSize: ScreenUtil().setSp(30),
            ),
          ),
          Text(
            '价格 ¥${list[index].oriPrice}',
            style: TextStyle(
                fontSize: ScreenUtil().setSp(26),
                color: Colors.black12,
                decoration: TextDecoration.lineThrough),
          ),
        ],
      ),
    );
  }

  Widget _listItemWidget(List list, int index) {
    return InkWell(
        onTap: () {},
        child: Container(
            padding: EdgeInsets.only(top: 5, bottom: 5),
            decoration: BoxDecoration(
              color: Colors.white,
              border:
                  Border(bottom: BorderSide(width: 1, color: Colors.black12)),
            ),
            child: Row(
              children: <Widget>[
                _goodsImage(list, index),
                Column(
                  children: <Widget>[
                    _goodsName(list, index),
                    _goodsPrice(list, index)
                  ],
                )
              ],
            )));
  }

  @override
  Widget build(BuildContext context) {
    final categoryGoodsListProvider =
        Provider.of<CategoryGoodsListProvider>(context);
    List<CategoryListData> list = categoryGoodsListProvider.value;
    return Expanded(
        child: Container(
      width: ScreenUtil().setWidth(550),
      // height: ScreenUtil().setHeight(980),
      child: ListView.builder(
        itemCount: list.length,
        itemBuilder: (context, index) {
          return _listItemWidget(list, index);
        },
      ),
    ));
  }
}
