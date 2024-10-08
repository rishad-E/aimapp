import 'dart:developer';

import 'package:aimshala/utils/common/constant/api_const.dart';
import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:http_parser/http_parser.dart';

class MentorRegistrationService {
  Dio dio = Dio();

  Future<String?> saveMentorRegistraion({
    required String token,
    required String name,
    required String email,
    required String dob,
    required String gender,
    required String status,
    required String phone,
    required String address,
    required String highDegree,
    required String otherDegree,
    required String experties,
    required String experience,
    required String institute,
    required String earnReward,
    required String earnRewardDes,
    required String preferMode,
    required List<String> subjects,
    required List<String> topics,
    required List<String> prefDays,
    required List<String> prefTimes,
    required List<String> questions,
    required List<String> answers,
    required List<String> refNames,
    required List<String> refRelations,
    required List<String> refPhones,
    required List<String?> refOtherRelations,
    required String linkedInLink,
    required String videoLink,
    PlatformFile? cv,
    PlatformFile? video,
  }) async {
    String path = Apis().aimUrl + Apis().mentor;
    FormData formData = FormData.fromMap({
      "name": name,
      "email": email,
      "dob": dob,
      "gender": gender,
      "current_status": status,
      "phone": phone,
      "address": address,
      "high_degree": highDegree,
      "other_degree": otherDegree,
      "expertise": experties,
      "experience": experience,
      "current_employer": institute,
      "earning_rewards": earnReward,
      "earning_award_des": earnRewardDes,
      "prefer_mode": preferMode,
      "mentor_field[]": subjects,
      "specific_topics[]": topics,
      "prefer_days[]": prefDays,
      "prefer_timeslot[]": prefTimes,
      "qus[]": questions,
      "ans[]": answers,
      "ref_name[]": refNames,
      "ref_relation[]": refRelations,
      "ref_phone[]": refPhones,
      "other_relation[]": refOtherRelations,
      "linkedin_link": linkedInLink,
      "video_link": videoLink,
    });

    if (cv != null) {
      log(cv.path.toString());
      formData.files.add(
        MapEntry(
            'cv',
            await MultipartFile.fromFile(
              cv.path!,
              contentType: MediaType.parse(('application/pdf')),
            )),
      );
    }
    if (video != null) {
      log(video.path.toString());

      formData.files.add(
        MapEntry(
          'video_file',
          await MultipartFile.fromFile(
            video.path!,
            contentType: MediaType.parse('video/mp4'),
          ),
        ),
      );
    }

    try {
      Response response = await dio.post(
        path,
        data: formData,
        options: Options(
          validateStatus: (status) => status! < 599,
          headers: {
            'Content-Type': 'multipart/form-data',
            'Accept': '*/*',
            'Authorization': 'Bearer $token'
          },
        ),
      );
      log(response.data.toString(), name: 'mentor response');
      Map<String, dynamic> responseData = response.data;
      if (responseData.containsKey('success')) {
        String successMessage = responseData["message"];
        // log(successMessage, name: 'mentor response sucess');
        return successMessage;
      } else if (responseData.containsKey('error')) {
        if (response.data is Map) {
          Map<String, dynamic> errors = responseData['error'];
          String first = errors.keys.first;
          if (errors[first] is List && (errors[first] as List).isNotEmpty) {
            String errorMessage = errors[first][0].toString();
            return errorMessage;
          }
        } else {
          String errorMessage = response.data["error"];
          log(errorMessage);
          return errorMessage;
        }
      }
    } on DioException catch (e) {
      if (e.response?.statusCode == 500) {
        log('Server error: ${e.message}', name: 'save mentor info error');
        throw Exception('Server error occurred');
      } else {
        log('error: statuscode:${e.response?.statusCode}',
            name: 'save mentor info error');
      }
    } catch (e) {
      // Handle other exceptions
      log('error :${e.toString()}', name: 'save mentor info error');
      throw Exception('error occurred ${e.toString()}');
    }
    return null;
  }
}
