import 'dart:developer';
import 'package:aimshala/models/UserModel/user_model.dart';
import 'package:aimshala/utils/common/snackbar/snackbar.dart';
import 'package:dio/dio.dart';
// import 'package:get/get.dart';

class LoginService {
  Dio dio = Dio();
  String path = 'http://154.26.130.161/elearning/api/user-login';

  Future<UserDataModel?> verifyUserExist({required String mobileNo}) async {
    try {
      Response response = await dio.post(path,
          data: {'phone': mobileNo},
          options: Options(
            validateStatus: (status) => status! < 599,
          ));

      log(response.data.toString(), name: 'userverify');
      if (response.statusCode == 200) {
        return UserDataModel.fromJson(response.data);
      } else if (response.statusCode == 422) {
        return UserDataModel.fromJson(response.data);
      }else if(response.statusCode == 500){
        SnackbarPopUps.popUpB('Error fetching data,Server Error...Please try after sometime');
      }
    } on DioException catch (e) {
      // Handle other exceptions
      log('Exception: ${e.toString()}', name: 'verifyusererror');
      throw SnackbarPopUps.popUpB('Error fetching data...Please try after sometime');
    }
    return null;
  }
}
   // on SocketException catch (e) {
    //   // Handle SocketException
    //   log('SocketException: ${e.message}', name: 'socket');
    // } 
