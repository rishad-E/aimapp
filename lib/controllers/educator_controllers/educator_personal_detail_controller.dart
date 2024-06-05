import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EducatorPersonalDetailController extends GetxController {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController mobileController = TextEditingController();

  String? fieldValidation(String? value, {bool? phone}) {
    if (value == null || value.isEmpty) {
      return 'Please Enter This Field';
    }
    if (value.isNotEmpty && value.length < 10 && phone == true) {
      return 'Please Enter 10 digit Valid Number';
    }
    return null;
  }
}
