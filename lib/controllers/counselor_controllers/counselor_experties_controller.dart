import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CounselorExpertiesController extends GetxController {
  TextEditingController primaryController = TextEditingController();
  TextEditingController secondaryController = TextEditingController();
  List<String> primaryAreaList = [];
  List<String> secondaryAreaList = [];

  void addPrimaryArea(String area) {
    if (!primaryAreaList.contains(area)) {
      primaryAreaList.add(area);
    } else {
      primaryAreaList.remove(area);
    }
    update(['update-Primary']);
    update(['update-Experties']);
  }

  void addSecondaryArea(String area) {
    if (!secondaryAreaList.contains(area)) {
      secondaryAreaList.add(area);
    } else {
      secondaryAreaList.remove(area);
    }
    update(['update-Secondary']);
    update(['update-Experties']); 
  }
}
