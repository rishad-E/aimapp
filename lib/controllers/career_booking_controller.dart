import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BookCareerCounsellController extends GetxController {
  TextEditingController nameController = TextEditingController();
  TextEditingController roleController = TextEditingController();

  RxBool isAllCareerFieldsSelected = false.obs;
  Rx<Color> careerButtontext =
      Rx<Color>(const Color.fromARGB(255, 116, 118, 119));
  String careerSelectedRole = 'Select your role';

  String? nameValidation(String? word) {
    if (word == null || word.isEmpty) {
      return 'Please enter Name';
    }
    List<String> nameWords = word.split(' ');

    // log(nameWords.toString(), name: 'words');
    if (nameWords.length < 2) {
      return 'Please enter First and Last name';
    }
    if (nameWords.length > 35) {
      return 'Name should be less than 35 characters';
    }
    return null;
  }

  void checkAllfield() {
    bool allFieldsSelectedCareer =
        nameController.text.isNotEmpty && roleController.text.isNotEmpty;

    isAllCareerFieldsSelected.value = allFieldsSelectedCareer;
    careerButtontext.value = allFieldsSelectedCareer
        ? Colors.white
        : const Color.fromARGB(255, 116, 118, 119);
        update(['button-careerHome']);
  }
}
