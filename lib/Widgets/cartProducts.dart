import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:green_leaf_app/controller/cartController.dart';
import 'package:green_leaf_app/models/foods_model.dart';
import 'package:tbib_splash_screen/splash_screen_view.dart';

class CartProducts extends StatefulWidget {
  CartProducts({Key? key}) : super(key: key);

  @override
  State<CartProducts> createState() => _CartProductsState();
}

class _CartProductsState extends State<CartProducts> {
  final CartController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(() => SizedBox(
          height: 500,
          child: Flexible(
            child: controller.foods.isNotEmpty
                ? ListView.builder(
                    itemCount: controller.foods.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Dismissible(
                          key: UniqueKey(),
                          direction: DismissDirection.endToStart,
                          background: Container(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            decoration: BoxDecoration(color: Color(0xFFFFE6E6)),
                            child: Row(
                              children: [
                                Spacer(),
                                Text(
                                  'Remove from Cart',
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Icon(Icons.delete)
                              ],
                            ),
                          ),
                          onDismissed: (direction) {
                            if (direction == DismissDirection.endToStart) {
                              controller.deleteFood(
                                  controller.foods.keys.toList()[index]);
                            }
                            setState(() {
                              controller.foods.keys.toList().removeAt(index);
                            });
                          },
                          child: cartProductCard(
                            controller: controller,
                            food: controller.foods.keys.toList()[index],
                            quantity: controller.foods.values.toList()[index],
                            index: index,
                          ),
                        ),
                      );
                    })
                : Center(
                    child: Lottie.asset("assets/images/empty-cart.json"),
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

  const cartProductCard(
      {required this.controller,
      required this.food,
      required this.quantity,
      required this.index,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CircleAvatar(
              radius: 40,
              backgroundImage: NetworkImage(food.img),
            ),
            SizedBox(
              width: 10,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    food.foodname,
                    style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Text(
                        "GH₵" + food.price.toString(),
                        style: TextStyle(
                            color: Colors.grey[600],
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "X " + quantity.toString(),
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Text(
                        "total :",
                        style: TextStyle(
                            color: Colors.grey[600],
                            fontSize: 12.0,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        " GH₵" + controller.foodSubtotal[index].toString(),
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  IconButton(
                      onPressed: () {
                        controller.removeFood(food);
                      },
                      icon: const Icon(
                        Icons.remove_circle_outline,
                        color: Colors.red,
                        size: 30,
                      )),
                  Text('$quantity'),
                  IconButton(
                      onPressed: () {
                        controller.addFood(food);
                      },
                      icon: const Icon(
                        Icons.add_circle_outline,
                        color: Colors.green,
                        size: 30,
                      )),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
