import 'dart:developer';

import 'package:aimshala/models/AIMCET_TEST/AIMCET_Test_model/test_model.dart';
import 'package:aimshala/models/AIMCET_TEST/AIMCET_qualification/qualification_model.dart';
import 'package:aimshala/models/AIMCET_TEST/Personality_model/personality_report_model.dart';
import 'package:aimshala/models/AIMCET_TEST/Trait_model/trait_report_model.dart';
import 'package:aimshala/services/AIMCET_TEST/aimcet_gp_report_service.dart';
import 'package:aimshala/services/AIMCET_TEST/aimcet_qualification_service.dart';
import 'package:aimshala/services/AIMCET_TEST/aimcet_test_service.dart';
import 'package:aimshala/services/AIMCET_TEST/personality_career_report_service.dart';
import 'package:aimshala/services/AIMCET_TEST/trait_career_result.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AIMCETController extends GetxController {
  TextEditingController qualificationController = TextEditingController();
  RxList<Qualification> qualificationList = <Qualification>[].obs;
  RxString qualify = 'Your qualification'.obs;
  String? qualifyId;
  bool guideSelect = false;
  RxBool guidebutton = false.obs;
  Map<String, List<Question>>? testRes;
  List<Question>? allQuestions;
  String? submitRes;
  RxInt secID = RxInt(1);
  RxString end = 'no'.obs;
  RxString gp = 'wait'.obs;

  List<String> personality = [];
  String? traitType;
  List<String> degrees = [];
  List<String> careers = [];
  PersonalityReportModel? personalityReport;
  TraitReportModel? traitReport;
  // RxInt attempt = RxInt(0);
  // int? isSelected;
  // RxString testEnd = 'false'.obs;

  /* --------- get all qualifications-------*/
  Future<void> getQualifications() async {
    qualificationList.value =
        await AIMCETQualificationService().fetchQualification();
    // update();
  }

  Future<void> fetchAllTestResults(
      {required String userId, required String qualifyId}) async {
    testRes = await AIMCETTestService()
        .getTestResult(userId: userId, qualifyId: qualifyId);

    if (testRes != null) {
      // Merge all lists of questions into a single list
      allQuestions = [];
      for (var questions in testRes!.values) {
        allQuestions!.addAll(questions);
      }
      if (allQuestions!.isEmpty) {
        end.value = 'done';
      }
    }
  }

  Future<void> submitAimTest({
    required String userId,
    required String cAnswer,
    required String sectionId,
    required String questionId,
  }) async {
    submitRes = await AIMCETTestService().sumbitAIMTest(
      userId: userId,
      cAnswer: cAnswer,
      sectionId: sectionId,
      questionId: questionId,
    );

    if (submitRes == 'failed') {
      end.value = 'done';
      Get.showSnackbar(
        const GetSnackBar(
          snackStyle: SnackStyle.FLOATING,
          message: 'You have already submitted this answer',
          margin: EdgeInsets.all(10),
          backgroundColor: Colors.red,
          duration: Duration(seconds: 2),
        ),
      );
    }
    update(['aimcet-test']);
  }

  Future<void> careerResultSubmittion(
      {required String userId, required String secId}) async {
    await AIMCETTestService().careerResultPost(userId: userId, secId: secId);
  }

  Future<void> aimcetTestResultFunction(
      {required String userId, required String userName}) async {
    dynamic result = await AIMCETTestService()
        .aimcetTestResult(userId: userId, userName: userName);
    if (result is Map<String, dynamic>) {
      //extracting personality types
      List<dynamic> resultData = result['result'];

      for (String item in resultData) {
        if (item.startsWith('Personality Type')) {
          if (!personality.contains(item.split(': ')[1])) {
            personality.add(item.split(': ')[1]);
          }
        }
        if (item.startsWith('Trait Type')) {
          traitType = item.split(': ')[1];
        }
      }
      // Extracting degrees
      List<dynamic> degreeData = result['degree'];

      for (String item in degreeData) {
        if (!degrees.contains(item.split('. ')[1])) {
          degrees.add(item.split('. ')[1]);
        }
      }
      // Extract careers
      List<dynamic> data = result['career'];
      List<dynamic> careerData = [];
      // List<dynamic> careerData = data.removeAt(0);
      for (int i = 2; i < data.length; i++) {
        if (i != 0 || i != 1) {
          careerData.add(data[i]);
        }
      }
      for (String item in careerData) {
        if (!careers.contains(item.split('. ')[1])) {
          careers.add(item.split('. ')[1]);
        }
      }

      log(personality.toString(), name: 'personality');
      log(degrees.toString(), name: 'degree');
      log(careers.toString(), name: 'careers');
    } else if (result is String) {
      log('result is string');
    }
  }

  Future<void> gpReportSubmitFunction(
      {required String uId,
      required String personality,
      required String trait}) async {
    String? value = await GPReportService()
        .gpReportSubmit(uId: uId, personality: personality, trait: trait);
    if (value == 'sucess') {
      gp.value = 'sucess';
    } else {
      gp.value = 'failed';
    }
  }

  Future<void> fetchPersonalityReport({required String userId}) async {
    PersonalityReportModel? report =
        await PersonalityReportService().getPersonalityReport(userId: userId);
    if (report != null) {
      personalityReport = report;
      update();
    }
  }

  Future<void> fetchTraitReport({required String userId}) async {
    TraitReportModel? report =
        await TraitReportService().getTraitReport(userId: userId);
    if (report != null) {
      traitReport = report;
      update();
    }
  }

  void toggleSelection() {
    guideSelect = !guideSelect;
    // guidebutton.value = !guidebutton.value;
    guidebutton.value = guideSelect;
    update(['button-proceed']);
  }
}
