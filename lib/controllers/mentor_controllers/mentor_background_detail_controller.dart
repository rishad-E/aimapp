import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MentorBackgroundDetailController extends GetxController {
  TextEditingController degreeController = TextEditingController();
  TextEditingController expertiesController = TextEditingController();
  TextEditingController professionalController = TextEditingController();
  TextEditingController affiliatedController = TextEditingController();
  TextEditingController otherDegreecontroller = TextEditingController();
  
  RxString other = ''.obs;

  String? fieldValidation(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please Enter this Filed';
    }
    return null;
  }
}
