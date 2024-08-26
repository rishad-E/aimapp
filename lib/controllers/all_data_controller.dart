import 'dart:developer';
import 'package:aimshala/models/UserModel/user_details_model.dart';
import 'package:aimshala/services/user_all_data.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

class AllDataController extends GetxController {
  final FlutterSecureStorage storage = const FlutterSecureStorage();
  UserDataModel? userDetails;
  UserData? userData;

  Future<void> getUserallData() async {
    String? token = await storage.read(key: 'token');

    Map<String, dynamic>? res =
        await UserAllDataService().fetchUserData(token: token.toString());

    if (res != null) {
      userDetails = UserDataModel.fromJson(res);
      userData = UserData.fromJson(res['user']);
      log(userData!.name.toString(), name: 'user-all-role');

      // log(userDetails!.gender.toString(), name: 'user-all-data');
    }
  }
}
