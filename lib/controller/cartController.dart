import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:green_leaf_app/models/foods_model.dart';

class CartController extends GetxController {
  // Dictionary to store the products
  var _foods = {}.obs;

  // add Food function
  addFood(food) {
    if (_foods.containsKey(food)) {
      _foods[food] += 1;
    } else {
      _foods[food] = 1;
    }

    Get.snackbar("Food Added", "You have added ${food.foodname} to Cart",
        isDismissible: true,
        dismissDirection: DismissDirection.horizontal,
        snackPosition: SnackPosition.BOTTOM,
        duration: Duration(seconds: 2));
  }

  void removeFood(Food food) {
    
      if (_foods.containsKey(food) && _foods[food] == 1) {
        _foods.removeWhere((key, value) => key == food);
      } else {
        _foods[food] -= 1;
      }
      Get.snackbar(
          "Food Removed", "You have removed ${food.foodname} from Cart",
          snackPosition: SnackPosition.BOTTOM,
          isDismissible: true,
          dismissDirection: DismissDirection.horizontal,
          duration: Duration(seconds: 2));
    }
  

  get foods => _foods;

  get foodSubtotal =>
      _foods.entries.map((food) => food.key.price * food.value).toList().obs;

  get total => _foods.entries
      .map((food) => food.key.price * food.value)
      .toList()
      .reduce((value, element) => value + element)
      .toStringAsFixed(2);
}
