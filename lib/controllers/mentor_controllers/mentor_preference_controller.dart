import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MentorPreferenceController extends GetxController {
  TextEditingController subjectController = TextEditingController();
  TextEditingController topicController = TextEditingController();

  RxList<String> seletedSubject = <String>[].obs;
  RxList<String> seletedTopic = <String>[].obs;
  String mentorMode = '';

  void selectMentorMode(String mode) {
    mentorMode = mode;
    update(['update-mentorMode']);
    update(['mentor-preferences']);
  }

  void addSubject({required String sub}) {
    String formattedSub = sub.trim().isNotEmpty
        ? '${sub.trim()[0].toUpperCase()}${sub.trim().substring(1).toLowerCase()}'
        : '';
    log(formattedSub);
    if (!seletedSubject.contains(formattedSub) && formattedSub.isNotEmpty) {
      seletedSubject.add(formattedSub);
    }
    update(['mentor-preferences']);
  }

  void addTopic({required String topic}) {
    String formattedtopic = topic.trim().isNotEmpty
        ? '${topic.trim()[0].toUpperCase()}${topic.trim().substring(1).toLowerCase()}'
        : '';
    if (!seletedTopic.contains(formattedtopic) && formattedtopic.isNotEmpty) {
      seletedTopic.add(formattedtopic);
    }
    update(['mentor-preferences']);
  }
}
