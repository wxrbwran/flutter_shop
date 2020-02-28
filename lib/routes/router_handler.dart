import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import '../pages/detail_page/detail_page.dart';


Handler detailHander =Handler(
  handlerFunc: (BuildContext context,Map<String,List<String>> params){
    String goodsId = params['id'].first;
    print('index>details goodsID is ${goodsId}');
    return DetailPage(goodsId);
  }
);