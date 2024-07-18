import 'package:aimshala/utils/common/widgets/colors_common.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

Widget contactInfoFiled({required Widget text, required Widget textField}) {
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

Widget changePhoneWidget({required void Function()? onPressed,required String text}) {
  return TextButton(
    onPressed:onPressed,
    child: Text(
    text,
      style: TextStyle(color: mainPurple, fontSize: 9.sp),
    ),
  );
}
