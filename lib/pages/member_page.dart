import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/translations.dart';

class MemberPage extends StatelessWidget {
  const MemberPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final translations = Provider.of<Translations>(context);
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('会员中心'),
      // ),
      body: Center(
        child: Text(
          '${translations.title}'
        )
      ),
    );
  }
}