import 'dart:developer';

import 'package:aimshala/utils/common/constant/api_const.dart';
import 'package:dio/dio.dart';

class UpdatePersonalInfoService {
  Dio dio = Dio();

  Future<bool?> updatePersonalInfo({
    required String uId,
    required String fullName,
    required String userName,
    required String dOB,
    required String gender,
    required String statement,
  }) async {
    String path = Apis().aimUrl + Apis().savepersonalInfo;
    log('name: $fullName username:${userName}date: $dOB UID: $uId',
        name: 'update personal info');

    try {
      Response response = await dio.post(
        path,
        data: {
          "user_id": uId,
          "full_name": fullName,
          "username": userName,
          "dob": dOB,
          "gender": gender,
          "statement": statement,
        },
        options: Options(validateStatus: (status) => status! < 599),
      );
      if (response.statusCode == 200) {
        // log(response.data.toString(), name: 'save personal info');
        return true;
      }
    } on DioException catch (e) {
      if (e.response?.statusCode == 500) {
        // Handle status code 500 here
        // You can throw a custom exception or return an empty list as needed
        throw Exception('Server error occurred');
      }
    } catch (e) {
      // Handle other exceptions
      throw Exception('Server error occurred ${e.toString()}');
    }
    return null;
  }
}
