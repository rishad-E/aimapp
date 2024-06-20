import 'package:aimshala/utils/common/widgets/colors_common.dart';
import 'package:aimshala/utils/common/widgets/text_common.dart';
import 'package:aimshala/utils/widgets/widgets_common.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

Widget loginContainer({required Widget child}) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
    decoration: BoxDecoration(
      borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(15), topRight: Radius.circular(15)),
      color: kwhite,
    ),
    child: child,
  );
}

Widget twoStyleTexts({required String text1, required String text2}) {
  return RichText(
    text: TextSpan(
      children: [
        TextSpan(
            text: text1,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 16.sp,
              color: const Color.fromARGB(255, 30, 35, 44),
            )),
        WidgetSpan(child: wBox),
        TextSpan(
            text: text2,
            style: TextStyle(
              color: const Color.fromARGB(255, 147, 38, 143),
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
            )),
      ],
    ),
  );
}

Widget aimshalaContainer() {
  return Container(
    // color: kwhite,
    padding: const EdgeInsets.symmetric(horizontal: 5),
    // height: 20.h,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        SizedBox(
          width: 61.w,
          height: 7.h,
          child: Image.asset('assets/images/aimshala-logo.png'),
        ),
        const SizedBox(height: 12),
        primarytxt2(
            'We envision a world where individuals are equipped to Take charge of their lives, realise their aspirations, and make meaningful contributions to society, fostering a future of limitless possibilities.',
            9.sp),
        const SizedBox(height: 12)
      ],
    ),
  );
}
