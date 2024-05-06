import 'dart:developer';
import 'dart:io';

import 'package:aimshala/utils/common/constant/api_const.dart';
import 'package:dio/dio.dart';

class UpdateProjectInfoService {
  Dio dio = Dio();
  Future<String?> saveProjectInfo(
      {required String uId,
      required String proName,
      required String startDate,
      required String endDate,
      required String description,
      required String assosiated,
      required List<String> skills,
      required List<File> medias}) async {
    String path = Apis().aimUrl + Apis().saveProject;
    log('uid=>$uId projectName=>$proName startdate=>$startDate endDate=>$endDate description=>$description assosiated=>$assosiated skills=>$skills media=>$medias',
        name: 'project-service');
    FormData formData = FormData.fromMap({
      "user_id": uId,
      "title": proName,
      "start_date": startDate,
      "end_date": endDate,
      "description": description,
      "associated": assosiated,
      "skills[]": skills,
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
      // log(responseData.toString(), name: 'save project info');
      if (responseData.containsKey('success')) {
        String successMessage = responseData['success'];
        log(successMessage, name: 'save project info success');
        return successMessage;
      } else if (responseData.containsKey('error')) {
        final errorData = responseData['error'] as Map<String, dynamic>;
        final List<dynamic> errorMessages = errorData.values.first;
        final errorMessage = errorMessages.join('\n');
        log(errorMessage.toString(), name: 'save publication error data');
        return errorMessage;
      }
    } on DioException catch (e) {
      if (e.response?.statusCode == 500) {
        log('Server error: ${e.message}', name: 'save project info error 500');
        throw Exception('Server error occurred');
      } else {
        log('error: statuscode:${e.response?.statusCode}',
            name: 'save project info error');
      }
    } catch (e) {
      // Handle other exceptions
      log('error :${e.toString()}', name: 'save project info error catch');
      throw Exception('error occurred ${e.toString()}');
    }
    return null;
  }
}
