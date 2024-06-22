import 'dart:developer';

import 'package:dio/dio.dart';

class AmySignUpService {
  Dio dio = Dio();
  String path = 'http://154.26.130.161/elearning/api/amy-new-chat';

  Future<Map<String, dynamic>?> sendToAmyRegister(
      {required String uId, required String msg, required String qusId}) async {
        log('userId=>$uId  msg=>$msg  qusId=>$qusId',name: 'amy register service');
    try {
      Response response = await dio.post(
        path,
        data: {"user_id": uId, "msg": msg, "fqs": qusId},
        options: Options(validateStatus: (status) => status! < 599),
      );
      log(response.data.toString(),name: 'amy register response');
     if (response.statusCode == 200) {
       Map<String,dynamic> resData = response.data;
       return resData;
     }
    } on DioException catch (e) {
      if (e.response?.statusCode == 500) {
        log('Server error: ${e.message}', name: 'signup amy info error');
        throw Exception('Server error occurred');
      } else {
        log('error: statuscode:${e.response?.statusCode}',
            name: 'signup amy info error');
      }
    } catch (e) {
      // Handle other exceptions
      log('error :${e.toString()}', name: 'signup amy info error');
      throw Exception('error occurred ${e.toString()}');
    }
    return null;
  }
}
