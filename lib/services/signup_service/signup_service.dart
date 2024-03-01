import 'dart:developer';

import 'package:dio/dio.dart';

class SignUpService {
  Dio dio = Dio();
  String path = 'http://154.26.130.161/elearning/api/user-registeration';

  Future<bool?> signUpUser({
    required String email,
    required String mobile,
    required String name,
  }) async {
    try {
      Response response = await dio.post(
        path,
        options: Options(
          validateStatus: (status) {
            return status! < 400;
          },
        ),
        data: {
          'phone': mobile,
          'name': name,
          'email': email,
          "user_active": "1",
          "referral_code": "AIM001"
        },
      );
      // log(response.data.toString(), name: 'signup');

      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      log(e.toString(), name: 'signup error');
    }
    return null;
  }
}
