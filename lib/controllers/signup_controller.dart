import 'package:aimshala/services/signup_service/signup_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  TextEditingController nameController = TextEditingController();
  TextEditingController roleController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  bool? signup;
  RxBool areAllFieldsSelected = false.obs;
  Rx<Color> buttonTextColor = Rx<Color>(const Color.fromARGB(255, 83, 83, 83));
  String selectedRole = 'Select your role';

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

    if (word.length < 3) {
      return 'Name should be greater than 3 characters';
    }
    if (word.length > 35) {
      return 'Name should be less than 35 characters';
    }
    // List<String> nameWords = word.split(' ');

    // log(nameWords.toString(), name: 'words');
    // // Check if there are at least two wsords
    // if (nameWords.length < 2) {
    //   return 'Please enter First and Last name';
    // }
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
