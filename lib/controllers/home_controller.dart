

import 'package:get/get.dart';

class HomeController extends GetxController {
  int currentStep = 0;

  // @override
  // void onInit() {
  //   String? id;
  //   final UserModel? userData = Get.put(LoginController()).userData;
  //   if (userData != null) {
  //     id = userData.user?.id.toString();
  //   }
  //   Get.find<AIMCETController>()
  //       .checkAimcetTestTakenFunction(userId: id.toString());
  //   Get.find<BookCareerCounsellController>()
  //       .checkCounsellcallBookingFuntion(userId: id.toString());
  //   super.onInit();
  // }

  void toggelNav(int index) {
    currentStep = index;
    update(['bottom-nav']);
  }
}
