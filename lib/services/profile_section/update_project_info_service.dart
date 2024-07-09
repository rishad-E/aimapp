import 'dart:developer';
import 'dart:io';

import 'package:aimshala/utils/common/constant/api_const.dart';
import 'package:dio/dio.dart';

class UpdateProjectInfoService {
  Dio dio = Dio();
  Future<String?> saveProjectInfo({
    required String uId,
    required String proName,
    required String startDate,
    required String endDate,
    required String description,
    required String assosiated,
    required String currentlyWorking,
    required List<String> skills,
    required List<File> medias,
    required List<String> mediaTitle,
    required List<String> mediaDescription,
    required List<String> mediaLink,
  }) async {
    String path = Apis().aimUrl + Apis().saveProject;
    log('uid=>$uId projectName=>$proName startdate=>$startDate endDate=>$endDate description=>$description assosiated=>$assosiated curretly=>$currentlyWorking skills=>$skills media=>$medias mediaTitle=>$mediaTitle mediaDesc=>$mediaDescription mediaLinks=>$mediaLink',
        name: 'project-service save');
    FormData formData = FormData.fromMap({
      "user_id": uId,
      "title": proName,
      "start_date": startDate,
      "end_date": endDate,
      "description": description,
      "associated": assosiated,
      "currently_working": currentlyWorking,
      "skills[]": skills,
      "media_titles[]": mediaTitle,
      "media_descriptions[]": mediaDescription,
      "media_links[]": mediaLink,
    });
    if (medias.isNotEmpty) {
      for (int i = 0; i < medias.length; i++) {
        File media = medias[i];
        formData.files.add(MapEntry(
          'images[$i]',
          await MultipartFile.fromFile(media.path,
              filename: media.path.split('/').last),
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
        
        return successMessage;
      } else if (responseData.containsKey('error')) {
        final errorData = responseData['error'] as Map<String, dynamic>;
        final List<dynamic> errorMessages = errorData.values.first;
        final errorMessage = errorMessages.join('\n');
        return errorMessage;
      }
    } on DioException catch (e) {
      if (e.response?.statusCode == 500) {
        throw Exception('Server error occurred');
      } else {
        log('error: statuscode:${e.response?.statusCode}',
            name: 'save project info error');
      }
    } catch (e) {
      // Handle other exceptions
      throw Exception('error occurred ${e.toString()}');
    }
    return null;
  }

  Future<String?> updateProjectInfo({
    required String prID,
    required String uId,
    required String proName,
    required String startDate,
    required String endDate,
    required String description,
    required String assosiated,
    required String currentlyWorking,
    required List<String> skills,
    required List<File> medias,
    required List<String> mediaTitle,
    required List<String> mediaDescription,
    required List<String> mediaLink,
  }) async {
    String path = Apis().aimUrl + Apis().saveProject;
    log('prID=>$prID uid=>$uId projectName=>$proName startdate=>$startDate endDate=>$endDate description=>$description assosiated=>$assosiated skills=>$skills media=>$medias mediaTitle=>$mediaTitle mediaDesc=>$mediaDescription currenty=>$currentlyWorking mediaLinks=>$mediaLink',
        name: 'project-service update');

    FormData formData = FormData.fromMap({
      "project_id": prID,
      "user_id": uId,
      "title": proName,
      "start_date": startDate,
      "end_date": endDate,
      "description": description,
      "associated": assosiated,
      "currently_working": currentlyWorking,
      "skills[]": skills.isEmpty ? null : skills,
      "media_titles[]": mediaTitle.isEmpty ? null : mediaTitle,
      "media_descriptions[]":
          mediaDescription.isEmpty ? null : mediaDescription,
      "media_links[]": mediaLink.isEmpty ? null : mediaLink,
    });
    if (medias.isNotEmpty) {
      for (int i = 0; i < medias.length; i++) {
        File media = medias[i];
        formData.files.add(MapEntry(
          'images[$i]',
          await MultipartFile.fromFile(media.path,
              filename: media.path.split('/').last),
        ));
      }
    } else {
      formData.fields.add(const MapEntry('images[]', ''));
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
        return successMessage;
      } else if (responseData.containsKey('error')) {
        final errorData = responseData['error'] as Map<String, dynamic>;
        final List<dynamic> errorMessages = errorData.values.first;
        final errorMessage = errorMessages.join('\n');
        return errorMessage;
      }
    } on DioException catch (e) {
      if (e.response?.statusCode == 500) {
       
        throw Exception('Server error occurred');
      } else {
        log('error: statuscode:${e.response?.statusCode}',
            name: 'update project info error');
      }
    } catch (e) {
      // Handle other exceptions
      // log('error :${e.toString()}', name: 'update project info error catch');
      throw Exception('error occurred ${e.toString()}');
    }
    return null;
  }

  Future<String?> deleteProjectInfo({required String prID}) async {
    String path = Apis().aimUrl + Apis().deleteProjects;
    try {
      Response response = await dio.post(
        path,
        data: {"project_id": prID},
        options: Options(validateStatus: (status) => status! < 599),
      );
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
        // log('Server error: ${e.message}', name: 'delete project error');
        throw Exception('Server error occurred');
      } else {
        log('error:${e.response?.data}', name: 'delete project error');
      }
    } catch (e) {
      // Handle other exceptions
      // log('error :${e.toString()}', name: 'delete project error');
      throw Exception('error occurred ${e.toString()}');
    }
    return null;
  }
}
