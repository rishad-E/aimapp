import 'dart:developer';
import 'package:dio/dio.dart';

class CheckCounselorRegTakenService {
  Dio dio = Dio();

  Future<Map<String, dynamic>?> checkCounselorRegtaken({required uId}) async {
    String path = 'http://154.26.130.161/elearning/api/get-counsellor-data';

    try {
      Response response = await dio.get(
        path,
        queryParameters: {"user_id": uId},
        options: Options(validateStatus: (status) => status! < 599),
      );
      // log(response.data.toString(), name: 'mentor taken check');

      Map<String, dynamic> resData = response.data;
      return resData;
    } on DioException catch (e) {
      if (e.response?.statusCode == 500) {
        log('Server error: ${e.message}', name: 'check counselor info error');
        throw Exception('Server error occurred');
      } else {
        log('error: statuscode:${e.response?.statusCode}',
            name: 'check counselor info error');
      }
    } catch (e) {
      // Handle other exceptions
      log('error :${e.toString()}', name: 'check counselor info error');
      throw Exception('error occurred ${e.toString()}');
    }
    return null;
  }
}
