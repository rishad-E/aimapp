import 'dart:developer';
import 'package:aimshala/utils/common/constant/api_const.dart';
import 'package:aimshala/utils/common/snackbar/snackbar.dart';
import 'package:dio/dio.dart';

class AIMCETTestService {
  Dio dio = Dio();

  Future<Map<String, dynamic>?> getTestResult(
      {required String userId, required String qualifyId}) async {
    String path = Apis().aimUrl + Apis().aimcetTest;
    try {
      Response response = await dio.post(path,
          data: {"user_id": userId, "qualification": qualifyId},
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

    // catch (e) {
    //   log(e.toString(), name: 'aimcet test error');
    // }
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
    log(userId + questionId + sectionId + cAnswer + secQues + totalQues,
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
      );
      log(response.data.toString(), name: 'career result submit');
    } catch (e) {
      log(e.toString(), name: 'career result submit error');
    }
  }

  Future<dynamic> aimcetTestResult(
      {required String userId, required String userName}) async {
    String path = Apis().aimUrl + Apis().aimcetResult;
    log(userId + userName, name: 'aimcettest res serv func params');
    try {
      Response response = await dio.post(path,
          data: {"user_id": userId, "username": userName},
          options: Options(
            validateStatus: (status) => status! < 500,
          ));
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
}
