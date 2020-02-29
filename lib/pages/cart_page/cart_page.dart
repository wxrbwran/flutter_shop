import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartPage extends StatefulWidget {
  CartPage({Key key});

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  List<String> logs = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _show();
  }

  @override
  Widget build(BuildContext context) {
    // 使用方法1
    // final counter = Provider.of<Counter>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('购物车'),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Container(
              height: 500,
              child: ListView.builder(
                itemCount: logs.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text(logs[index]),
                  );
                },
              ),
            ),
            RaisedButton(
                onPressed: () {
                  _add();
                },
                child: Text('add'))
          ],
        ),
      ),
    );
  }

  Future _getPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs;
  }

  void _show() async {
    SharedPreferences prefs = await _getPrefs();
    if (prefs.getStringList('logs') != null) {
      setState(() {
        logs = prefs.getStringList('logs');
      });
    } else {
      setState(() {
        logs = [];
      });
    }
  }

  void _add() async {
    SharedPreferences prefs = await _getPrefs();
    int now = DateTime.now().millisecondsSinceEpoch.abs();
    logs.add('$now');
    await prefs.setStringList('logs', logs);
    _show();
  }

  void _clear() async {
    SharedPreferences prefs = await _getPrefs();
    // prefs.clear();
    prefs.remove('logs');
    _show();
  }
}
