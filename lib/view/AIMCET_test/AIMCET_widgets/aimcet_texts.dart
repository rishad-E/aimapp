import 'package:aimshala/utils/common/colors_common.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

Text aimcetBoldText(
    {required String text, required double size, TextAlign? textAlign}) {
  return Text(
    text,
    style: TextStyle(
      color: kblack,
      fontSize: size,
      fontWeight: FontWeight.bold,
    ),
    textAlign: textAlign,
  );
}

Text welcomeText(
  String text,
  double size,
) {
  return Text(
    text,
    style: TextStyle(
      color: const Color.fromARGB(255, 116, 118, 119),
      fontSize: size,
      fontWeight: FontWeight.w400,
    ),
  );
}

Widget guidelineComponent({required String title,required String subtitile}) {
  return Padding(
    padding: const EdgeInsets.only(left: 8),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        aimcetBoldText(
          text: title,
          size: 8.5.sp,
        ),
        welcomeText(
          subtitile,
          8.5.sp,
        ),
      ],
    ),
  );
}
