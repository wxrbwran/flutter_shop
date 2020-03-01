import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../provider/cart.dart';
import './compoents/cart_item.dart';
import './compoents/cart_bottom.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key key}) : super(key: key);

  Future<String> _getCartInfo(BuildContext context) async {
    await Provider.of<CartProvider>(context, listen: false).getCartInfo();
    print('CartPage cartList, success');
    return 'success';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('购物车'),
      ),
      body: FutureBuilder(
          future: _getCartInfo(context),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List cartList = Provider.of<CartProvider>(context).cartList;
              print('CartPage cartList, $cartList');
              return Stack(
                children: <Widget>[
                  ListView.builder(
                    itemCount: cartList.length,
                    itemBuilder: (context, index) {
                      return CartItem(cartList[index]);
                    },
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    child: CartBottom(),
                  )
                ],
              );
            }
            return Text('加载中。。。');
          }),
    );
  }
}
