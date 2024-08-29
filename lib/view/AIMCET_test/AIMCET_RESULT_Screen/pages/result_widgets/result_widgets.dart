import 'package:aimshala/utils/widgets/widgets_common.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

Widget reportHeadears({String? tex1t, String? text2}) {
  return Row(
    children: [
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: RichText(
          text: TextSpan(
            children: [
              TextSpan(
                  text: tex1t,
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 15.5.sp,
                    color: const Color.fromARGB(255, 30, 35, 44),
                  )),
              WidgetSpan(child: wBox),
              TextSpan(
                  text: text2,
                  style: TextStyle(
                    color: const Color.fromARGB(255, 30, 35, 44),
                    fontSize: 15.5.sp,
                    fontWeight: FontWeight.w600,
                  )),
            ],
          ),
        ),
      ),
      const Expanded(
        child: Divider(
          color: Colors.yellow,
          thickness: 3,
        ),
      ),
    ],
  );
}
