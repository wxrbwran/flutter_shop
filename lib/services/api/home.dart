import 'package:dio/dio.dart';
import '../httpUtil.dart';

class HomeApiConfigs {
  // 商城首页信息。。。。
  static String homePageContent = '/homePageContent';
  // static String homePageSwiper = '/homePageSwiper';
  // 商城热卖商品
  static String homePageBelowContent = '/homePageBelowContent';
}

class HomeApi {
  static HttpUtil _http;
  static HomeApi _instance;
  HomeApi._private() {
    _http = HttpUtil();
  }
  factory HomeApi() {
    if (_instance == null) {
      _instance = HomeApi._private();
    }
    return _instance;
  }

  Future getTestHttp(data) async {
    Response res = await _http.post(HomeApiConfigs.homePageContent, data: data);
    // print('Future getHttp, $res, ${res.data}');
    return res;
  }

  // 获取首页主体部分
  // Future getHomePageContent() async {
  //   Map data = {'lon': '111.2131', 'lat': '35.1231'};
  //   Response response =
  //       await _http.get(HomeApiConfigs.homePageContent, data: data);
  //   return response;
  // }

  Future getHomePageContent() async {
    Response response = await _http.get(HomeApiConfigs.homePageContent);
    return response;
  }

  // 获取火爆专区
  Future getHomePageBelow({page: 1}) async {
    // int page = 1;
    var data = { 'page': page };
    Response response = await _http.get(HomeApiConfigs.homePageBelowContent, data: data);
    return response;
  }
}
