import 'dart:developer';
import 'dart:io';

import 'package:aimshala/utils/common/constant/api_const.dart';
import 'package:dio/dio.dart';

class UpdateHonorAwardService {
  Dio dio = Dio();

  Future<String?> saveHonorAwardInfo({
    required String uId,
    required String titile,
    required String assosiated,
    required String issuer,
    required String startdate,
    required String description,
    required List<File> media,
  }) async {
    String path = Apis().aimUrl + Apis().saveHonorAwards;

    FormData formData = FormData.fromMap({
      "user_id": uId,
      "title": titile,
      "associated": assosiated,
      "issuer": issuer,
      "start_date": startdate,
      "description": description,
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
        log(response.data.toString(), name: 'save HonorAward info MB error');

        return 'Each image must not exceed 2MB in size.';
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
}
