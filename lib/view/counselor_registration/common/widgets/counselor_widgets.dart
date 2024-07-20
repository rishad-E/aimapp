import 'package:aimshala/utils/common/widgets/colors_common.dart';
import 'package:aimshala/utils/common/widgets/text_common.dart';
import 'package:aimshala/utils/widgets/widgets_common.dart';
import 'package:aimshala/view/profile/common/widgets/texts.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

PreferredSizeWidget counselorAppBar({required bool backArrow}) {
  return AppBar(
    title: Text(
      'Counselor Registration',
      style:
          TextStyle(fontWeight: FontWeight.w600, color: kblack, fontSize: 12),
    ),
    centerTitle: true,
    surfaceTintColor: Colors.white,
    elevation: 7,
    automaticallyImplyLeading: backArrow,
    shadowColor: Colors.black.withOpacity(0.5),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10)),
    ),
  );
}

Widget counselorContainer({required Widget child}){
  return Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/careerbgimage.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: kwhite,
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(24),
                      topRight: Radius.circular(24)),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
                margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
                width: double.infinity,
                child: child
              ),
            ],
          ),
        ),
      );
}

Widget counselorRichText({required String text1, required String text2}) {
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

Widget counselorFields({required String fieldItem, required Widget textfiled}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 3),
    child: Column(
      children: [
        Align(alignment: Alignment.centerLeft, child: semiBoldChoiceText(text: fieldItem, size: 9.sp),),
        textfiled
      ],
    ),
  );
}

Widget checkBoxContainer(
    {required String item, required bool selected}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 3),
    child: Row(
      children: [
        Container(
          height: 15,
          width: 15,
          decoration: BoxDecoration(
            color: selected == true ? mainPurple : kwhite,
            border: selected == false
                ? Border.all(
                    width: 1, color: const Color.fromARGB(255, 195, 197, 198))
                : null,
            borderRadius: BorderRadius.circular(4),
          ),
          child: selected == true
              ? Center(
                  child: Icon(
                  Icons.done,
                  color: kwhite,
                  size: 13,
                ))
              : null,
        ),
        wMBox,
        regularText(item, 11)
      ],
    ),
  );
}
