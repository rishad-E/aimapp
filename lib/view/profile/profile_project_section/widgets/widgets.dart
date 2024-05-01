import 'dart:io';

import 'package:aimshala/utils/common/colors_common.dart';
import 'package:aimshala/utils/common/text_common.dart';
import 'package:aimshala/utils/widgets/widgets_common.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

Widget projectInfoFiled({required Widget text, required Widget textField}) {
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

Widget addedskillHomeProject(String skill) {
  return Container(
    margin: const EdgeInsets.symmetric(vertical: 3),
    width: double.infinity,
    decoration: BoxDecoration(
        color: Colors.grey.shade200, borderRadius: BorderRadius.circular(4)),
    padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 3),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Icon(
              Icons.close,
              size: 12.sp,
              color: textFieldColor,
            ),
            wBox,
            Text(
              skill,
              style: TextStyle(fontSize: 9.sp),
            )
          ],
        ),
        Icon(
          Icons.menu,
          size: 12.sp,
        )
      ],
    ),
  );
}

Widget addedMediaHomeProject(File file,void Function()? onTap) {
  return Container(
    margin: const EdgeInsets.symmetric(vertical: 3),
    width: double.infinity,
    decoration: BoxDecoration(
        color: Colors.grey.shade200, borderRadius: BorderRadius.circular(4)),
    padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            GestureDetector(
              onTap: onTap,
              child: Icon(
                Icons.close,
                size: 12.sp,
                color: textFieldColor,
              ),
            ),
            wBox,
             SizedBox(
              height: 29,
              width: 45,
              child: Image.file(
                file,
                fit: BoxFit.fill,
              ),
            ),
            wBox,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                regularText('Physician (General Practitioner)', 12),
                regularText('Physician (General Practitioner)', 8),
              ],
            )
          ],
        ),
        Icon(
          Icons.menu,
          size: 12.sp,
        )
      ],
    ),
  );
}


Widget projectAdditional(
    {required String heading,
    required String subText,
    String? secSub,
    void Function()? onTap,
    required Widget selected}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 5),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          heading,
          style: TextStyle(fontSize: 9.sp, fontWeight: FontWeight.w600),
        ),
        hBox,
        Text(
          subText,
          style: TextStyle(
              color: const Color.fromARGB(255, 132, 131, 131),
              fontSize: 9.sp,
              fontWeight: FontWeight.w400),
        ),
        secSub != null
            ? Text(
                secSub,
                style: TextStyle(
                    color: mainPurple,
                    fontSize: 9.sp,
                    fontWeight: FontWeight.w400),
              )
            : const SizedBox.shrink(),
        selected,
        hBox,
        GestureDetector(
          onTap: onTap,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(400),
                color: const Color.fromARGB(24, 185, 78, 182)),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.add, color: mainPurple),
                Text(
                  "Add $heading",
                  style: TextStyle(
                      fontSize: 9.sp,
                      color: mainPurple,
                      fontWeight: FontWeight.w400),
                ),
              ],
            ),
          ),
        )
      ],
    ),
  );
}



Widget currentlyWorkingProject() {
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
      Text("I am currently working in this role",
          style: TextStyle(fontSize: 8.2.sp, color: textFieldColor))
    ],
  );
}


Widget selectedPSkill({required String skill, required Function()? onTap}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: textFieldColor.withOpacity(0.1),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Flexible(
            child: Text(
              skill,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,color: kblack
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          wBox,
          Icon(
            Icons.close_rounded,
            size: 16,
            color: textFieldColor,
          )
        ],
      ),
    ),
  );
}

Widget projectMediaInfoFiled({required Widget text, required Widget textField}) {
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


Widget projectMediaListTile(
    {required String title, void Function()? onTap, Widget? leading}) {
  return ListTile(
    leading: leading,
    title: Text(
      title,
      style: const TextStyle(fontSize: 14),
    ),
    onTap: onTap,
    horizontalTitleGap: 5,
    shape: const Border(
        bottom: BorderSide(color: Color.fromARGB(255, 202, 201, 201))),
    contentPadding: EdgeInsets.zero,
  );
}