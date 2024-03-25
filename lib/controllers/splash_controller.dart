import 'dart:async';
import 'dart:developer';
import 'package:aimshala/controllers/aimcet_test_controller.dart';
import 'package:aimshala/controllers/career_booking_controller.dart';
import 'package:aimshala/controllers/login_controller.dart';
import 'package:aimshala/services/login_service/login_service.dart';
import 'package:aimshala/utils/exceptions/dio_exceptions.dart';
import 'package:aimshala/view/home/home.dart';
import 'package:aimshala/view/login/login_screen.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  final storage = const FlutterSecureStorage();
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
    log(connectionStatus.toString(), name: 'conectivity');

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
      String? checkLogin = await storage.read(key: 'token');
      String? phone = await storage.read(key: 'phone');
      log(phone.toString(), name: 'splassssssssssssssssssssssssss');
      loginController.userData =
          await LoginService().verifyUserExist(mobileNo: phone.toString());
      String? checkSignup;
      if (loginController.userData?.token != null) {
        storage.write(
            key: 'token', value: loginController.userData?.token.toString());
        checkSignup = await storage.read(key: 'token');
      }

      log('signup $checkSignup....login $checkLogin');
      // log('date ${bookingController.selectedDate}....time ${bookingController.selectedTime}');

      Timer(const Duration(seconds: 1), () {
        if (checkSignup == null && checkLogin == null) {
          Get.off(() => const LoginScreen());
        } else {
          if (loginController.userData != null) {
            String? id = loginController.userData?.user?.id.toString();
            String? uName = loginController.userData?.user?.name.toString();
            log('uid $id....quaId 1...uName $uName');
            fetchFunctions(uId: id.toString(), uName: uName.toString());
          }
          Get.off(() => const HomeScreen());
        }
      });
    }
  }

  void fetchFunctions({required String uId, required String uName}) {
    aimtestController.fetchAllTestQuestions(userId: uId, qualifyId: '1').then((value) => {
      if(aimtestController.allQuestions?.isEmpty == true){
        log("delaaaaaaayerrrrr"),
        aimtestController.aimcetTestResultFunction(userId: uId,userName: uName)
      }
    });
  }
}
