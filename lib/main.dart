
import 'package:aimshala/view/splash_screen/splash_screen.dart';
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
          title: 'AIMSHALA APP',
          theme: ThemeData(
            useMaterial3: true,
            textSelectionTheme: const TextSelectionThemeData(
              // cursorColor: Colors.transparent,
              selectionColor: Colors.transparent,
              selectionHandleColor: Colors.transparent,
            ),
          ),
          home:  SplashScreen(),
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}

