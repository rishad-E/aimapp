import 'package:flutter/material.dart';

Widget contactInfoFiled({required Widget text, required Widget textField}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 3),
    child: Column(
      children: [Align(alignment: Alignment.centerLeft, child: text), textField],
    ),
  );
}

