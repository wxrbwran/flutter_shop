import 'package:dio/dio.dart';
import '../httpUtil.dart';

class CateApiConfigs {
  static String getCategory = '/getCategory';
}

class CateApi {
  static HttpUtil _http;
  static CateApi _instance;
  CateApi._private() {
    _http = HttpUtil();
  }
  factory CateApi() {
    if (_instance == null) {
      _instance = CateApi._private();
    }
    return _instance;
  }

  Future getCategory() async {
    Response response = await _http.get(CateApiConfigs.getCategory);
    return response;
  }

  // // 获取火爆专区
  // Future getHomePageBelow({page: 1}) async {
  //   // int page = 1;
  //   var data = { 'page': page };
  //   Response response = await _http.get(CateApiConfigs.homePageBelowContent, data: data);
  //   return response;
  // }
}
