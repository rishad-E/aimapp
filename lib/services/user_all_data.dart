import 'dart:developer';

import 'package:dio/dio.dart';

class UserAllDataService {
  Dio dio = Dio();

  Future<Map<String, dynamic>?> fetchUserData({required String uId}) async {
    String path = 'http://154.26.130.161/elearning/api/get-user-info';

    try {
      Response response = await dio.get(
        path,
        queryParameters: {"user_id": uId},
        options: Options(validateStatus: (status) => status! < 599),
      );
      Map<String,dynamic> resData = response.data;
      // log(resData.toString(),name: 'user-all-data');
      return resData;
    } on DioException catch (e) {
      if (e.response?.statusCode == 500) {
        log('Server error: ${e.message}', name: 'get all-data info error');
        throw Exception('Server error occurred');
      } else {
        log('error: statuscode:${e.response?.statusCode}',
            name: 'get all-data info error');
      }
    } catch (e) {
      // Handle other exceptions
      log('error :${e.toString()}', name: 'get all-data info error');
      throw Exception('error occurred ${e.toString()}');
    }
    return null;
  }
}
