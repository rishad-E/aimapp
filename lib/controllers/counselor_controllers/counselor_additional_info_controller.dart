import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CounselorAdditionalinfoController extends GetxController {
  TextEditingController describeController = TextEditingController();
  TextEditingController whyCounselor = TextEditingController();

  String? fieldValidation(String? value,{String? type}) {
    if (value == null || value.isEmpty) {
      return 'Please enter $type';
    }
    return null;
  }
}
