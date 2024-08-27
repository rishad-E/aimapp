import 'dart:developer';
import 'dart:io';

import 'package:aimshala/utils/common/constant/api_const.dart';
import 'package:dio/dio.dart';

class UpdateProfilePhotoService {
  Dio dio = Dio();

  Future<Map<String, dynamic>?> updateProfile(
      {required String token, required File file}) async {
    String path = Apis().aimUrl + Apis().updateProfilePic;
    log('token=>${token.isNotEmpty}  file=>$file path=>$path', name: 'update profile service');
    FormData formData = FormData.fromMap({
      "user_profile": await MultipartFile.fromFile(file.path,
          filename: file.path.split('/').last),
    });
    try {
      Response response = await dio.post(
        path,
        data: formData,
        options: Options(
          validateStatus: (status) => status! < 599,
          headers: {
            'Content-Type': 'multipart/form-data',
            'Authorization': 'Bearer $token'
          },
        ),
      );
      log(response.data.toString(), name: 'update profile res');
      Map<String, dynamic> responseData = response.data;
      if (responseData.containsKey("message")) {
        return responseData;
      } else if (responseData.containsKey("error")) {
        return responseData;
      } else {
        return null;
      }
    } on DioException catch (e) {
      if (e.response?.statusCode == 500) {
        // log('Server error: ${e.message}', name: 'update profilepic error');
        throw Exception('Server error occurred');
      } else {
        log('error: statuscode:${e.response?.data}',
            name: 'update profilepic error');
      }
    } catch (e) {
      // Handle other exceptions
      throw Exception('error occurred ${e.toString()}');
    }
    return null;
  }

  Future<dynamic> deleteProfilePicService({required String token}) async {
    String path = Apis().aimUrl + Apis().deleteProfilePic;
    log('token=>${token.isNotEmpty}', name: 'remove profile pic service');
    try {
      Response response = await dio.post(
        path,
      
        options: Options(
          validateStatus: (status) => status! < 599,
          headers: {'Authorization': 'Bearer $token'},
        ),
      );
      // log(response.data.toString(), name: 'remove profilepic res');
      if (response.statusCode == 200) {
        return response.data;
      } else {
        return null;
      }
    } on DioException catch (e) {
      if (e.response?.statusCode == 500) {
        throw Exception('Server error occurred');
      } else {
        log('error: statuscode:${e.response?.data}',
            name: 'update profilepic error');
      }
    } catch (e) {
      // Handle other exceptions
      throw Exception('error occurred ${e.toString()}');
    }
    return null;
  }
}
