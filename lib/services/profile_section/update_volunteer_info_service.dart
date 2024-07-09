import 'dart:developer';
import 'dart:io';

import 'package:aimshala/utils/common/constant/api_const.dart';
import 'package:dio/dio.dart';

class UpdateVolunteerInfoService {
  Dio dio = Dio();
  Future<String?> saveVolunteerInfo({
    required String uId,
    required String organization,
    required String volRole,
    required String volCause,
    required String startDate,
    required String endDate,
    required String currentlyWorking,
    required String description,
    required List<File> media,
    required List<String> mediaDesc,
    required List<String> mediaTitle,
    required List<String> mediaLink,
  }) async {
    String path = Apis().aimUrl + Apis().saveVolunteer;
    log('ID=>$uId organization=>$organization role=>$volRole cause=>$volCause startDate=>$startDate endDate=>$endDate description=>$description currently=>$currentlyWorking media=>$media mediaTitle=>$mediaTitle  mediaDesc=>$mediaDesc mediaLinks=>$mediaLink',
        name: 'volunteer-service save');
    FormData formData = FormData.fromMap({
      "user_id": uId,
      "organization": organization,
      "role": volRole,
      "cause": volCause,
      "start_date": startDate,
      "end_date": endDate,
      "currently_working": currentlyWorking,
      "description": description,
      "media_titles[]": mediaTitle,
      "media_descriptions[]": mediaDesc,
      "media_links[]": mediaLink,
    });
    if (media.isNotEmpty) {
      for (var i = 0; i < media.length; i++) {
        File image = media[i];
        formData.files.add(MapEntry(
          'images[$i]',
          await MultipartFile.fromFile(image.path,
              filename: image.path.split('/').join()),
        ));
      }
    }
    try {
      Response response = await dio.post(path,
          data: formData,
          options: Options(
            validateStatus: (status) => status! < 599,
          ));
      Map<String, dynamic> responseData = response.data;

      if (responseData.containsKey('success')) {
        String successMessage = responseData['success'];
        return successMessage;
      } else if (responseData.containsKey('error')) {
        // String errorMessage = responseData['error'];
        final errorData = responseData['error'] as Map<String, dynamic>;
        final List<dynamic> errorMessages = errorData.values.first;
        final errorMessage = errorMessages.join('\n');
        return errorMessage;
      }
    } on DioException catch (e) {
      if (e.response?.statusCode == 500) {
        throw Exception('Server error occurred');
      } else {
        log('error:${e.response?.data}', name: 'save volunteer error');
      }
    } catch (e) {
      // Handle other exceptions
      throw Exception('error occurred ${e.toString()}');
    }
    return null;
  }

  Future<String?> updateVolunteerInfo({
    required String vtID,
    required String uId,
    required String organization,
    required String volRole,
    required String volCause,
    required String startDate,
    required String endDate,
    required String currentlyWorking,
    required String description,
    required List<File> media,
    required List<String> mediaDesc,
    required List<String> mediaTitle,
    required List<String> mediaLink,
  }) async {
    String path = Apis().aimUrl + Apis().saveVolunteer;
    log('volunteerID=>$vtID ID=>$uId organization=>$organization role=>$volRole cause=>$volCause startDate=>$startDate endDate=>$endDate description=>$description currently=>$currentlyWorking media=>$media mediaTitle=>$mediaTitle  mediaDesc=>$mediaDesc mediaLinks=>$mediaLink',
        name: 'volunteer-service update');
    FormData formData = FormData.fromMap({
      "volunteer_experience_id": vtID,
      "user_id": uId,
      "organization": organization,
      "role": volRole,
      "cause": volCause,
      "start_date": startDate,
      "end_date": endDate,
      "currently_working": currentlyWorking,
      "description": description,
      "media_titles[]": mediaTitle.isEmpty?null:mediaTitle,
      "media_descriptions[]": mediaDesc.isEmpty?null:mediaDesc,
      "media_links[]": mediaLink.isEmpty?null:mediaLink,
    });
    if (media.isNotEmpty) {
      for (var i = 0; i < media.length; i++) {
        File image = media[i];
        formData.files.add(MapEntry(
          'images[$i]',
          await MultipartFile.fromFile(image.path,
              filename: image.path.split('/').join()),
        ));
      }
    }else{
      formData.fields.add(const MapEntry('images[]', ''));
    }
    try {
      Response response = await dio.post(path,
          data: formData,
          options: Options(
            validateStatus: (status) => status! < 599,
          ));
      Map<String, dynamic> responseData = response.data;

      if (responseData.containsKey('success')) {
        String successMessage = responseData['success'];
        return successMessage;
      } else if (responseData.containsKey('error')) {
        // String errorMessage = responseData['error'];
        final errorData = responseData['error'] as Map<String, dynamic>;
        final List<dynamic> errorMessages = errorData.values.first;
        final errorMessage = errorMessages.join('\n');
        return errorMessage;
      }
    } on DioException catch (e) {
      if (e.response?.statusCode == 500) {
        // log('Server error: ${e.message}', name: 'update volunteer error');
        throw Exception('Server error occurred');
      } else {
        log('error:${e.response?.data}', name: 'update volunteer error');
      }
    } catch (e) {
      // Handle other exceptions
      // log('error :${e.toString()}', name: 'update volunteer error');
      throw Exception('error occurred ${e.toString()}');
    }
    return null;
  }

  Future<String?> deleteVolunteerExperienceInfo(
      {required String volunteerID}) async {
    String path = Apis().aimUrl + Apis().deleteVolunteerEX;
    try {
      Response response = await dio.post(path,
          data: {"volunteer_experience_id": volunteerID},
          options: Options(validateStatus: (status) => status! < 599));
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
        log('error:${e.response?.data}', name: 'delete volunteerEX error');
      }
    } catch (e) {
      // Handle other exceptions
      throw Exception('error occurred ${e.toString()}');
    }
    return null;
  }
}
