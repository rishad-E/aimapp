import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CounselorExpertiesController extends GetxController {
  TextEditingController primaryController = TextEditingController();
  TextEditingController secondaryController = TextEditingController();
  List<String> primaryAreaList = [];
  List<String> secondaryAreaList = [];
  RxString isPrimaryOther = ''.obs;
  RxString isSecondaryOther = ''.obs;

  void addPrimaryArea(String area) {
    if (!primaryAreaList.contains(area)) {
      if (area == 'Other') {
        isPrimaryOther.value = area;
      }
      primaryAreaList.add(area);
    } else {
      primaryAreaList.remove(area);
      if (area == 'Other') {
        isPrimaryOther.value = '';
      }
    }
    update(['update-Primary']);
    update(['update-Experties']);
  }

  void addSecondaryArea(String area) {
    if (!secondaryAreaList.contains(area)) {
      if (area == 'Other') {
        isSecondaryOther.value = area;
      }
      secondaryAreaList.add(area);
    } else {
      secondaryAreaList.remove(area);
      if (area == 'Other') {
        isSecondaryOther.value = '';
      }
    }
    update(['update-Secondary']);
    update(['update-Experties']);
  }

  String? fieldValidation(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter this field';
    }
    return null;
  }
}
