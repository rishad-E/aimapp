import 'package:aimshala/utils/common/text_common.dart';
import 'package:aimshala/utils/widgets/widgets_common.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

ShapeBorder appBarBorder() {
  return const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
    bottomLeft: Radius.circular(15),
    bottomRight: Radius.circular(15),
  ));
}

PreferredSizeWidget appbarc() {
  return AppBar(
    toolbarHeight: 70,
    // backgroundColor: Colors.transparent,
    surfaceTintColor: Colors.transparent,
    shape: appBarBorder(),
    leading: IconButton(onPressed: () {}, icon: const Icon(Icons.menu)),
    title: primarytxt3('Hi,Sachin', 14.sp),
    actions: [
      IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.notifications_active_outlined,
            size: 19.sp,
          )),
      const SizedBox(
        // color: Colors.yellow,
        height: 26,
        width: 26,
        // child: SvgPicture.asset(
        //   'assets/images/Vector.svg',
        // ),
        // child: Image.asset('assets/images/person.png',fit: BoxFit.cover,),
      ),
      wBox,
      const SizedBox(
        height: 26,
        width: 26,
        // color: Colors.red,
       
        // child: SvgPicture.asset('assets/images/Vector.svg'),
      ),
      wMBox
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
                    fontWeight: FontWeight.w700,
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
                      fontSize:  15.5.sp,
                      fontWeight: FontWeight.w700,
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
