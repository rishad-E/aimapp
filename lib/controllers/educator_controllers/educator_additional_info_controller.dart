import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EducatorAdditionalInfoController extends GetxController {
  TextEditingController descriptionController = TextEditingController();
  TextEditingController joinAimshalaController = TextEditingController();
  List<String> questions = ['Description', 'Why do you want to join Aimshala?'];
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

  void clearEducatorAddiationalFields(){
    descriptionController.clear();
    joinAimshalaController.clear();
    answers.clear();
  }
}
