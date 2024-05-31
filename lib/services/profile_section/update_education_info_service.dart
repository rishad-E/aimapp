import 'dart:developer';
import 'dart:io';

import 'package:aimshala/utils/common/constant/api_const.dart';
import 'package:dio/dio.dart';

class UpdateEducationInfoService {
  Dio dio = Dio();

  Future<String?> saveEducationInfo({
    required String uId,
    required String school,
    required String degree,
    required String studyfield,
    required String startDate,
    required String endDate,
    required String grade,
    required String activities,
    required String description,
    required List<String> mediaTitle,
    required List<String> mediaDescription,
    required List<String> mediaLinks,
    required List<File> images,
    required List<String> skills,
  }) async {
    String path = Apis().aimUrl + Apis().saveEducation;

    log('uid:$uId school: $school degree:$degree studyfiled: $studyfield start: $startDate end: $endDate grade: $grade activities: $activities description: $description skills:$skills media:$images mediaTitle:$mediaTitle  mediaDesc:$mediaDescription  mediaLinks=>$mediaLinks',
        name: 'add-education save');
    // log(path, name: 'path');
    FormData formData = FormData.fromMap({
      "user_id": uId,
      "school": school,
      "degree": degree,
      "study_field": studyfield,
      "start_date": startDate,
      "end_date": endDate,
      "grade": grade,
      "activities": activities,
      "description": description,
      "media_titles[]": mediaTitle,
      "media_descriptions[]": mediaDescription,
      "media_links[]": mediaLinks,
      "skills[]": skills,
    });
    if (images.isNotEmpty) {
      for (int i = 0; i < images.length; i++) {
        File image = images[i];
        formData.files.add(MapEntry(
          'images[$i]',
          await MultipartFile.fromFile(image.path,
              filename: image.path.split('/').last),
        ));
      }
    }
    try {
      Response response = await dio.post(
        path,
        data: formData,
        options: Options(
          validateStatus: (status) => status! < 599,
          headers: {'Content-Type': 'multipart/form-data'},
        ),
      );
      Map<String, dynamic> responseData = response.data;
      if (responseData.containsKey('success')) {
        String successMessage = responseData['success'];
        log(successMessage, name: 'save education info success');
        return successMessage;
      } else if (responseData.containsKey('error')) {
        // String errorMessage = responseData['error'];
        log(response.data.toString(), name: 'save education info MB error');

        return 'Each image must not exceed 2MB in size.';
      }
    } on DioException catch (e) {
      if (e.response?.statusCode == 500) {
        log('Server error: ${e.message}', name: 'save education info error');
        throw Exception('Server error occurred');
      } else {
        log('error: statuscode:${e.response?.statusCode}',
            name: 'save education info error');
      }
    } catch (e) {
      // Handle other exceptions
      log('error :${e.toString()}', name: 'save education info error');
      throw Exception('error occurred ${e.toString()}');
    }
    return null;
  }

  Future<String?> updateEducationInfo({
    required String edID,
    required String uId,
    required String school,
    required String degree,
    required String studyfield,
    required String startDate,
    required String endDate,
    required String grade,
    required String activities,
    required String description,
    required List<String> mediaTitle,
    required List<String> mediaDescription,
    required List<String> mediaLinks,
    required List<File> images,
    required List<String> skills,
  }) async {
    log('edID=>$edID uid:$uId school: $school degree:$degree studyfiled: $studyfield start: $startDate end: $endDate grade: $grade activities: $activities description: $description skills:$skills media:$images mediaTitle:$mediaTitle  mediaDesc:$mediaDescription mediaLink=>$mediaLinks',
        name: 'add-education update');

    String path = Apis().aimUrl + Apis().saveEducation;
    FormData formData = FormData.fromMap({
      "education_id": edID,
      "user_id": uId,
      "school": school,
      "degree": degree,
      "study_field": studyfield,
      "start_date": startDate,
      "end_date": endDate,
      "grade": grade,
      "activities": activities,
      "description": description,
      "media_titles[]": mediaTitle,
      "media_descriptions[]": mediaDescription,
      "media_links[]": mediaLinks,
      "skills[]": skills,
    });
    if (images.isNotEmpty) {
      for (int i = 0; i < images.length; i++) {
        File image = images[i];
        formData.files.add(MapEntry(
          'images[$i]',
          await MultipartFile.fromFile(image.path,
              filename: image.path.split('/').last),
        ));
      }
    }
    try {
      Response response = await dio.post(
        path,
        data: formData,
        options: Options(
          validateStatus: (status) => status! < 599,
          headers: {'Content-Type': 'multipart/form-data'},
        ),
      );
      Map<String, dynamic> responseData = response.data;
      log(responseData.toString(), name: 'ressssssssssssssssssss');
      if (responseData.containsKey('success')) {
        String successMessage = responseData['success'];
        log(successMessage, name: 'save education info success');
        return successMessage;
      } else if (responseData.containsKey('error')) {
        // log(errorMessage.toString(), name: 'save education info MB error');
        Map<String, dynamic> errors = responseData['error'];
        String first = errors.keys.first;
        if (errors[first] is List && (errors[first] as List).isNotEmpty) {
          String errorMessage = errors[first][0].toString();
          log(errorMessage, name: 'save education info MB error');
          return errorMessage;
        }
        // return 'Each image must not exceed 2MB in size.';
      }
    } on DioException catch (e) {
      if (e.response?.statusCode == 500) {
        log('Server error: ${e.message}', name: 'save education info error');
        throw Exception('Server error occurred');
      } else {
        log('error: statuscode:${e.response?.statusCode}',
            name: 'save education info error');
      }
    } catch (e) {
      // Handle other exceptions
      log('error :${e.toString()}', name: 'save education info error');
      throw Exception('error occurred ${e.toString()}');
    }
    return null;
  }

  Future<String?> deleteEducationInfo({required String eduID}) async {
    String path = Apis().aimUrl + Apis().deleteEducations;
    try {
      Response response = await dio.post(
        path,
        data: {"education_id": eduID},
        options: Options(
          validateStatus: (status) => status! < 599,
        ),
      );
      Map<String, dynamic> responseData = response.data;

      if (responseData.containsKey('success')) {
        String successMessage = responseData['success'];
        log(successMessage, name: 'delete education section success');
        return successMessage;
      } else if (responseData.containsKey('error')) {
        if (responseData['error'] is Map) {
          Map<String, dynamic> errors = responseData['error'];
          String first = errors.keys.first;
          if (errors[first] is List && (errors[first] as List).isNotEmpty) {
            String errorMessage = errors[first][0].toString();
            log(errorMessage, name: 'delete education section error');
            return errorMessage;
          }
        } else if (responseData['error'] is String) {
          String errorMessage = responseData['error'];
          return errorMessage;
        }
      }
    } on DioException catch (e) {
      if (e.response?.statusCode == 500) {
        log('Server error: ${e.message}',
            name: 'delete education section error');
        throw Exception('Server error occurred');
      } else {
        log('error: statuscode:${e.response?.statusCode}',
            name: 'delete education section error');
      }
    } catch (e) {
      // Handle other exceptions
      log('error :${e.toString()}', name: 'save education info error');
      throw Exception('error occurred ${e.toString()}');
    }
    return null;
  }
}
