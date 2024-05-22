import 'dart:developer';

import 'package:aimshala/utils/common/constant/api_const.dart';
import 'package:dio/dio.dart';

class UpdatePublicationService {
  Dio dio = Dio();

  Future<String?> savePublicationService(
      {required String uId,
      required String title,
      required String publication,
      required String pubDate,
      required String pubURL,
      required String pubDescription}) async {
    String path = Apis().aimUrl + Apis().savePublication;
    log('uid=>$uId  title=>$title publication=>$publication  publicationDate=>$pubDate publicationURL=>$pubURL publicationDescri=>$pubDescription',
        name: 'publication-service save');
    try {
      Response response = await dio.post(path,
          data: {
            "user_id": uId,
            "title": title,
            "publication": publication,
            "publication_date": pubDate,
            "publication_url": pubURL,
            "description": pubDescription,
          },
          options: Options(
            validateStatus: (status) => status! < 599,
          ));
      Map<String, dynamic> responseData = response.data;

      if (responseData.containsKey('success')) {
        String successMessage = responseData['success'];
        log(successMessage, name: 'save publication success');
        return successMessage;
      } else if (responseData.containsKey('error')) {
        // String errorMessage = responseData['error'];
        final errorData = responseData['error'] as Map<String, dynamic>;
        final List<dynamic> errorMessages = errorData.values.first;
        final errorMessage = errorMessages.join('\n');
        log(errorMessage.toString(), name: 'save publication error data');
          return errorMessage;
        // return 'Each image must not exceed 2MB in size.';
      }
    } on DioException catch (e) {
      if (e.response?.statusCode == 500) {
        log('Server error: ${e.message}', name: 'save publication error');
        throw Exception('Server error occurred');
      } else {
        log('error:${e.response?.data}', name: 'save publication error');
      }
    } catch (e) {
      // Handle other exceptions
      log('error :${e.toString()}', name: 'save publication error');
      throw Exception('error occurred ${e.toString()}');
    }
    return null;
  }

  Future<String?> updatePublicationInfo({
    required String pbID,
    required String uId,
    required String title,
    required String publication,
    required String pubDate,
    required String pubURL,
    required String pubDescription,
  }) async {
    String path = Apis().aimUrl + Apis().savePublication;
    log('pbID=>$pbID uid=>$uId  title=>$title publication=>$publication  publicationDate=>$pubDate publicationURL=>$pubURL publicationDescri=>$pubDescription',
        name: 'publication-service update');
    try {
      Response response = await dio.post(path,
          data: {
            "publication_id":pbID,
            "user_id": uId,
            "title": title,
            "publication": publication,
            "publication_date": pubDate,
            "publication_url": pubURL,
            "description": pubDescription,
          },
          options: Options(
            validateStatus: (status) => status! < 599,
          ));
      Map<String, dynamic> responseData = response.data;

      if (responseData.containsKey('success')) {
        String successMessage = responseData['success'];
        log(successMessage, name: 'update publication success');
        return successMessage;
      } else if (responseData.containsKey('error')) {
        // String errorMessage = responseData['error'];
        final errorData = responseData['error'] as Map<String, dynamic>;
        final List<dynamic> errorMessages = errorData.values.first;
        final errorMessage = errorMessages.join('\n');
        log(errorMessage.toString(), name: 'update publication error data');
          return errorMessage;
        // return 'Each image must not exceed 2MB in size.';
      }
    } on DioException catch (e) {
      if (e.response?.statusCode == 500) {
        log('Server error: ${e.message}', name: 'update publication error');
        throw Exception('Server error occurred');
      } else {
        log('error:${e.response?.data}', name: 'update publication error');
      }
    } catch (e) {
      // Handle other exceptions
      log('error :${e.toString()}', name: 'update publication error');
      throw Exception('error occurred ${e.toString()}');
    }
    return null;
  }
}
