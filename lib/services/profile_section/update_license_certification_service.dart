import 'dart:developer';
import 'dart:io';

import 'package:aimshala/utils/common/constant/api_const.dart';
import 'package:dio/dio.dart';

class UpdateLicenseCertificationService {
  Dio dio = Dio();

  Future<String?> saveLicenseCertificationInfo({
    required String uId,
    required String name,
    required String organization,
    required String issueDate,
    required String expiryDate,
    required String credID,
    required String credURL,
    required List<File> media,
    required List<String> skills,
    required List<String> mediaTitle,
    required List<String> mediaDescription,
    required List<String> mediaLink,
  }) async {
    String path = Apis().aimUrl + Apis().saveLicense;
    log('uID=>$uId name=>$name organization=>$organization issueDate=>$issueDate expiryDate=>$expiryDate credID=>$credID credURL=>$credURL skills=>$skills media=>$media mediaTitle=>$mediaTitle mediaDesc=>$mediaDescription mediaLinks=>$mediaLink',
        name: 'license-service save');

    FormData formData = FormData.fromMap({
      "user_id": uId,
      "name": name,
      "organization": organization,
      "issue_date": issueDate,
      "expire_date": expiryDate,
      "credential_id": credID,
      "credential_url": credURL,
      "skills[]": skills,
      "media_titles[]": mediaTitle,
      "media_descriptions[]": mediaDescription,
      "media_links[]": mediaLink,
    });
    if (media.isNotEmpty) {
      for (int i = 0; i < media.length; i++) {
        File image = media[i];
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
        log(responseData.toString(), name: 'save License info');
        log(successMessage, name: 'save License info success');
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
        log('Server error: ${e.message}', name: 'save License info error');
        throw Exception('Server error occurred');
      } else {
        log('error: statuscode:${e.response?.statusCode}',
            name: 'save License info error');
      }
    } catch (e) {
      // Handle other exceptions
      log('error :${e.toString()}', name: 'save License info error');
      throw Exception('error occurred ${e.toString()}');
    }
    return null;
  }

  Future<String?> updateLicenseCertificationInfo({
    required String lcID,
    required String uId,
    required String name,
    required String organization,
    required String issueDate,
    required String expiryDate,
    required String credID,
    required String credURL,
    required List<File> media,
    required List<String> skills,
    required List<String> mediaTitle,
    required List<String> mediaDescription,
    required List<String> mediaLink,
  }) async {
    String path = Apis().aimUrl + Apis().saveLicense;
    log('lcID=>$lcID uID=>$uId name=>$name organization=>$organization issueDate=>$issueDate expiryDate=>$expiryDate credID=>$credID credURL=>$credURL skills=>$skills media=>$media mediaTitle=>$mediaTitle mediaDesc=>$mediaDescription mediaLinks=>$mediaLink',
        name: 'license-service update');

    FormData formData = FormData.fromMap({
      "license_id": lcID,
      "user_id": uId,
      "name": name,
      "organization": organization,
      "issue_date": issueDate,
      "expire_date": expiryDate,
      "credential_id": credID,
      "credential_url": credURL,
      "skills[]": skills,
      "media_titles[]": mediaTitle,
      "media_descriptions[]": mediaDescription,
      "media_links[]": mediaLink,
    });
    if (media.isNotEmpty) {
      for (int i = 0; i < media.length; i++) {
        File image = media[i];
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
        log(responseData.toString(), name: 'update License info');
        log(successMessage, name: 'update License info success');
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
        log('Server error: ${e.message}', name: 'update License info error');
        throw Exception('Server error occurred');
      } else {
        log('error: statuscode:${e.response?.statusCode}',
            name: 'update License info error');
      }
    } catch (e) {
      // Handle other exceptions
      log('error :${e.toString()}', name: 'update License info error');
      throw Exception('error occurred ${e.toString()}');
    }
    return null;
  }

  Future<String?> deleteLicenseInfo({required String licenseId}) async {
    String path = Apis().aimUrl + Apis().deleteLicenses;
    try {
      Response response = await dio.post(
        path,
        data: {"license_id": licenseId},
        options: Options(
          validateStatus: (status) => status! < 599,
        ),
      );
      Map<String, dynamic> responseData = response.data;
      if (responseData.containsKey('success')) {
        String successMessage = responseData['success'];
        log(response.data.toString(), name: 'save license info');
        return successMessage;
      } else if (responseData.containsKey('error')) {
        if (responseData['error'] is Map) {
          Map<String, dynamic> errors = responseData['error'];
          String first = errors.keys.first;
          if (errors[first] is List && (errors[first] as List).isNotEmpty) {
            String errorMessage = errors[first][0].toString();
            log(errorMessage, name: 'delete licen section error');
            return errorMessage;
          }
        } else if (responseData['error'] is String) {
          String errorMessage = responseData['error'];
          return errorMessage;
        }
      }
    } on DioException catch (e) {
      if (e.response?.statusCode == 500) {
        log('Server error: ${e.message}', name: 'delete licen info error');
        throw Exception('Server error occurred');
      } else {
        log('error: statuscode:${e.response?.statusCode}',
            name: 'delete licen info error');
      }
    } catch (e) {
      // Handle other exceptions
      log('error :${e.toString()}', name: 'delete licen info error');
      throw Exception('error occurred ${e.toString()}');
    }
    return null;
  }
}
