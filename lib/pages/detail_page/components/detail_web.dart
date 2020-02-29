import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../provider/detail_info.dart';

class DetailWeb extends StatelessWidget {
  const DetailWeb({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var detail_provider = Provider.of<DetailInfoProvider>(context);
    // html片段
    var goodsDetail = detail_provider.goodsInfo.data.goodInfo.goodsDetail;
    var isLeft = detail_provider.isLeft;
    // var isRight = detail_provider.isRight;
    if (isLeft) {
      return Container(
        child: Html(
          data: '<div><h1 style="color:red">H1: left</h1></div>',
        ),
      );
    }
    return Container(
      child: Html(
        data: '<div><h2 style="color: yellow">H2: right</h2></div>',
      ),
    );
  }
}
