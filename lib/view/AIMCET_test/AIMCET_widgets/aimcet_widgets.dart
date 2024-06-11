import 'package:aimshala/utils/common/widgets/colors_common.dart';
import 'package:aimshala/utils/widgets/widgets_common.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

PreferredSizeWidget aimcetAppBar() {
  return AppBar(
    // backgroundColor: Colors.yellow,
    surfaceTintColor: Colors.white,
    elevation: 7,
    shadowColor: Colors.black.withOpacity(0.5),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10)),
    ),
    title: const Text(
      "Aim CET",
      style: TextStyle(fontWeight: FontWeight.w600, fontSize: 12),
    ),
    centerTitle: true,
  );
}

BoxDecoration aimcetMainContainerdecoration() {
  return const BoxDecoration(
    image: DecorationImage(
        image: AssetImage('assets/images/careerbgimage.png'),
        fit: BoxFit.cover),
  );
}

InputDecoration aimCETTextFiled(
    {String? hintText, Widget? suffixWidget, Widget? prefixWidget}) {
  return InputDecoration(
    hintText: hintText,
    prefixIconConstraints: const BoxConstraints(minHeight: 25, minWidth: 25),
    suffixIcon: suffixWidget,
    // prefix:prefixWidget ,
    prefixIcon: prefixWidget,
    contentPadding: const EdgeInsets.symmetric(vertical: 2, horizontal: 10),
    hintStyle: TextStyle(
      color: kblack.withOpacity(0.4),
      fontSize: 14,
      fontWeight: FontWeight.w400,
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: Colors.red),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: Colors.red),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(color: kblack.withOpacity(0.3)),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(color: kblack.withOpacity(0.3)),
    ),
  );
}

Decoration guidelineContainerDecoration() {
  return BoxDecoration(
    color: kwhite,
    border:
        Border.all(width: 1, color: const Color.fromARGB(255, 195, 197, 198)),
    borderRadius: BorderRadius.circular(9),
  );
}

Decoration guidelineSecContainerDecoration() {
  return const BoxDecoration(
    color: Color.fromARGB(255, 247, 247, 247),
    borderRadius: BorderRadius.only(
      topLeft: Radius.circular(9),
      topRight: Radius.circular(9),
    ),
  );
}

PreferredSizeWidget aimcetResultAppBar() {
  return AppBar(
    surfaceTintColor: Colors.white,
    elevation: 7,
    iconTheme: IconThemeData(color: mainPurple),
    shadowColor: Colors.black.withOpacity(0.5),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10)),
    ),
    title: const Text(
      "Aim CET Results",
      style: TextStyle(fontWeight: FontWeight.w600, fontSize: 12),
    ),
    centerTitle: true,
  );
}

Widget personalityTwoText({required String text1, required String text2}) {
  return RichText(
    text: TextSpan(
      children: [
        TextSpan(
            text: text1,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 15.4.sp,
              color: const Color.fromARGB(255, 30, 35, 44),
            )),
        WidgetSpan(child: wBox),
        TextSpan(
            text: text2,
            style: TextStyle(
              color: const Color.fromARGB(255, 147, 38, 143),
              fontSize: 15.4.sp,
              fontWeight: FontWeight.w600,
            )),
      ],
    ),
  );
}

BoxDecoration report3Container() {
  return const BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        Color.fromRGBO(255, 245, 255, 1.0),
        Color.fromRGBO(241, 248, 248, 1.0),
      ],
      stops: [0.0, 1.0],
    ),
  );
}

BoxDecoration colorGradient3() {
  return const BoxDecoration(
      gradient: LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color.fromRGBO(255, 247, 255, 1.0),
      Color.fromRGBO(241, 248, 248, 1.0),
      Color.fromRGBO(255, 247, 255, 1.0),
    ],
    stops: [0.0, 0.5, 1.0],
  ));
}

BoxDecoration personalityTrairContainerGradient() {
  return const BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        Color.fromRGBO(241, 248, 248, 1.0),
        Color.fromRGBO(255, 245, 255, 1.0),
      ],
      stops: [0.0, 1.0],
    ),
  );
}
