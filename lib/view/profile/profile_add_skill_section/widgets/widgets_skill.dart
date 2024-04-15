import 'package:aimshala/utils/common/colors_common.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

Widget skillInfoFiled({required Widget text, required Widget textField}) {
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

Widget suggestedSkills(String skill) {
  return Container(
    decoration: BoxDecoration(
        color: Colors.grey.shade200, borderRadius: BorderRadius.circular(400)),
    padding: const EdgeInsets.all(5),
    child: Text(skill,style: TextStyle(color: textFieldColor,fontSize: 8.5.sp)),
  );
}

List<String> suggestedskillText = [
  'Social Media',
  'Business',
  'Advertisement',
  'Marketing',
  'Sales'
];
