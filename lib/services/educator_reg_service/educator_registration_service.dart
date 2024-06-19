import 'dart:developer';
import 'package:aimshala/utils/common/constant/api_const.dart';
import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:http_parser/http_parser.dart';

class EducatorRegistrationService {
  Dio dio = Dio();

  Future<String?> saveEducatorRegistration({
    required String name,
    required String email,
    required String phone,
    required String address,
    required String highDegree,
    required String otherDegree,
    required String experties,
    required String experience,
    required String institute,
    required List<String> subjects,
    required List<String> topics,
    required String relocate,
    required String workMode,
    required String teachPrefer,
    required List<String> prefereDays,
    required List<String> prefereTimes,
    required List<String> questions,
    required List<String> answers,
    required List<String> refnames,
    required List<String> refRelations,
    required List<String> refPhones,
    required List<String?> otherRelations,
    required String linkedInLink,
    required String videoLink,
    PlatformFile? cv,
    PlatformFile? videoFile,
  }) async {
    String path = Apis().aimUrl + Apis().educator;
log(name);
    FormData formData = FormData.fromMap({
      "name": name,
      "email": email,
      "phone": phone,
      "address": address,
      "high_degree": highDegree,
      "other_degree": otherDegree,
      "expertise": experties,
      "experience": experience,
      "institute_affliated": institute,
      "mentor_field[]": subjects,
      "specific_topics[]": topics,
      "relocate": relocate,
      "work_mode": workMode,
      "teach_prefer": teachPrefer,
      "prefer_days[]": prefereDays,
      "prefer_timeslot[]": prefereTimes,
      "qus[]": questions,
      "ans[]": answers,
      "ref_name[]": refnames,
      "ref_relation[]": refRelations,
      "ref_phone[]": refPhones,
      "other_relation[]": otherRelations,
      "linkedin_link": linkedInLink,
      "video_link": videoLink,
    });
    if (cv != null) {
      log(cv.path.toString());
      formData.files.add(
        MapEntry(
          'cv',
          await MultipartFile.fromFile(cv.path!,
              contentType: MediaType.parse(('application/pdf'))),
        ),
      );
    }
    if (videoFile != null) {
      log(videoFile.path.toString());
      formData.files.add(
        MapEntry(
            'video_file',
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
        options: Options(
          validateStatus: (status) => status! < 599,
          headers: {'Content-Type': 'multipart/form-data'},
        ),
      );
      log(response.data.toString(), name: 'educator response');
      Map<String, dynamic> responseData = response.data;
      if (responseData.containsKey('success')) {
        String successMessage = responseData["message"];
        // log(successMessage, name: 'educator response sucess');
        return successMessage;
      } else if (responseData.containsKey('error')) {
        dynamic error = responseData['error'];
        if (error is Map) {
          Map<String, dynamic> errors = responseData['error'];
          String first = errors.keys.first;
          if (errors[first] is List && (errors[first] as List).isNotEmpty) {
            String errorMessage = errors[first][0].toString();
            // log(errorMessage, name: 'save education info MB error');
            return errorMessage;
          }
        } else {
          String errorMessage = response.data["error"];
          log(errorMessage, name: 'error res string');
        }
      }
    } on DioException catch (e) {
      if (e.response?.statusCode == 500) {
        log('Server error: ${e.message}', name: 'save educator info error');
        throw Exception('Server error occurred');
      } else {
        log('error: statuscode:${e.response?.statusCode}',
            name: 'save educator info error');
      }
    } catch (e) {
      // Handle other exceptions
      log('error :${e.toString()}', name: 'save educator info error');
      throw Exception('error occurred ${e.toString()}');
    }
    return null;
  }
}
