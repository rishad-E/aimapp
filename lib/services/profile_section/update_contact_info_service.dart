import 'dart:developer';

import 'package:aimshala/utils/common/constant/api_const.dart';
import 'package:dio/dio.dart';

class UpdateContactInfoService {
  Dio dio = Dio();

  Future<bool?> updateContactInfo(
      {required String uId,
      required String userName,
      required String mobNumber,
      required String email,
      required String address,
      required String city,
      required String state,
      required String facebook,
      required String instagram,
      required String twitter}) async {
    String path = Apis().aimUrl + Apis().savepersonalInfo;
    log('mob: $mobNumber username:$userName email: $email address: $address city: $city state: $state facebook: $facebook instagram: $instagram twitter: $twitter UID: $uId',
        name: 'update contact info');

    try {
      Response response = await dio.post(path,
          data: {
            "user_id": uId,
            "mobile_number": mobNumber,
            "username": userName,
            "email": email,
            "address": address,
            "state": state,
            "city": city,
            "facebook": facebook,
            "twitter": twitter,
            "instagram": instagram,
          },
          options: Options(
            validateStatus: (status) => status! < 599,
          ));
      if (response.statusCode == 200) {
        log(response.data.toString(), name: 'save contact info');
        return true;
      }
    } on DioException catch (e) {
      if (e.response?.statusCode == 500) {
        // Handle status code 500 here
        log('Server error: ${e.message}', name: 'save contact info error');
        // You can throw a custom exception or return an empty list as needed
        throw Exception('Server error occurred');
      }
    } catch (e) {
      // Handle other exceptions
      log(e.toString(), name: 'save contact info error');
      throw Exception('error occurred ${e.toString()}');
    }
    return null;
  }
}
