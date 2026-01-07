import 'package:flutter/material.dart';
import 'package:flutter_version_2/models/home/controller/food.controller.dart';
import 'package:get/state_manager.dart';

int _selectedIndex = 0;

class _HomeviewState extends GetView<FoodController>{
  @override
  Widget build(BuildContext context) {
    return Scaffold( // คือ Creates a visual scaffold for Material Design widgets.
      backgroundColor: Colors.white,
      body: SafeArea( 
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 20), 
          // EdgeInsets คือ class flutter / function flutter 
          // .symmetric คือ Creates insets that match the given view padding
          children: [
            SizedBox(height: 20,), // ระยะห่าง
            _headerview(),

            SizedBox(height: 30,), // ระยะห่าง
            _searchbox(),

            SizedBox(height: 20,),
            _categories(),

            SizedBox(height: 25,),
            _gridviewbuilder(),

          ],
        ),
      ),
    );
  }
}

Widget _headerview() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Foodgo' , style: TextStyle(fontSize: 32 , fontWeight: FontWeight.bold , color: Colors.black),),
          Text('Order your favourite food!', style: TextStyle(fontSize: 16 , color: Colors.grey),)
        ],
      ),
      CircleAvatar(
        radius: 25,
        backgroundImage: AssetImage('assets/images/Maskgroup.png'),
      )
    ],    
  );
}

Widget _searchbox() {
  return Row(
    children: [ // Row คือ widget ที่ใช้ในการจัดเรียง widget ลูกในแนวนอน และ Children คือ ตัวที่รองรับ widget อื่นๆ เพิ่มเติม และสามารถมีได้หลายตัว
      Expanded( // Expanded คือ widget ที่ใช้ในการขยาย widget ลูกให้เต็มพื้นที่ที่มีอยู่
        child: Container( // child คือ ตัวที่รองรับ widget อื่นๆ เพิ่มเติม แลพ Container คือ widget ที่ใช้สำหรับการจัดการ layout และตกแต่ง
          decoration: BoxDecoration( // BoxDecoration คือ class ที่ใช้ในการตกแต่งกล่อง และ decoration คือ ตัวที่ใช้ในการตกแต่ง widget
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [BoxShadow(color: const Color.fromARGB(255, 220, 219, 219), blurRadius: 10)],
          ),
          child: TextField( 
            decoration: InputDecoration( // InputDecoration คือ class ที่ใช้ในการตกแต่ง input field
                prefixIcon: Icon(Icons.search, color: Colors.black54),
                hintText: "Search",
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(vertical: 15),
              ),
          ),
      ),
      ),
      SizedBox(width: 15,), // ระยะห่างของ widget
      Container( // Container คือ widget ที่ใช้สำหรับการจัดการ layout และตกแต่ง
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(color: Colors.red, borderRadius: BorderRadius.circular(15)),
        child: Icon(Icons.tune , color: Colors.white,),
      )
    ],
  );
}

Widget _categories() {
  List<String> labels = ["All", "Combos", "Sliders", "Classic"]; // กำหนด list ชื่อป้ายกำกับ
  return SizedBox( // SizedBox คือ widget ที่ใช้ในการกำหนดขนาดของ widget ลูก
    height: 50,
    child: ListView.builder( // ListView.builder คือ widget ที่ใช้ในการสร้างรายการแบบเลื่อน
      scrollDirection: Axis.horizontal,
      itemCount: labels.length, // จำนวนรายการใน list
      itemBuilder: (context, index) { // itemBuilder คือ ตัวที่ใช้ในการสร้าง widget สำหรับแต่ละรายการใน list และ index คือ ตัวที่ใช้ในการระบุหมายเลขของรายการใน list , context คือ ตัวที่ใช้ในการเข้าถึงข้อมูลของ widget
        return GestureDetector(
          onTap: () { // onTap คือ ตัวที่ใช้ในการตรวจจับการแตะบน widget
            _selectedIndex = index; 
          },
          child: Container(
            margin: EdgeInsets.only(right: 15),
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            decoration: BoxDecoration(
              color: _selectedIndex == index ? Colors.red : const Color.fromARGB(255, 244, 243, 243),
              borderRadius: BorderRadius.circular(15),
              boxShadow: [BoxShadow(color: const Color.fromARGB(255, 220, 219, 219), blurRadius: 10)],
            ),
            child: Center(
              child: Text(
                labels[index],
                style: TextStyle(
                  color: _selectedIndex == index ? Colors.white : Colors.black54,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        );
      },
    ),
  );
}

Widget _carditem() {
  return Container(
    margin: EdgeInsets.all(10),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(20),
      boxShadow: [BoxShadow(color: const Color.fromARGB(255, 220, 219, 219), blurRadius: 10)],
    ),
    child: Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image.asset('assets/images/Cheeseburger.png', height: 120, width: 120, fit: BoxFit.cover),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10,),
            Text('Cheeseburger' , style: TextStyle(fontSize: 18 , fontWeight: FontWeight.bold , color: Colors.black),),
            Text('Wendy\'s Burger' , style: TextStyle(fontSize: 14 , color: Colors.grey),),
            SizedBox(height: 5,),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              children: [
                Icon(Icons.star , color: Colors.amber , size: 16,),
                SizedBox(width: 5,),
                Text('4.5' , style: TextStyle(fontSize: 14 , color: Colors.black),),
              ],
            ),
            
            Icon(Icons.favorite, color: Colors.red , size: 16,),
          ],
        )
      ],
    ),
  );
}

Widget _gridviewbuilder() {
  return GridView.builder(
    shrinkWrap: true, // ใช้ในกรณีที่อยู่ใน Column อื่น
    physics: NeverScrollableScrollPhysics(), // ถ้าต้องการให้ scroll ไปกับหน้าจอหลัก
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2, // กำหนดให้มี 2 คอลัมน์
      crossAxisSpacing: 10, // ระยะห่างแนวตั้ง
      mainAxisSpacing: 10, // ระยะห่างแนวนอน
      childAspectRatio: 0.75, // ปรับค่านี้เพื่อให้ความสูงของ Card พอดีกับเนื้อหา
    ),
    itemCount: 6,
    itemBuilder: (context, index) {
      return _carditem();
    },
  );
}