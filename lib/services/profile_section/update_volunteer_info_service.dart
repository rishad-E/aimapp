import 'dart:developer';

import 'package:aimshala/utils/common/constant/api_const.dart';
import 'package:dio/dio.dart';

class UpdateVolunteerInfoService {
  Dio dio = Dio();
  Future<String?> saveVolunteerInfo({
    required String uId,
    required String organization,
    required String volRole,
    required String volCause,
    required String startDate,
    required String endDate,
    required String description,
  }) async {
    String path = Apis().aimUrl + Apis().saveVolunteer;
    log('ID=>$uId organization=>$organization role=>$volRole cause=>$volCause startDate=>$startDate endDate=>$endDate description=>$description',
        name: 'volunteer-service');
    try {
      Response response = await dio.post(path,
          data: {
            "user_id": uId,
            "organization":organization ,
            "role":volRole ,
            "cause": volCause,
            "start_date": startDate,
            "end_date": endDate,
            "description": description,
          },
          options: Options(
            validateStatus: (status) => status! < 599,
          ));
      Map<String, dynamic> responseData = response.data;

      if (responseData.containsKey('success')) {
        String successMessage = responseData['success'];
        log(successMessage, name: 'save volunteer success');
        return successMessage;
      } else if (responseData.containsKey('error')) {
        // String errorMessage = responseData['error'];
        final errorData = responseData['error'] as Map<String, dynamic>;
        final List<dynamic> errorMessages = errorData.values.first;
        final errorMessage = errorMessages.join('\n');
        log(errorMessage.toString(), name: 'save volunteer error data');
        return errorMessage;
      }
    } on DioException catch (e) {
      if (e.response?.statusCode == 500) {
        log('Server error: ${e.message}', name: 'save volunteer error');
        throw Exception('Server error occurred');
      } else {
        log('error:${e.response?.data}', name: 'save volunteer error');
      }
    } catch (e) {
      // Handle other exceptions
      log('error :${e.toString()}', name: 'save volunteer error');
      throw Exception('error occurred ${e.toString()}');
    }
    return null;
  }
}
