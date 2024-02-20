import 'package:aimshala/utils/common/colors_common.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

Text primarytxt(String text, double size) {
  return Text(
    text,
    style: TextStyle(
        color: const Color.fromARGB(255, 132, 131, 131),
        fontSize: size,
        fontWeight: FontWeight.w400),
    textAlign: TextAlign.center,
  );
}

Text primarytxt2(String text, double size) {
  return Text(
    text,
    style: TextStyle(
      color: const Color.fromARGB(255, 116, 118, 119),
      fontSize: size,
      fontWeight: FontWeight.w400,
    ),
    textAlign: TextAlign.center,
  );
}

Text primarytxt3(String text, double size) {
  return Text(
    text,
    style: TextStyle(
      color: kblack,
      fontSize: size,
      fontWeight: FontWeight.w500,
    ),
    textAlign: TextAlign.center,
  );
}

TextStyle errorStyle() {
  return TextStyle(
      color: Colors.red, fontSize: 10.sp, fontWeight: FontWeight.w400);
}

Text boldText({required String text, required double size}) {
  return Text(
    text,
    style: TextStyle(
      color: kblack,
      fontSize: size,
      fontWeight: FontWeight.bold,
    ),
    textAlign: TextAlign.center,
  );
}
