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
      ProxyProvider<Counter, Translations>(
        update: (_, counter, __) => Translations(counter.value),
      ),
      // Reusing an existing object instance:
      // 如上正相反
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    //-------------------主要代码start
    final router = Router();
    Routes.configureRoutes(router);
    Application.router=router;
    //-------------------主要代码end
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
}
