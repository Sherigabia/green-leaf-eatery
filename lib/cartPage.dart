import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:green_leaf_app/Widgets/cartProducts.dart';
import 'package:green_leaf_app/Widgets/cartTotal.dart';
import 'package:green_leaf_app/controller/cartController.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final CartController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: Column(children: [
            Text(
              "Cart Items",
              style: TextStyle(color: Colors.white),
            ),
            Obx(() => Text(
                  "${controller.foods.length} items",
                  style: Theme.of(context).textTheme.caption,
                ))
          ]),
          centerTitle: true,
        ),
        body: CartProducts(),
        bottomNavigationBar: CartTotal());
  }
}
