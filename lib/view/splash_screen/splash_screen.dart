import 'package:aimshala/controllers/splash_controller.dart';
import 'package:aimshala/view/bookcareercounsellcall/career_home_aimScreen/widgets/career__widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SplashController());
    controller.splashTimer();
    return Scaffold(
      body: Container(
        decoration: careerMainContainerdecoration(),
        child: Center(
          child: SizedBox(
            width: 61.w,
            height: 7.h,
            child: Image.asset('assets/images/aimshala-logo.png'),
          ),
        ),
      ),
    );
  }
}
