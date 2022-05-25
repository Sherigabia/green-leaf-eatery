import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:green_leaf_app/controller/cartController.dart';
import 'package:green_leaf_app/models/foods_model.dart';

class CartProducts extends StatelessWidget {
  final CartController controller = Get.find();

  CartProducts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => SizedBox(
          height: 500,
          child: Flexible(
            child: controller.foods.isNotEmpty
                ? ListView.builder(
                    itemCount: controller.foods.length,
                    itemBuilder: (BuildContext context, int index) {
                      return cartProductCard(
                        controller: controller,
                        food: controller.foods.keys.toList()[index],
                        quantity: controller.foods.values.toList()[index],
                        index: index,
                      );
                    })
                : Center(
                    child: const Text(
                      'No results found',
                      style: TextStyle(fontSize: 24),
                    ),
                  ),
          ),
        ));
  }
}

class cartProductCard extends StatelessWidget {
  final CartController controller;
  final Food food;
  final int quantity;
  final int index;

  cartProductCard(
      {required this.controller,
      required this.food,
      required this.quantity,
      required this.index,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CircleAvatar(
            radius: 40,
            backgroundImage: AssetImage(food.img),
          ),
          SizedBox(
            width: 20,
          ),
          Expanded(child: Text(food.foodname)),
          IconButton(
              onPressed: () {
                controller.removeFood(food);
              },
              icon: Icon(
                Icons.remove_circle,
                color: Colors.red,
              )),
          Text('${quantity}'),
          IconButton(
              onPressed: () {
                controller.addFood(food);
              },
              icon: Icon(
                Icons.add_circle,
                color: Colors.green,
              )),
        ],
      ),
    );
  }
}
