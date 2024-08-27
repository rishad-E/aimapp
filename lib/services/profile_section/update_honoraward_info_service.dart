import 'dart:developer';
import 'dart:io';

import 'package:aimshala/utils/common/constant/api_const.dart';
import 'package:dio/dio.dart';

class UpdateHonorAwardService {
  Dio dio = Dio();

  Future<String?> saveHonorAwardInfo({
    required String token,
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
    log('  title=>$title assosiated=>$assosiated issuer=>$issuer startdate=>$startdate description=>$description media=>$media mediaTitle=>$mediaTitle mediaDesc=>$mediaDescription',
        name: 'add honor-service save');
    FormData formData = FormData.fromMap({
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
          headers: {
            'Content-Type': 'multipart/form-data',
            'Authorization': 'Bearer $token',
          },
        ),
      );
      Map<String, dynamic> responseData = response.data;
      log(responseData.toString(), name: 'awaaaaaaaaaaard');
      if (responseData.containsKey('success')) {
        String successMessage = responseData['success'];
        return successMessage;
      } else if (responseData.containsKey('error')) {
        // String errorMessage = responseData['error'];
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
        throw Exception('Server error occurred');
      } else {
        log('error: statuscode:${e.response?.statusCode}',
            name: 'save HonorAward info error');
      }
    } catch (e) {
      // Handle other exceptions
      throw Exception('error occurred ${e.toString()}');
    }
    return null;
  }

  Future<String?> updateHonorAwardInfo({
    required String awardID,
    required String token,
    required String title,
    required String assosiated,
    required String issuer,
    required String startdate,
    required String description,
    required List<String> mediaTitle,
    required List<String> mediaDescription,
    required List<String> mediaLink,
    required List<File> media,
    required List<String> mediaUrl,
  }) async {
    String path = Apis().aimUrl + Apis().saveHonorAwards;
    log(' awardID=>$awardID title=>$title assosiated=>$assosiated issuer=>$issuer startdate=>$startdate description=>$description media=>$media mediaTitle=>$mediaTitle mediaDesc=>$mediaDescription  mediaUrl=>$mediaUrl',
        name: 'add honor-service update');
    FormData formData = FormData.fromMap({
      "award_id": awardID,
   
      "title": title,
      "associated": assosiated,
      "issuer": issuer,
      "start_date": startdate,
      "description": description,
      "media_titles[]": mediaTitle.isEmpty ? null : mediaTitle,
      "media_descriptions[]":
          mediaDescription.isEmpty ? null : mediaDescription,
      "media_links[]": mediaLink.isEmpty ? null : mediaLink,
    });
    int index = 0;
    if (mediaUrl.isNotEmpty) {
      for (String url in mediaUrl) {
        formData.fields.add(MapEntry('images[$index]', url));
        index++;
      }
    }
    // Add Images
    if (media.isNotEmpty) {
      for (File image in media) {
        formData.files.add(MapEntry(
          'images[$index]',
          await MultipartFile.fromFile(image.path,
              filename: image.path.split('/').last),
        ));
        index++;
      }
    }

    try {
      Response response = await dio.post(
        path,
        data: formData,
        options: Options(
          validateStatus: (status) => status! < 599,
          headers: {'Content-Type': 'multipart/form-data','Authorization': 'Bearer $token',},
        ),
      );
      log(response.data.toString());
      Map<String, dynamic> responseData = response.data;
      if (responseData.containsKey('success')) {
        String successMessage = responseData['success'];
        return successMessage;
      } else if (responseData.containsKey('error')) {
        // String errorMessage = responseData['error'];
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
        throw Exception('Server error occurred');
      } else {
        log('error: statuscode:${e.response?.statusCode}',
            name: 'update HonorAward info error');
      }
    } catch (e) {
      // Handle other exceptions
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
            return errorMessage;
          }
        } else if (responseData['error'] is String) {
          String errorMessage = responseData['error'];
          return errorMessage;
        }
      }
    } on DioException catch (e) {
      if (e.response?.statusCode == 500) {
        throw Exception('Server error occurred');
      } else {
        log('error: statuscode:${e.response?.statusCode}',
            name: 'delete HonorAward info error');
      }
    } catch (e) {
      // Handle other exceptions
      throw Exception('error occurred ${e.toString()}');
    }
    return null;
  }
}
