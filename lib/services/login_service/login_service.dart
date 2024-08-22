import 'dart:developer';
import 'package:aimshala/utils/common/snackbar/snackbar.dart';
import 'package:dio/dio.dart';
// import 'package:get/get.dart';

class LoginService {
  Dio dio = Dio();
  String path = 'http://154.26.130.161/elearning/api/user-login';

  Future<Map<String, dynamic>?> verifyUserExist(
      {required String mobileNo}) async {
    try {
      Response response = await dio.post(
        path,
        data: {'phone': mobileNo},
        options: Options(validateStatus: (status) => status! < 599),
      );

      log(response.statusCode.toString(), name: 'userverify');
      if (response.data is Map) {
        Map<String, dynamic> resData = response.data;
        // if (response.statusCode == 200 || response.statusCode == 300) {
        return resData;
        // }
      } else {
        if (response.statusCode == 500) {
          SnackbarPopUps.popUpB(
              'Error fetching data,Server Error...Please try after sometime');
        }
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
