import 'dart:developer';
import 'dart:io';

import 'package:aimshala/utils/common/constant/api_const.dart';
import 'package:dio/dio.dart';

class UpdateEducationInfoService {
  Dio dio = Dio();

  Future<String?> updateEducationInfo({
    required String uId,
    required String school,
    required String degree,
    required String studyfield,
    required String startDate,
    required String endDate,
    required String grade,
    required String activities,
    required String description,
    required List<File> images,
    required List<String> skills,
  }) async {
    String path = Apis().aimUrl + Apis().saveEducation;

    log('uid:$uId school: $school degree:$degree studyfiled: $studyfield start: $startDate end: $endDate grade: $grade activities: $activities description: $description skills:$skills media:$images',
        name: 'add-education');
    // log(path, name: 'path');
    FormData formData = FormData.fromMap({
      "user_id": uId,
      "school": school,
      "degree":degree,
      "study_field": studyfield,
      "start_date": startDate,
      "end_date": endDate,
      "grade": grade,
      "activities": activities,
      "description": description,
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
}




  // data: {
            // "user_id": uId,
            // "school": school,
            // "degree": degree,
            // "study_field": studyfield,
            // "start_date": startDate,
            // "end_date": endDate,
            // "grade": grade,
            // "activities": activities,
            // "description": description,
            // "images": image,
            // "skills": skills,
          // },






  //          FormData formData = FormData.fromMap({
  //     "user_id": uId,
  //     "school": school,
  //     "degree": degree,
  //     "study_field": studyfield,
  //     "start_date": startDate,
  //     "end_date": endDate,
  //     "grade": grade,
  //     "activities": activities,
  //     "description": description,
  //     "skills[]": skills,
  //   });
  //   for ( var item in images) {
  //     formData.files.addAll([MapEntry("images[]", await MultipartFile.fromFile(item.path,filename: item.path.split('/').last))]);
  //   }
  //   try {
  //     Response response = await dio.post(path,
  //         data: formData,
  //         options: Options(
  //           validateStatus: (status) => status! < 599,
  //           headers: {'Content-Type': 'multipart/form-data'},
  //         ));

  //     log(response.data.toString(), name: 'save education info');
  //   } on DioException catch (e) {
  //     if (e.response?.statusCode == 500) {
  //       // Handle status code 500 here
  //       log('Server error: ${e.message}', name: 'save education info error');
  //       // You can throw a custom exception or return an empty list as needed
  //       throw Exception('Server error occurred');
  //     } else {
  //       log('error: statuscode:${e.response?.statusCode}',
  //           name: 'save education info error');
  //     }
  //   } catch (e) {
  //     // Handle other exceptions
  //     log('error :${e.toString()}', name: 'save education info error');
  //     throw Exception('error occurred ${e.toString()}');
  //   }
  //   // return null;
  // }