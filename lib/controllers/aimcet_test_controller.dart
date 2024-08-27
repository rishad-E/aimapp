import 'dart:developer';
import 'dart:io';
import 'package:aimshala/models/AIMCET_TEST/AIMCET_Test_model/test_model.dart';
import 'package:aimshala/models/AIMCET_TEST/Personality_model/personality_report_model.dart';
import 'package:aimshala/models/AIMCET_TEST/Trait_model/trait_report_model.dart';
import 'package:aimshala/models/AIMCET_TEST/test_all_reviews/test_all_reviews.dart';
import 'package:aimshala/models/AIMCET_TEST/test_res_userdetails/test_res_user_details.dart';
import 'package:aimshala/models/AIMCET_TEST/test_section_texts/section_texts.dart';
import 'package:aimshala/services/AIMCET_TEST/aimcet_test_service.dart';
import 'package:aimshala/services/AIMCET_TEST/personality_career_report_service.dart';
import 'package:aimshala/services/AIMCET_TEST/trait_career_result.dart';
import 'package:aimshala/utils/common/widgets/colors_common.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

class AIMCETController extends GetxController {
  TextEditingController qualificationController = TextEditingController();
  final FlutterSecureStorage storage = const FlutterSecureStorage();

  String? qualifyId;
  bool guideSelect = false;
  RxBool guidebutton = false.obs;
  RxBool isLoading = false.obs;
  Map<String, List<Question>>? testRes;
  List<Question>? allQuestions;
  RxInt secID = RxInt(1);
  RxString end = 'no'.obs;
  RxString gp = ''.obs;
  RxString testDone = 'no'.obs;
  int? totalQ;
  // int? secQuestion;
  int subQusCount = 0;
  int sectionQusCount = 0;
  int sectionTotalQus = 0;
  List<String> aimcetList = [];
  List<SectionName> aimcetSectionName = [];

  List<String> personality = [];
  String? traitType;
  List<String> degrees = [];
  List<String> careers = [];

  var personalityReort = Rxn<PersonalityReportModel>();
  var traitReport = Rxn<TraitReportModel>();
  RxBool isDownloading = false.obs;
  int starCount = 0;
  TextEditingController reviewController = TextEditingController();
  TestuserDetails? testuserDetails;
  List<AlltestReview> testReviews = [];
  bool showAllreview = false;
  AimcetReviewData? aimcetReviewData;
  int? previousSecID;

  Future<void> fetchAllTestQuestions() async {
    String? token = await storage.read(key: 'token');
    totalQ = 0;
    // secQuestion = 0;
    subQusCount = 0;
    sectionQusCount = 0;
    isLoading.value = true;
    Map<String, dynamic>? data =
        await AIMCETTestService().getTestQuestions(token: token.toString());
    if (data != null) {
      if (data.containsKey('error')) {
        Get.snackbar(
          "Error",
          "Failed to Fetch your Questions...",
          snackPosition: SnackPosition.TOP,
          duration: const Duration(seconds: 2),
          backgroundColor: kred,
          colorText: Colors.white,
        );
      } else {
        List<dynamic> sectionData = data['sectionName'];
        List<SectionName> sections =
            sectionData.map((e) => SectionName.fromJson(e)).toList();
        for (var item in sections) {
          if (!aimcetSectionName.any((i) => i.name == item.name)) {
            aimcetSectionName.add(item);
          }
          // can remove aimcetList this list if wanted
          if (!aimcetList.contains(item.name)) {
            aimcetList.add(item.name.toString());
          }
        }

        Map<String, dynamic>? questionData = data['data'];
        if (data['indexval'] == null || data['indexval'] == 0) {
          totalQ = 0;
        } else {
          totalQ = data['indexval'];
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
        /*--------------changes----------- */
        if (data['sec_question_attempt'] == null ||
            data['sec_question_attempt'] == 0) {
          /////////
          sectionQusCount = 0;
        } else {
          sectionQusCount = data['sec_question_attempt'];
        }
        if (data['sub_question_attempt'] == null ||
            data['sub_question_attempt'] == 0) {
          //////////
          subQusCount = 0;
        } else {
          subQusCount = data['sub_question_attempt'];
        }
      }
    }
    isLoading.value = false;
    log('length====>${allQuestions?.length} subQuesCount=>$subQusCount sectionqusCount=>$sectionQusCount submittedQus=>$totalQ',
        name: 'fetch allqus func');
  }

  void updateTestFileds(int secionID) {
    totalQ = totalQ! + 1;
    if (subQusCount < 6) {
      subQusCount = subQusCount + 1;
    } else {
      subQusCount = 1;
    }
    if (previousSecID != secionID) {
      previousSecID = secionID;
      for (var item in aimcetSectionName) {
        // if (aimcetSectionName.any((i) => i.id == previousSecID)) {}
        if (item.id == previousSecID) {
          sectionTotalQus = 0;
          sectionQusCount = 0;
          sectionTotalQus = int.tryParse(item.totalQuestion.toString()) ?? 0;
        }
      }
    }
    if (sectionQusCount < sectionTotalQus) {
      sectionQusCount = sectionQusCount + 1;
    }

    update(['aimcet-test']);
  }

  Future<void> submitAceTestQuestion({
    // required String userId,
    required String questionId,
    required String cAnswer,
    required String sectionId,
    required String subSectionId,
    required String sectionQusCount,
    required String subQuesCount,
    required String totalQues,
  }) async {
    String? token = await storage.read(key: 'token');
    await AIMCETTestService().sumbitAceTest(
      // userId: userId,
      questionId: questionId,
      cAnswer: cAnswer,
      sectionId: sectionId,
      subSectionId: subSectionId,
      sectionQusCount: sectionQusCount,
      subQuesCount: subQuesCount,
      totalQues: totalQues,
      token: token.toString(),
    );
    update(['aimcet-test']);
  }

  // Future<void> careerResultSubmittion(
  //     {required String userId, required String secId}) async {
  //   log('career result at 40th and 55th qustion====secid=>$secId',
  //       name: '40th and 55th');
  //   await AIMCETTestService().careerResultPost(userId: userId, secId: secId);
  // }

  Future<void> aimcetTestResultFunction({required String userName}) async {
    String? token = await storage.read(key: 'token');

    dynamic result = await AIMCETTestService()
        .aimcetTestResult(token: token.toString(), userName: userName);

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
        if (result['userDetails'] != null) {
          testuserDetails = TestuserDetails.fromJson(result['userDetails']);
        }
        fetchAllTestReviews();
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

  // Future<void> gpReportSubmitFunction(
  //     {required String personality, required String trait}) async {
  //   String? token = await storage.read(key: 'token');
  //   gp.value = 'wait';
  //   String? value = await GPReportService().gpReportSubmit(
  //       token: token.toString(), personality: personality, trait: trait);
  //   if (value == 'sucess') {
  //     gp.value = 'sucess';
  //   } else {
  //     gp.value = 'failed';
  //   }
  // }

  Future<void> fetchPersonalityReport() async {
    try {
       gp.value = 'wait';
      String? token = await storage.read(key: 'token');
      PersonalityReportModel? report = await PersonalityReportService()
          .getPersonalityReport(token: token.toString());
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

  Future<void> fetchTraitReport() async {
    try {
       gp.value = 'wait';
      String? token = await storage.read(key: 'token');
      TraitReportModel? report =
          await TraitReportService().getTraitReport(token: token.toString());
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

  Future<void> checkAimcetTestTakenFunction() async {
    String? token = await storage.read(key: 'token');
    Map<String, dynamic>? data =
        await AIMCETTestService().checkAimcetTestTaken(token: token.toString());
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
      String? token = await storage.read(key: 'token');
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
            headers: {'Authorization': 'Bearer $token'},
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

  Future<void> submitTestReview(
      {required String testId,
      required String rating,
      required String review}) async {
    String? token = await storage.read(key: 'token');
    String? res = await AIMCETTestService().submitTestReview(
        token: token.toString(),
        testId: testId,
        rating: rating,
        review: review);
    if (res == 'Review saved successfully') {
      Get.showSnackbar(
        GetSnackBar(
          snackStyle: SnackStyle.FLOATING,
          message: res,
          borderRadius: 4,
          margin: const EdgeInsets.all(10),
          backgroundColor: Colors.green,
          duration: const Duration(seconds: 2),
        ),
      );
    } else {
      Get.showSnackbar(
        GetSnackBar(
          snackStyle: SnackStyle.FLOATING,
          message: res,
          borderRadius: 4,
          margin: const EdgeInsets.all(10),
          backgroundColor: Colors.red,
          duration: const Duration(seconds: 2),
        ),
      );
    }
    reviewController.clear();
  }

  Future<void> fetchAllTestReviews() async {
    Map<String, dynamic>? resData =
        await AIMCETTestService().getAllTestReviews();
    if (resData != null) {
      aimcetReviewData = AimcetReviewData.fromJson(resData);
      List<dynamic> reviewData = resData['data'];
      List<AlltestReview> data =
          reviewData.map((e) => AlltestReview.fromJson(e)).toList();
      for (var item in data) {
        if (!testReviews.any((i) => i.review?.id == item.review?.id)) {
          testReviews.add(item);
        }
      }
    }
    update(['show-Allreviews']);
  }

  void toggleSelection() {
    guideSelect = !guideSelect;
    // guidebutton.value = !guidebutton.value;
    guidebutton.value = guideSelect;
    update(['button-proceed']);
  }

  void updateStarCount(int count) {
    starCount = count;
    update(['review-star']);
  }

  void toggleShowReview() {
    showAllreview = !showAllreview;
    update(['show-Allreviews']);
  }
}
