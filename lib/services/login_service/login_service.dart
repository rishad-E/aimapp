import 'dart:developer';
import 'package:dio/dio.dart';

class LoginService {
  Dio dio = Dio();
  String path = 'http://154.26.130.161/elearning/api/user-login';

  Future<bool?> verifyUserExist({required String mobileNo}) async {
    try {
      Response response = await dio.post(path, data: {'phone': mobileNo},options: Options(validateStatus: (status) => status! < 400,));

      log(response.data.toString(), name: 'userverify');
      if (response.statusCode == 200) {
        return true;
      } else if (response.statusCode == 300) {
        return false;
      }
    } catch (e) {
      log(e.toString(), name: 'verifyusererror');
    }
    return null;
  }
}
