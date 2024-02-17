import 'dart:developer';
import 'package:aimshala/models/career_aim_model/career_bookingtime_model.dart';
import 'package:aimshala/utils/common/constant/api_const.dart';
import 'package:dio/dio.dart';

class CareerBookingService {
  Dio dio = Dio();

  Future<List?> getBookingDate() async {
    String path = Apis().aimUrl + Apis().getDate;

    try {
      Response response = await dio.get(path);
      List<dynamic> data = response.data['sevendates'];
      // log(data.toString(), name: 'booking res'); 
      // List<String> res = res.addAll(data);
      return data;
    } catch (e) {
      log(e.toString(), name: 'booking date error');
    }
    return null;
  }

  Future<List<Slot>> getBookingTime({required String date}) async {
    String path = Apis().aimUrl + Apis().getTime;
    try {
      Response response = await dio.post(path, data: {"date": date});
      log(response.data.toString(), name: 'booking time res');
      List<dynamic> data = response.data['slots'];
      final res = data.map((json) => Slot.fromJson(json)).toList();
      return res;
    } catch (e) {
      log(e.toString(), name: 'booking time error');
    }
    return [];
  }
}
