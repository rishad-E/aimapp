import 'package:aimshala/utils/common/widgets/colors_common.dart';
import 'package:aimshala/utils/common/widgets/text_common.dart';
import 'package:aimshala/utils/widgets/widgets_common.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

Widget signUPContainer({required Widget child}) {
  return Container(
    width: double.infinity,
    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
    decoration: BoxDecoration(
      borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(15), topRight: Radius.circular(15)),
      color: kwhite,
    ),
    child: child,
  );
}

InputDecoration roleContainer({String? hintText, Widget? suffixWidget}) {
  return InputDecoration(
    hintText: hintText,
    suffixIcon: suffixWidget,
    contentPadding: const EdgeInsets.symmetric(vertical: 2, horizontal: 10),
    hintStyle: TextStyle(color: kblack.withOpacity(0.4), fontSize: 14),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: Colors.red),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: Colors.red),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: Colors.purple),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(color: kblack.withOpacity(0.3)),
    ),
  );
}

Widget signupBox({required Widget text, required Widget textField}) {
  return Column(
    children: [Align(alignment: Alignment.centerLeft, child: text), textField],
  );
}

Widget aimshalaContainerSignUp() {
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

Widget signUpButton(
    {MaterialStateProperty<Color?>? backgroundColor,
    Color? textColor,
    required void Function()? onPressed}) {
  return TextButton(
    style: ButtonStyle(
      backgroundColor: backgroundColor,
      shape: buttonShape(round: 10),
    ),
    onPressed: onPressed,
    child: Text(
      'Sign up',
      style: TextStyle(
          color: textColor, fontWeight: FontWeight.w600, fontSize: 14),
    ),
  );
}
