import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_shop/model/cart_info.dart';
import 'package:provider/provider.dart';
import '../../../provider/cart.dart';

class CartCount extends StatelessWidget {
  // final count;
  CartInfoModel item;
  CartCount(this.item);
  final borderSideStyle = BorderSide(width: 1, color: Colors.black12);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil().setWidth(165),
      margin: EdgeInsets.only(top: 5.0),
      decoration:
          BoxDecoration(border: Border.all(width: 1, color: Colors.black12)),
      child: Row(
        children: <Widget>[
          _reduceBtn(context, item),
          _countArea(item),
          _addBtn(context, item),
        ],
      ),
    );
  }

  Widget _reduceBtn(context, item) {
    return InkWell(
      onTap: () {
        Provider.of<CartProvider>(context, listen: false).addOrReduceAction(item, 'reduce');
      },
      child: Container(
        width: ScreenUtil().setWidth(45),
        height: ScreenUtil().setHeight(45),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: item.count > 1 ? Colors.white : Colors.black12,
          border: Border(right: borderSideStyle)),
        child: item.count > 1 ? Text('-') : null,
      ),
    );
  }

  //添加按钮
  Widget _addBtn(context, item) {
    return InkWell(
      onTap: () {
        Provider.of<CartProvider>(context, listen: false).addOrReduceAction(item, 'add');
      },
      child: Container(
        width: ScreenUtil().setWidth(45),
        height: ScreenUtil().setHeight(45),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: Colors.white, border: Border(left: borderSideStyle)),
        child: Text('+'),
      ),
    );
  }

  //中间数量显示区域
  Widget _countArea(item) {
    return Container(
      width: ScreenUtil().setWidth(70),
      height: ScreenUtil().setHeight(45),
      alignment: Alignment.center,
      color: Colors.white,
      child: Text('${item.count}'),
    );
  }
}
