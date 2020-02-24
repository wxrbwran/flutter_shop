import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../components/swiper.dart';
import '../services/api/home.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String homePageContent = '正在获取数据';

  @override
  Widget build(BuildContext context) {
    print('设备像素密度: ${ScreenUtil.pixelRatio}');
    print('设备高: ${ScreenUtil.screenHeight}');
    print('设备宽: ${ScreenUtil.screenWidth}');

    return FutureBuilder(
        future: HomeApi().getHomePageSwiper(),
        builder: (BuildContext context, snapshot) {
          if (snapshot.hasData) {
            var data = json.decode(snapshot.data.toString());
            print('FutureBuilder');
            print(data);
            // as运算符类似于Java中的cast操作，将一个对象强制类型转换
            List<Map> swiper = (data['data']['slides'] as List).cast();
            List<Map> nav = (data['data']['category'] as List).cast();
            String adPicUrl = (data['data']['adPicUrl'] as String);
            return Column(children: <Widget>[
              SwiperDIY(swiperList: swiper),
              TopNavigator(navList: nav),
              AdBanner(adPicUrl: adPicUrl),
            ]);
          } else {
            return Center(
                child: Text(homePageContent,
                    style: TextStyle(
                      fontSize: ScreenUtil().setSp(28),
                    )));
          }
        });
  }
}

class TopNavigator extends StatelessWidget {
  final List navList;
  const TopNavigator({Key key, this.navList}) : super(key: key);

  Widget _gridViewItemUI(BuildContext context, item) {
    return InkWell(
      onTap: () {
        print('点击了导航');
      },
      child: Column(
        children: <Widget>[
          Image.network(item['image'], width: ScreenUtil().setWidth(95)),
          Text(item['mallCategroyName'])
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil().setHeight(250),
      padding: EdgeInsets.all(3),
      child: GridView.count(
        crossAxisCount: 5,
        padding: EdgeInsets.all(5),
        children: navList.map((nav) {
          return _gridViewItemUI(context, nav);
        }).toList(),
      ),
    );
  }
}

class AdBanner extends StatelessWidget {
  final String adPicUrl;
  const AdBanner({Key key, this.adPicUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil().setWidth(750),
      child: Image.network(this.adPicUrl, fit: BoxFit.fitWidth
        // width: ScreenUtil().setWidth(750)
        ),
    );
  }
}
