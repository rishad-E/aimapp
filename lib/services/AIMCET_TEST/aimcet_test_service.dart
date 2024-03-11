import 'dart:developer';
import 'package:aimshala/models/AIMCET_TEST/AIMCET_Test_model/test_model.dart';
import 'package:aimshala/utils/common/constant/api_const.dart';
import 'package:dio/dio.dart';

class AIMCETTestService {
  Dio dio = Dio();

  Future<Map<String, List<Question>>?> getTestResult(
      {required String userId, required String qualifyId}) async {
    String path = Apis().aimUrl + Apis().aimcetTest;
    try {
      Response response = await dio.post(
        path,
        data: {"user_id": userId, "qualification": qualifyId},
      );
      if (response.statusCode == 200) {
        Map<String, dynamic> data = response.data['data'];
        Map<String, List<Question>> res = {};
        data.forEach((key, value) {
          res[key] =
              List<Question>.from(value.map((x) => Question.fromJson(x)));
        });

        log(res.toString(), name: 'aimcet res');
        return res;
      }
    } catch (e) {
      log(e.toString(), name: 'aimcet test error');
    }
    return null;
  }

  Future<String?> sumbitAIMTest({
    required String userId,
    required String cAnswer,
    required String sectionId,
    required String questionId,
  }) async {
    String path = Apis().aimUrl + Apis().sumbitTest;
    log(userId + cAnswer + sectionId + questionId);
    try {
      Response response = await dio.post(path,
          data: {
            "user_id": userId,
            "c_answer": cAnswer,
            "section_id": sectionId,
            "question_id": questionId
          },
          options: Options(
            validateStatus: (status) => status! < 500,
          ));
      if (response.statusCode == 200) {
        return 'success';
      } else if (response.statusCode == 422) {
        return 'failed';
      }
      log(response.data.toString(), name: 'aimcet sumbit');
    } catch (e) {
      log(e.toString(), name: 'aimcet submit error');
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
    log(userId + userName, name: 'cccccccccccccccccccccccccccc');
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
        log(response.data.toString(), name: 'aimcet result submit');
        return 'failed';
      }
    } catch (e) {
      log(e.toString(), name: 'aimcet result submit error');
    }
  }
}
