import 'package:aimshala/utils/common/colors_common.dart';
import 'package:flutter/material.dart';

SizedBox wBox = const SizedBox(width: 5);
SizedBox hBox = const SizedBox(height: 5);
SizedBox wMBox = const SizedBox(width: 15);
SizedBox hMBox = const SizedBox(height: 15);
SizedBox hLBox = const SizedBox(height: 25);

SizedBox shrinked = const SizedBox.shrink();

InputDecoration decorTextfield(
    {String? labeltext, Widget? prefixWidget, String? hintText}) {
  return InputDecoration(
    counterText: '',
    isDense: true,
    contentPadding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
    hintText: hintText,
    labelText: labeltext,
    hintStyle: TextStyle(
        color: kblack.withOpacity(0.4),
        fontSize: 14,
        fontWeight: FontWeight.w400),
    prefixIcon: Padding(
      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
      child: prefixWidget,
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(13),
      borderSide: const BorderSide(color: Colors.red),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(13),
      borderSide: const BorderSide(color: Colors.red),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(13),
      borderSide: BorderSide(color: mainPurple),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(13),
      borderSide: BorderSide(color: kblack.withOpacity(0.3)),
    ),
  );
}

Widget appbarContainer({required void Function()? onPressed}) {
  return Container(
    height: 40, width: 40,
    // margin: EdgeInsets.fromLTRB(15, 0, 10, 0),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      color: kwhite,
      boxShadow: const [
        BoxShadow(
          color: Color.fromARGB(255, 234, 232, 232),
          spreadRadius: 0,
          blurRadius: 0,
          offset: Offset(0, 1),
        ),
      ],
    ),
    child: IconButton(
        onPressed: onPressed,
        icon: Icon(
          Icons.arrow_back_rounded,
          color: kpurple,
        )),
  );
}

MaterialStateProperty<OutlinedBorder?> buttonShape({required double round}) {
  return MaterialStateProperty.all<RoundedRectangleBorder>(
    RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(round),
    ),
  );
}
