import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../config/app.dart';
import '../routes/application.dart';

class SwiperDIY extends StatelessWidget {
  final List swiperList;
  const SwiperDIY({Key key, this.swiperList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int length = swiperList.length;
    if (length == 0) {
      return (Container(
        height: ScreenUtil().setHeight(333),
        width: ScreenUtil().setHeight(App.DESIGN_WIDTH),
        child: Text('加载中...'),
      ));
    }
    return Container(
        height: ScreenUtil().setHeight(333),
        width: ScreenUtil().setHeight(App.DESIGN_WIDTH),
        child: Swiper(
          itemCount: swiperList.length,
          itemBuilder: (BuildContext context, index) {
            return InkWell(
                onTap: () {
                  // Future.delayed(Duration(milliseconds: 100)).then((e) {
                  Application.router.navigateTo(
                      context, '/detail?id=${swiperList[index]['goodsId']}');
                  // });
                },
                child: Image.network(swiperList[index]['image'],
                    fit: BoxFit.fitWidth));
          },
          pagination: SwiperPagination(),
          autoplay: true,
        ));
  }
}
