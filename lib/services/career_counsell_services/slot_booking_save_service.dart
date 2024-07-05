import 'dart:developer';

import 'package:aimshala/utils/common/constant/api_const.dart';
import 'package:dio/dio.dart';

class SlotBookingService {
  Dio dio = Dio();

  Future<String?> slotBooking({
    required String uId,
    required String appointDate,
    required String appointTime,
    required String aimId,
    required List<String> microAim,
  }) async {
    String path = Apis().aimUrl + Apis().saveSlote;
    log('id=>$uId appointDate=>$appointDate appointTime=>$appointTime aimId=>$aimId microAim=>$microAim',
        name: 'reviewBooking servie');
    try {
      Response response = await dio.post(
        path,
        data: {
          "user_id": uId,
          "appoint_date": appointDate,
          "appoint_time": appointTime,
          "aim_category": aimId,
          "micro_aim": microAim
        },
        options: Options(validateStatus: (status) => status! < 599),
      );
      log(response.statusCode.toString(), name: 'slot booking res');

      if (response.statusCode == 200) {
        String res = response.data["message"];
        log(res, name: 'slot booking msg success');
        return res;
      }
    } catch (e) {
      log(e.toString(), name: 'slot booking error');
    }
    return null;
  }
}
