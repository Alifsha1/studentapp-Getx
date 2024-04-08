import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studentapp/constants/colors.dart';
import 'package:studentapp/constants/constants.dart';
import 'package:studentapp/presentation/add_students/student_list_add.dart';
import 'package:studentapp/presentation/screen_view_student/studen_list.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'Students ',
            style: TextStyle(
                color: Colors.white,
                fontSize: 23,
                fontWeight: FontWeight.bold,
                letterSpacing: 2),
          ),
          backgroundColor: Colors.purple[100],
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              elevatedButton(size, 'Add Details', const ScreenStudentAdd()),
              height20,
              elevatedButton(size, 'View List', const StudentList())
            ],
          ),
        ),
      ),
    );
  }

  ElevatedButton elevatedButton(Size size, String title, page) {
    return ElevatedButton(
        onPressed: () {
          Get.to(page);
        },
        style: ElevatedButton.styleFrom(
          minimumSize: Size(size.width - 120, 60),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        child: Text(
          title,
          style: const TextStyle(
              fontWeight: FontWeight.bold, fontSize: 20, color: Kblack),
        ));
  }
}
