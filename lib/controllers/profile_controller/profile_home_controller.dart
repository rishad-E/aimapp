import 'package:aimshala/controllers/login_controller.dart';
import 'package:aimshala/models/UserModel/user_model.dart';
import 'package:get/get.dart';

class ProfileHomeController extends GetxController {

  Rx<User?> user = Rx<User?>(null);
  @override
  void onInit() {
    // user = Get.put(LoginController()).userData?.user;
    user.value = Get.put(LoginController()).userData?.user;
    super.onInit();
  }
}
