import 'dart:developer';

import 'package:aimshala/utils/common/constant/api_const.dart';
import 'package:dio/dio.dart';

class CareerOtpService {
  Dio dio = Dio();
  String templateId = '65af4634d6fc054da644a222';
  String authKey = '414267AspeU9svuZYb65aa6769P1';
  String retryType = 'text';

  /*---------- Career send otp service ---------*/
  Future<void> careerSendOTP({required String mobileNo}) async {
    try {
      String path = '${Apis().baseUrlOtp}otp';

      Response response = await dio.get(
        path,
        queryParameters: {
          'template_id': templateId,
          'mobile': mobileNo,
          'authkey': authKey,
        },
      );
      log(response.data.toString());
    } catch (e) {
      log(e.toString(), error: 'career sendOtp error');
    }
  }

  /*---------- Career validate otp serviece---------*/
  Future<bool?> careerValidateOTP(
      {required String otp, required String mobileNo}) async {
    try {
      String path = '${Apis().baseUrlOtp}otp/verify';
      Response response = await dio.get(path, queryParameters: {
        'otp': otp,
        'authkey': authKey,
        'mobile': mobileNo,
      });
      log(response.data.toString(), name: 'career otp validation');
      String data = response.data['message'];
      if (data == 'OTP verified success') {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      log(e.toString(), name: 'otp validate error');
    }
    return null;
  }

/*---------- Career validate otp serviece---------*/
  Future<String?> careerResendOTP({required String mobileNo}) async {
    try {
      log(mobileNo.toString());
      String path = '${Apis().baseUrlOtp}otp/retry';
      Response response = await dio.get(path, queryParameters: {
        'authkey': authKey,
        'mobile': mobileNo,
        'retrytype': retryType,
      });
      log(response.data.toString(), name: 'resend');
      String data = response.data['message'];
      return data;
    } catch (e) {
      log(e.toString(), name: 'retry error');
    }
    return null;
  }
}
