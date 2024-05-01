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
        name: 'language-service');

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
        log(successMessage, name: 'save language success');
        return successMessage;
      } else if (responseData.containsKey('error')) {
        final errorData = responseData['error'] as Map<String, dynamic>;
        final List<dynamic> errorMessages = errorData.values.first;
        final errorMessage = errorMessages.join('\n');
        log(errorMessage.toString(), name: 'save language error data');
        return errorMessage;
      }
    } on DioException catch (e) {
      if (e.response?.statusCode == 500) {
        log('Server error: ${e.message}', name: 'save language error');
        throw Exception('Server error occurred');
      } else {
        log('error:${e.response?.data}', name: 'save language error');
      }
    } catch (e) {
      // Handle other exceptions
      log('error :${e.toString()}', name: 'save language error');
      throw Exception('error occurred ${e.toString()}');
    }
    return null;
  }
}
