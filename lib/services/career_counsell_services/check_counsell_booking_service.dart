import 'dart:developer';

import 'package:aimshala/utils/common/constant/api_const.dart';
import 'package:dio/dio.dart';

class CheckCounsellBookingService {
  Dio dio = Dio();

  Future<Map<String, dynamic>?> checkCounsellcallBooking(
      {required String token}) async {
    String path = Apis().aimUrl + Apis().checkCounsellcall;

    try {
      Response response = await dio.get(
        path,
        options: Options(
          validateStatus: (status) => status! < 599,
          headers: {'Authorization': 'Bearer $token'},
        ),
      );
      // log(response.data.toString(), name: 'check counsell booking taken');
      if (response.statusCode == 200) {
        Map<String, dynamic> res = response.data;
        return res;
      }
    } catch (e) {
      log(e.toString(), name: 'check counsell booking taken error');
    }
    return null;
  }
}
