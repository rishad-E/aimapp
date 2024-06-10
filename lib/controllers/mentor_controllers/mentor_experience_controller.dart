import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MentorExperienceController extends GetxController {
  TextEditingController experienceController = TextEditingController();

  Rxn<bool> relocate = Rxn<bool>();
  RxString relocteSelected = ''.obs;

  void toggleRelocate({required bool val}) {
    relocate.value = val;
    relocteSelected.value = 'yes';
    if (val == false) {
      experienceController.clear();
    }
    update(['update-relocateMentor']);
    update(['mentor-experience']);
  }

  String? fieldValidation(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please Enter this Field';
    }
    return null;
  }
}
