import 'dart:developer';

import 'package:aimshala/utils/common/widgets/colors_common.dart';
import 'package:aimshala/utils/common/widgets/text_common.dart';
import 'package:aimshala/utils/widgets/widgets_common.dart';
import 'package:aimshala/view/chatbot/amy_chat_screen.dart';
import 'package:aimshala/view/temp.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

ShapeBorder appBarBorder() {
  return const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
    bottomLeft: Radius.circular(15),
    bottomRight: Radius.circular(15),
  ));
}

PreferredSizeWidget appbarHome({String? name}) {
  return AppBar(
    surfaceTintColor: Colors.transparent,
    shape: appBarBorder(),
    leading: Builder(
        builder: (context) => IconButton(
              onPressed: () => Scaffold.of(context).openDrawer(),
              icon: const Icon(Icons.menu),
            )),
    title: primarytxt3(name == null ? 'Hi, ' : 'Hi, $name', 14.sp),
    titleSpacing: 0,
    actions: [
      Padding(
        padding: const EdgeInsets.only(top: 5),
        child: Stack(
          // alignment: AlignmentDirectional.topEnd,
          children: [
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.notifications_active_outlined,
                size: 19.5.sp,
              ),
            ),
            Positioned(
              top: 12,
              right: 12,
              child: Container(
                width: 12,
                height: 12,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.red,
                ),
              ),
            ),
          ],
        ),
      ),
      wBox,
      GestureDetector(
        onTap: () {
          log('talk to amy', name: 'chat screen');
          Get.to(() => const AmyChatBotScreen());
        },
        child: Container(
          width: 30,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
          ),
          child: Image.asset('assets/images/appbarWomen2.png'),
        ),
      ),
      wMBox,
      Padding(
        padding: const EdgeInsets.only(top: 5),
        child: GestureDetector(
          onTap: () {
            log('temp screen', name: 'temp screen');
            Get.to(() => TempScreen(name: name ?? ''));
          },
          child: Container(
            // width: 30,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: const Color.fromARGB(255, 215, 211, 211),
                width: 1,
              ),
            ),
            child: CircleAvatar(
              radius: 13,
              backgroundColor: kwhite,
              backgroundImage: const AssetImage('assets/images/appbarMen.png'),
            ),
          ),
        ),
      ),
      const SizedBox(width: 20)
    ],
  );
}

Widget headersHome(
    {String? text1, String? text2, Color? divColor, Color? textC}) {
  return Row(
    children: [
      Container(
        color: Colors.yellow,
        height: 4.h,
        width: 0,
        child: VerticalDivider(
          thickness: 3,
          color: divColor ?? Colors.yellow,
        ),
      ),
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: RichText(
          text: TextSpan(
            children: [
              TextSpan(
                  text: text1,
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 15.5.sp,
                    color: textC ?? const Color.fromARGB(255, 30, 35, 44),
                  )),
              WidgetSpan(child: wBox),
              TextSpan(
                  text: text2,
                  style: TextStyle(
                    color: textC ?? const Color.fromARGB(255, 30, 35, 44),
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

Widget headersHome2(
    {String? text1, String? text2, Color? divColor, Color? textC}) {
  return Padding(
    padding: const EdgeInsets.only(right: 15),
    child: Row(
      children: [
        SizedBox(
          height: 4.h,
          width: 0,
          child: VerticalDivider(
            thickness: 3,
            color: divColor ?? Colors.yellow,
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                    text: text1,
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 15.5.sp,
                      color: textC ?? const Color.fromARGB(255, 30, 35, 44),
                    )),
                WidgetSpan(child: wBox),
                TextSpan(
                    text: text2,
                    style: TextStyle(
                      color: textC ?? const Color.fromARGB(255, 30, 35, 44),
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
        wBox,
        Text(
          "See All",
          style: TextStyle(
              fontSize: 9.5.sp,
              fontWeight: FontWeight.w600,
              color: const Color.fromARGB(255, 147, 38, 143)),
        )
      ],
    ),
  );
}
