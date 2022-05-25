import 'package:flutter/material.dart';
import 'package:green_leaf_app/Widgets/cartProducts.dart';
import 'package:green_leaf_app/Widgets/cartTotal.dart';
import 'package:green_leaf_app/favourites.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text("Cart"),
      ),
      body: Column(
        children: [CartProducts(), CartTotal()],
      ),
    );
  }
}
