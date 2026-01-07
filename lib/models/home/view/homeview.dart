import 'package:flutter/material.dart';
import 'package:flutter_version_2/models/home/controller/food.controller.dart';
import 'package:get/state_manager.dart';

int _selectedIndex = 0;

class Homeview extends GetView<FoodController> {
  const Homeview({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // คือ Creates a visual scaffold for Material Design widgets.
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 20),
          // EdgeInsets คือ class flutter / function flutter
          // .symmetric คือ Creates insets that match the given view padding
          children: [
            SizedBox(height: 20), // ระยะห่าง
            _headerview(),

            SizedBox(height: 30), // ระยะห่าง
            _searchbox(),

            SizedBox(height: 20),
            _categories(),

            SizedBox(height: 25),
            _gridviewbuilder(),
          ],
        ),
      ),
    );
  }

  Widget _headerview() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Foodgo',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            Text(
              'Order your favourite food!',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
          ],
        ),
        CircleAvatar(
          radius: 25,
          backgroundImage: AssetImage('assets/images/Maskgroup.png'),
        ),
      ],
    );
  }

  Widget _searchbox() {
    return Row(
      children: [
        // Row คือ widget ที่ใช้ในการจัดเรียง widget ลูกในแนวนอน และ Children คือ ตัวที่รองรับ widget อื่นๆ เพิ่มเติม และสามารถมีได้หลายตัว
        Expanded(
          // Expanded คือ widget ที่ใช้ในการขยาย widget ลูกให้เต็มพื้นที่ที่มีอยู่
          child: Container(
            // child คือ ตัวที่รองรับ widget อื่นๆ เพิ่มเติม แลพ Container คือ widget ที่ใช้สำหรับการจัดการ layout และตกแต่ง
            decoration: BoxDecoration(
              // BoxDecoration คือ class ที่ใช้ในการตกแต่งกล่อง และ decoration คือ ตัวที่ใช้ในการตกแต่ง widget
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: const Color.fromARGB(255, 220, 219, 219),
                  blurRadius: 10,
                ),
              ],
            ),
            child: TextField(
              decoration: InputDecoration(
                // InputDecoration คือ class ที่ใช้ในการตกแต่ง input field
                prefixIcon: Icon(Icons.search, color: Colors.black54),
                hintText: "Search",
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(vertical: 15),
              ),
            ),
          ),
        ),
        SizedBox(width: 15), // ระยะห่างของ widget
        Container(
          // Container คือ widget ที่ใช้สำหรับการจัดการ layout และตกแต่ง
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Icon(Icons.tune, color: Colors.white),
        ),
      ],
    );
  }

  // --- ส่วนของ Categories ---
  Widget _categories() {
    List<String> labels = ["All", "Combos", "Sliders", "Classic"];
    
    // หุ้มด้วย Obx เพื่อให้เวลาเปลี่ยนค่า _selectedIndex แล้ว UI สีปุ่มเปลี่ยนทันที
    // *หมายเหตุ: _selectedIndex ควรเป็น RxInt ใน Controller เพื่อประสิทธิภาพสูงสุด
    return SizedBox(
      height: 50,
      child: Obx(() => ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: labels.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              // สมมติว่าใน controller มีตัวแปร selectedCategory.value = index;
              _selectedIndex = index; 
              // ถ้าต้องการให้ Obx ทำงาน ตัวแปรที่เปลี่ยนต้องเป็น Rx เช่น controller.selectedIndex.value = index;
            },
            child: Container(
              margin: EdgeInsets.only(right: 15),
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: BoxDecoration(
                color: _selectedIndex == index
                    ? Colors.red
                    : const Color.fromARGB(255, 244, 243, 243),
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: const Color.fromARGB(255, 220, 219, 219),
                    blurRadius: 10,
                  ),
                ],
              ),
              child: Center(
                child: Text(
                  labels[index],
                  style: TextStyle(
                    color: _selectedIndex == index
                        ? Colors.white
                        : Colors.black54,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          );
        },
      )),
    );
  }

  Widget _carditem({
    required String title,
    String? description,
    String? imageUrl,
    String? rating,
    bool? isFavorite,
    Function()? onTap,
  }) {
    return Container(
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: const Color.fromARGB(255, 220, 219, 219),
            blurRadius: 10,
          ),
        ],
      ),
      // ใช้ ClipRRect เพื่อให้ InkWell ที่อยู่ข้างในไม่ล้นขอบโค้งของ Container
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: InkWell(
          onTap: () {
            print("Card Tapped!");
            // ใส่ logic เมื่อกดที่นี่ เช่น Get.to(DetailPage());
          },
          // splashColor: Colors.red.withOpacity(0.1), // เปลี่ยนสีตอนกดได้ที่นี่
          child: Column(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(20),
                ),
                child: Image.asset(
                  'assets/images/Cheeseburger.png',
                  height: 120,
                  width: 120, // ขยายให้เต็มความกว้าง Card
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(
                  10.0,
                ), // เพิ่ม Padding ให้เนื้อหาดูไม่ติดขอบ
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Cheeseburger',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    const Text(
                      'Wendy\'s Burger',
                      style: TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: const [
                            Icon(Icons.star, color: Colors.amber, size: 16),
                            SizedBox(width: 5),
                            Text(
                              '4.5',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                        const Icon(Icons.favorite, color: Colors.red, size: 16),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // --- ส่วนของ GridView ---
  Widget _gridviewbuilder() {
    // หุ้ม Obx ที่นี่ เพื่อให้เมื่อข้อมูลใน foodList (ที่เป็น RxList) เปลี่ยนแปลง
    // เช่น การค้นหา หรือโหลดข้อมูลเพิ่ม GridView จะวาดใหม่ทันที
    return Obx(() => GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 0.75,
      ),
      itemCount: controller.foodList.length,
      itemBuilder: (context, index) {
        return _carditem(
          title: controller.foodList[index].name ?? '',
          description: controller.foodList[index].description,
          imageUrl: controller.foodList[index].image ?? '',
          rating: controller.foodList[index].rating.toString(),
          isFavorite: controller.foodList[index].isFavorite,
        );
      },
    ));
  }
}
