import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Recommend extends StatelessWidget {
  final List recommendList;
  const Recommend({Key key, this.recommendList}) : super(key: key);

  // 标题方法
  Widget _titleWidget() {
    return Container(
        alignment: Alignment.centerLeft,
        padding: EdgeInsets.fromLTRB(10, 2, 0, 5),
        height: ScreenUtil().setHeight(60),
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border(
                bottom: BorderSide(
              width: 0.5,
              color: Colors.black12,
            ))),
        child: Text(
          '商品推荐',
          style: TextStyle(
            color: Colors.pinkAccent,
            fontSize: ScreenUtil().setSp(40),
          ),
        ));
  }

  // 单个商品
  Widget _item(index) {
    return InkWell(
        onTap: () {},
        child: Container(
          width: ScreenUtil().setWidth(250),
          // height: ScreenUtil().setHeight(270),
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: Colors.white,
              border:
                  Border(left: BorderSide(width: 1, color: Colors.black12))),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Image.network(recommendList[index]['image'],
                fit: BoxFit.contain,
                width: ScreenUtil().setWidth(230),
                height: ScreenUtil().setWidth(230),
              ),
              Text(
                '¥${recommendList[index]['old_price']}',
                style: TextStyle(
                  fontSize: ScreenUtil().setSp(30),
                  decoration: TextDecoration.lineThrough,
                  color: Colors.grey,
                ),
              ),
              Text(
                '¥${recommendList[index]['price']}',
                style: TextStyle(
                  fontSize: ScreenUtil().setSp(30),
                ),
              )
            ],
          ),
        )
      );
  }

  // 横向商品列表

  Widget recomList() {
    return Container(
        height: ScreenUtil().setHeight(290),
        // margin: EdgeInsets.only(top: 10),
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: recommendList.length,
          itemBuilder: (BuildContext context, int index) {
            return _item(index);
          },
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil().setHeight(350),
      margin: EdgeInsets.only(top: 10),
      child: Column(
        children: <Widget>[
          _titleWidget(),
          recomList(),
        ],
      ),
    );
  }
}
