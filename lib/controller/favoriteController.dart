import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:green_leaf_app/models/foods_model.dart';

class FavoriteController extends GetxController{
    // Dictionary to store the products
  final _foods = {}.obs;

  
  // add Food function
   addFood( food) {
    if (_foods.containsKey(food)) {
      _foods[food] += 1;
    } else {
      _foods[food] = 1;
    }

    Get.snackbar("${food.foodname}", " ${food.foodname} saved for later",
        isDismissible: true,
        dismissDirection: DismissDirection.horizontal,
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 2));
  }

  void removeFood(Food food) {
    if (_foods.containsKey(food) && _foods[food] == 1) {
      _foods.removeWhere((key, value) => key == food);
    } else {
      _foods[food] -= 1;
    }
    Get.snackbar("Food Removed", "You have removed ${food.foodname} from Cart",
        snackPosition: SnackPosition.BOTTOM,
        isDismissible: true,
        dismissDirection: DismissDirection.horizontal,
        duration: const Duration(seconds: 2));
  }

  get foods => _foods;

}