import 'package:flutter/material.dart'; // 谷歌样式主题
import 'package:flutter/cupertino.dart'; // ios样式主题
import 'package:provider/provider.dart';
import 'package:fluro/fluro.dart';
import './routes/routes.dart';
import './routes/application.dart';
import './pages/index_page.dart';
import './provider/counter.dart';
import './provider/translations.dart';
import './provider/category_goods_list.dart';
import './provider/child_category.dart';
import './provider/detail_info.dart';
import './provider/cart.dart';
import './provider/current_index.dart';
import 'package:flutter/services.dart';
import 'package:jpush_flutter/jpush_flutter.dart';

// provider有以下三个特点：

// 可维护性，provider强制使用单向数据流
// 易测性/可组合性，provider可以很方便地模拟或者复写数据
// 鲁棒性，provider会在合适的时候更新组件或者模型的状态，降低错误率
void main() {
  // Router router = Router();
  // Routes.configureRoutes(router);
  // Application.router = router;
  runApp(MultiProvider(
    providers: [
      // Exposing a new object instance
      // 注册方法1 NON'T 官方不推荐
      // ChangeNotifierProvider.value(value: Counter()),
      // 注册方法2 DO
      ChangeNotifierProvider<Counter>(create: (_) => Counter()),
      ChangeNotifierProvider<ChildCategoryProvider>(
          create: (_) => ChildCategoryProvider()),
      ChangeNotifierProvider<CategoryGoodsListProvider>(
          create: (_) => CategoryGoodsListProvider()),
      ChangeNotifierProvider<DetailInfoProvider>(
          create: (_) => DetailInfoProvider()),
      ChangeNotifierProvider<CartProvider>(create: (_) => CartProvider()),
      ChangeNotifierProvider<CurrentIndexProvider>(
          create: (_) => CurrentIndexProvider()),
      ProxyProvider<Counter, Translations>(
        update: (_, counter, __) => Translations(counter.value),
      ),
      // Reusing an existing object instance:
      // 如上正相反
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  MyApp({Key key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String debugLable = 'Unknown';
  final JPush jpush = new JPush();
  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  @override
  Widget build(BuildContext context) {
    // fluro-------------------主要代码start
    final router = Router();
    Routes.configureRoutes(router);
    Application.router = router;
    // fluro -------------------主要代码end
    return Container(
      child: MaterialApp(
          title: '百姓生活+',
          onGenerateRoute: Application.router.generator,
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primaryColor: Colors.pink,
          ),
          home: IndexPage()),
    );
  }

  Future<void> initPlatformState() async {
    String platformVersion;
    try {
      jpush.addEventHandler(
          onReceiveNotification: (Map<String, dynamic> message) async {
        print("flutter onReceiveNotification: $message");
        setState(() {
          debugLable = "flutter onReceiveNotification: $message";
        });
      }, onOpenNotification: (Map<String, dynamic> message) async {
        print("flutter onOpenNotification: $message");
        setState(() {
          debugLable = "flutter onOpenNotification: $message";
        });
      }, onReceiveMessage: (Map<String, dynamic> message) async {
        print("flutter onReceiveMessage: $message");
        setState(() {
          debugLable = "flutter onReceiveMessage: $message";
        });
      }, onReceiveNotificationAuthorization:
              (Map<String, dynamic> message) async {
        print("flutter onReceiveNotificationAuthorization: $message");
        setState(() {
          debugLable = "flutter onReceiveNotificationAuthorization: $message";
        });
      });
    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
    }

    jpush.setup(
      appKey: "e58a32cb3e4469ebf31867e5", //你自己应用的 AppKey
      channel: "theChannel",
      production: false,
      debug: true,
    );
    jpush.applyPushAuthority(
        new NotificationSettingsIOS(sound: true, alert: true, badge: true));

    // Platform messages may fail, so we use a try/catch PlatformException.
    jpush.getRegistrationID().then((rid) {
      print("flutter get registration id : $rid");
      setState(() {
        debugLable = "flutter getRegistrationID: $rid";
      });
    });

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      debugLable = platformVersion;
    });
  }
}
