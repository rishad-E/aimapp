import 'dart:async';
import 'dart:developer';
import 'package:aimshala/controllers/login_controller.dart';
import 'package:aimshala/services/login_service/login_service.dart';
import 'package:aimshala/view/home/home.dart';
import 'package:aimshala/view/login/login_screen.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  final storage = const FlutterSecureStorage();
   final loginController = Get.put(LoginController()); 

  splashTimer() async {
String? checkLogin = await storage.read(key: 'token');
String? phone = await storage.read(key: 'phone');
log(phone.toString(),name: 'splassssssssssssssssssssssssss');
  loginController.userData = await LoginService().verifyUserExist(mobileNo: phone.toString());

    Timer(const Duration(seconds: 1), () {
      if (checkLogin == null) {
        Get.off(()=>const LoginScreen());
      }else {
        Get.off(()=>const HomeScreen());
      }
    });
  }
}
