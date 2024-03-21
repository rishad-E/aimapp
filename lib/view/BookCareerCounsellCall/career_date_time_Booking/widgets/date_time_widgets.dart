import 'package:aimshala/utils/common/colors_common.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';

Widget dateFotmatBox(String inputDateString,
    {Color? colorbb, Color? colortext}) {
  DateTime dateTime = DateTime.parse(inputDateString);

  // Format the date to get the abbreviated day of the week (e.g., "Tue")
  String dayOfWeek = DateFormat.E('en_US').format(dateTime);
  // Extract the day of the month as an integer
  int dayOfMonth = dateTime.day;
  // Define styles for day of the week and day of the month
  TextStyle dayOfWeekStyle = TextStyle(
    color: colortext,
    fontSize: 11,
    fontWeight: FontWeight.w400,
  );

  TextStyle dayOfMonthStyle = TextStyle(
    color: colortext,
    fontSize: 14,
    fontWeight: FontWeight.bold,
  );

  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(12),
      color: colorbb,
      border:
          Border.all(color: const Color.fromARGB(255, 247, 245, 245), width: 1),
    ),
    width: 10.5.w,
    margin: const EdgeInsets.symmetric(horizontal: 7),
    child: Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          dayOfWeek,
          style: dayOfWeekStyle,
        ),
        Text(
          '$dayOfMonth',
          style: dayOfMonthStyle,
        ),
      ],
    )),
  );
}

Widget timeContainer(
    {required String timeData,
    Color? colortext,
    Color? colorbb,
    bool? select}) {
  return Container(
    width: 19.5.w,
    // height: 40,
    padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 8),
    decoration: BoxDecoration(
      color: colorbb,
      borderRadius: BorderRadius.circular(12),
      border: select == false
          ? Border.all(
              color: const Color.fromARGB(255, 229, 226, 226), width: 1)
          : Border.all(color: kwhite),
    ),
    child: Text(
      timeData,
      textAlign: TextAlign.center,
      style: TextStyle(fontSize: 12, color: colortext),
    ),
  );
}

Widget backForth(Icon icon) {
  return Container(
    decoration: BoxDecoration(
      color: const Color.fromARGB(255, 247, 245, 245),
      borderRadius: BorderRadius.circular(8),
    ),
    height: 25,
    width: 25,
    child:icon
  );
}
