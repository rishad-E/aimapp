import 'dart:developer';
import 'dart:io';

import 'package:aimshala/utils/common/constant/api_const.dart';
import 'package:dio/dio.dart';

class UpdateExperienceInfoService {
  Dio dio = Dio();

  Future<String?> saveExperienceInfo({
    required String token,
    required String title,
    required String employee,
    required String company,
    required String location,
    required String locationtype,
    required String currentlyWorking,
    required String startDate,
    required String endDate,
    required String description,
    required String profile,
    required List<String> mediaTitle,
    required List<String> mediaDescription,
    required List<String> mediaLink,
    required List<File> imagesEX,
    required List<String> skillsEX,
  }) async {
    String path = Apis().aimUrl + Apis().saveExperience;
    log('title:$title=> employee:$employee=> company:$company=> location:$location=> locationtype:$locationtype=> startDate:$startDate=> endDate:$endDate=> description:$description=> profile:$profile=> skill:$skillsEX=> media:$imagesEX media:$imagesEX mediaTitle:$mediaTitle  mediaDesc:$mediaDescription mediaLnk=>$mediaLink',
        name: 'add-EX service save');

    FormData formData = FormData.fromMap({
      "title": title,
      "employment_type": employee,
      "company_name": company,
      "location": location,
      "location_type": locationtype,
      "currently_working": currentlyWorking,
      "start_date": startDate,
      "end_date": endDate,
      "description": description,
      "profile": profile,
      "media_titles[]": mediaTitle,
      "media_descriptions[]": mediaDescription,
      "media_links[]": mediaLink,
      "skills[]": skillsEX,
    });
    if (imagesEX.isNotEmpty) {
      for (int i = 0; i < imagesEX.length; i++) {
        File image = imagesEX[i];
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
          headers: {
            'Content-Type': 'multipart/form-data',
            'Authorization': 'Bearer $token',
          },
        ),
      );
      Map<String, dynamic> responseData = response.data;
      if (responseData.containsKey('success')) {
        String successMessage = responseData['success'];
        // log(successMessage, name: 'save education info success');

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
            name: 'save experience info error');
      }
    } catch (e) {
      // Handle other exceptions
      throw Exception('error occurred ${e.toString()}');
    }
    return null;
  }

  Future<String?> updateExperienceInfo({
    required String exID,
    required String token,
    required String title,
    required String employee,
    required String company,
    required String location,
    required String locationtype,
    required String currentlyWorking,
    required String startDate,
    required String endDate,
    required String description,
    required String profile,
    required List<String> mediaTitle,
    required List<String> mediaDescription,
    required List<String> mediaLink,
    required List<File> imagesEX,
    required List<String> skillsEX,
    required List<String> mediaUrl,
  }) async {
    String path = Apis().aimUrl + Apis().saveExperience;
    log('exID=>$exID title:$title=> employee:$employee=> company:$company=> location:$location=> locationtype:$locationtype=> startDate:$startDate=> endDate:$endDate => description:$description=> profile:$profile=> skill:$skillsEX=> media:$imagesEX mediaTitle:$mediaTitle  mediaDesc:$mediaDescription currenly=>$currentlyWorking mediaLnk=>$mediaLink',
        name: 'add-EX service update');

    FormData formData = FormData.fromMap({
      "experience_id": exID,
      "title": title,
      "employment_type": employee,
      "company_name": company,
      "location": location,
      "location_type": locationtype,
      "currently_working": currentlyWorking,
      "start_date": startDate,
      "end_date": endDate,
      "description": description,
      "profile": profile,
      "media_titles[]": mediaTitle.isEmpty ? null : mediaTitle,
      "media_descriptions[]":
          mediaDescription.isEmpty ? null : mediaDescription,
      "media_links[]": mediaLink.isEmpty ? null : mediaLink,
      "skills[]": skillsEX.isEmpty ? null : skillsEX,
    });

    int index = 0;
    if (mediaUrl.isNotEmpty) {
      for (String url in mediaUrl) {
        formData.fields.add(MapEntry('images[$index]', url));
        index++;
      }
    }
    // Add Images
    if (imagesEX.isNotEmpty) {
      for (File image in imagesEX) {
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
          headers: {
            'Content-Type': 'multipart/form-data',
            'Authorization': 'Bearer $token',
          },
        ),
      );
      Map<String, dynamic> responseData = response.data;
      if (responseData.containsKey('success')) {
        String successMessage = responseData['success'];
        // log(successMessage, name: 'save education info success');

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
            name: 'save experience info error');
      }
    } catch (e) {
      // Handle other exceptions
      throw Exception('error occurred ${e.toString()}');
    }
    return null;
  }

  Future<String?> deleteExperienceInfo({required String exID}) async {
    String path = Apis().aimUrl + Apis().deleteExperiences;
    try {
      Response response = await dio.post(
        path,
        data: {"experience_id": exID},
        options: Options(
          validateStatus: (status) => status! < 599,
        ),
      );
      Map<String, dynamic> responseData = response.data;
      if (responseData.containsKey('success')) {
        String successMessage = responseData['success'];
        // log(successMessage, name: 'save education info success');

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
            name: 'save experience info error');
      }
    } catch (e) {
      // Handle other exceptions
      throw Exception('error occurred ${e.toString()}');
    }
    return null;
  }
}
