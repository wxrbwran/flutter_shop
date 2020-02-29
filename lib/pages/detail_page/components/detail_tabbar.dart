import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../provider/detail_info.dart';

class DetailTabBar extends StatelessWidget {
  const DetailTabBar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var detail_provider = Provider.of<DetailInfoProvider>(context);
    var isLeft = detail_provider.isLeft;
    var isRight = detail_provider.isRight;

    return Container(
        color: Colors.white,
        margin: EdgeInsets.only(top: 15),
        child: Row(
          children: <Widget>[
            _myTabBarLeft(context, isLeft),
            _myTabBarRight(context, isRight),
          ],
        ));
  }

  Widget _myTabBarLeft(BuildContext context, bool isLeft) {
    return InkWell(
      onTap: () {
        Provider.of<DetailInfoProvider>(context, listen: false).changeLeftAndRight('left');
      },
      child: Container(
        padding: EdgeInsets.all(10),
        alignment: Alignment.center,
        width: ScreenUtil().setWidth(375),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
              bottom: BorderSide(
            width: 1,
            color: isLeft ? Colors.pink : Colors.black12,
          )),
        ),
        child: Text('详情',
            style: TextStyle(
              color: isLeft ? Colors.pink : Colors.black,
            )),
      ),
    );
  }

  Widget _myTabBarRight(BuildContext context, bool isRight) {
    return InkWell(
      onTap: () {
        Provider.of<DetailInfoProvider>(context, listen: false).changeLeftAndRight('right');
      },
      child: Container(
        padding: EdgeInsets.all(10),
        alignment: Alignment.center,
        width: ScreenUtil().setWidth(375),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
              bottom: BorderSide(
            width: 1,
            color: isRight ? Colors.pink : Colors.black12,
          )),
        ),
        child: Text('评论',
            style: TextStyle(
              color: isRight ? Colors.pink : Colors.black,
            )),
      ),
    );
  }
}
