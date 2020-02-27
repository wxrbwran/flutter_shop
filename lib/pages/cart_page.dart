import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:provider/provider.dart';
import '../provider/counter.dart';
import '../provider/translations.dart';

// import '../services/api/cartgory.dart';

class CartPage extends StatefulWidget {
  CartPage({Key key}) : super(key: key);

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    // 使用方法1
    // final counter = Provider.of<Counter>(context);
    final translations = Provider.of<Translations>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('购物车'),
      ),
      body: Center(
          child: Column(
            children: <Widget>[
              Text('${translations.title}'),
              // // 使用方法2
              Consumer<Counter>(
                  builder: (context, counter, _) => Text('${counter.value}')),
              // Text('${counter.value}'),
              RaisedButton(
                onPressed: () {
                  Provider.of<Counter>(context, listen: false).increment();
                },
                child: Text('plus++++++'),
              )
            ],
        )
      ),
    );
  }
}
