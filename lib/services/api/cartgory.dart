import 'package:dio/dio.dart';
import '../httpUtil.dart';

class CateApiConfigs {
  // 商品分类信息
  static String getCategory = '/getCategory';
  // 商品分类的商品列表
  static String getMallGoods = '/getMallGoods';
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

  Future getMallGoods(data) async {
    Response response = await _http.get(CateApiConfigs.getMallGoods, data: data);
    return response;
  }
}
