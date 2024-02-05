import 'dart:developer';

import 'package:aimshala/services/signup_service/signup_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController roleController = TextEditingController();
  bool? signup;
  RxBool areAllFieldsSelected = false.obs;
  Rx<Color> buttonTextColor = Rx<Color>(const Color.fromARGB(255, 83, 83, 83));
  String selectedRole = 'Select your role';

  void selectRole(String role) {
    selectedRole = role;
    update();
  }

  String? emailValidation(String? word) {
    if (word == null || word.isEmpty) {
      return 'Please enter Email';
    } else if (!word.isEmail) {
      return 'Please enter a valid Email';
    }
    return null;
  }

  String? nameValidation(String? word) {
    if (word == null || word.isEmpty) {
      return 'Please enter Name';
    }
    List<String> nameWords = word.split(' ');

    log(nameWords.toString());
    // Check if there are at least two words
    if (nameWords.length < 3) {
      return 'Please enter full name';
    }

    return null;
  }

  Future<bool> signUpUserFunction({
    required String name,
    required String email,
    required String mobileNo,
  }) async {
    signup = await SignUpService()
        .signUpUser(email: email, mobile: mobileNo, name: name);
    if (signup == true) {
      return true;
    } else {
      Get.snackbar(
        "Error",
        "Error in signup",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.grey[800],
        colorText: Colors.red,
      );
      return false;
    }
  }

  void allFieldsSelected() {
    bool allFieldsSelected = nameController.text.isNotEmpty &&
        emailController.text.isNotEmpty &&
        roleController.text.isNotEmpty;
    // Update the reactive variable
    areAllFieldsSelected.value = allFieldsSelected;
    buttonTextColor.value = allFieldsSelected
        ? Colors.white
        : const Color.fromARGB(255, 83, 83, 83);
    update(['button-signup']);
  }
}
