import 'package:dio/dio.dart';
import 'package:flutter_version_2/models/home/model/food.model.dart';
import 'package:get/get.dart';

class FoodController extends GetxController {
  // ใช้ RxList สำหรับการสังเกตการเปลี่ยนแปลงของรายการอาหาร
  RxList<FoodModel> foodList = <FoodModel>[].obs;
  // ตัวแปรสำหรับเก็บดัชนีที่เลือก
  var selectedIndex = 0.obs;
  // สร้าง instance ของ Dio สำหรับการทำ HTTP requests
  Dio dio = Dio();

  @override // override คือ การเขียนทับเมธอดจากคลาสแม่
  void onInit() { // onInit จะถูกเรียกใช้เมื่อ Controller ถูกสร้างขึ้น
    super.onInit(); 
    fetchFoodData(); // เรียกใช้ฟังก์ชันเพื่อดึงข้อมูลอาหารเมื่อ Controller ถูกสร้างขึ้น
  }

  void fetchFoodData() async {
    try {
      final response = await dio.get('https://apiopenspace.vercel.app/foodItems'); // Replace with your API endpoint
      if (response.statusCode == 200) {
        List<dynamic> data = response.data;
        foodList.value = data.map((item) => FoodModel.fromJson(item)).toList();
      } else {
        print('Failed to load food data');
      }
    } catch (e) {
      print('Error fetching food data: $e');
    }
  }
}