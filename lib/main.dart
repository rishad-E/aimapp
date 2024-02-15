import 'package:aimshala/view/Book_career_counsell/career_home_screen.dart';
import 'package:aimshala/view/login/login_screen.dart';
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
          home: BookCareerHomePage(),
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}
