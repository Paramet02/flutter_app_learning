import 'package:flutter/material.dart';
import 'package:flutter_version_2/models/home/view/homeview.dart';
import 'package:get/get.dart'; // [1] เพิ่ม import get
import 'package:flutter_version_2/models/home/controller/Binding/food.binding.dart'; // [2] เพิ่ม import binding

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // [3] เปลี่ยนจาก MaterialApp เป็น GetMaterialApp
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // [4] แก้ไข syntax: เติม ColorScheme ข้างหน้า .fromSeed
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // [5] เพิ่มบรรทัดนี้เพื่อเรียกใช้ Binding ที่เก็บ lazyPut ของ FoodController ไว้
      initialBinding: FoodBinding(), 
      home: const Homeview(),
    );
  }
}