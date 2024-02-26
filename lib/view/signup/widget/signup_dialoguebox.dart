import 'package:aimshala/utils/common/colors_common.dart';
import 'package:aimshala/utils/common/text_common.dart';
import 'package:aimshala/utils/widgets/widgets_common.dart';
import 'package:aimshala/view/home/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class SignUpDialogueBox extends StatelessWidget {
  const SignUpDialogueBox({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: kwhite,
      surfaceTintColor: kwhite,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircleAvatar(
            radius: 55.sp,
            backgroundColor: kwhite,
            backgroundImage: const AssetImage('assets/images/person.png'),
          ),
          hMBox,
          Text('Thank You!',
              style: TextStyle(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.bold,
                  color: kpurple)),
          hMBox,
          primarytxt2("For signing up! Welcom to AimShala", 11.sp),
          hMBox,
          Container(
              width: 79.w,
              height: 4.5.h,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(15),
                ),
              ),
              child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(kpurple),
                      shape: buttonShape(round: 10)),
                  onPressed: () {
                    Get.offAll(() => const HomeScreen());
                  },
                  child: Text('OK', style: TextStyle(color: kwhite)))),
        ],
      ),
    );
  }
}
