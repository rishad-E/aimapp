import 'dart:developer';

import 'package:aimshala/utils/common/snackbar/snackbar.dart';
import 'package:dio/dio.dart';

class UserAllDataService {
  Dio dio = Dio();

  Future<Map<String, dynamic>?> fetchUserData(
      {required String uId, required String token}) async {
    String path = 'http://154.26.130.161/elearning/api/get-user-info';

    try {
      Response response = await dio.get(
        path,
        queryParameters: {"user_id": uId},
        options: Options(
          validateStatus: (status) => status! < 599,
          // headers: {'Authorization': 'Bearer $token'},
        ),
      );
      log("statuscode=====>${response.statusCode}", name: 'user-all-data');
      if (response.statusCode == 200) {
        if (response.data is Map) {
          Map<String, dynamic> resData = response.data;
          return resData;
        }
      } else if (response.statusCode == 500) {
        log('Server error: ${response.statusCode}',
            name: 'get all-data info error');
        SnackbarPopUps.popUpB('Server erro occured..!');
      }
    } on DioException catch (e) {
      if (e.response?.statusCode == 500) {
        // log('Server error: ${e.message}', name: 'get all-data info error');
        throw Exception('Server error occurred');
      } else {
        log('error: statuscode:${e.response?.statusCode}',
            name: 'get all-data info error');
      }
    } catch (e) {
      // Handle other exceptions
      // log('error :${e.toString()}', name: 'get all-data info error');
      throw Exception('error occurred ${e.toString()}');
    }
    return null;
  }
}
