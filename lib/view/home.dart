import 'package:aimshala/utils/common/text_common.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: const EdgeInsets.fromLTRB(15, 0, 15, 5),
          height: MediaQuery.of(context).size.height * 0.25,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                width: 61.w,
                height: 7.h,
                child: Image.asset('assets/images/aimshala-logo.png'),
              ),
              primarytxt2('Welcome to AimShala', 14)
            ],
          ),
        ),
      ),
    );
  }
}
