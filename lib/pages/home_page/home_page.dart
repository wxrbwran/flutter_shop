import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../components/swiper.dart';
import './components/recommend.dart';
import '../../services/api/home.dart';

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
            String adPicUrl = data['data']['adPicUrl'];
            String avatar = (data['data']['shopInfo']['avatar']);
            String phone = (data['data']['shopInfo']['phone']);
            print(data['data']['recommend']);
            List<Map> recommend = (data['data']['recommend'] as List).cast();

            return SingleChildScrollView(
              child: Column(children: <Widget>[
                SwiperDIY(swiperList: swiper),
                TopNavigator(navList: nav),
                AdBanner(adPicUrl: adPicUrl),
                LeaderPhone(avatar: avatar, phone: phone),
                Recommend(
                  recommendList: recommend,
                ),
              ]
            )
          );
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
      // color: Colors.white,
      decoration: BoxDecoration(
        color: Colors.white
      ),
      width: ScreenUtil().setWidth(750),
      child: Image.network(this.adPicUrl, fit: BoxFit.fitWidth
          // width: ScreenUtil().setWidth(750)
          ),
    );
  }
}

class LeaderPhone extends StatelessWidget {
  final String avatar;
  final String phone;
  const LeaderPhone({Key key, this.avatar, this.phone}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void _launchUrl() async {
      // String tel = 'tel:+1 850 534 988';
      String url = 'https://github.com/Solido/awesome-flutter';
      print('_launchUrl url');
      print(url);
      if (await canLaunch(url)) {
        launch(url);
      } else {
        throw '不能访问！';
      }
    }

    return Container(
      child: InkWell(
        onTap: _launchUrl,
        child: Container(
            margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
            child: Row(
              children: <Widget>[
                Image.network(avatar),
                Container(
                    margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    decoration: BoxDecoration(
                      // border: Border.all(color: Colors.redAccent, width: 1, style: BorderStyle.solid),
                      border: Border(
                          bottom: BorderSide(
                        color: Colors.redAccent,
                        width: 3,
                        style: BorderStyle.solid,
                      )),
                    ),
                    child: Text(
                      'LinkTo: awesome flutter',
                      style: TextStyle(
                        color: Colors.purpleAccent,
                        fontSize: ScreenUtil().setSp(50),
                      ),
                    ))
              ],
            )),
      ),
    );
  }
}
