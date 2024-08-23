import 'dart:developer';

import 'package:aimshala/models/UserModel/user_model.dart';
import 'package:aimshala/models/signup_role_model/role_models.dart';
import 'package:aimshala/services/signup_service/signup_service.dart';
import 'package:aimshala/view/signup/signup_amy_screen.dart';
import 'package:aimshala/view/splash_screen/splash_screen.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  final storage = const FlutterSecureStorage();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController dobController = TextEditingController();
  TextEditingController qualiController = TextEditingController();
  TextEditingController classController = TextEditingController();
  TextEditingController roleController = TextEditingController();

  RxBool areAllFieldsSelected = false.obs;
  Rx<Color> buttonTextColor = Rx<Color>(const Color.fromARGB(255, 83, 83, 83));
  RxBool isSaving = false.obs;
  RxnString selectedRole = RxnString();
  String? selectedSubRole;
  String? selectedFinalRole;
  RxString roleNotSelected = ''.obs;
  Dio dio = Dio();

  List<MainList> studentList = [];
  List<MainList> professionalList = [];
  List<SubList> subListSchool = [];
  List<SubList> subListCollege = [];

  Future<void> signUpUserFunction({
    required String name,
    required String email,
    required String mobileNo,
    required String gender,
    required String dob,
    required String qualification,
    required String clases,
    required String role,
    required String submit,
  }) async {
    try {
      isSaving.value = true;
      update(['button-signup']);
      Map<String, dynamic>? res = await SignUpService().signUpUser(
          email: email,
          mobile: mobileNo,
          name: name,
          gender: gender,
          dob: dob,
          qualification: qualification,
          clases: clases,
          role: role,
          submit: submit);
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

  String? fieldValidation(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter this Filed';
    }
    return null;
  }

  void toggleRoleSelect(String role, String id) {
    selectedRole.value = role;
    selectedSubRole = null;
    selectedFinalRole = null;
    roleNotSelected.value = role;
    roleController.text = id;
    qualiController.clear();
    classController.clear();
    allFieldsSelected();
    fetchMainRoles(id);
    update(['update-signupRole']);
  }

  void toggleSubRoleSelect(String role, String id) {
    selectedSubRole = role;
    qualiController.text = id;
    classController.clear();
    selectedFinalRole = null;
    fetchSubRoles(id);
    update(['update-signupRole']);
  }

  void toggleFinalRoleSelect(String role, String id) {
    selectedFinalRole = role;
    classController.text = id;
    update(['update-signupRole']);
  }

  /*--------- fetch role functio---------*/
  void fetchMainRoles(String id) async {
    try {
      final res = await dio
          .get('http://154.26.130.161/elearning/api/get-qualification/$id');
      if (res.statusCode == 200 && res.data is List) {
        List<dynamic> data = res.data;
        if (data.isNotEmpty) {
          List<MainList> roles = data.map((e) => MainList.fromJson(e)).toList();
          if (roles.first.title == 'School Student' &&
              !studentList.any((i) => i.title == roles.first.title)) {
            studentList.addAll(roles);
          } else if (roles.first.title == 'Career Professional' &&
              !professionalList.any((i) => i.title == roles.first.title)) {
            professionalList.addAll(roles);
          }
          update(['update-signupRole']);
        }
      }
    } catch (e) {
      log('Error fetching Roles: $e', name: 'fetchRole');
    }
  }

  void fetchSubRoles(String id) async {
    try {
      final res =
          await dio.get('http://154.26.130.161/elearning/api/get-class/$id');
      if (res.statusCode == 200 && res.data is List) {
        List<dynamic> data = res.data;
        if (data.isNotEmpty) {
          List<SubList> roles = data.map((e) => SubList.fromJson(e)).toList();
          if (roles.first.name == 'Class 5th-8th' &&
              !subListSchool.any((i) => i.name == roles.first.name)) {
            subListSchool.addAll(roles);
          } else if (roles.first.name == 'Under Graduation' &&
              !subListCollege.any((i) => i.name == roles.first.name)) {
            subListCollege.addAll(roles);
          }
          update(['update-signupRole']);
        }
        //  log('sublistSchool=>$subListSchool    subListCollege=>$subListCollege');
      }
    } catch (e) {
      log('Error fetching SubRoles: $e', name: 'fetchSubRole');
    }
  }
  /*--------- fetch role functio---------*/

  void allFieldsSelected() {
    bool allFieldsSelected = nameController.text.isNotEmpty &&
        emailController.text.isNotEmpty &&
        genderController.text.isNotEmpty &&
        dobController.text.isNotEmpty &&
        selectedRole.value != null;
    // Update the reactive variable
    areAllFieldsSelected.value = allFieldsSelected;
    buttonTextColor.value = allFieldsSelected
        ? Colors.white
        : const Color.fromARGB(255, 83, 83, 83);
    update(['button-signup']);
  }
}
