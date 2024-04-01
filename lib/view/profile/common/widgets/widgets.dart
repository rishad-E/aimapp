import 'package:aimshala/utils/common/colors_common.dart';
import 'package:aimshala/utils/widgets/widgets_common.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

PreferredSizeWidget profileAppBar({required String title}) {
  return AppBar(
    title: Text(
      title,
      style:
          TextStyle(fontWeight: FontWeight.w600, color: kblack, fontSize: 12),
    ),
    centerTitle: true,
    surfaceTintColor: Colors.white,
    elevation: 7,
    shadowColor: Colors.black.withOpacity(0.5),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10)),
    ),
  );
}

BoxDecoration profileMainContainer() => const BoxDecoration(
      image: DecorationImage(
        image: AssetImage('assets/images/careerbgimage.png'),
        fit: BoxFit.cover,
      ),
    );

Widget profileRichText(String text1, String text2) {
  return RichText(
    text: TextSpan(
      children: [
        TextSpan(
            text: text1,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16.sp,
              color: const Color.fromARGB(255, 30, 35, 44),
            )),
        WidgetSpan(child: wBox),
        TextSpan(
            text: text2,
            style: TextStyle(
              color: const Color.fromARGB(255, 147, 38, 143),
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
            )),
      ],
    ),
  );
}
