import 'package:aimshala/models/UserModel/user_details_model.dart';
import 'package:aimshala/services/user_all_data.dart';
import 'package:get/get.dart';

class AllDataController extends GetxController {
  String? userRole;
  UserDetails? userDetails;

  Future<void> getUserallData({required String uId}) async {
    Map<String, dynamic>? res =
        await UserAllDataService().fetchUserData(uId: uId);

    if (res != null) {
      userRole = res["user_role"];
      userDetails = UserDetails.fromJson(res["user_details"]);
      // log(userDetails!.gender.toString(), name: 'user-all-data');
      // log(userRole.toString(), name: 'user-all-role');
    }
  }
}
