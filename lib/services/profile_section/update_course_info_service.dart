import 'dart:developer';

import 'package:aimshala/utils/common/constant/api_const.dart';
import 'package:dio/dio.dart';

class UpdateCourseInfoService {
  Dio dio = Dio();

  Future<String?> saveCourseInfo(
      {required String uId,
      required String course,
      required String courseNo,
      required String courseAssosiated,
      required String working}) async {
    log('ID=>$uId course=>$course number=>$courseNo assosiated=>$courseAssosiated currently=>$working',
        name: 'course-service');
    String path = Apis().aimUrl + Apis().saveCourse;
    try {
      Response response = await dio.post(path,
          data: {
            "user_id": uId,
            "course_name": course,
            "course_number": courseNo,
            "assosiated": courseAssosiated,
            "working_currently": working,
          },
          options: Options(
            validateStatus: (status) => status! < 599,
          ));
      Map<String, dynamic> responseData = response.data;

      if (responseData.containsKey('success')) {
        String successMessage = responseData['success'];
        log(successMessage, name: 'save course success');
        return successMessage;
      } else if (responseData.containsKey('error')) {
        final errorData = responseData['error'] as Map<String, dynamic>;
        final List<dynamic> errorMessages = errorData.values.first;
        final errorMessage = errorMessages.join('\n');
        log(errorMessage.toString(), name: 'save course error data');
        return errorMessage;
      }
    } on DioException catch (e) {
      if (e.response?.statusCode == 500) {
        log('Server error: ${e.message}', name: 'save course error');
        throw Exception('Server error occurred');
      } else {
        log('error:${e.response?.data}', name: 'save course error');
      }
    } catch (e) {
      // Handle other exceptions
      log('error :${e.toString()}', name: 'save course error');
      throw Exception('error occurred ${e.toString()}');
    }
    return null;
  }
}
