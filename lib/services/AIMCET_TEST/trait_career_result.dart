import 'dart:developer';

import 'package:aimshala/models/AIMCET_TEST/Trait_model/trait_report_model.dart';
import 'package:aimshala/utils/common/constant/api_const.dart';
import 'package:dio/dio.dart';

class TraitReportService{
  Dio dio = Dio();

  Future<TraitReportModel?>getTraitReport({required String userId})async{
    String path = Apis().aimUrl + Apis().traitReport;

     try {
      Response response = await dio.get(
        path,
        queryParameters: {"user_id": userId},
      );

      if (response.statusCode == 200) {
        log(response.data.toString(),name: 'trait report');
        Map<String, dynamic> responseBody = response.data;
        return TraitReportModel.fromJson(responseBody);
      } else {
        // If the request fails, log the error and return null
        log('Failed to get trait report: ${response.statusCode}',
            name: 'trait report error');
        return null;
      }
    } catch (e) {
      log(e.toString(), name: 'trait report error');
    }
    return null;
  
  }
}