import 'package:aimshala/utils/common/colors_common.dart';
import 'package:aimshala/utils/widgets/widgets_common.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

PreferredSizeWidget profileAppBar(
    {required String title, required Widget doneWidget}) {
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
    actions: [doneWidget, wBox],
  );
}

BoxDecoration profileMainContainer() => const BoxDecoration(
      image: DecorationImage(
        image: AssetImage('assets/images/careerbgimage.png'),
        fit: BoxFit.cover,
      ),
    );

BoxDecoration profileSecondaryContainer() => BoxDecoration(
      borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(24), topRight: Radius.circular(24)),
      color: kwhite,
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

InputDecoration infoFieldDecoration(
    {String? hintText, Widget? suffixWidget, bool? fill, Widget? prefix}) {
  return InputDecoration(
    hintText: hintText,
    // isDense: true,
    filled: fill,
    prefixIcon: prefix,
    fillColor: fill == true
        ? const Color.fromARGB(255, 116, 118, 119).withOpacity(0.2)
        : null,
    suffixIcon: suffixWidget,
    contentPadding: const EdgeInsets.symmetric(horizontal: 10,vertical: 8),
    hintStyle: TextStyle(
        color: kblack.withOpacity(0.4),
        fontSize: 12,
        height: 1.2,
        fontWeight: FontWeight.w400),
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
      borderSide: const BorderSide(color: Colors.purple),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(color: kblack.withOpacity(0.3)),
    ),
  );
}

Widget actionContainer(
    {required String text,
    required Color textColor,
    Color? borderColor,
    required Color boxColor,
    void Function()? onTap}) {
  return Expanded(
    child: GestureDetector(
      onTap: onTap,
      child: Container(
        height: 4.h,
        decoration: BoxDecoration(
          color: boxColor,
          border: borderColor != null
              ? Border.all(width: 1, color: borderColor)
              : null,
          borderRadius: BorderRadius.circular(6),
        ),
        child: Center(
            child: Text(
          text,
          style: TextStyle(
              color: textColor, fontWeight: FontWeight.w600, fontSize: 14),
        )),
      ),
    ),
  );
}
