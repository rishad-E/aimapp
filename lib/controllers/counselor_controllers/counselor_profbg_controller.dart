import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CounserlorProfBGController extends GetxController {
  TextEditingController jobTitleController = TextEditingController();
  TextEditingController expertiesController = TextEditingController();
  TextEditingController currentController = TextEditingController();
  TextEditingController experienceController = TextEditingController();

  String? fieldValidation(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter this field';
    }
    return null;
  }

  void clearCounselorProfFields(){
    jobTitleController.clear();
    expertiesController.clear();
    currentController.clear();
    experienceController.clear();
  }
}
