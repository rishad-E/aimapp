import 'dart:developer';
import 'dart:io';
import 'package:aimshala/models/AIMCET_TEST/AIMCET_Test_model/test_model.dart';
import 'package:aimshala/models/AIMCET_TEST/Personality_model/personality_report_model.dart';
import 'package:aimshala/models/AIMCET_TEST/Trait_model/trait_report_model.dart';
import 'package:aimshala/models/AIMCET_TEST/test_section_texts/section_texts.dart';
import 'package:aimshala/services/AIMCET_TEST/aimcet_gp_report_service.dart';
import 'package:aimshala/services/AIMCET_TEST/aimcet_test_service.dart';
import 'package:aimshala/services/AIMCET_TEST/personality_career_report_service.dart';
import 'package:aimshala/services/AIMCET_TEST/trait_career_result.dart';
import 'package:aimshala/utils/common/widgets/colors_common.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

class AIMCETController extends GetxController {
  TextEditingController qualificationController = TextEditingController();
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
  List<String> aimcetList = [];

  List<String> personality = [];
  String? traitType;
  List<String> degrees = [];
  List<String> careers = [];
  // PersonalityReportModel? personalityReport;
  // TraitReportModel? traitReport;

  var personalityReort = Rxn<PersonalityReportModel>();
  var traitReport = Rxn<TraitReportModel>();
  RxBool isDownloading = false.obs;

  Future<void> fetchAllTestQuestions({required String userId}) async {
    totalQ = 0;
    secQuestion = 0;
    isLoading.value = true;
    log('sectionQuesNum==>$secQuestion  totalQusNum==>$totalQ',
        name: 'secques and total ques frst');

    Map<String, dynamic>? data =
        await AIMCETTestService().getTestQuestions(userId: userId);

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
    log('sectionQuesNum==>$secQuestion  totalQusNum==>$totalQ',
        name: 'secques and total ques second');
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
    log('career result at 40th and 55th qustion====secid=>$secId',
        name: '40th and 55th');
    await AIMCETTestService().careerResultPost(userId: userId, secId: secId);
  }

  Future<void> aimcetTestResultFunction(
      {required String userId, required String userName}) async {
    dynamic result = await AIMCETTestService()
        .aimcetTestResult(userId: userId, userName: userName);

    if (result is Map) {
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
        // personalityReport = report;
        personalityReort.value = report;
        gp.value = 'sucess';
        // update();
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
        traitReport.value = report;
        log(traitType.toString(), name: 'report trait controller');
        gp.value = 'sucess';
        // update();
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
      } else if (data['Test Status'] == 'Continue Test') {
        testDone.value = 'continue';
      } else if (data['Test Status'] == 'Test Given') {
        testDone.value = 'done';
      }
    }
  }

  Future<void> downloadPDF(String pdfUrl, String fileName) async {
    try {
      isDownloading.value = true;
      Directory? directory;
      if (Platform.isIOS) {
        directory = await getApplicationDocumentsDirectory();
      } else {
        if (await Permission.storage.isGranted) {
          log('granded');
          directory = Directory('/storage/emulated/0/Download');
          if (!await directory.exists()) {
            directory = Directory('/storage/emulated/0/Downloads');
          }
        } else {
          if (await Permission.manageExternalStorage.isGranted) {
            directory = Directory('/storage/emulated/0/Download');
            if (!await directory.exists()) {
              directory = Directory('/storage/emulated/0/Downloads');
            }
          } else {
            directory = await getExternalStorageDirectory();
          }
          // var status = await Permission.storage.request();
          // if (status.isGranted) {
          //   directory = Directory('/storage/emulated/0/Download');
          //   if (!await directory.exists()) {
          //     directory = Directory('/storage/emulated/0/Downloads');
          //   }
          // } else {
          // directory = await getExternalStorageDirectory();
          // }
          //// directory = await getExternalStorageDirectory();
        }

        //////////////////////////////////////////////////////////////
        // if (await Permission.manageExternalStorage.isGranted) {
        //   directory = Directory('/storage/emulated/0/Download');
        //   if (!await directory.exists()) {
        //     directory = Directory('/storage/emulated/0/Downloads');
        //   }
        // } else {
        //   directory = await getExternalStorageDirectory();
        // }
      }
      if (directory == null) {
        throw const FileSystemException('Unable to access storage directory');
      }
      String savePath = '${directory.path}/$fileName';
      log(savePath);
      Dio dio = Dio();
      try {
        await dio.download(
          pdfUrl,
          savePath,
          options: Options(
            responseType: ResponseType.bytes,
          ),
          onReceiveProgress: (received, total) {
            if (total != -1) {
              // downloadProgress.value = received / total * 100;
            }
          },
        );
      } on PathAccessException catch (e) {
        log(e.toString(), name: 'path exception');
        if (await Permission.manageExternalStorage.isGranted) {
          directory = Directory('/storage/emulated/0/Download');
          if (!await directory.exists()) {
            directory = Directory('/storage/emulated/0/Downloads');
          }
        } else {
          directory = await getExternalStorageDirectory();
        }
        if (directory == null) {
          throw const FileSystemException('Unable to access storage directory');
        }
        savePath = '${directory.path}/$fileName';
        log(savePath);
        await dio.download(
          pdfUrl,
          savePath,
          options: Options(
            responseType: ResponseType.bytes,
          ),
          onReceiveProgress: (received, total) {
            if (total != -1) {
              // downloadProgress.value = received / total * 100;
            }
          },
        );
      }

      isLoading.value = false;
      Get.snackbar(
        "File Downloaded",
        "PDF downloaded successfully to $savePath...",
        snackPosition: SnackPosition.TOP,
        duration: const Duration(seconds: 2),
        backgroundColor:
            const Color.fromARGB(255, 86, 21, 171).withOpacity(0.7),
        colorText: Colors.white,
      );
      log(directory.path, name: 'directory path');
    } catch (e) {
      isLoading.value = false;
      log("Error downloading file: $e");
      Get.snackbar(
        "Downloade Failed",
        "Error downloading file: $e",
        snackPosition: SnackPosition.TOP,
        duration: const Duration(seconds: 2),
        backgroundColor: kred.withOpacity(0.7),
        colorText: Colors.white,
      );
    }
    isDownloading.value = false;
    // Determine the download directory path based on platform and availability
  }

  Future<void> getTestSectionTextsFunc() async {
    List<Section>? data = await AIMCETTestService().getTestSectionTexts();
    if (data != null) {
      if (data.isNotEmpty) {
        for (var item in data) {
          if (!aimcetList.contains(item.name)) {
            aimcetList.add(item.name.toString());
          }
        }
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
    totalQ = totalQ! + 1;
    if (secID <= 8) {
      if (secQuestion! < 10) {
        secQuestion = secQuestion! + 1;
      } else if (secQuestion! == 10) {
        secQuestion = 1;
      }
    } else if (secID == 9 || secID == 10) {
      if (secQuestion! < 15) {
        secQuestion = secQuestion! + 1;
      } else if (secQuestion! == 15) {
        secQuestion = 1;
      }
    }
    // if (totalQ == 40) {
    //   secQuestion = 1;
    // }
    // if (totalQ! < 110) {
    //   totalQ = totalQ! + 1;
    // } else if (totalQ == 110) {
    //   totalQ = 1;
    // }
    update(['aimcet-test']);
  }
}
