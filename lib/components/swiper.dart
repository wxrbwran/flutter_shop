import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../config/app.dart';

class SwiperDIY extends StatelessWidget {
  final List swiperList;
  const SwiperDIY({Key key, this.swiperList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: ScreenUtil().setHeight(333),
        width: ScreenUtil().setHeight(App.DESIGN_WIDTH),
        child: Swiper(
          itemCount: swiperList.length,
          itemBuilder: (BuildContext context, index) {
            return Image.network(swiperList[index]['image'], fit: BoxFit.fitWidth);
          },
          pagination: SwiperPagination(),
          autoplay: true,
        ));
  }
}
