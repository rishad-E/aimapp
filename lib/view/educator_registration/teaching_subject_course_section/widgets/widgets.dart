import 'package:aimshala/utils/common/widgets/colors_common.dart';
import 'package:aimshala/utils/widgets/widgets_common.dart';
import 'package:flutter/material.dart';

Widget subjectMainContainer({Widget? child}) => Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 10),
      decoration: BoxDecoration(
          border: Border.all(color: const Color.fromARGB(255, 173, 174, 175)),
          borderRadius: BorderRadius.circular(8)),
      child: child,
    );
Widget selectedContainer({required String sub,void Function()? onTap}) {
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
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
              overflow: TextOverflow.ellipsis),
        ),
        wBox,
        GestureDetector(
          onTap:onTap ,
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

Widget addmore() {
  return const Text(" Add more...",
      style: TextStyle(color: Color.fromARGB(255, 116, 118, 119)),
      overflow: TextOverflow.ellipsis);
}
