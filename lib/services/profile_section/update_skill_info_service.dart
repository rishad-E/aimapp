import 'dart:developer';
import 'package:aimshala/utils/common/constant/api_const.dart';
import 'package:dio/dio.dart';

class UpdateSkillInfoService {
  Dio dio = Dio();

  Future<List<String>> getSuggestedSkills() async {
    String path = Apis().aimUrl + Apis().suggestedSkills;
    try {
      Response response = await dio.get(
        path,
        options: Options(validateStatus: (status) => status! < 599),
      );
      if (response.statusCode == 200) {
        List<dynamic> data = response.data["suggestions"];
        List<String> res = List<String>.from(data);
        // log(res.toString());
        return res;
      }
    } on DioException catch (e) {
      if (e.response?.statusCode == 500) {
        // log('Server error: ${e.message}', name: 'suggested skills error');
        throw Exception('Server error occurred');
      } else {
        log('error:${e.response?.data}', name: 'suggested skills error');
      }
    } catch (e) {
      // Handle other exceptions
      // log('error :${e.toString()}', name: 'suggested skills error');
      throw Exception('error occurred ${e.toString()}');
    }
    return [];
  }

  Future<String?> saveAddSkillService({
    required String token,
    required String skill,
    required List<String> exIDs,
    required List<String> edIDs,
    required List<String> liIDs,
    required List<String> prIDs,
    required List<String> crsIds,
    required List<String> awIDs,
    required String permission,
  }) async {
    String path = Apis().aimUrl + Apis().saveSkill;
    log('Skill=>$skill ExperienceList=>$exIDs educationList=>$edIDs LicenseList=>$liIDs projectList=>$prIDs CourseList=>$crsIds awardList=>$awIDs permission=>$permission',
        name: 'all Ids-service save');
    try {
      Response response = await dio.post(
        path,
        data: {
          "skill": skill,
          "experience_ids": exIDs,
          "education_ids": edIDs,
          "license_ids": liIDs,
          "project_ids": prIDs,
          "course_ids": crsIds,
          "award_ids": awIDs,
          "permission": permission,
        },
        options: Options(
          validateStatus: (status) => status! < 599,
          headers: {'Authorization': 'Bearer $token'},
        ),
      );
      Map<String, dynamic> responseData = response.data;
      // log(responseData.toString(), name: 'response data-save skill');

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
        // log('Server error: ${e.message}', name: 'save skill error');
        throw Exception('Server error occurred');
      } else {
        log('error:${e.response?.data}', name: 'save skill error');
      }
    } catch (e) {
      // Handle other exceptions
      // log('error :${e.toString()}', name: 'save skill error');
      throw Exception('error occurred ${e.toString()}');
    }
    return null;
  }

  Future<String?> updateAddedSkillService({
    required String skID,
    required String token,
    required String skill,
    required List<String> exIDs,
    required List<String> edIDs,
    required List<String> liIDs,
    required List<String> prIDs,
    required List<String> crsIds,
    required List<String> awIDs,
    required String permission,
  }) async {
    String path = Apis().aimUrl + Apis().saveSkill;
    log('skID=>$skID Skill=>$skill ExperienceList=>$exIDs educationList=>$edIDs LicenseList=>$liIDs projectList=>$prIDs CourseList=>$crsIds awardList=>$awIDs permission=>$permission',
        name: 'all Ids-service update');
    try {
      Response response = await dio.post(path,
          data: {
            "skill_id": skID,
            "skill": skill,
            "experience_ids": exIDs,
            "education_ids": edIDs,
            "license_ids": liIDs,
            "project_ids": prIDs,
            "course_ids": crsIds,
            "award_ids": awIDs,
            "permission": permission,
          },
          options: Options(
            validateStatus: (status) => status! < 599,
            headers: {'Authorization': 'Bearer $token'},
          ));
      Map<String, dynamic> responseData = response.data;
      // log(responseData.toString(), name: 'response data-update skill');

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
        // log('Server error: ${e.message}', name: 'update skill error');
        throw Exception('Server error occurred');
      } else {
        log('error:${e.response?.data}', name: 'update skill error');
      }
    } catch (e) {
      // Handle other exceptions
      // log('error :${e.toString()}', name: 'update skill error');
      throw Exception('error occurred ${e.toString()}');
    }
    return null;
  }

  Future<String?> deleteSkillInfo({required String skID}) async {
    String path = Apis().aimUrl + Apis().deleteSkills;
    try {
      Response response = await dio.post(path,
          data: {"skill_id": skID},
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
        throw Exception('Server error occurred');
      } else {
        log('error:${e.response?.data}', name: 'delete skill error');
      }
    } catch (e) {
      // Handle other exceptions
      throw Exception('error occurred ${e.toString()}');
    }
    return null;
  }
}
