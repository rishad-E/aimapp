import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EducatorAdditionalInfoController extends GetxController {
  TextEditingController descriptionController = TextEditingController();
  TextEditingController joinAimshalaController = TextEditingController();

  String? filedValidation(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please Enter this Field';
    }
    return null;
  }
}
