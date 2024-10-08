import 'dart:developer';

import 'package:aimshala/utils/common/constant/api_const.dart';
import 'package:dio/dio.dart';

class UpdatePublicationService {
  Dio dio = Dio();

  Future<String?> savePublicationService(
      {required String token,
      required String title,
      required String publication,
      required String pubDate,
      required String pubURL,
      required String pubDescription}) async {
    String path = Apis().aimUrl + Apis().savePublication;
    log('title=>$title publication=>$publication  publicationDate=>$pubDate publicationURL=>$pubURL publicationDescri=>$pubDescription',
        name: 'publication-service save');
    try {
      Response response = await dio.post(
        path,
        data: {
          "title": title,
          "publication": publication,
          "publication_date": pubDate,
          "publication_url": pubURL,
          "description": pubDescription,
        },
        options: Options(
          validateStatus: (status) => status! < 599,
          headers: {'Authorization': 'Bearer $token'},
        ),
      );
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
        // return 'Each image must not exceed 2MB in size.';
      }
    } on DioException catch (e) {
      if (e.response?.statusCode == 500) {
        // log('Server error: ${e.message}', name: 'save publication error');
        throw Exception('Server error occurred');
      } else {
        log('error:${e.response?.data}', name: 'save publication error');
      }
    } catch (e) {
      // Handle other exceptions
      // log('error :${e.toString()}', name: 'save publication error');
      throw Exception('error occurred ${e.toString()}');
    }
    return null;
  }

  Future<String?> updatePublicationInfo({
    required String pbID,
    required String token,
    required String title,
    required String publication,
    required String pubDate,
    required String pubURL,
    required String pubDescription,
  }) async {
    String path = Apis().aimUrl + Apis().savePublication;
    log('pbID=>$pbID  title=>$title publication=>$publication  publicationDate=>$pubDate publicationURL=>$pubURL publicationDescri=>$pubDescription',
        name: 'publication-service update');
    try {
      Response response = await dio.post(
        path,
        data: {
          "publication_id": pbID,
          "title": title,
          "publication": publication,
          "publication_date": pubDate,
          "publication_url": pubURL,
          "description": pubDescription,
        },
        options: Options(
          validateStatus: (status) => status! < 599,
          headers: {'Authorization': 'Bearer $token'},
        ),
      );
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
        // return 'Each image must not exceed 2MB in size.';
      }
    } on DioException catch (e) {
      if (e.response?.statusCode == 500) {
        // log('Server error: ${e.message}', name: 'update publication error');
        throw Exception('Server error occurred');
      } else {
        log('error:${e.response?.data}', name: 'update publication error');
      }
    } catch (e) {
      // Handle other exceptions
      // log('error :${e.toString()}', name: 'update publication error');
      throw Exception('error occurred ${e.toString()}');
    }
    return null;
  }

  Future<String?> deletePublicationInfo({required String pbID}) async {
    String path = Apis().aimUrl + Apis().deletePublications;
    try {
      Response response = await dio.post(path,
          data: {"publication_id": pbID},
          options: Options(
            validateStatus: (status) => status! < 599,
          ));
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
        // log('Server error: ${e.message}', name: 'delete publication error');
        throw Exception('Server error occurred');
      } else {
        log('error:${e.response?.data}', name: 'delete publication error');
      }
    } catch (e) {
      // Handle other exceptions
      // log('error :${e.toString()}', name: 'delete publication error');
      throw Exception('error occurred ${e.toString()}');
    }
    return null;
  }
}
