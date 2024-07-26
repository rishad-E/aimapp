import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:http_parser/http_parser.dart';

class SaveCounselorRegService {
  Dio dio = Dio();

  Future<String?> saveCounselorRegistraion({
    required String uId,
    required String name,
    required String email,
    required String phone,
    required String dob,
    required String gender,
    required String status,
    required String address,
    required String highDegree,
    required String otherDegree,
    required String specialization,
    required String certification,
    required String jobTitle,
    required String experties,
    required String currentOrganization,
    required String experience,
    required List<String> prefereDays,
    required List<String> prefereTimes,
    required String additionalNote,
    required List<String> primaryExp,
    required String otherPrimary,
    required List<String> secondaryExp,
    required String otherSecondary,
    required String counselPhilosophyQus,
    required String counselPhilosophyAns,
    required String whyCounselQus,
    required String whyCounselAns,
    required List<String> refnames,
    required List<String> refRelations,
    required List<String> refPhones,
    required List<String?> otherRelations,
    required String linkedInLink,
    required String videoLink,
    required String temsAgree,
    PlatformFile? cv,
    PlatformFile? videoFile,
  }) async {
    String path = 'http://154.26.130.161/elearning/api/save-counsellor';

    FormData formData = FormData.fromMap({
      'uId': uId,
      'name': name,
      'email': email,
      'phone': phone,
      'dob': dob,
      'gender': gender,
      'current_status': status,
      'address': address,
      'high_degree': highDegree,
      'other_degree': otherDegree,
      'specializations': specialization,
      'certificates': certification,
      'current_job_title': jobTitle,
      'field_of_expertise': experties,
      'current_employ_organization': currentOrganization,
      'year_of_professional_experience': experience,
      'prefer_days[]': prefereDays,
      'prefer_timeslot[]': prefereTimes,
      'additional_note_for_availability': additionalNote,
      'primary_area[]': primaryExp,
      'primary_area_of_expertise': otherPrimary,
      'secondary_area[]': secondaryExp,
      'secondary_area_of_expertise': otherSecondary,
      'teaching_philosophy': counselPhilosophyQus,
      'teaching_philosophy_ans': counselPhilosophyAns,
      'why_join': whyCounselQus,
      'why_join_ans[]': whyCounselAns,
      'ref_name[]': refnames,
      'ref_relation[]': refRelations,
      'ref_phone[]': refPhones,
      'other_relation[]': otherRelations,
      'linkedin_link': linkedInLink,
      'video_link': videoLink,
      'agreeCheckbox':temsAgree,
    });
    if (cv != null) {
      log(cv.path.toString(), name: 'cv');
      formData.files.add(
        MapEntry(
          'cv',
          await MultipartFile.fromFile(cv.path!,
              contentType: MediaType.parse(('application/pdf'))),
        ),
      );
    }
    if (videoFile != null) {
      log(videoFile.path.toString(), name: 'video');
      formData.files.add(
        MapEntry(
            'file2',
            await MultipartFile.fromFile(
              videoFile.path!,
              contentType: MediaType.parse('video/mp4'),
            )),
      );
    }
    try {
      Response response = await dio.post(
        path,
        data: formData,
        options: Options(validateStatus: (status) => status! < 599),
      );
      log(response.data.toString(), name: 'counselor response');
      // if (response.data is Map) {
        Map<String, dynamic> responseData = response.data;
        if (responseData.containsKey('message')) {
          String successMessage = responseData["message"];
          log(successMessage, name: 'counselor response sucess');
          return successMessage;
        } else if (responseData.containsKey('error')) {
          dynamic error = responseData['error'];
          if (error is Map) {
            Map<String, dynamic> errors = responseData['error'];
            String first = errors.keys.first;
            if (errors[first] is List && (errors[first] as List).isNotEmpty) {
              String errorMessage = errors[first][0].toString();
              log(errorMessage, name: 'save counselor  error');
              return errorMessage;
            }
          } else {
            String errorMessage = response.data["error"];
            log(errorMessage, name: 'error res string');
            return errorMessage;
          }
        }
      // } else {
      //   String errorMessage = response.data;
      //   log(errorMessage, name: 'error res string');
      // }
    } on DioException catch (e) {
      if (e.response?.statusCode == 500) {
        log('Server error: ${e.message}', name: 'save counselor info error');
        throw Exception('Server error occurred');
      } else {
        log('error: statuscode:${e.response?.statusCode}',
            name: 'save counselor info error');
      }
    } catch (e) {
      // Handle other exceptions
      log('error :${e.toString()}', name: 'save counselor info error');
      throw Exception('error occurred ${e.toString()}');
    }
    return null;
  }
}
