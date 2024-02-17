import 'package:aimshala/view/date_time_Booking/date_time_booking_screen.dart';
import 'package:aimshala/view/home/home.dart';
import 'package:aimshala/view/login/login_screen.dart';
import 'package:aimshala/view/login/otp_screen.dart';
import 'package:aimshala/view/signup/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return GetMaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            useMaterial3: true,
            textSelectionTheme: const TextSelectionThemeData(
              // cursorColor: Colors.transparent,
              selectionColor: Colors.transparent,
              selectionHandleColor: Colors.transparent,
            ),
          ),
          home:  const LoginScreen(),
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}
