import 'package:aimshala/utils/common/colors_common.dart';
import 'package:aimshala/utils/common/text_common.dart';
import 'package:aimshala/utils/widgets/widgets_common.dart';
import 'package:flutter/material.dart';

Widget avaliabilityDayContainer(
    {required String day, required bool selectedDay}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 3),
    child: Row(
      children: [
        Container(
          height: 15,
          width: 15,
          decoration: BoxDecoration(
            color: selectedDay == true ? mainPurple : kwhite,
            border: selectedDay == false
                ? Border.all(
                    width: 1, color: const Color.fromARGB(255, 195, 197, 198))
                : null,
            borderRadius: BorderRadius.circular(4),
          ),
          child: selectedDay == true
              ? Center(
                  child: Icon(
                  Icons.done,
                  color: kwhite,
                  size: 13,
                ))
              : null,
        ),
        wMBox,
        regularText(day, 11)
      ],
    ),
  );
}
