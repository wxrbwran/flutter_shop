import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../../../provider/detail_info.dart';
import '../../../provider/cart.dart';

class DetailBottom extends StatelessWidget {
  const DetailBottom({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var goodsInfo =
        Provider.of<DetailInfoProvider>(context).goodsInfo.data.goodInfo;
    var goodsId = goodsInfo.goodsId;
    var goodsName = goodsInfo.goodsName;
    var count = 1;
    var price = goodsInfo.oriPrice;
    var images = goodsInfo.image1;

    return Container(
      width: ScreenUtil().setWidth(750),
      height: ScreenUtil().setHeight(80),
      color: Colors.white,
      child: Row(
        children: <Widget>[
          InkWell(
            onTap: () {},
            child: Container(
              width: ScreenUtil().setWidth(110),
              height: ScreenUtil().setHeight(80),
              alignment: Alignment.center,
              child: Icon(
                Icons.shopping_cart,
                size: 35,
                color: Colors.red,
              ),
            ),
          ),
          InkWell(
            onTap: () async { 
              Provider.of<CartProvider>(context, listen: false).save(
                goodsId,
                goodsName,
                count,
                price,
                images,
              );
            },
            child: Container(
              width: ScreenUtil().setWidth(320),
              height: ScreenUtil().setHeight(80),
              alignment: Alignment.center,
              color: Colors.green,
              child: Text(
                '加入购物车',
                style: TextStyle(
                  fontSize: ScreenUtil().setSp(28),
                  color: Colors.white,
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () async {
              Provider.of<CartProvider>(context, listen: false).remove();
            },
            child: Container(
              width: ScreenUtil().setWidth(320),
              height: ScreenUtil().setHeight(80),
              alignment: Alignment.center,
              color: Colors.red,
              child: Text(
                '立即购买',
                style: TextStyle(
                  fontSize: ScreenUtil().setSp(28),
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
