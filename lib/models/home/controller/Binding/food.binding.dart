import 'package:flutter_version_2/models/home/controller/food.controller.dart';
import 'package:get/get.dart';

// ในไฟล์ food.binding.dart
class FoodBinding implements Bindings {
  @override
  void dependencies() {
    // ใช้ lazyPut เพื่อสร้าง Controller เมื่อมีการเรียกใช้หน้า Homeview เท่านั้น
    Get.lazyPut<FoodController>(() => FoodController());
  }
}