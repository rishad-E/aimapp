import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MentorAdditionalInfoController extends GetxController {
  TextEditingController philosophyController = TextEditingController();
  TextEditingController mentorController = TextEditingController();
  List<String> qustions = [
    'Briefly Describe Your Mentoring Philosophy',
    'Why do you want to be a mentor with Aimshala'
  ];
  List<String> answers = [];

  void addAnswers({required String ans1, required String ans2}) {
    if (!answers.contains(ans1)) {
      answers.add(ans1);
    }
    if (!answers.contains(ans2)) {
      answers.add(ans2);
    }
  }

  String? filedValidation(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please Enter this Field';
    }
    return null;
  }
}
