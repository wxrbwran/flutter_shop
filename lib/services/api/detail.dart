import 'package:dio/dio.dart';
import '../httpUtil.dart';

class DetailApiConfigs {
  // 商品分类信息
  static String getGoodDetailById = '/getGoodDetailById';
  // 商品分类的商品列表
}

class DetailApi {
  static HttpUtil _http;
  static DetailApi _instance;
  DetailApi._private() {
    _http = HttpUtil();
  }
  factory DetailApi() {
    if (_instance == null) {
      _instance = DetailApi._private();
    }
    return _instance;
  }

  Future getGoodDetailById(data) async {
    Response response = await _http.get(DetailApiConfigs.getGoodDetailById, data: data);
    return response;
  }
}
