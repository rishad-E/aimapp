
import 'package:aimshala/utils/common/colors_common.dart';
import 'package:aimshala/utils/widgets/widgets_common.dart';
import 'package:flutter/material.dart';

Widget selectedSkillEX({required String skill, required Function()? onTap}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: textFieldColor.withOpacity(0.1),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Flexible(
            child: Text(
              skill,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,color: kblack
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          wBox,
          Icon(
            Icons.close_rounded,
            size: 16,
            color: textFieldColor,
          )
        ],
      ),
    ),
  );
}