import 'package:aimshala/services/signup_service/signup_service.dart';
import 'package:aimshala/utils/common/widgets/colors_common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  final storage = const FlutterSecureStorage();
  TextEditingController nameController = TextEditingController();
  TextEditingController roleController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  bool? signup;
  RxBool areAllFieldsSelected = false.obs;
  Rx<Color> buttonTextColor = Rx<Color>(const Color.fromARGB(255, 83, 83, 83));
  String selectedRole = 'Select your role';


  Future<bool> signUpUserFunction({
    required String name,
    required String email,
    required String mobileNo,
  }) async {
    signup = await SignUpService()
        .signUpUser(email: email, mobile: mobileNo, name: name);
    if (signup == true) {
      storage.write(key: 'phone', value: mobileNo);
      return true;
    } else {
      Get.snackbar(
        "Error",
        "Error in signup",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: kblack.withOpacity(0.7),
        margin: const EdgeInsets.all(8),
        colorText: Colors.red,
      );
      return false;
    }
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

    if (word.length < 3) {
      return 'Name should be greater than 3 characters';
    }
    if (word.length > 35) {
      return 'Name should be less than 35 characters';
    }
    return null;
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
