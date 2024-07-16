import 'package:aimshala/utils/common/widgets/colors_common.dart';
import 'package:aimshala/utils/common/widgets/text_common.dart';
import 'package:aimshala/utils/widgets/widgets_common.dart';
import 'package:flutter/material.dart';

Widget relocateTrueContainer({required bool? relocate}) {
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

Widget relocateFalseContainer({required bool? relocate}) {
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

Widget workModelContainer({required String workMode, required bool work}) {
  return Row(
    children: [
      Container(
        height: 15,
        width: 15,
        decoration: BoxDecoration(
          color: work == true ? mainPurple : kwhite,
          border: work == false
              ? Border.all(
                  width: 1, color: const Color.fromARGB(255, 195, 197, 198))
              : null,
          borderRadius: BorderRadius.circular(4),
        ),
        child: work == true
            ? Center(
                child: Icon(
                Icons.done,
                color: kwhite,
                size: 13,
              ))
            : null,
      ),
      wMBox,
      regularText(workMode, 11)
    ],
  );
}
