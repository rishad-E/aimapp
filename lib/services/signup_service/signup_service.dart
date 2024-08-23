import 'dart:developer';

import 'package:aimshala/utils/common/snackbar/snackbar.dart';
import 'package:dio/dio.dart';

class SignUpService {
  Dio dio = Dio();
  String path = 'http://154.26.130.161/elearning/api/user-registeration';

  Future<Map<String, dynamic>?> signUpUser({
    required String name,
    required String email,
    required String gender,
    required String dob,
    required String mobile,
    required String qualification,
    required String clases,
    required String role,
    required String submit,
  }) async {
    log('email=>$email  mobile=>$mobile  name=>$name gender=>$gender dob=>$dob quali=>$qualification class=$clases role=>$role submit=>$submit',
        name: 'signup-service');
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
          'gender': gender,
          'dob': dob,
          'qualification': qualification,
          'classes': clases,
          'role': role,
          'submit_type': submit,
          "user_active": "1",
          "referral_code": "AIM001"
        },
      );
      log(response.data.toString(), name: 'signup');
      if (response.data is Map) {
        Map<String, dynamic> res = response.data;
        return res;
      } else if (response.statusCode == 500) {
        // log('Server error:${response.data}', name: 'sign up error');
        SnackbarPopUps.popUpB('Server error occured');
      }
    } on DioException catch (e) {
      if (e.response?.statusCode == 500) {
        log('Server error: ${e.message}', name: 'sign up error');
        throw Exception('Server error occurred');
      } else {
        // log('error:${e.response?.data}', name: 'sign up error');
      }
    } catch (e) {
      // Handle other exceptions
      // log('error :${e.toString()}', name: 'sign up error');
      throw Exception('error occurred ${e.toString()}');
    }
    return null;
  }
}
