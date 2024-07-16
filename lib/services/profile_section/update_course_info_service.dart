import 'dart:developer';

import 'package:aimshala/utils/common/constant/api_const.dart';
import 'package:dio/dio.dart';

class UpdateCourseInfoService {
  Dio dio = Dio();

  Future<String?> saveCourseInfo({
    required String uId,
    required String course,
    required String courseNo,
    required String courseAssosiated,
  }) async {
    log('ID=>$uId course=>$course number=>$courseNo assosiated=>$courseAssosiated ',
        name: 'course-service save');
    String path = Apis().aimUrl + Apis().saveCourse;
    try {
      Response response = await dio.post(
        path,
        data: {
          "user_id": uId,
          "course_name": course,
          "course_number": courseNo,
          "associated": courseAssosiated,
        },
        options: Options(validateStatus: (status) => status! < 599),
      );
      Map<String, dynamic> responseData = response.data;

      if (responseData.containsKey('success')) {
        String successMessage = responseData['success'];

        return successMessage;
      } else if (responseData.containsKey('error')) {
        final errorData = responseData['error'] as Map<String, dynamic>;
        final List<dynamic> errorMessages = errorData.values.first;
        final errorMessage = errorMessages.join('\n');

        return errorMessage;
      }
    } on DioException catch (e) {
      if (e.response?.statusCode == 500) {
        // log('Server error: ${e.message}', name: 'save course error');
        throw Exception('Server error occurred');
      } else {
        log('error:${e.response?.data}', name: 'save course error');
      }
    } catch (e) {
      // Handle other exceptions
      // log('error :${e.toString()}', name: 'save course error');
      throw Exception('error occurred ${e.toString()}');
    }
    return null;
  }

  Future<String?> updateCourseInfo({
    required String uId,
    required String courseID,
    required String course,
    required String courseNo,
    required String courseAssosiated,
    // required String working,
  }) async {
    log('courseID=>$courseID ID=>$uId course=>$course number=>$courseNo assosiated=>$courseAssosiated ',
        name: 'course-service update');
    String path = Apis().aimUrl + Apis().saveCourse;
    try {
      Response response = await dio.post(
        path,
        data: {
          "course_id": courseID,
          "user_id": uId,
          "course_name": course,
          "course_number": courseNo,
          "associated": courseAssosiated,
        },
        options: Options(validateStatus: (status) => status! < 599),
      );
      Map<String, dynamic> responseData = response.data;
      // log(responseData.toString(), name: 'save course success');
      if (responseData.containsKey('success')) {
        String successMessage = responseData['success'];

        return successMessage;
      } else if (responseData.containsKey('error')) {
        final errorData = responseData['error'] as Map<String, dynamic>;
        final List<dynamic> errorMessages = errorData.values.first;
        final errorMessage = errorMessages.join('\n');

        return errorMessage;
      }
    } on DioException catch (e) {
      if (e.response?.statusCode == 500) {
        // log('Server error: ${e.message}', name: 'update course error');
        throw Exception('Server error occurred');
      } else {
        // log('error:${e.response?.data}', name: 'update course error');
      }
    } catch (e) {
      // Handle other exceptions
      // log('error :${e.toString()}', name: 'update course error');
      throw Exception('error occurred ${e.toString()}');
    }
    return null;
  }

  Future<String?> deleteCourseInfo({required String courseID}) async {
    String path = Apis().aimUrl + Apis().deleteCourses;
    try {
      Response response = await dio.post(
        path,
        data: {"course_id": courseID},
        options: Options(
          validateStatus: (status) => status! < 599,
        ),
      );
      // log(response.data.toString(),name: 'delete couser');
      Map<String, dynamic> responseData = response.data;

      if (responseData.containsKey('success')) {
        String successMessage = responseData['success'];
        return successMessage;
      } else if (responseData.containsKey('error')) {
        if (responseData['error'] is Map) {
          Map<String, dynamic> errors = responseData['error'];
          String first = errors.keys.first;
          if (errors[first] is List && (errors[first] as List).isNotEmpty) {
            String errorMessage = errors[first][0].toString();
            return errorMessage;
          }
        } else if (responseData['error'] is String) {
          String errorMessage = responseData['error'];
          return errorMessage;
        }
      }
    } on DioException catch (e) {
      if (e.response?.statusCode == 500) {
        // log('Server error: ${e.message}',
        //     name: 'delete Course section error');
        throw Exception('Server error occurred');
      } else {
        log('error: statuscode:${e.response?.statusCode}',
            name: 'delete Course section error');
      }
    } catch (e) {
      // Handle other exceptions
      // log('error :${e.toString()}', name: 'delete Course info error');
      throw Exception('error occurred ${e.toString()}');
    }
    return null;
  }
}
