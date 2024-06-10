import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MentorAdditionalInfoController extends GetxController {
  TextEditingController philosophyController = TextEditingController();
  TextEditingController mentorController = TextEditingController();

  String? filedValidation(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please Enter this Field';
    }
    return null;
  }
}
