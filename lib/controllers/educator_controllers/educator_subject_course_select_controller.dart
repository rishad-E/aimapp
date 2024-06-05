import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EducatorSubjectCourseController extends GetxController {
  TextEditingController subjectController = TextEditingController();
  TextEditingController topicController = TextEditingController();
  RxList<String> seletedSubject = <String>[].obs;
  RxList<String> seletedTopic = <String>[].obs;

  void addSubject({required String sub}) {
    if (!seletedSubject.contains(sub) && sub.isNotEmpty) {
      seletedSubject.add(sub);
    }
    update(['edu-SubjectCourseinfo']);
  }

  void addTopic({required String sub}) {
    if (!seletedTopic.contains(sub) && sub.isNotEmpty) {
      seletedTopic.add(sub);
    }
    update(['edu-SubjectCourseinfo']);
  }
}
