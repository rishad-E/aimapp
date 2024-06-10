import 'package:aimshala/utils/common/colors_common.dart';
import 'package:aimshala/utils/common/text_common.dart';
import 'package:aimshala/utils/widgets/widgets_common.dart';
import 'package:flutter/material.dart';

Widget mentoringPreference({required String mentorMode, required bool mode}) {
  return Row(
    children: [
      Container(
        height: 15,
        width: 15,
        decoration: BoxDecoration(
          color: mode == true ? mainPurple : kwhite,
          border: mode == false
              ? Border.all(
                  width: 1, color: const Color.fromARGB(255, 195, 197, 198))
              : null,
          borderRadius: BorderRadius.circular(4),
        ),
        child: mode == true
            ? Center(
                child: Icon(
                Icons.done,
                color: kwhite,
                size: 13,
              ))
            : null,
      ),
      wMBox,
      regularText(mentorMode, 11)
    ],
  );
}

Widget subjectContainerMentor({Widget? child}) => Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 10),
      decoration: BoxDecoration(
          border: Border.all(color: const Color.fromARGB(255, 173, 174, 175)),
          borderRadius: BorderRadius.circular(8)),
      child: child,
    );
Widget selectedContainerMentor({required String sub, void Function()? onTap}) {
  return Container(
    padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 10),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(16),
      color: textFieldColor.withOpacity(0.1),
    ),
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Flexible(
          child: Text(sub,
              style: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w500,
              ),
              overflow: TextOverflow.ellipsis),
        ),
        wBox,
        GestureDetector(
          onTap: onTap,
          child: Icon(
            Icons.close_rounded,
            size: 16,
            color: textFieldColor,
          ),
        )
      ],
    ),
  );
}

InputDecoration mentorPreferenceTextfield() {
  return const InputDecoration(
      isDense: true,
      border: InputBorder.none,
      hintText: 'Add more...',
      hintStyle:
          TextStyle(color: Color.fromARGB(255, 116, 118, 119), fontSize: 12));
}
