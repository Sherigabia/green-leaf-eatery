import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:green_leaf_app/controller/cartController.dart';

class CartTotal extends StatelessWidget {
  final CartController controller = Get.find();
  CartTotal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => Container(
        padding: EdgeInsets.symmetric(horizontal: 75),
        child: controller.foods.isNotEmpty
            ? Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Total',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'GH ${controller.total}',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ],
              )
            : const Text(
                'No items in Cart',
                style: TextStyle(fontSize: 24),
              )
              ));
  }
}
