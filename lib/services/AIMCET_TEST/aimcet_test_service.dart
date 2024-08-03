import 'dart:developer';
import 'package:aimshala/models/AIMCET_TEST/test_section_texts/section_texts.dart';
import 'package:aimshala/utils/common/constant/api_const.dart';
import 'package:aimshala/utils/common/snackbar/snackbar.dart';
import 'package:dio/dio.dart';

class AIMCETTestService {
  Dio dio = Dio();

  Future<Map<String, dynamic>?> getTestQuestions(
      {required String userId}) async {
    String path = Apis().aimUrl + Apis().aimcetTest;
    try {
      Response response = await dio.post(path,
          data: {"user_id": userId},
          options: Options(
            validateStatus: (status) => status! < 599,
          ));
      if (response.statusCode == 200) {
        Map<String, dynamic> data = response.data;
        return data;
      } else if (response.statusCode == 500) {
        SnackbarPopUps.popUpB(
            'Error fetching data...Please try after sometime');
        return null;
      }
    } on DioException catch (e) {
      // Handle other exceptions
      log('Exception: ${e.toString()}', name: 'aimcet test error');
      throw SnackbarPopUps.popUpB(
          'Error fetching data...Please try after sometime');
    }
    return null;
  }

  Future<String?> sumbitAIMTest({
    required String userId,
    required String cAnswer,
    required String sectionId,
    required String questionId,
    required String secQues,
    required String totalQues,
  }) async {
    String path = Apis().aimUrl + Apis().sumbitTest;
    log('userId=>$userId questionId=>$questionId sectionId=>$sectionId cAnswer=>$cAnswer secQues=>$secQues totalQues=>$totalQues',
        name: 'serviceeeeeee');
    try {
      Response response = await dio.post(path,
          data: {
            "user_id": userId,
            "c_answer": cAnswer,
            "section_id": sectionId,
            "question_id": questionId,
            "section_qus": secQues,
            "total_question": totalQues
          },
          options: Options(
            validateStatus: (status) => status! < 599,
          ));
      log(response.data.toString(), name: 'aimcet sumbit');
      if (response.statusCode == 200) {
        return 'success';
      } else if (response.statusCode == 422) {
        return 'failed';
      } else if (response.statusCode == 500) {
        SnackbarPopUps.popUpB(
            'Error fetching data...Please try after sometime');
      }
    } on DioException catch (e) {
      // Handle other exceptions
      log('Exception: ${e.toString()}', name: 'aimcet submit error');
      throw SnackbarPopUps.popUpB(
          'Error fetching data...Please try after sometime');
    }
    return null;
  }

  Future<void> careerResultPost(
      {required String userId, required String secId}) async {
    String path = Apis().aimUrl + Apis().careerresultsubmit;
    try {
      Response response = await dio.post(
        path,
        data: {"user_id": userId, "secid": secId},
        options: Options(validateStatus: (status) => status! < 599),
      );
      log(response.data.toString(), name: 'career result submit');
    } catch (e) {
      log(e.toString(), name: 'career result submit error');
    }
  }

  Future<dynamic> aimcetTestResult(
      {required String userId, required String userName}) async {
    String path = Apis().aimUrl + Apis().aimcetResult;
    log('userId=>$userId  userName=>$userName',
        name: 'aimcettest res serv func params');
    try {
      Response response = await dio.post(
        path,
        data: {"user_id": userId, "username": userName},
        options: Options(validateStatus: (status) => status! < 599),
      );
      if (response.statusCode == 200) {
        // log(response.data.toString(), name: 'aimcet result submit');
        return response.data;
      } else if (response.statusCode == 422) {
        log(response.data.toString(), name: 'aimcet test result');
        return 'failed';
      } else if (response.statusCode == 500) {
        SnackbarPopUps.popUpB(
            'Error fetching data...Please try after sometime');
      }
      return null;
    } on DioException catch (e) {
      // Handle other exceptions
      log('Exception: ${e.toString()}', name: 'aimcet test result error');
      throw SnackbarPopUps.popUpB(
          'Error fetching data...Please try after sometime');
    }
  }

  Future<Map<String, dynamic>?> checkAimcetTestTaken(
      {required String userId}) async {
    String path = Apis().aimUrl + Apis().checkAimcet;
    try {
      Response response = await dio.get(
        path,
        queryParameters: {"user_id": userId},
      );
      if (response.statusCode == 200) {
        Map<String, dynamic> res = response.data;
        log(res.toString(), name: 'check aimcet test');
        return res;
      } else if (response.statusCode == 500) {
        SnackbarPopUps.popUpB(
            'Error fetching data...Please try after sometime');
      }
    } on DioException catch (e) {
      // Handle other exceptions
      log('Exception: ${e.toString()}', name: 'check aimcet test taken error');
      throw SnackbarPopUps.popUpB(
          'Error fetching data...Please try after sometime');
    }

    return null;
  }

  Future<List<Section>?> getTestSectionTexts() async {
    String path = 'http://154.26.130.161/elearning/api/test-sections';

    try {
      Response response = await dio.get(
        path,
        options: Options(validateStatus: (status) => status! < 599),
      );
      if (response.data is Map) {
        Map<String, dynamic> resData = response.data;
        if (resData.containsKey('sections')) {
          List<dynamic> data = resData['sections'];
          List<Section> texts = data.map((e) => Section.fromJson(e)).toList();
          return texts;
          // log(texts.toString(), name: 'sec Texts');
        }
      } else if (response.data is String) {
        String msg = response.data;
        SnackbarPopUps.popUpB(
            'Error fetching data $msg...Please try after sometime');
      }
    } on DioException catch (e) {
      // Handle other exceptions
      log('Exception: ${e.toString()}',
          name: 'aimcet getTestSectionTexts error');
      throw SnackbarPopUps.popUpB(
          'Error fetching data...Please try after sometime');
    }
    return null;
  }

  Future<String?> submitTestReview(
      {required String uId,
      required String testId,
      required String rating,
      required String review}) async {
    String path = 'http://154.26.130.161/elearning/api/add-review';
    try {
      Response response = await dio.post(
        path,
        queryParameters: {
          'user_id': uId,
          'test_id': testId,
          'rating': rating,
          'review': review
        },
        options: Options(validateStatus: (status) => status! < 599),
      );
      Map<String, dynamic> resData = response.data;
      if (resData.containsKey('message')) {
        String resMsg = resData['message'];
        return resMsg;
      } else if (resData.containsKey('error')) {
        if (resData['error'] is Map) {
          Map<String, dynamic> errors = resData['error'];
          String first = errors.keys.first;
          if (errors[first] is List && (errors[first] as List).isNotEmpty) {
            String errorMessage = errors[first][0].toString();
            return errorMessage;
          }
        } else if (resData['error'] is String) {
          String errorMessage = resData['error'];
          return errorMessage;
        }
      }
    } on DioException catch (e) {
      // Handle other exceptions
      log('Exception: ${e.toString()}',
          name: 'aimcet getTestSectionTexts error');
      throw SnackbarPopUps.popUpB(
          'Error fetching data...Please try after sometime');
    }
    return null;
  }

  Future<List?> getAllTestReviews() async {
    String path = 'http://154.26.130.161/elearning/api/show-review';
    try {
      Response response = await dio.get(
        path,
        options: Options(validateStatus: (status) => status! < 599),
      );

      Map<String, dynamic> resData = response.data;
      if (resData.containsKey('data')) {
        List<dynamic> data = resData['data'];
        return data;
      } else if (resData.containsKey('error')) {
        if (resData['error'] is Map) {
          Map<String, dynamic> errors = resData['error'];
          String first = errors.keys.first;
          if (errors[first] is List && (errors[first] as List).isNotEmpty) {
            String errorMessage = errors[first][0].toString();
            // return errorMessage;
            SnackbarPopUps.popUpB('Error fetching data...$errorMessage');
          }
        } else if (resData['error'] is String) {
          String errorMessage = resData['error'];
          // return errorMessage;
          SnackbarPopUps.popUpB('Error fetching data...$errorMessage');
        }
      }
    } on DioException catch (e) {
      // Handle other exceptions
      log('Exception: ${e.toString()}',
          name: 'aimcet getTestSectionTexts error');
      throw SnackbarPopUps.popUpB(
          'Error fetching data...Please try after sometime');
    }
    return null;
  }
}



// {
//   "message": "Review saved successfully",
//   "data": {
//     "user_id": "583",
//     "test_id": "1084",
//     "ratings": "4",
//     "review": "checking",
//     "updated_at": "2024-08-01T12:53:34.000000Z",
//     "created_at": "2024-08-01T12:53:34.000000Z",
//     "id": 27
//   },
//   "userName": "Rishad E",
//   "Nameinitials": "RE",
//   "timeElapsed": "1 second ago"
// }