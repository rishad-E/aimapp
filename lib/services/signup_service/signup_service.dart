import 'dart:developer';

import 'package:dio/dio.dart';

class SignUpService {
  Dio dio = Dio();
  String path = 'http://154.26.130.161/elearning/api/user-registeration';

  Future<String?> signUpUser(
      {required String email,
      required String mobile,
      required String name}) async {
    log(email + mobile + name, name: 'service');
    try {
      Response response = await dio.post(
        path,
        options: Options(
          validateStatus: (status) => status! < 599,
        ),
        data: {
          'phone': mobile,
          'name': name,
          'email': email,
          "user_active": "1",
          "referral_code": "AIM001"
        },
      );
      log(response.data.toString(), name: 'signup');
      dynamic res = response.data;
      if (res is Map) {
        Map<String, dynamic> resData = response.data;
        if (resData.containsKey('message')) {
          String message = resData['message'];
          // "message": "User registered successfully"
          return message;
        } else if (resData.containsKey('error')) {
          Map<String, dynamic> errors = resData['error'];
          String first = errors.keys.first;
          if (errors[first] is List && (errors[first] as List).isNotEmpty) {
            String errorMessage = errors[first][0].toString();
            log(errorMessage, name: 'sign up  error');
            return errorMessage;
          }
        }
      }
    } catch (e) {
      log(e.toString(), name: 'signup error');
    }
    return null;
  }
}
