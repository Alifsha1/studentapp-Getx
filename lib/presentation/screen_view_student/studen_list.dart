import 'dart:io';

import 'package:flutter/material.dart';
import 'package:studentapp/constants/colors.dart';
import 'package:studentapp/controller/student_controller.dart';
import 'package:get/get.dart';
import 'package:studentapp/presentation/update_student/screen_update_student.dart';

class StudentList extends StatefulWidget {
  const StudentList({Key? key}) : super(key: key);

  @override
  State<StudentList> createState() => _StudentListState();
}

class _StudentListState extends State<StudentList> {
  final studentDataController = Get.put(StudentDataController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(
              Icons.arrow_back,
              color: KWhite,
            ),
          ),
          centerTitle: true,
          title: const Text(
            'Students Names',
            style: TextStyle(
                color: Colors.white,
                fontSize: 23,
                fontWeight: FontWeight.bold,
                letterSpacing: 2),
          ),
          backgroundColor: Colors.purple[100],
        ),
        body: Obx(() => studentDataController.allStudents.isNotEmpty
            ? ListView.builder(
                itemCount: studentDataController.allStudents.length,
                itemBuilder: (context, index) => Card(
                      child: ListTile(
                        leading: CircleAvatar(
                          radius: 40,
                          child: ClipOval(
                            child: Image.file(
                              File(studentDataController
                                  .allStudents[index].image!),
                              width: 60,
                              height: 60,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        title: Text(
                          studentDataController.allStudents[index].name,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        subtitle: Text(
                          'Domain: ${studentDataController.allStudents[index].domain}\nBatch:${studentDataController.allStudents[index].batch}',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                        trailing: SizedBox(
                          width: 100,
                          child: Row(
                            children: [
                              IconButton(
                                onPressed: () {
                                  Get.defaultDialog(
                                      radius: 10,
                                      confirmTextColor: Kblack,
                                      cancelTextColor: KWhite,
                                      textConfirm: 'Yes',
                                      buttonColor: KWhite,
                                      textCancel: 'No',
                                      onConfirm: () {
                                        studentDataController.deleteStudent(
                                            studentDataController
                                                .allStudents[index].id!);
                                        Get.back();
                                      },
                                      backgroundColor: Colors.blueGrey[300],
                                      title: 'Delete Details',
                                      titleStyle: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: KWhite),
                                      content: const Text(
                                        'Are You sure you want to delete this details',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15,
                                            color: KWhite),
                                      ));
                                },
                                icon: const Icon(Icons.delete),
                              ),
                              IconButton(
                                onPressed: () {
                                  Get.to(UpdateStudent(
                                      name: studentDataController
                                          .allStudents[index].name,
                                      domain: studentDataController
                                          .allStudents[index].domain!,
                                      batch: studentDataController
                                          .allStudents[index].batch!,
                                      imagePath: studentDataController
                                          .allStudents[index].image!,
                                      id: studentDataController
                                          .allStudents[index].id!));
                                },
                                icon: const Icon(Icons.edit),
                              )
                            ],
                          ),
                        ),
                      ),
                    ))
            : Center(
                child: Text('No Datas found?Add Data'),
              )),
        // floatingActionButton: FloatingActionButton(
        //   onPressed: () {
        //     Get.to(ScreenStudentAdd());
        //   },
        //   child: const Icon(Icons.add),
        // ),
      ),
    );
  }
}
