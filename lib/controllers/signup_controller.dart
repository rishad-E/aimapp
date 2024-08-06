import 'package:aimshala/models/UserModel/user_model.dart';
import 'package:aimshala/services/signup_service/signup_service.dart';
import 'package:aimshala/view/signup/signup_amy_screen.dart';
import 'package:aimshala/view/splash_screen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  final storage = const FlutterSecureStorage();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController dobController = TextEditingController();

  RxBool areAllFieldsSelected = false.obs;
  Rx<Color> buttonTextColor = Rx<Color>(const Color.fromARGB(255, 83, 83, 83));
  String selectedRole = 'Select your role';
  RxBool isSaving = false.obs;
  Future<void> signUpUserFunction({
    required String name,
    required String email,
    required String mobileNo,
  }) async {
    try {
      isSaving.value = true;
      update(['button-signup']);
      Map<String, dynamic>? res = await SignUpService()
          .signUpUser(email: email, mobile: mobileNo, name: name);
      if (res != null) {
        if (res.containsKey('message')) {
          User? user = User.fromJson(res["user"]);
          String? id = user.id.toString();
          String? phone = user.phone.toString();
          storage.write(key: 'phone', value: phone);
          Get.offAll(() =>
              SignUpAmyScreen(name: name, email: email, uId: id, phone: phone));
          //   Navigator.of(context).pushAndRemoveUntil(
          //   MaterialPageRoute(
          //     builder: (context) => SignUpAmyScreen(name: name, email: email),
          //   ),
          //   (Route<dynamic> route) => route.isFirst, // Keep only the first screen
          // );
        } else if (res.containsKey('error')) {
          dynamic errorData = res['error'];
          if (errorData is Map) {
            Map<String, dynamic> errors = res['error'];
            String first = errors.keys.first;
            if (errors[first] is List && (errors[first] as List).isNotEmpty) {
              String errorMessage = errors[first][0].toString();
              Get.showSnackbar(GetSnackBar(
                snackStyle: SnackStyle.FLOATING,
                message: errorMessage,
                margin: const EdgeInsets.all(10),
                backgroundColor: Colors.red,
                duration: const Duration(seconds: 2),
              ));
            }
          } else if (errorData is String) {
            String errorMessage = res['error'];
            Get.showSnackbar(GetSnackBar(
              snackStyle: SnackStyle.FLOATING,
              message: errorMessage,
              margin: const EdgeInsets.all(10),
              backgroundColor: Colors.red,
              duration: const Duration(seconds: 2),
            ));
            if (errorMessage == "Phone number already registered") {
              Get.offAll(() => const SplashScreen());
            }
          }
        }
      }
    } finally {
      isSaving.value = false;
      update(['button-signup']);
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
    bool allFieldsSelected =
        nameController.text.isNotEmpty && emailController.text.isNotEmpty;
    // Update the reactive variable
    areAllFieldsSelected.value = allFieldsSelected;
    buttonTextColor.value = allFieldsSelected
        ? Colors.white
        : const Color.fromARGB(255, 83, 83, 83);
    update(['button-signup']);
  }
}
