import 'package:dio/dio.dart';
import 'package:flutter_version_2/models/home/model/food.model.dart';
import 'package:get/get.dart';

class FoodController extends GetxController {
  RxList<FoodModel> foodList = <FoodModel>[].obs;
  // Add your controller variables and methods here
  var selectedIndex = 0.obs;

  Dio dio = Dio();

  @override
  void onInit() {
    super.onInit();
    fetchFoodData();
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