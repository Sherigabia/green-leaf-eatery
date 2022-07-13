import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:green_leaf_app/controller/favoriteController.dart';
import 'package:green_leaf_app/models/foods_model.dart';
import 'package:lottie/lottie.dart';

class FavoriteFoods extends StatelessWidget {
  final FavoriteController controller = Get.find();
  FavoriteFoods({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => SizedBox(
          height: 500,
          child: Flexible(
            child: controller.foods.isNotEmpty
                ? ListView.builder(
                    itemCount: controller.foods.length,
                    itemBuilder: (BuildContext context, int index) {
                      return FavoriteFoodCard(
                        controller: controller,
                        food: controller.foods.keys.toList()[index],
                        quantity: controller.foods.values.toList()[index],
                        index: index,
                      );
                    })
                : Center(
                    child: Lottie.asset("assets/images/no-item.json"),
                  ),
          ),
        ));
  }
}

class FavoriteFoodCard extends StatelessWidget {
  final FavoriteController controller;
  final Food food;
  final int quantity;
  final int index;

  const FavoriteFoodCard(
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
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CircleAvatar(
              radius: 40,
              backgroundImage: NetworkImage(food.img),
            ),
            const SizedBox(
              width: 20,
            ),
            Expanded(child: Text(food.foodname)),
            IconButton(
                onPressed: () {
                  controller.removeFood(food);
                },
                icon: const Icon(
                  Icons.favorite,
                  color: Colors.red,
                  size: 24,
                )),
            const Text('Liked'),
          ],
        ),
      ),
    );
  }
}
