import 'package:aimshala/utils/common/widgets/colors_common.dart';
import 'package:aimshala/utils/common/widgets/text_common.dart';
import 'package:aimshala/utils/widgets/widgets_common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';

Text careerBoldText(
    {required String text, required double size, required Color color}) {
  return Text(
    text,
    style: TextStyle(
      color: color,
      fontSize: size,
      fontWeight: FontWeight.bold,
    ),
    textAlign: TextAlign.center,
  );
}

Widget reviewRoleController({required String role}) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(22),
      color: const Color.fromARGB(255, 15, 187, 195),
    ),
    child: Text(
      role,
      textAlign: TextAlign.center,
      style:
          TextStyle(fontWeight: FontWeight.w600, fontSize: 12, color: kwhite),
    ),
  );
}

Widget reviewValContainer({required String svg, required String text}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Container(
        height: 3.5.h,
        width: 8.w,
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          // borderRadius: BorderRadius.circular(22),
          color: kpurple,
        ),
        child: SvgPicture.asset(
          svg,
        ),
      ),
      wBox,
      primarytxt2(text, 14),
    ],
  );
}

Widget reviewAimWidget({required String microAim}) {
  return Container(
    padding: const EdgeInsets.symmetric(
      vertical: 4,
      horizontal: 10,
    ),
    decoration: BoxDecoration(
      border: Border.all(color: const Color.fromARGB(255, 217, 219, 219)),
      borderRadius: BorderRadius.circular(16),
    ),
    child: Text(
      microAim,
      style: const TextStyle(
        fontSize: 12,
      ),
    ),
  );
}

Widget reviewDateContainer({required String time,required String date}) {
  return Container(
    width: double.infinity,
    alignment: Alignment.center,
    padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 10),
    decoration: BoxDecoration(
      border: Border.all(color: const Color.fromARGB(255, 217, 219, 219)),
      borderRadius: BorderRadius.circular(8),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          children: [
            careerBoldText(
              text:time,
              color: textFieldColor,
              size: 18,
            ),
            Text(
              date,
              // textAlign: TextAlign.center,
              style:  TextStyle(
                color: textFieldColor,
                fontWeight: FontWeight.w400,
                fontSize: 13,
              ),
            ),
          ],
        ),
        wMBox,
        SvgPicture.asset(
          "assets/images/calendar.svg",
        ),
      ],
    ),
  );
}

  String convertToAMPM(String timeString) {
    DateTime dateTime = DateFormat('HH:mm').parse(timeString);
    String formattedTime = DateFormat('h:mm a').format(dateTime);
    if (dateTime.hour < 10) {
      formattedTime = '0$formattedTime';
    }
    return formattedTime;
  }

   String formatDate(String inputDateString) {
    DateTime dateTime = DateTime.parse(inputDateString);
    String dayOfWeek = DateFormat.E('en_US').format(dateTime);
    int dayOfMonth = dateTime.day;
    String month = DateFormat.MMM().format(dateTime);
    String formattedDate = '$dayOfWeek, $dayOfMonth $month';
    return formattedDate;
  }