import 'package:get/get.dart';
import 'package:green_leaf_app/controller/dashboardController.dart';
import 'package:green_leaf_app/controller/home_controller.dart';

class DashboardBinding extends Bindings {
  void dependencies() {
    Get.put(DashBoardController());
    Get.put(HomeController());
  }
}
