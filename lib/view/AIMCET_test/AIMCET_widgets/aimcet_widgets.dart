import 'package:aimshala/utils/common/colors_common.dart';
import 'package:aimshala/utils/widgets/widgets_common.dart';
import 'package:flutter/material.dart';

PreferredSizeWidget aimcetAppBar() {
  return AppBar(
    backgroundColor: Colors.transparent,
    surfaceTintColor: Colors.transparent,
    title: const Text(
      "Aim CET",
      style: TextStyle(fontWeight: FontWeight.w600, fontSize: 12),
    ),
    centerTitle: true,
    actions: [
      TextButton(
        onPressed: () {},
        child: const Text(
          "apply",
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 12),
        ),
      ),
      wBox,
    ],
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

// Widget guidelineConformContainer() {
//   return Container(
//     height: 24,
//     width: 24,
//     decoration: BoxDecoration(
//       color: kwhite,
//       border:
//           Border.all(width: 1, color: const Color.fromARGB(255, 195, 197, 198)),
//       borderRadius: BorderRadius.circular(6),
//     ),
//   );
// }
