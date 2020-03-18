import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../services/api/test.dart';

const isProd = bool.fromEnvironment('dart.vm.product');

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController typeController = TextEditingController();
  String showText = '生产环境？${isProd.toString()}';
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Container(
          width: ScreenUtil().setWidth(375),
          height: ScreenUtil().setHeight(800),
          child: Column(
            children: <Widget>[
              TextField(
                controller: typeController,
                style: TextStyle(
                  fontSize: ScreenUtil().setSp(28)
                ),
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(10),
                  labelText: '类型',
                  helperText: '请输入类型',
                  
                ),
                autofocus: false,
              ),
              RaisedButton(onPressed: _choiceAction, child: Text('确定')),
              Text(
                showText,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              )
            ],
          ),
      )
    );
  }

  void _choiceAction() {
    print('开始');
    if (typeController.text.toString() == '') {
      showDialog(
          context: context,
          builder: (context) => AlertDialog(title: Text('不能为空！')));
    } else {
      getHttp(typeController.text.toString()).then((val) {
        print(val);
        setState(() {
          showText = val['data']['name'].toString();
        });
      });
    }
  }

  Future getHttp(String textType) async {
    try {
      var data = {
        'type': textType,
      };
      // String url = 'http://rap2.taobao.org:38080/app/mock/245329/test';
      // Response res = await Dio().post(url, queryParameters: data);
      Response res = await TestApi().getTestHttp(data);
      print(res);
      return res.data;
    } catch (e) {
      return print(e);
    }
  }
}
