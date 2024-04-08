import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class PickimageController extends GetxController {
  var selectedImagePath = ''.obs;
  void pickimage() async {
    final pickedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      selectedImagePath.value = pickedImage.path;
    } else {
      Get.snackbar(
        'ImageError',
        'Please Select an Image',
        backgroundColor: Colors.red,
        snackPosition: SnackPosition.BOTTOM,
        colorText: Colors.white,
      );
    }
  }
}
