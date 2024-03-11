import 'dart:developer';

import 'package:aimshala/models/AIMCET_TEST/Personality_model/personality_report_model.dart';
import 'package:aimshala/utils/common/constant/api_const.dart';
import 'package:dio/dio.dart';

class PersonalityReportService {
  Dio dio = Dio();

  Future<PersonalityReportModel?> getPersonalityReport(
      {required String userId}) async {
    String path = Apis().aimUrl + Apis().personalityReport;

    try {
      Response response = await dio.get(
        path,
        queryParameters: {"user_id": userId},
      );

      if (response.statusCode == 200) {
        log(response.data.toString(),name: 'personality report');
        Map<String, dynamic> responseBody = response.data;
        return PersonalityReportModel.fromJson(responseBody);
      } else {
        // If the request fails, log the error and return null
        log('Failed to get personality report: ${response.statusCode}',
            name: 'personality report error');
        return null;
      }
    } catch (e) {
      log(e.toString(), name: 'personality report error');
    }
    return null;
  }
}
