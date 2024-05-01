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
  }) async {
    String path = Apis().aimUrl + Apis().saveLicense;
    log('name=>$name organization=>$organization issueDate=>$issueDate expiryDate=>$expiryDate credID=>$credID credURL=>$credURL skills=>$skills media=>$media uID=>$uId',
        name: 'license-service');

    FormData formData = FormData.fromMap({
      "user_id": uId,
      "name": name,
      "organization": organization,
      "issue_date": issueDate,
      "expire_date": expiryDate,
      "credential_id": credID,
      "credential_url": credURL,
      "skills[]": skills,
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
        log(response.data.toString(), name: 'save License info MB error');

        return 'Each image must not exceed 2MB in size.';
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
}
