import 'package:aimshala/utils/common/colors_common.dart';
import 'package:flutter/material.dart';

Widget perosnalInfoFiled({required Widget text, required Widget textField}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 3),
    child: Column(
      children: [Align(alignment: Alignment.centerLeft, child: text), textField],
    ),
  );
}

InputDecoration infoFieldDecoration({String? hintText, Widget? suffixWidget}) {
  return InputDecoration(
    hintText: hintText,
    suffixIcon: suffixWidget,
    contentPadding: const EdgeInsets.symmetric(vertical: 2, horizontal: 10),
    hintStyle: TextStyle(color: kblack.withOpacity(0.4), fontSize: 14,fontWeight: FontWeight.w500),
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
