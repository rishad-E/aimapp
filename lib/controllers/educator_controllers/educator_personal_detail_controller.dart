import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EducatorPersonalDetailController extends GetxController {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController mobileController = TextEditingController();

  String? fieldValidation(String? value, {bool? phone,bool? email}) {
    if (value == null || value.isEmpty) {
      return 'Please Enter This Field';
    }
    if (value.isNotEmpty && value.length < 10 && phone == true) {
      return 'Please Enter 10 digit Valid Number';
    }
     if (value.isNotEmpty && !value.isEmail && email == true) {
      return 'Please Enter a Valid Email';
    }
    return null;
  }

  void clearAllfields() {
    nameController.clear();
    emailController.clear();
    locationController.clear();
    mobileController.clear();
  }
}
