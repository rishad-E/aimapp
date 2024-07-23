import 'dart:async';
import 'dart:developer';
import 'package:aimshala/controllers/aimcet_test_controller.dart';
import 'package:aimshala/controllers/all_data_controller.dart';
import 'package:aimshala/controllers/career_booking_controller.dart';
import 'package:aimshala/controllers/educator_controllers/educator_personal_detail_controller.dart';
import 'package:aimshala/controllers/login_controller.dart';
import 'package:aimshala/controllers/mentor_controllers/mentor_personal_details_controller.dart';
import 'package:aimshala/models/UserModel/user_model.dart';
import 'package:aimshala/services/login_service/login_service.dart';
import 'package:aimshala/utils/common/widgets/colors_common.dart';
import 'package:aimshala/utils/exceptions/dio_exceptions.dart';
import 'package:aimshala/view/home/home.dart';
import 'package:aimshala/view/login/login_screen.dart';
import 'package:aimshala/view/signup/signup_amy_screen.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  final FlutterSecureStorage storage = const FlutterSecureStorage();
  final loginController = Get.put(LoginController());
  final aimtestController = Get.put(AIMCETController());
  final bookingController = Get.put(BookCareerCounsellController());
  final mentorController = Get.put(MentorPersonalDetailController());
  final eduController = Get.put(EducatorPersonalDetailController());
  final alldataController = Get.put(AllDataController());
  final Connectivity connectivity = Connectivity();
  bool isConnected = false;

  Future<void> splashTimer() async {
    ConnectivityResult connectivityResult =
        await connectivity.checkConnectivity();
    ApiExceptions exceptions =
        ApiExceptions.fromconnectivityError(connectivityResult);
    String connectionStatus = exceptions.errorMessage;

    if (connectionStatus == 'not internet') {
      Get.snackbar(
        "No Internet",
        "Please turn on your Network...",
        snackPosition: SnackPosition.TOP,
        duration: const Duration(seconds: 2),
        backgroundColor: kred,
        colorText: Colors.white,
      );
    } else {
      // storage.write(key: 'name', value: 'Rishad E');
      // String? checkLogin = await storage.read(key: 'token');
      // log(checkLogin.toString(), name: 'splash checklogin');
      String? phone = await storage.read(key: 'phone');
      String? email = await storage.read(key: 'email');
      String? name = await storage.read(key: 'name');

      log("phone=>$phone email=>$email name=>$name",
          name: 'splash mobile and email');
      Map<String, dynamic>? res =
          await LoginService().verifyUserExist(mobileNo: '9846126154');
      if (res != null) {
        if (res.containsKey('error')) {
          String errorMessage = res["error"];
          if (errorMessage == "Please fill first three questions.") {
            User? user = User.fromJson(res["user"]);
            String? id = user.id.toString();
            String? phone = user.phone.toString();
            // log(phone, name: 'mmmmmmmmmmmmmmmmmmmmmmmmmmmm');
            Get.offAll(() => SignUpAmyScreen(
                name: name.toString(),
                email: email.toString(),
                uId: id,
                phone: phone));
          } else {
            Get.offAll(() => const LoginScreen());
          }
        } else if (res.containsKey('status')) {
          User? user = User.fromJson(res["user"]);
          String? id = user.id.toString();
          String? phone = user.phone.toString();
          // log(phone, name: 'mmmmmmmmmmmmmmmmmmmmmmmmmmmm2');
          Get.offAll(() => SignUpAmyScreen(
              name: name.toString(),
              email: email.toString(),
              uId: id,
              phone: phone));
        } else if (res.containsKey('token')) {
          loginController.userData = UserModel.fromJson(res);
          if (loginController.userData != null) {
            String? id = loginController.userData?.user?.id.toString();
            String? uName = loginController.userData?.user?.name.toString();
            log('userID=>$id  name=>$uName', name: 'userid and username');
            alldataController.getUserallData(uId: id.toString());
            bookingController.checkCounsellcallBookingFuntion(
                userId: id.toString());
            aimtestController
                .checkAimcetTestTakenFunction(userId: id.toString())
                .then((value) {
              if (aimtestController.testDone.value == 'done') {
                log('aimcet test done', name: 'spalsh done');
                aimtestController.aimcetTestResultFunction(
                    userId: id.toString(), userName: uName.toString());
              }
            });
            mentorController.checkMentorRegtakenFunction(uId: id.toString());
            eduController.checkEducatorRegTakenFunction(uId: id.toString());

            Get.off(() => const HomeScreen());
          }
        }
      } else {
        Get.offAll(() => const LoginScreen());
      }
    }
  }
}
