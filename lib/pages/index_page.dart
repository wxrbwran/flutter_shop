import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:jpush_flutter/jpush_flutter.dart';
import '../config/app.dart';
import './home_page/home_page.dart';
import './category_page/category_page.dart';
import './cart_page/cart_page.dart';
import './member_page/member_page.dart';
import 'package:provider/provider.dart';
import '../provider/current_index.dart';

class IndexPage extends StatelessWidget {
  final jpush;
  IndexPage(this.jpush);
  final List<BottomNavigationBarItem> bottomTabs = [
    BottomNavigationBarItem(icon: Icon(CupertinoIcons.home), title: Text('首页')),
    BottomNavigationBarItem(
        icon: Icon(CupertinoIcons.search), title: Text('分类')),
    BottomNavigationBarItem(
        icon: Icon(CupertinoIcons.shopping_cart), title: Text('购物车')),
    BottomNavigationBarItem(
        icon: Icon(CupertinoIcons.profile_circled), title: Text('会员中心')),
  ];

  // List<Widget> tabBodies = ;
  @override
  Widget build(BuildContext context) {
    print(jpush);
    ScreenUtil.init(
      context,
      width: App.DESIGN_WIDTH,
      height: App.DESIGN_HEIGHT,
      allowFontScaling: App.ALLOW_FONT_SCALING_SELF,
    );
    var current_provider = Provider.of<CurrentIndexProvider>(context);
    int currentIndex = current_provider.currentIndex;
    return Scaffold(
      backgroundColor: Color.fromRGBO(244, 245, 245, 1),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        items: bottomTabs,
        onTap: (index) {
          current_provider.changeIndex(index);
        },
      ),
      body: IndexedStack(
        index: currentIndex,
        children: <Widget>[
          HomePage(jpush),
          CategoryPage(),
          CartPage(),
          MemberPage()
        ],
      ),
    );
  }
}
