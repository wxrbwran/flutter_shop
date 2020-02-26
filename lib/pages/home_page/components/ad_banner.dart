import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AdBanner extends StatelessWidget {
  final String adPicUrl;
  const AdBanner({Key key, this.adPicUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.white,
      decoration: BoxDecoration(color: Colors.white),
      width: ScreenUtil().setWidth(750),
      child: Image.network(this.adPicUrl, fit: BoxFit.fitWidth
          // width: ScreenUtil().setWidth(750)
          ),
    );
  }
}