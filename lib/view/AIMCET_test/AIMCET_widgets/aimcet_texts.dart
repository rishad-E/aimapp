import 'package:aimshala/utils/common/colors_common.dart';
import 'package:aimshala/utils/widgets/widgets_common.dart';
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

Widget guidelineComponent({required String title, required String subtitile}) {
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

Widget questionText(String question) {
  return Padding(
    padding: const EdgeInsets.only(top: 5, bottom: 8, left: 7, right: 7),
    child: Text(
      question,
      style: TextStyle(
        fontSize: 10.7.sp,
        fontWeight: FontWeight.w600,
      ),
      textAlign: TextAlign.center,
    ),
  );
}

Widget answerContainer(String index, String answer, bool sele) {
  return Container(
    // height: 6.5.h,
    padding: const EdgeInsets.symmetric(vertical: 5),
    decoration: BoxDecoration(
      color: kwhite,
      border: Border.all(
        width: 1,
        color: sele ? mainPurple : const Color.fromARGB(255, 227, 224, 224),
      ),
    ),
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Row(
        children: [
          Container(
            height: 2.3.h,
            width: 5.3.w,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                border: Border.all(
                  width: 1,
                  color: mainPurple,
                ),
                color: sele ? mainPurple : kwhite),
            child: Center(
              child: Text(
                index,
                textAlign: TextAlign.center,
                style:
                    TextStyle(fontSize: 12, color: sele ? kwhite : mainPurple),
              ),
            ),
          ),
          wMBox,
          Expanded(
            child: Text(
              answer,
              style: TextStyle(fontSize: 10.7.sp),
            ),
          )
        ],
      ),
    ),
  );
}
