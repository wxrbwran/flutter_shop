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
    var goodsDetail = detail_provider.goodsInfo.data.goodInfo.goodsDetail;
    return Container(
      child: Html(
        data: goodsDetail,
      ),
    );
  }
}
