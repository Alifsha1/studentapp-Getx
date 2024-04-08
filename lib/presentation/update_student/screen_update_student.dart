import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studentapp/constants/colors.dart';
import 'package:studentapp/constants/constants.dart';
import 'package:studentapp/controller/image_pick_controller.dart';
import 'package:studentapp/controller/student_controller.dart';
import 'package:studentapp/model/student_model.dart';
import 'package:studentapp/presentation/add_students/widgets/text_form_field.dart';

class UpdateStudent extends StatelessWidget {
  final String name;
  final String domain;
  final String batch;
  final String imagePath;
  final int id;
  const UpdateStudent({
    super.key,
    required this.name,
    required this.domain,
    required this.batch,
    required this.imagePath,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    final studentDataController = Get.put(StudentDataController());
    final _formKey = GlobalKey<FormState>();
    final namecontroller = TextEditingController(text: name);
    final domainController = TextEditingController(text: domain);
    final batchcontroller = TextEditingController(text: batch);
    PickimageController controller = PickimageController();
    controller.selectedImagePath.value = imagePath;

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
              )),
          backgroundColor: Colors.purple[100],
          title: const Text(
            'Update Details',
            style: TextStyle(
              color: KWhite,
              fontSize: 25,
              fontWeight: FontWeight.bold,
              letterSpacing: 2,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                height20,
                CircleAvatar(
                  backgroundImage:
                      FileImage(File(controller.selectedImagePath.value)),
                  maxRadius: 60,
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
                          : null,
                    ),
                  ),
                ),
                height20,
                TextFormFieldWidget(
                  labelText: 'Enter Name',
                  controller: namecontroller,
                  errorText: 'name cannot be empty',
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
                  controller: batchcontroller,
                  errorText: 'batch cannot be empty',
                  formKey: _formKey,
                ),
                height20,
                ElevatedButton(
                  onPressed: () {
                    if (controller.selectedImagePath.value.isEmpty) {
                      showDialog('No image', 'Please select an image',
                          const Color.fromARGB(255, 223, 87, 78));
                    }
                    if (_formKey.currentState!.validate() &&
                        controller.selectedImagePath.value.isNotEmpty) {
                      studentDataController.updateStudent(
                        StudentModel(
                          id: id,
                          name: namecontroller.text,
                          domain: domainController.text,
                          batch: batchcontroller.text,
                          image: controller.selectedImagePath.value,
                        ),
                      );
                      Get.back();
                      showDialog(
                        'Updated',
                        'Details Updated succesfully',
                        const Color.fromARGB(255, 99, 190, 102),
                      );
                    }
                  },
                  child: const Text(
                    'Update Details',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  showDialog(String title, String message, Color backgroundcolor) {
    Get.snackbar(title, message,
        colorText: KWhite,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: backgroundcolor);
  }
}
