import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../routes/application.dart';

class HotGoods extends StatelessWidget {
  List hotGoodsList;
  HotGoods({Key key, this.hotGoodsList}) : super(key: key);

  Widget hotTitle = Container(
    margin: EdgeInsets.only(top: 10),
    padding: EdgeInsets.only(top: 5),
    alignment: Alignment.center,
    color: Colors.transparent,
    child: Text('火爆专区'),
  );

  Widget _wrapList(context) {
    int length = hotGoodsList.length;
    if (length != 0) {
      List<Widget> listWidget = hotGoodsList.map((val) {
        return InkWell(
            onTap: () {
               Application.router.navigateTo(context,"/detail?id=${val['goodsId']}");
              // Application.router
              //     .navigateTo(context, 'detail?id=${val['goodsId']}');
            },
            child: Container(
              width: ScreenUtil().setWidth(370),
              color: Colors.white,
              padding: EdgeInsets.all(5),
              margin: EdgeInsets.only(bottom: 3),
              child: Column(children: <Widget>[
                Image.network(val['image'], width: ScreenUtil().setWidth(370)),
                Text(val['name'],
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Colors.pink,
                      fontSize: ScreenUtil().setSp(26),
                    )),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text('¥${val['mallPrice']}'),
                    Text('¥${val['price']}',
                        style: TextStyle(
                          color: Colors.grey,
                          decoration: TextDecoration.lineThrough,
                        ))
                  ],
                )
              ]),
            ));
      }).toList();

      return Wrap(
        // 流布局
        spacing: 2, // 每行几列
        children: listWidget,
      );
    } else {
      return Text('');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        child: Column(
          children: <Widget>[hotTitle, _wrapList(context)],
        ),
      ),
    );
  }
}
