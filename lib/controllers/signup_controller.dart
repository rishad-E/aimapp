import 'package:aimshala/services/signup_service/signup_service.dart';
import 'package:aimshala/utils/common/colors_common.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController roleController = TextEditingController();
  bool? signup;
  RxBool areAllFieldsSelected = false.obs;
  Rx<Color> buttonTextColor = Rx<Color>(kwhite);
  String selectedRole = 'Select your role';

  void selectRole(String role) {
    selectedRole = role;
    update();
  }

  String? validation({String? word, String? field}) {
    if (word == null || word.isEmpty) {
      return 'Please enter $field';
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
    // SignUpService()
    //     .signUpUser(email: email, mobile: mobileNo, name: name)
    //     .then((value) => {
    //           if (value == true)
    //             {
    //               signup = value,
    //               Get.to(() => const HomeScreen()),
    //             }
    //           else
    //             {
    //               Get.snackbar(
    //                 "Error",
    //                 "Error in signup",
    //                 snackPosition: SnackPosition.BOTTOM,
    //                 backgroundColor: Colors.grey[800],
    //                 colorText: Colors.red, // Customize the text color
    //               )
    //             }
    //         });
  }

  void allFieldsSelected() {
    bool allFieldsSelected = nameController.text.isNotEmpty &&
        emailController.text.isNotEmpty &&
        roleController.text.isNotEmpty;
    // Update the reactive variable
    areAllFieldsSelected.value = allFieldsSelected;
    buttonTextColor.value = allFieldsSelected ? Colors.white : const Color.fromARGB(255, 83, 83, 83);
  }
}
