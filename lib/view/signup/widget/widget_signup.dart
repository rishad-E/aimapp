import 'package:aimshala/utils/common/colors_common.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

Widget signUPContainer({
  required BuildContext context,
  required Widget textfield,
  required Widget twoText,
  required Widget fieldText,
  Widget? button,
  ButtonStyle? style,
}) {
  return Container(
    padding: const EdgeInsets.only(top: 8, bottom: 8),
    decoration: BoxDecoration(
      borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(15), topRight: Radius.circular(15)),
      color: kwhite,
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        twoText,
        fieldText,
        textfield,
        Container(
          width: 79.w,
          height: 4.5.h,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(15),
            ),
          ),
          child: button,
        ),
      ],
    ),
  );
}

InputDecoration roleContainer({String? hintText, Widget? suffixWidget}) {
  return InputDecoration(
    hintText: hintText,
    suffixIcon: suffixWidget,
    contentPadding: const EdgeInsets.symmetric(vertical: 2, horizontal: 10),
    hintStyle: TextStyle(color: kblack.withOpacity(0.4), fontSize: 14),
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

Widget signupBox({required Widget text, required Widget textField}) {
  return Column(
    children: [Align(alignment: Alignment.centerLeft, child: text), textField],
  );
}
