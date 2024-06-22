import 'dart:developer';
import 'package:aimshala/models/UserModel/user_model.dart';
import 'package:aimshala/utils/common/snackbar/snackbar.dart';
import 'package:dio/dio.dart';
// import 'package:get/get.dart';

class LoginService {
  Dio dio = Dio();
  String path = 'http://154.26.130.161/elearning/api/user-login';

  Future<dynamic> verifyUserExist({required String mobileNo}) async {
    try {
      Response response = await dio.post(path,
          data: {'phone': mobileNo},
          options: Options(
            validateStatus: (status) => status! < 599,
          ));

      log(response.data.toString(), name: 'userverify');
      Map<String, dynamic> resData = response.data;
      if (response.statusCode == 200 || response.statusCode == 300) {
        return resData;
      } else if (response.statusCode == 500) {
        SnackbarPopUps.popUpB(
            'Error fetching data,Server Error...Please try after sometime');
      } else {
        return null;
      }
    } on DioException catch (e) {
      // Handle other exceptions
      log('Exception: ${e.toString()}', name: 'verifyusererror');
      throw SnackbarPopUps.popUpB(
          'Error fetching data...Please try after sometime');
    }
    return null;
  }
}
   // on SocketException catch (e) {
    //   // Handle SocketException
    //   log('SocketException: ${e.message}', name: 'socket');
    // } 
