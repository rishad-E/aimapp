import 'package:aimshala/utils/common/widgets/colors_common.dart';
import 'package:aimshala/utils/widgets/widgets_common.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

Widget courseInfoFiled({required Widget text, required Widget textField}) {
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

Widget currentlyWorkingCourse({required bool working}) {
  return Row(
    children: [
      Container(
        height: 1.8.h,
        width: 3.8.w,
        decoration: BoxDecoration(
          color: working ? mainPurple : kwhite,
          border: working
              ? null
              : Border.all(
                  width: 1, color: const Color.fromARGB(255, 195, 197, 198)),
          borderRadius: BorderRadius.circular(4),
        ),
        child: working
            ? Center(child: Icon(Icons.done, color: kwhite, size: 7.7.sp))
            : null,
      ),
      wBox,
      Text("I am currently working in this project",
          style: TextStyle(fontSize: 8.2.sp, color: textFieldColor))
    ],
  );
}
