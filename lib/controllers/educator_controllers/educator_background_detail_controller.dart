import 'package:aimshala/models/mentor_check_model/mentor_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EducatorBackgroundDetailController extends GetxController {
  TextEditingController degreeController = TextEditingController();
  TextEditingController expertiesController = TextEditingController();
  TextEditingController professionalController = TextEditingController();
  TextEditingController affiliatedController = TextEditingController();
  TextEditingController otherDegreeController = TextEditingController();

  RxString other = ''.obs;

  List<DegreeData> degreeList = [];

  String? fieldValidation(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please Enter this Filed';
    }
    return null;
  }

  void clearEduBgFields() {
    degreeController.clear();
    expertiesController.clear();
    professionalController.clear();
    affiliatedController.clear();
    otherDegreeController.clear();
    other.value = '';
  }
}
