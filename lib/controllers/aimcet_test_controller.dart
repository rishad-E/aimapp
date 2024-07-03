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
  RxBool isLoading = false.obs;
  Map<String, List<Question>>? testRes;
  List<Question>? allQuestions;
  String? submitRes;
  RxInt secID = RxInt(1);
  RxString end = 'no'.obs;
  RxString gp = ''.obs;
  RxString testDone = 'no'.obs;
  int? totalQ;
  int? secQuestion;

  List<String> personality = [];
  String? traitType;
  List<String> degrees = [];
  List<String> careers = [];
  PersonalityReportModel? personalityReport;
  TraitReportModel? traitReport;

  /* --------- get all qualifications-------*/
  Future<void> getQualifications() async {
    qualificationList.value =
        await AIMCETQualificationService().fetchQualification();
  }

  Future<void> fetchAllTestQuestions({required String userId}) async {
    isLoading.value = true;
    Map<String, dynamic>? data =
        await AIMCETTestService().getTestResult(userId: userId);

    if (data != null) {
      Map<String, dynamic>? questionData = data['data'];
      if (data['indexval'] == null || data['question_attempt'] == null) {
        totalQ = 0;
        secQuestion = 0;
      } else {
        totalQ = data['indexval'];
        secQuestion = data['question_attempt'];
      }
      if (questionData != null) {
        Map<String, List<Question>> res = {};
        questionData.forEach((key, value) {
          res[key] =
              List<Question>.from(value.map((x) => Question.fromJson(x)));
        });
        testRes = res;
        allQuestions = [];
        for (var questions in testRes!.values) {
          allQuestions!.addAll(questions);
        }

        if (allQuestions!.isEmpty) {
          end.value = 'done';
        }
      }
    }
    isLoading.value = false;
    log(allQuestions.toString(), name: 'fetch allqus func');
  }

  Future<void> submitAimTest({
    required String userId,
    required String cAnswer,
    required String sectionId,
    required String questionId,
    required String secQues,
    required String totalQues,
  }) async {
    submitRes = await AIMCETTestService().sumbitAIMTest(
        userId: userId,
        cAnswer: cAnswer,
        sectionId: sectionId,
        questionId: questionId,
        secQues: secQues,
        totalQues: totalQues);
    update(['aimcet-test']);
  }

  Future<void> careerResultSubmittion(
      {required String userId, required String secId}) async {
    log('career result at 40th and 55th qustion====secid=>$secId', name: '40th and 55th');
    await AIMCETTestService().careerResultPost(userId: userId, secId: secId);
  }

  Future<void> aimcetTestResultFunction(
      {required String userId, required String userName}) async {
    dynamic result = await AIMCETTestService()
        .aimcetTestResult(userId: userId, userName: userName);

    if (result is Map<String, dynamic>) {
      //extracting personality types
      if (result.isNotEmpty) {
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
        if (result['degree'] != null) {
          List<dynamic> degreeData = result['degree'];

          for (String item in degreeData) {
            if (!degrees.contains(item.split('. ')[1])) {
              degrees.add(item.split('. ')[1]);
            }
          }
        } else {
          degrees = [];
        }

        // Extract careers
        if (result['career'] != null) {
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
        } else {
          careers = [];
        }

        // log(personality.toString(), name: 'personality');
        // log(degrees.toString(), name: 'degree');
        // log(careers.toString(), name: 'careers');
      }
    } else if (result is String) {
      log('result is string');
    } else {
      throw 'Result is null =>$result';
    }
  }

  Future<void> gpReportSubmitFunction(
      {required String uId,
      required String personality,
      required String trait}) async {
    gp.value = 'wait';
    String? value = await GPReportService()
        .gpReportSubmit(uId: uId, personality: personality, trait: trait);
    if (value == 'sucess') {
      gp.value = 'sucess';
    } else {
      gp.value = 'failed';
    }
  }

  Future<void> fetchPersonalityReport({required String userId}) async {
    try {
      PersonalityReportModel? report =
          await PersonalityReportService().getPersonalityReport(userId: userId);
      if (report != null) {
        personalityReport = report;
        update();
      }
    } catch (e) {
      gp.value = 'personality-e';
      log(e.toString(), name: 'fetch personality-c');
    }
  }

  Future<void> fetchTraitReport({required String userId}) async {
    try {
      TraitReportModel? report =
          await TraitReportService().getTraitReport(userId: userId);
      if (report != null) {
        traitReport = report;
        log(traitType.toString(), name: 'report trait controller');
        update();
      }
    } catch (e) {
      gp.value = 'trait-e';
      log(e.toString(), name: 'fetch trait-c');
    }
  }

  Future<void> checkAimcetTestTakenFunction({required String userId}) async {
    Map<String, dynamic>? data =
        await AIMCETTestService().checkAimcetTestTaken(userId: userId);
    if (data != null) {
      if (data['Test Status'] == 'Not Given') {
        testDone.value = 'no';
        // log(data['Test Status']);
      } else if (data['Test Status'] == 'Continue Test') {
        testDone.value = 'continue';
      } else if (data['Test Status'] == 'Test Given') {
        testDone.value = 'done';
      }
    }
  }

  void toggleSelection() {
    guideSelect = !guideSelect;
    // guidebutton.value = !guidebutton.value;
    guidebutton.value = guideSelect;
    update(['button-proceed']);
  }

  void totalQuestionNumber(int secID) {
    if (secID <= 8) {
      if (secQuestion! < 5) {
        secQuestion = secQuestion! + 1;
      } else if (secQuestion! == 5) {
        secQuestion = 1;
      }
    } else if (secID == 9 || secID == 10) {
      if (secQuestion! < 15) {
        secQuestion = secQuestion! + 1;
      } else if (secQuestion! == 15) {
        secQuestion = 1;
      }
    }
    if (totalQ == 40) {
      secQuestion = 1;
    }
    if (totalQ! < 70) {
      totalQ = totalQ! + 1;
    } else if (totalQ == 70) {
      totalQ = 1;
    }
    update(['aimcet-test']);
  }
}
