import 'package:aimshala/utils/common/colors_common.dart';
import 'package:aimshala/utils/widgets/widgets_common.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

Widget volunteerInfoFiled(
    {required Widget text, required Widget textField}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 3),
    child: Column(
      children: [
        Align(alignment: Alignment.centerLeft, child: text),
        textField
      ],
    ),
  );
}


Widget currentlyWorkingVolunteer() {
  return Row(
    children: [
      Container(
          height: 1.8.h,
          width: 3.8.w,
          decoration: BoxDecoration(
            color: mainPurple,
            borderRadius: BorderRadius.circular(4),
          ),
          child: Center(
              child: Icon(
            Icons.done,
            color: kwhite,
            size: 7.7.sp,
          ))),
      wBox,
      Text("I am currently volunteering in this role",
          style: TextStyle(fontSize: 8.2.sp, color: textFieldColor))
    ],
  );
}