import 'dart:developer';

import 'package:aimshala/utils/common/constant/api_const.dart';
import 'package:dio/dio.dart';

class SlotBookingService {
  Dio dio = Dio();

  Future<String?> slotBooking({
    required String name,
    required String email,
    required String phoneNumber,
    required String appointDate,
    required String appointTime,
    required String role,
    required String aimId,
    required List<String> microAim,
  }) async {
    String path = Apis().aimUrl + Apis().saveSlote;
    log(name +
        email +
        phoneNumber +
        appointDate +
        appointTime +
        role +
        aimId +
        microAim.toString());
    try {
      Response response = await dio.post(
        path,
        data: {
          "name": name,
          "email": email,
          "phone": phoneNumber,
          "appoint_date": appointDate,
          "appoint_time": appointTime,
          "role": role,
          "aim_category": aimId,
          "micro_aim": microAim
        },
      );
      if (response.statusCode == 200) {
        String res = response.data["message"];
        log(res, name: 'slot booking');
        return res;
      }
    } catch (e) {
      log(e.toString(), name: 'get aim error');
    }
    return null;
  }
}
