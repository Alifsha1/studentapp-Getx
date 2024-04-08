import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studentapp/constants/colors.dart';
import 'package:studentapp/constants/constants.dart';
import 'package:studentapp/controller/image_pick_controller.dart';
import 'package:studentapp/controller/student_controller.dart';
import 'package:studentapp/model/student_model.dart';
import 'package:studentapp/presentation/add_students/widgets/text_form_field.dart';
import 'package:studentapp/presentation/screen_view_student/studen_list.dart';

class ScreenStudentAdd extends StatelessWidget {
  const ScreenStudentAdd({super.key});

  @override
  Widget build(BuildContext context) {
    final studentDataController = Get.put(StudentDataController());
    final _formKey = GlobalKey<FormState>();
    final nameController = TextEditingController();
    final domainController = TextEditingController();
    final batchController = TextEditingController();
    PickimageController controller = PickimageController();

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(
                Icons.arrow_back,
              )),
          backgroundColor: Colors.purple[100],
          title: const Text(
            'Add',
            style: TextStyle(
                color: Colors.white,
                fontSize: 23,
                fontWeight: FontWeight.bold,
                letterSpacing: 2),
          ),
        ),
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                height20,
                CircleAvatar(
                  backgroundColor: KWhite,
                  maxRadius: 80,
                  child: Obx(
                    () => GestureDetector(
                      onTap: () async {
                        controller.pickimage();
                      },
                      child: controller.selectedImagePath.value != ''
                          ? ClipOval(
                              child: Image.file(
                                File(controller.selectedImagePath.value),
                                fit: BoxFit.cover,
                                width: 140,
                                height: 140,
                              ),
                            )
                          : const Icon(
                              Icons.add_a_photo_outlined,
                              size: 30,
                            ),
                    ),
                  ),
                ),
                height10,
                const Text(
                  'Add Image',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                height20,
                TextFormFieldWidget(
                  labelText: 'Enter Name',
                  controller: nameController,
                  errorText: 'Name cannot be empty',
                  formKey: _formKey,
                ),
                TextFormFieldWidget(
                  labelText: 'Enter domain',
                  controller: domainController,
                  errorText: 'domain cannot be empty',
                  formKey: _formKey,
                ),
                TextFormFieldWidget(
                  labelText: 'Enter batch',
                  controller: batchController,
                  errorText: 'batch cannot be empty',
                  formKey: _formKey,
                ),
                height20,
                ElevatedButton(
                  onPressed: () {
                    if (controller.selectedImagePath.value.isEmpty) {
                      showDialog('No image', 'Please select an Image',
                          const Color.fromARGB(255, 223, 87, 78));
                    }
                    if (_formKey.currentState!.validate() &&
                        controller.selectedImagePath.value.isNotEmpty) {
                      var id = DateTime.now().millisecond;
                      studentDataController.addStudents(
                        StudentModel(
                          id: id,
                          name: nameController.text,
                          domain: domainController.text,
                          batch: batchController.text,
                          image: controller.selectedImagePath.value,
                        ),
                      );
                      controller.selectedImagePath.value = '';
                      nameController.clear();
                      domainController.clear();
                      batchController.clear();
                      Get.to(const StudentList());
                      showDialog('Saved', 'Details added Succesfully',
                          const Color.fromARGB(255, 99, 190, 102));
                    }
                  },
                  child: const Text(
                    'Save Details',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Kblack),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

showDialog(String title, String message, Color backgroundcolor) {
  Get.snackbar(title, message,
      colorText: KWhite,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: backgroundcolor);
}
