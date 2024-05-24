import 'dart:developer';
import 'package:aimshala/models/AIMCET_TEST/Trait_model/trait_report_model.dart';
import 'package:aimshala/utils/common/constant/api_const.dart';
import 'package:dio/dio.dart';

class TraitReportService {
  Dio dio = Dio();

  Future<TraitReportModel?> getTraitReport({required String userId}) async {
    String path = Apis().aimUrl + Apis().traitReport;

    try {
      Response response = await dio.get(
        path,
        queryParameters: {"user_id": userId},
        options: Options(validateStatus: (status) => status! < 599),
      );

      if (response.statusCode == 200) {
        log(response.data.toString(), name: 'trait report');
        Map<String, dynamic> responseBody = response.data;
        return TraitReportModel.fromJson(responseBody);
      } else if (response.statusCode != 200) {
        // If the request fails, log the error and return null
        log('Failed to get trait report: ${response.statusCode}',
            name: 'trait report error');
        return null;
      }
    } on DioException catch (e) {
      log(e.toString(), name: 'trait report error');
    }
    return null;
  }
}

// class PersonalityReportService {
//   Dio dio = Dio();

//   Future<PersonalityReportModel?> getPersonalityReport({required String userId}) async {
//     String path = Apis().aimUrl + Apis().personalityReport;

//     try {
//       Response response = await dio.get(
//         path,
//         queryParameters: {"user_id": userId},
//       );

//       if (response.statusCode == 200) {
//         log(response.data.toString(), name: 'personality report');
//         Map<String, dynamic> responseBody = response.data;
//         return PersonalityReportModel.fromJson(responseBody);
//       } else {
//         // If the request fails, log the error and return null
//         log('Failed to get personality report: ${response.statusCode} - ${response.statusMessage}',
//             name: 'personality report error');
//         return null;
//       }
//     } on DioError catch (dioError) {
//       // Handle DioError separately
//       if (dioError.response != null) {
//         // Non-200 response
//         log('Dio error response: ${dioError.response?.statusCode} - ${dioError.response?.statusMessage}\n${dioError.response?.data}',
//             name: 'personality report error');
//       } else if (dioError.type == DioErrorType.connectTimeout) {
//         // Connection timeout
//         log('Connection timeout: ${dioError.message}', name: 'personality report error');
//       } else if (dioError.type == DioErrorType.sendTimeout) {
//         // Send timeout
//         log('Send timeout: ${dioError.message}', name: 'personality report error');
//       } else if (dioError.type == DioErrorType.receiveTimeout) {
//         // Receive timeout
//         log('Receive timeout: ${dioError.message}', name: 'personality report error');
//       } else if (dioError.type == DioErrorType.cancel) {
//         // Request cancellation
//         log('Request canceled: ${dioError.message}', name: 'personality report error');
//       } else {
//         // Other Dio errors
//         log('Dio error: ${dioError.message}', name: 'personality report error');
//       }
//     } catch (e) {
//       // Handle other types of errors
//       log('Unexpected error: $e', name: 'personality report error');
//     }
//     return null;
//   }
// }
