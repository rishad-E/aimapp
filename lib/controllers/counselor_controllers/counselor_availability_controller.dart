import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CounselorAvailabilityController extends GetxController {
  TextEditingController additionalnoteController = TextEditingController();
  List<String> availableDays = [];
  List<String> availableTimes = [];

  void addAvaliableDay({required String day}) {
    if (!availableDays.contains(day)) {
      availableDays.add(day);
    } else {
      availableDays.remove(day);
    }
    update(['update-counsAvaiableday']);
    update(['couns-availability']);
  }

 void addAvaliableTime({required String time}) {
    if (!availableTimes.contains(time)) {
      availableTimes.add(time);
    } else {
      availableTimes.remove(time);
    }
    update(['update-counsAvaiableTime']);
    update(['couns-availability']);
  }

  void clearCounselorAvailableFields(){
    additionalnoteController.clear();
    availableDays.clear();
    availableTimes.clear();
  }
}
