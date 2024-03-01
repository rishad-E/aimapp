import 'package:aimshala/models/AIMCET_TEST/AIMCET_Test_model/test_model.dart';
import 'package:aimshala/models/AIMCET_TEST/AIMCET_qualification/qualification_model.dart';
import 'package:aimshala/services/AIMCET_TEST/aimcet_qualification_service.dart';
import 'package:aimshala/services/AIMCET_TEST/aimcet_test_service.dart';
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
  // RxString testEnd = 'false'.obs;

  /* --------- get all qualifications-------*/
  Future<void> getQualifications() async {
    qualificationList.value =
        await AIMCETQualificationService().fetchQualification();
    update();
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
  }

  Future<void> careerResultSubmittion(
      {required String userId, required String secId}) async {
    await AIMCETTestService().careerResultPost(userId: userId, secId: secId);
  }

  void toggleSelection() {
    guideSelect = !guideSelect;
    // guidebutton.value = !guidebutton.value;
    guidebutton.value = guideSelect;
    update(['button-proceed']);
  }
}
