import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EducatorSubjectCourseController extends GetxController {
  TextEditingController subjectController = TextEditingController();
  TextEditingController topicController = TextEditingController();
  RxList<String> seletedSubject = <String>[].obs;
  RxList<String> seletedTopic = <String>[].obs;

  void addSubject({required String sub}) {
    String formattedSub = sub.trim().isNotEmpty
        ? '${sub.trim()[0].toUpperCase()}${sub.trim().substring(1).toLowerCase()}'
        : '';
    if (!seletedSubject.contains(formattedSub) && formattedSub.isNotEmpty) {
      seletedSubject.add(formattedSub);
    }
    update(['edu-SubjectCourseinfo']);
  }

  void addTopic({required String sub}) {
    String formattedSub = sub.trim().isNotEmpty
        ? '${sub.trim()[0].toUpperCase()}${sub.trim().substring(1).toLowerCase()}'
        : '';
    if (!seletedTopic.contains(formattedSub) && formattedSub.isNotEmpty) {
      seletedTopic.add(formattedSub);
    }
    update(['edu-SubjectCourseinfo']);
  }

  void clearEducatorTeachFields(){
    subjectController.clear();
    topicController.clear();
    seletedSubject.clear();
    seletedTopic.clear();
  }
}
