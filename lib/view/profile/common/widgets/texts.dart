import 'package:flutter/material.dart';

Widget semiBoldText({required String text}) {
  return Text(
    text,
    style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w600),
  );
}

Widget semiBoldChoiceText(
    {required String text, double? size, TextAlign? textAlign}) {
  return Text(
    text,
    style: TextStyle(fontSize: size, fontWeight: FontWeight.w600),
    textAlign: textAlign,
  );
}
