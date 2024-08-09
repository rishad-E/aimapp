import 'dart:developer';
import 'package:aimshala/models/UserModel/user_details_model.dart';
import 'package:aimshala/services/user_all_data.dart';
import 'package:get/get.dart';

class AllDataController extends GetxController {
 
  UserDataModel? userDetails;
  UserData? userData;

  Future<void> getUserallData({required String uId}) async {
    Map<String, dynamic>? res =
        await UserAllDataService().fetchUserData(uId: uId);

    if (res != null) {
      userDetails = UserDataModel.fromJson(res);
      userData = UserData.fromJson(res['user'])  ;
      log(userData!.name.toString(), name: 'user-all-role');
      
      // log(userDetails!.gender.toString(), name: 'user-all-data');
    }
  }
}
