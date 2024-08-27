import 'dart:developer';

import 'package:aimshala/utils/common/constant/api_const.dart';
import 'package:dio/dio.dart';

class GetProfileAllData {
  Dio dio = Dio();

  Future<dynamic> fetchProfileAlldata({required String token}) async {
    String path = Apis().aimUrl + Apis().getProfileAlldata;
    try {
      Response response = await dio.get(
        path,
        options: Options(
          validateStatus: (status) => status! < 599,
          headers: {'Authorization': 'Bearer $token'},
        ),
      );
      // log(response.data.toString(),name: 'profile data res');
      if (response.statusCode == 200) {
        return response.data;
      } else {
        // Handle other response status codes if needed
        throw Exception('Failed to fetch profile data: ${response.data.toString()}');
      }
    } on DioException catch (e) {
      if (e.response?.statusCode == 500) {
        // Handle status code 500 here
        log('Server error: ${e.message}', name: 'profile all data error');
        // You can throw a custom exception or return an empty list as needed
        throw Exception('Server error occurred');
      }
    } catch (e) {
      // Handle other exceptions
      log(e.toString(), name: 'profile all data error');
      throw Exception('error occurred ${e.toString()}');
    }
    return null;
  }
}
