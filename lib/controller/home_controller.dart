import 'package:get/get.dart';
import 'package:green_leaf_app/Service/remote_service/remote_food_service.dart';
import 'package:green_leaf_app/models/addFoods.dart';

class HomeController extends GetxController {
  static HomeController instance = Get.find();

  RxList<Food> foodList = List<Food>.empty(growable: true).obs;

  RxBool isFoodLoading = false.obs;

  @override
  void onInit() {
    getFoods();
    super.onInit();
  }

  void getFoods() async {
    try {
      isFoodLoading(true);
      var result = await RemoteFoodService().get();

      if (result != null) {
        foodList.assignAll(FoodListFromJson(result.body));
      }
    } finally {
      print("There are ${foodList.length} food items");
      isFoodLoading(false);
    }
  }
}
