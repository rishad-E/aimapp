import 'dart:developer';

import 'package:aimshala/models/profile_model/cities_model.dart';
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
      required String pincode,
      required String city,
      required String state,
      required String country,
      required String facebook,
      required String instagram,
      required String twitter}) async {
    String path = Apis().aimUrl + Apis().saveContactInfo;
    log('mob: $mobNumber username:$userName email: $email address: $address pincode=>$pincode city: $city state: $state country=>$country facebook: $facebook instagram: $instagram twitter: $twitter UID: $uId ',
        name: 'update contact info');

    try {
      Response response = await dio.post(path,
          data: {
            "user_id": uId,
            "mobile_number": mobNumber,
            "username": userName,
            "email": email,
            "address": address,
            "pin_code":pincode,
            "state": state,
            "city": city,
            "country":country,
            "facebook": facebook,
            "twitter": twitter,
            "instagram": instagram,
          },
          options: Options(
            validateStatus: (status) => status! < 599,
          ));
      log(response.data.toString(),name:'save contact info res' );
      if (response.statusCode == 200) {
        // log(response.data.toString(), name: 'save contact info');
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

  Future<dynamic> getCountryStatesService() async {
    String path = Apis().aimUrl + Apis().getCountryStates;
    try {
      Response response = await dio.get(
        path,
        options: Options(validateStatus: (status) => status! < 599),
      );
      if (response.statusCode == 200) {
        return response.data;
      } else if (response.statusCode != 200) {
        return null;
      }
    } on DioException catch (e) {
      if (e.response?.statusCode == 500) {
        // Handle status code 500 here
        log('Server error: ${e.message}', name: 'profile all data error');
        // You can throw a custom exception or return an empty list as needed
        throw Exception('Server error occurred');
      }
    } catch (e) {
      // Handle other exceptions
      log(e.toString(), name: 'profile all data error');
      throw Exception('error occurred ${e.toString()}');
    }
    return null;
  }

  Future<List<City>?> getCitiesService({required String stateID}) async {
    String path = Apis().aimUrl + Apis().getCities;
    try {
      Response response = await dio.get(
        path,
        queryParameters: {"stateId": stateID},
        options: Options(validateStatus: (status) => status! < 599),
      );
      if (response.statusCode == 200) {
        // return response.data;
        List<dynamic> data = response.data["cities"];
        final res = data.map((e) => City.fromJson(e)).toList();
        // log(res.toString(),name: 'cities data res');
        return res;
      } else if (response.statusCode != 200) {
        return null;
      }
    } on DioException catch (e) {
      if (e.response?.statusCode == 500) {
        // Handle status code 500 here
        log('Server error: ${e.message}', name: 'profile all data error');
        // You can throw a custom exception or return an empty list as needed
        throw Exception('Server error occurred');
      }
    } catch (e) {
      // Handle other exceptions
      log(e.toString(), name: 'profile all data error');
      throw Exception('error occurred ${e.toString()}');
    }
    return null;
  }
}
