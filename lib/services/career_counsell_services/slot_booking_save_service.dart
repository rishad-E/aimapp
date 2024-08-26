import 'dart:developer';

import 'package:aimshala/utils/common/constant/api_const.dart';
import 'package:dio/dio.dart';

class SlotBookingService {
  Dio dio = Dio();

  Future<String?> slotBooking({
    required String token,
    required String appointDate,
    required String appointTime,
    required List<String> microAim,
  }) async {
    String path = Apis().aimUrl + Apis().saveSlote;
    log('token=>${token.isNotEmpty} appointDate=>$appointDate appointTime=>$appointTime  microAim=>$microAim',
        name: 'reviewBooking servie');
    try {
      Response response = await dio.post(
        path,
        data: {
          "appoint_date": appointDate,
          "appoint_time": appointTime,
          "career_class": microAim
        },
        options: Options(
          validateStatus: (status) => status! < 599,
          headers: {'Authorization': 'Bearer $token'},
        ),
      );
      if (response.data is Map) {
        Map<String, dynamic> resData = response.data;
        if (resData.containsKey('status')) {
          if (resData['status'] == 'success') {
            String success = resData['message'];
            return success;
          } else {
            String error = resData['message'];
            return error;
          }
        } else if (resData.containsKey('error')) {
          Map<String, dynamic> errors = resData['error'];
          String first = errors.keys.first;
          if (errors[first] is List && (errors[first] as List).isNotEmpty) {
            String errorMessage = errors[first][0].toString();
            return errorMessage;
          }
        }
      } else if (response.data is String) {
        String msg = response.data;
        return msg;
      }
    } catch (e) {
      log(e.toString(), name: 'slot booking error');
    }
    return null;
  }
}
