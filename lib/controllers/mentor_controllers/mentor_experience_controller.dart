import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MentorExperienceController extends GetxController {
  TextEditingController experienceController = TextEditingController();

  Rxn<bool> reward = Rxn<bool>();
  RxString rewardSelected = ''.obs;

  void toggleReward({required bool val}) {
    reward.value = val;
    rewardSelected.value = 'yes';
    if (val == false) {
      experienceController.clear();
    }
    update(['update-rewardMentor']);
    update(['mentor-experience']);
  }

  String? fieldValidation(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please Enter this Field';
    }
    return null;
  }
}
