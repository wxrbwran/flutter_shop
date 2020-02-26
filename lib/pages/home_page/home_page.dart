import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../components/swiper.dart';
import '../../services/api/home.dart';

import './components/recommend.dart';
import './components/floor.dart';
import './components/ad_banner.dart';
import './components/top_navigator.dart';
import './components/leader_phone.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  String homePageContent = '正在获取数据';

  @override
  void initState() {
    super.initState();
    // print('==========>1111111');
  }

  @override
  Widget build(BuildContext context) {
    print('设备像素密度: ${ScreenUtil.pixelRatio}');
    print('设备高: ${ScreenUtil.screenHeight}');
    print('设备宽: ${ScreenUtil.screenWidth}');

    return FutureBuilder(
        future: HomeApi().getHomePageSwiper(),
        builder: (BuildContext context, snapshot) {
          if (snapshot.hasData) {
            print(snapshot.data.runtimeType);
            var data = json.decode(snapshot.data.toString());
            print('FutureBuilder');
            print(Map.from(data['data']['floor1']));
            // print(data);
            // as运算符类似于Java中的cast操作，将一个对象强制类型转换
            List<Map> swiper = (data['data']['slides'] as List).cast();
            List<Map> nav = (data['data']['category'] as List).cast();
            String adPicUrl = data['data']['adPicUrl'];
            String avatar = (data['data']['shopInfo']['avatar']);
            String phone = (data['data']['shopInfo']['phone']);
            // print(data['data']['recommend']);
            List<Map> recommend = (data['data']['recommend'] as List).cast();
            String floor1Title = (data['data']['floor1Pic']['pic']);
            String floor1Image0 = (data['data']['floor1']['image0']);
            String floor1Image1 = (data['data']['floor1']['image1']);
            String floor1Image2 = (data['data']['floor1']['image2']);
            String floor1Image3 = (data['data']['floor1']['image3']);
            String floor1Image4 = (data['data']['floor1']['image4']);
            List<String> floorList = [floor1Image0, floor1Image1, floor1Image2,
              floor1Image3, floor1Image4];
            // Map floor1 = json.decode(data['data']['floor1']);

            return SingleChildScrollView(
                child: Column(children: <Widget>[
              SwiperDIY(swiperList: swiper),
              TopNavigator(navList: nav),
              AdBanner(adPicUrl: adPicUrl),
              LeaderPhone(avatar: avatar, phone: phone),
              Recommend(
                recommendList: recommend,
              ),
              FloorTitle(pic: floor1Title),
              FloorContent(floorList: floorList)
            ]));
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
