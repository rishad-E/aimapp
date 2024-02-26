import 'dart:developer';
import 'package:aimshala/models/UserModel/user_model.dart';
import 'package:dio/dio.dart';

class LoginService {
  Dio dio = Dio();
  String path = 'http://154.26.130.161/elearning/api/user-login';

  Future<UserDataModel?> verifyUserExist({required String mobileNo}) async {
    try {
      Response response = await dio.post(path,
          data: {'phone': mobileNo},
          options: Options(
            validateStatus: (status) => status! < 400,
          ));

      log(response.data.toString(), name: 'userverify');
      if (response.statusCode == 200) {
        return UserDataModel.fromJson(response.data);
        // return true;
      }
      //  else if (response.statusCode == 300) {
      //   return false;
      // }
    } catch (e) {
      log(e.toString(), name: 'verifyusererror');
    }
    return null;
  }
}
