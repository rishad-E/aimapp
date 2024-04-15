import 'package:flutter/material.dart';

Widget semiBoldText({required String text}) {
  return  Text(
    text,
    style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w600),
  );
}
