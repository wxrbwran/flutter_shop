import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/services.dart';
import 'package:jpush_flutter/jpush_flutter.dart';

class AdBanner extends StatelessWidget {
  final String adPicUrl;
  AdBanner({Key key, this.adPicUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.white,
      decoration: BoxDecoration(color: Colors.white),
      width: ScreenUtil().setWidth(750),
      child: InkWell(
        onTap: () async {
          print(' AdBanner');
          // 三秒后出发本地推送
          var fireDate = DateTime.fromMillisecondsSinceEpoch(
              DateTime.now().millisecondsSinceEpoch + 3000);
          var localNotification = LocalNotification(
              id: 234,
              title: 'fadsfa',
              buildId: 1,
              content: 'fdas',
              fireTime: fireDate,
              subtitle: 'fasf',
              badge: 5,
              extra: {"fa": "0"});
          // jpush.sendLocalNotification(localNotification);
        },
        child: Image.network(this.adPicUrl, fit: BoxFit.fitWidth),
      ),
    );
  }
}
