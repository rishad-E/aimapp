import 'dart:developer';
import 'dart:io';

import 'package:aimshala/utils/common/constant/api_const.dart';
import 'package:dio/dio.dart';

class UpdateHonorAwardService {
  Dio dio = Dio();

  Future<String?> saveHonorAwardInfo({
    required String uId,
    required String title,
    required String assosiated,
    required String issuer,
    required String startdate,
    required String description,
    required List<String> mediaTitle,
    required List<String> mediaDescription,
    required List<String> mediaLink,
    required List<File> media,
  }) async {
    String path = Apis().aimUrl + Apis().saveHonorAwards;
    log('uid=>$uId  title=>$title assosiated=>$assosiated issuer=>$issuer startdate=>$startdate description=>$description media=>$media mediaTitle=>$mediaTitle mediaDesc=>$mediaDescription',
        name: 'add honor-service save');
    FormData formData = FormData.fromMap({
      "user_id": uId,
      "title": title,
      "associated": assosiated,
      "issuer": issuer,
      "start_date": startdate,
      "description": description,
      "media_titles[]": mediaTitle,
      "media_descriptions[]": mediaDescription,
      "media_links[]": mediaLink,
    });
    if (media.isNotEmpty) {
      for (int i = 0; i < media.length; i++) {
        File image = media[i];
        formData.files.add(
          MapEntry(
              'images[$i]',
              await MultipartFile.fromFile(image.path,
                  filename: image.path.split('/').last)),
        );
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
        log(successMessage, name: 'save HonorAward info success');
        return successMessage;
      } else if (responseData.containsKey('error')) {
        // String errorMessage = responseData['error'];
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
        log('Server error: ${e.message}', name: 'save HonorAward info error');
        throw Exception('Server error occurred');
      } else {
        log('error: statuscode:${e.response?.statusCode}',
            name: 'save HonorAward info error');
      }
    } catch (e) {
      // Handle other exceptions
      log('error :${e.toString()}', name: 'save HonorAward info error');
      throw Exception('error occurred ${e.toString()}');
    }
    return null;
  }

  Future<String?> updateHonorAwardInfo({
    required String awardID,
    required String uId,
    required String title,
    required String assosiated,
    required String issuer,
    required String startdate,
    required String description,
    required List<String> mediaTitle,
    required List<String> mediaDescription,
    required List<String> mediaLink,
    required List<File> media,
  }) async {
    String path = Apis().aimUrl + Apis().saveHonorAwards;
    log('uid=>$uId awardID=>$awardID title=>$title assosiated=>$assosiated issuer=>$issuer startdate=>$startdate description=>$description media=>$media mediaTitle=>$mediaTitle mediaDesc=>$mediaDescription',
        name: 'add honor-service update');
    FormData formData = FormData.fromMap({
      "award_id": awardID,
      "user_id": uId,
      "title": title,
      "associated": assosiated,
      "issuer": issuer,
      "start_date": startdate,
      "description": description,
      "media_titles[]": mediaTitle,
      "media_descriptions[]": mediaDescription,
      "media_links[]": mediaLink,
    });
    if (media.isNotEmpty) {
      for (int i = 0; i < media.length; i++) {
        File image = media[i];
        formData.files.add(
          MapEntry(
              'images[$i]',
              await MultipartFile.fromFile(image.path,
                  filename: image.path.split('/').last)),
        );
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
        log(successMessage, name: 'update HonorAward info success');
        return successMessage;
      } else if (responseData.containsKey('error')) {
        // String errorMessage = responseData['error'];
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
        log('Server error: ${e.message}', name: 'update HonorAward info error');
        throw Exception('Server error occurred');
      } else {
        log('error: statuscode:${e.response?.statusCode}',
            name: 'update HonorAward info error');
      }
    } catch (e) {
      // Handle other exceptions
      log('error :${e.toString()}', name: 'update HonorAward info error');
      throw Exception('error occurred ${e.toString()}');
    }
    return null;
  }

  Future<String?> deleteAwardInfo({required String awardID}) async {
    String path = Apis().aimUrl + Apis().deleteAwards;

    try {
      Response response = await dio.post(
        path,
        data: {"award_id": awardID},
        options: Options(
          validateStatus: (status) => status! < 599,
        ),
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
            log(errorMessage, name: 'delete award section error');
            return errorMessage;
          }
        } else if (responseData['error'] is String) {
          String errorMessage = responseData['error'];
          return errorMessage;
        }
      }
    } on DioException catch (e) {
      if (e.response?.statusCode == 500) {
        log('Server error: ${e.message}', name: 'delete HonorAward info error');
        throw Exception('Server error occurred');
      } else {
        log('error: statuscode:${e.response?.statusCode}',
            name: 'delete HonorAward info error');
      }
    } catch (e) {
      // Handle other exceptions
      log('error :${e.toString()}', name: 'delete HonorAward info error');
      throw Exception('error occurred ${e.toString()}');
    }
    return null;
  }
}
