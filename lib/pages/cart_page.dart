import 'package:flutter/material.dart';
import 'dart:convert';
import '../services/api/cartgory.dart';

class CartPage extends StatefulWidget {
  CartPage({Key key}) : super(key: key);

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
       child: Text('CartPage'),
    );
  }
}