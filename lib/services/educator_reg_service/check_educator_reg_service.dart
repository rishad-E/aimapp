import 'dart:developer';

import 'package:dio/dio.dart';

class CheckEducatorRegTakenService {
  Dio dio = Dio();

  Future<Map<String, dynamic>?> checkEducatorRegTaken({required String uId}) async {
    String path = 'http://154.26.130.161/elearning/api/get-educator-data';

    try {
      Response response = await dio.get(
        path,
        queryParameters: {"user_id": uId},
        options: Options(validateStatus: (status) => status! < 599),
      );
      Map<String,dynamic>resData = response.data;
      // log(resData.toString(),name: 'educator check res');
      return resData;
    } on DioException catch (e) {
      if (e.response?.statusCode == 500) {
        log('Server error: ${e.message}', name: 'check educator info error');
        throw Exception('Server error occurred');
      } else {
        log('error: statuscode:${e.response?.statusCode}',
            name: 'check educator info error');
      }
    } catch (e) {
      // Handle other exceptions
      log('error :${e.toString()}', name: 'check educator info error');
      throw Exception('error occurred ${e.toString()}');
    }
    return null;
  }
}
