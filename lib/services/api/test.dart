import 'package:dio/dio.dart';
import '../httputil.dart';
import '../../model/home_banner.dart';
import '../../model/home_article.dart';

class TestApiConfigs {
  // static const _baseUrl = 'https://www.wanandroid.com';

  static String test = '/test';
  static String homeBanner = '/banner/json';

  static String homeArticle(int page) => '/article/list/$page/json';
}

class TestApi {
  static HttpUtil _http;
  static TestApi _instance;

  TestApi._private() {
    // BaseOptions options = BaseOptions(
    //   baseUrl: ApiConfigs._baseUrl,
    //   connectTimeout: 5000,
    //   receiveTimeout: 3000,
    // );

    _http = HttpUtil();
  }

  factory TestApi() {
    if (_instance == null) {
      _instance = TestApi._private();
    }
    return _instance;
  }

  Future<HomeArticleEntity> fetchHomeArticles(int page) async {
    Response response = await _http.get(TestApiConfigs.homeArticle(page));
    return HomeArticleEntity.fromJson(response.data);
  }

  Future<List<HomeBannerDetail>> fetchHomeBanner() async {
    Response response = await _http.get(TestApiConfigs.homeBanner);
    HomeBannerEntity entity = HomeBannerEntity.fromJson(response.data);
    return entity.errorCode == 0 ? entity.data : [];
  }

  Future getTestHttp(data) async {
    Response res = await _http.post(TestApiConfigs.test, data: data);
    print('Future getHttp, $res, ${res.data}');
    return res;
  }
}
