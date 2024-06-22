import 'dart:async';
import 'dart:developer';
import 'package:aimshala/controllers/aimcet_test_controller.dart';
import 'package:aimshala/controllers/career_booking_controller.dart';
import 'package:aimshala/controllers/login_controller.dart';
import 'package:aimshala/models/UserModel/user_model.dart';
import 'package:aimshala/services/login_service/login_service.dart';
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
  final Connectivity connectivity = Connectivity();
  bool isConnected = false;

  Future<void> splashTimer() async {
    ConnectivityResult connectivityResult =
        await connectivity.checkConnectivity();
    ApiExceptions exceptions =
        ApiExceptions.fromconnectivityError(connectivityResult);
    String connectionStatus = exceptions.errorMessage;

    if (connectionStatus == 'not internet') {
      Get.showSnackbar(
        const GetSnackBar(
          snackStyle: SnackStyle.FLOATING,
          message: 'No Internet...Please turn on your data',
          margin: EdgeInsets.all(10),
          backgroundColor: Colors.red,
          duration: Duration(seconds: 2),
        ),
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
      Map<String, dynamic> res =
          await LoginService().verifyUserExist(mobileNo: phone.toString());
      if (res.containsKey('error')) {
        String errorMessage = res["error"];
        if (errorMessage == "Please fill first three questions.") {
          User? user = User.fromJson(res["user"]);
          String? id = user.id.toString();
          // log(id,name: 'idddddddddddddddddd');
          //  Get.offAll(()=>LoginScreen());
          Get.offAll(() => SignUpAmyScreen(
              name: name.toString(), email: email.toString(), uId: id));
        } else {
          Get.offAll(() => const LoginScreen());
        }
      } else if (res.containsKey('status')) {
        User? user = User.fromJson(res["user"]);
        String? id = user.id.toString();
        // log(id,name: 'idddddddddddddddddd');
        //  Get.offAll(()=>LoginScreen());
        Get.offAll(() => SignUpAmyScreen(
            name: name.toString(), email: email.toString(), uId: id));
      } else if (res.containsKey('token')) {
        loginController.userData = UserDataModel.fromJson(res);
        if (loginController.userData != null) {
          String? id = loginController.userData?.user?.id.toString();
          String? uName = loginController.userData?.user?.name.toString();
          log('userID=>$id  name=>$uName', name: 'userid and username');
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
          Get.off(() => const HomeScreen());
        }
      }

      // loginController.userData =
      //     await LoginService().verifyUserExist(mobileNo: phone.toString());
      // String? checkSignup;
      // if (loginController.userData?.token != null) {
      //   storage.write(
      //       key: 'token', value: loginController.userData?.token.toString());
      //   checkSignup = await storage.read(key: 'token');
      // }
      // log(checkSignup.toString(), name: 'splash checksignup');
      // Timer(const Duration(seconds: 2), () {
      //   if (checkSignup == null) {
      //     Get.off(() => const LoginScreen());
      //   } else {
      //     if (loginController.userData != null) {
      //       String? id = loginController.userData?.user?.id.toString();
      //       String? uName = loginController.userData?.user?.name.toString();
      //       log('uid $id....quaId 1...uName $uName');
      //       bookingController.checkCounsellcallBookingFuntion(
      //           userId: id.toString());
      //       aimtestController
      //           .checkAimcetTestTakenFunction(userId: id.toString())
      //           .then((value) {
      //         if (aimtestController.testDone.value == 'done') {
      //           log('aimcet test done', name: 'spalsh done');
      //           aimtestController.aimcetTestResultFunction(
      //               userId: id.toString(), userName: uName.toString());
      //         }
      //       });
      //     }
      //     Get.off(() => const HomeScreen());
      //   }
      // });
    }
  }
}
