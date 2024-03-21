import 'dart:async';
import 'dart:developer';
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
  final Connectivity connectivity = Connectivity();
  bool isConnected = false;

  Future<void> splashTimer() async {
    String? checkLogin = await storage.read(key: 'token');
    String? phone = await storage.read(key: 'phone');
    log(phone.toString(), name: 'splassssssssssssssssssssssssss');

    ConnectivityResult connectivityResult =
        await connectivity.checkConnectivity();
    ApiExceptions exceptions =
        ApiExceptions.fromconnectivityError(connectivityResult);
    String connectionStatus = exceptions.errorMessage;
    log(connectionStatus.toString(), name: 'conectivity');

    // if (connectionStatus == 'not internet') {
    //   Get.showSnackbar(
    //     const GetSnackBar(
    //       snackStyle: SnackStyle.FLOATING,
    //       message: 'No Internet...Please turn on your data',
    //       margin: EdgeInsets.all(10),
    //       backgroundColor: Colors.red,
    //       duration: Duration(seconds: 2),
    //     ),
    //   );
    // } else {
      loginController.userData =
          await LoginService().verifyUserExist(mobileNo: phone.toString());

      Timer(const Duration(seconds: 1), () {
        if (checkLogin == null) {
          Get.off(() => const LoginScreen());
        } else {
          Get.off(() => const HomeScreen());
        }
      });
    // }
  }
}
