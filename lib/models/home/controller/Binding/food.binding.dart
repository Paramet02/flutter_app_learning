import 'package:flutter_version_2/models/home/controller/food.controller.dart';
import 'package:get/get.dart';

class FoodBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FoodController>(() => FoodController());
  }
}