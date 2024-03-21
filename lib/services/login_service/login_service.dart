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
            validateStatus: (status) => status! < 500,
          ));

      log(response.data.toString(), name: 'userverify');
      if (response.statusCode == 200) {
        return UserDataModel.fromJson(response.data);
      } else if (response.statusCode == 422) {
        return UserDataModel.fromJson(response.data);
      }
    } on DioException catch (e) {
      // Handle other exceptions
      log('Exception: ${e.toString()}', name: 'verifyusererror');
    }
    return null;
  }
}
   // on SocketException catch (e) {
    //   // Handle SocketException
    //   log('SocketException: ${e.message}', name: 'socket');
    // } 
