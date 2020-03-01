import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../../../provider/cart.dart';

class CartBottom extends StatelessWidget {
  const CartBottom({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cart_provider = Provider.of<CartProvider>(context);
    double price = cart_provider.allPrice;
    int count = cart_provider.allGoodsCount;
    bool isAllCheck = cart_provider.isAllCheck;
    return Container(
      margin: EdgeInsets.all(5.0),
      color: Colors.white,
      width: ScreenUtil().setWidth(750),
      child: Row(
        children: <Widget>[
          _selectAllBtn(context, isAllCheck),
          _allPriceArea(price),
          _goButton(count)
        ],
      ),
    );
  }

  //全选按钮
  Widget _selectAllBtn(BuildContext context, bool isAllCheck) {
    return Container(
      child: Row(
        children: <Widget>[
          Checkbox(
            value: isAllCheck,
            activeColor: Colors.pink,
            onChanged: (bool val) {
              Provider.of<CartProvider>(context, listen: false)
                  .changeAllChaeckBtnState(val);
            },
          ),
          Text('全选')
        ],
      ),
    );
  }

  // 合计区域
  Widget _allPriceArea(price) {
    return Container(
      width: ScreenUtil().setWidth(430),
      alignment: Alignment.centerRight,
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                alignment: Alignment.centerRight,
                width: ScreenUtil().setWidth(280),
                child: Text('合计:',
                    style: TextStyle(fontSize: ScreenUtil().setSp(36))),
              ),
              Container(
                alignment: Alignment.centerLeft,
                width: ScreenUtil().setWidth(150),
                child: Text('¥$price',
                    style: TextStyle(fontSize: ScreenUtil().setSp(36))),
              )
            ],
          ),
          Container(
            width: ScreenUtil().setWidth(430),
            alignment: Alignment.centerRight,
            child: Text('满79元免配送费，预购49元免配送费',
                style: TextStyle(
                    color: Colors.black38, fontSize: ScreenUtil().setSp(22))),
          ),
        ],
      ),
    );
  }

  //结算按钮
  Widget _goButton(int count) {
    return Container(
      width: ScreenUtil().setWidth(160),
      padding: EdgeInsets.only(left: 10),
      child: InkWell(
        onTap: () {},
        child: Container(
          padding: EdgeInsets.all(10.0),
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: Colors.red, borderRadius: BorderRadius.circular(3.0)),
          child: Text(
            '结算($count)',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
