
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';

class LeaderPhone extends StatelessWidget {
  final String avatar;
  final String phone;
  const LeaderPhone({Key key, this.avatar, this.phone}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void _launchUrl() async {
      // String tel = 'tel:+1 850 534 988';
      String url = 'https://github.com/Solido/awesome-flutter';
      print('_launchUrl url');
      print(url);
      if (await canLaunch(url)) {
        launch(url);
      } else {
        throw '不能访问！';
      }
    }

    return Container(
      child: InkWell(
        onTap: _launchUrl,
        child: Container(
            margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
            child: Row(
              children: <Widget>[
                Image.network(avatar),
                Container(
                    margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    decoration: BoxDecoration(
                      // border: Border.all(color: Colors.redAccent, width: 1, style: BorderStyle.solid),
                      border: Border(
                          bottom: BorderSide(
                        color: Colors.redAccent,
                        width: 3,
                        style: BorderStyle.solid,
                      )),
                    ),
                    child: Text(
                      'LinkTo: awesome flutter',
                      style: TextStyle(
                        color: Colors.purpleAccent,
                        fontSize: ScreenUtil().setSp(50),
                      ),
                    ))
              ],
            )),
      ),
    );
  }
}
