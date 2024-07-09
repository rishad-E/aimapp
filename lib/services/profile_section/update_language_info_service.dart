import 'dart:developer';

import 'package:aimshala/utils/common/constant/api_const.dart';
import 'package:dio/dio.dart';

class UpdateLanguageInfoService {
  Dio dio = Dio();

  Future<String?> saveLanguageInfo(
      {required String uId,
      required String language,
      required String proficiency}) async {
    String path = Apis().aimUrl + Apis().saveLanguage;
    log('ID=>$uId language=>$language proficiency=>$proficiency',
        name: 'language-service save');
    try {
      Response response = await dio.post(path,
          data: {
            "user_id": uId,
            "language": language,
            "proficiency": proficiency,
          },
          options: Options(
            validateStatus: (status) => status! < 599,
          ));
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
        log('error:${e.response?.data}', name: 'save language error');
      }
    } catch (e) {
      // Handle other exceptions
      throw Exception('error occurred ${e.toString()}');
    }
    return null;
  }

  Future<String?> updateLanguageInfo({
    required String languageID,
    required String uId,
    required String language,
    required String proficiency,
  }) async {
    String path = Apis().aimUrl + Apis().saveLanguage;
    log('languageID=>$languageID  ID=>$uId language=>$language proficiency=>$proficiency',
        name: 'language-service update');
    try {
      Response response = await dio.post(path,
          data: {
            "language_id": languageID,
            "user_id": uId,
            "language": language,
            "proficiency": proficiency,
          },
          options: Options(
            validateStatus: (status) => status! < 599,
          ));
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
        log('error:${e.response?.data}', name: 'update language error');
      }
    } catch (e) {
      // Handle other exceptions
      throw Exception('error occurred ${e.toString()}');
    }
    return null;
  }

  Future<String?> deleteLanguageInfo({required String languageID}) async {
    String path = Apis().aimUrl + Apis().deleteLanguages;
    try {
      Response response = await dio.post(
        path,
        data: {"language_id": languageID},
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
            name: 'delete language info error');
      }
    } catch (e) {
      // Handle other exceptions
      throw Exception('error occurred ${e.toString()}');
    }
    return null;
  }
}
