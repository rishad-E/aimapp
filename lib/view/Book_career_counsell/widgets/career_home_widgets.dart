import 'package:aimshala/utils/common/colors_common.dart';
import 'package:flutter/material.dart';

Decoration boxdecoration(double radius) {
  return  BoxDecoration(
    borderRadius: BorderRadius.all(
      Radius.circular(radius),
    ),
  );
}

Widget careerHomeField({required Widget text, required Widget textField}) {
  return Column(
    children: [Align(alignment: Alignment.centerLeft, child: text), textField],
  );
}

InputDecoration careerTextFiled({String? hintText, Widget? suffixWidget,Widget? prefixWidget}) {
  return InputDecoration(
    hintText: hintText,
    suffixIcon: suffixWidget,
    prefixIcon:prefixWidget ,
    contentPadding: const EdgeInsets.symmetric(vertical: 2, horizontal: 10),
    hintStyle: TextStyle(
      color: kblack.withOpacity(0.4),
      fontSize: 14,
      fontWeight: FontWeight.w400,
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: Colors.red),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: Colors.red),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: Colors.purple),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(color: kblack.withOpacity(0.3)),
    ),
  );
}
