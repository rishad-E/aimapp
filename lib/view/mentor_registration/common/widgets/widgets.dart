import 'package:aimshala/utils/common/colors_common.dart';
import 'package:flutter/material.dart';

PreferredSizeWidget mentorAppbar({required String title}) {
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

Widget mentorFields({required Widget item, required Widget textfiled}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 3),
    child: Column(
      children: [
        Align(alignment: Alignment.centerLeft, child: item),
        textfiled
      ],
    ),
  );
}

Widget mentorBGContainer({Widget? child}) => Container(
      height: double.infinity,
      width: double.infinity,
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/careerbgimage.png'),
              fit: BoxFit.cover)),
      child: child,
    );

Widget mentorSectionContainer({Widget? child}) {
  return Container(
    decoration: BoxDecoration(
      borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(24), topRight: Radius.circular(24)),
      color: kwhite,
    ),
    width: double.infinity,
    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
    margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
    child: child,
  );
}
