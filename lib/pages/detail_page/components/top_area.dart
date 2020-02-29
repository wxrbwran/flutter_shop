import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../provider/detail_info.dart';

class DetailTopArea extends StatelessWidget {
  const DetailTopArea({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var detail_page_provider = Provider.of<DetailInfoProvider>(context);
    var goodsInfo = detail_page_provider.value.data.goodInfo;
    if (goodsInfo != null) {
      return Container(
          color: Colors.white,
          child: Column(
            children: <Widget>[
              _goodsImage(goodsInfo.image1),
              _goodsName(goodsInfo.goodsName),
              _goodsNum(goodsInfo.goodsSerialNumber),
              _goodsPrice(goodsInfo.presentPrice, goodsInfo.oriPrice)
            ],
          ));
    }
    return Text('加载中。。。。');
  }

  // 商品图片
  Widget _goodsImage(url) {
    print('url, $url');
    return Image.network(
      url,
      width: ScreenUtil().setWidth(750),
      height: ScreenUtil().setWidth(500),
    );
  }

  // 商品名称
  Widget _goodsName(name) {
    return Container(
      width: ScreenUtil().setWidth(750),
      padding: EdgeInsets.only(left: 15),
      margin: EdgeInsets.only(top: 10),
      child: Text(
        name,
        style: TextStyle(
          fontSize: ScreenUtil().setSp(40),
          color: Colors.pink,
        ),
      ),
    );
  }

  // 商品编号
  Widget _goodsNum(num) {
    return Container(
      width: ScreenUtil().setWidth(750),
      padding: EdgeInsets.only(left: 15),
      margin: EdgeInsets.only(top: 8),
      child: Text(
        '编号：$num',
        style: TextStyle(
          fontSize: ScreenUtil().setSp(26),
          color: Colors.black26,
        ),
      ),
    );
  }

  // 商品价格
  Widget _goodsPrice(price, oldPrice) {
    return Container(
        width: ScreenUtil().setWidth(750),
        padding: EdgeInsets.only(left: 15),
        margin: EdgeInsets.only(top: 8),
        child: Row(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(right: 40),
              child: Text(
              '¥$price',
              style: TextStyle(
                fontSize: ScreenUtil().setSp(36),
                color: Color.fromRGBO(255, 125, 125, 1),
              ),
            )),
            Text('市场价：',
              style: TextStyle(
                fontSize: ScreenUtil().setSp(40),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 10),
              child: Text(
              '$oldPrice',
              style: TextStyle(
                fontSize: ScreenUtil().setSp(36),
                decoration: TextDecoration.lineThrough,
                color: Colors.black12,
              ),
            )),
          ],
        ));
  }
}
