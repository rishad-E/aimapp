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
        return res;
      }
    } on DioException catch (e) {
      if (e.response?.statusCode == 500) {
        log('Server error: ${e.message}', name: 'suggested skills error');
        throw Exception('Server error occurred');
      } else {
        log('error:${e.response?.data}', name: 'suggested skills error');
      }
    } catch (e) {
      // Handle other exceptions
      log('error :${e.toString()}', name: 'suggested skills error');
      throw Exception('error occurred ${e.toString()}');
    }
    return [];
  }

  Future<String?> saveAddSkillService({
    required String uId,
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
      Response response = await dio.post(path,
          data: {
            "user_id": uId,
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
          ));
      Map<String, dynamic> responseData = response.data;
      log(responseData.toString(), name: 'response data-save skill');

      if (responseData.containsKey('success')) {
        String successMessage = responseData['success'];
        log(successMessage, name: 'save skill success');
        return successMessage;
      } else if (responseData.containsKey('error')) {
        // String errorMessage = responseData['error'];
        final errorData = responseData['error'] as Map<String, dynamic>;
        final List<dynamic> errorMessages = errorData.values.first;
        final errorMessage = errorMessages.join('\n');
        log(errorMessage.toString(), name: 'save skill error data');
        return errorMessage;
        // return 'Each image must not exceed 2MB in size.';
      }
    } on DioException catch (e) {
      if (e.response?.statusCode == 500) {
        log('Server error: ${e.message}', name: 'save skill error');
        throw Exception('Server error occurred');
      } else {
        log('error:${e.response?.data}', name: 'save skill error');
      }
    } catch (e) {
      // Handle other exceptions
      log('error :${e.toString()}', name: 'save skill error');
      throw Exception('error occurred ${e.toString()}');
    }
    return null;
  }

  Future<String?> updateAddedSkillService({
    required String skID,
    required String uId,
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
    log('skID=>$skID uid=>$uId Skill=>$skill ExperienceList=>$exIDs educationList=>$edIDs LicenseList=>$liIDs projectList=>$prIDs CourseList=>$crsIds awardList=>$awIDs permission=>$permission',
        name: 'all Ids-service update');
    try {
      Response response = await dio.post(path,
          data: {
            "skill_id": skID,
            "user_id": uId,
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
          ));
      Map<String, dynamic> responseData = response.data;
      log(responseData.toString(), name: 'response data-update skill');

      if (responseData.containsKey('success')) {
        String successMessage = responseData['success'];
        log(successMessage, name: 'update skill success');
        return successMessage;
      } else if (responseData.containsKey('error')) {
        // String errorMessage = responseData['error'];
        final errorData = responseData['error'] as Map<String, dynamic>;
        final List<dynamic> errorMessages = errorData.values.first;
        final errorMessage = errorMessages.join('\n');
        log(errorMessage.toString(), name: 'update skill error data');
        return errorMessage;
        // return 'Each image must not exceed 2MB in size.';
      }
    } on DioException catch (e) {
      if (e.response?.statusCode == 500) {
        log('Server error: ${e.message}', name: 'update skill error');
        throw Exception('Server error occurred');
      } else {
        log('error:${e.response?.data}', name: 'update skill error');
      }
    } catch (e) {
      // Handle other exceptions
      log('error :${e.toString()}', name: 'update skill error');
      throw Exception('error occurred ${e.toString()}');
    }
    return null;
  }
}
