import 'package:aimshala/utils/common/widgets/colors_common.dart';
import 'package:aimshala/utils/common/widgets/text_common.dart';
import 'package:aimshala/utils/widgets/widgets_common.dart';
import 'package:flutter/material.dart';

Widget rewardTrueMentor({required bool? relocate}) {
  return Row(
    children: [
      Container(
        height: 18,
        width: 18,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
                color: relocate == true ? mainPurple : buttonColor,
                width: 1)),
        child: relocate == true
            ? Container(
                margin: const EdgeInsets.all(3.5),
                decoration:
                    BoxDecoration(color: mainPurple, shape: BoxShape.circle),
              )
            : null,
      ),
      wBox,
      regularText('Yes', 16)
    ],
  );
}

Widget rewardFalseMentor({required bool? relocate}) {
  return Row(
    children: [
      Container(
        height: 18,
        width: 18,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
                color: relocate == false ? mainPurple : buttonColor,
                width: 1)),
        child: relocate == false
            ? Container(
                margin: const EdgeInsets.all(3.5),
                decoration:
                    BoxDecoration(color: mainPurple, shape: BoxShape.circle),
              )
            : null,
      ),
      wBox,
      regularText('No', 16)
    ],
  );
}
