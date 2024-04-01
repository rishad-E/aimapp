import 'package:aimshala/utils/common/colors_common.dart';
import 'package:aimshala/utils/widgets/widgets_common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';

Widget buildTopContent(
    {required double bottom,
    required double coverHeight,
    required double top,
    required double profileHeight,
    required Widget profilePicWidget}) {
  return Stack(
    clipBehavior: Clip.none,
    alignment: Alignment.center,
    children: [
      Container(
        margin: EdgeInsets.only(bottom: bottom),
        child: Container(
          color: Colors.transparent,
          child: Image.asset(
            'assets/images/profile-bg.png',
            width: double.infinity,
            height: coverHeight,
            fit: BoxFit.cover,
          ),
        ),
      ),
      Positioned(top: top, child: profilePicWidget),
    ],
  );
}

Widget buildProfileImage(
        {required double profileHeight, required void Function()? onPressed}) =>
    Stack(
      alignment: Alignment.bottomRight,
      clipBehavior: Clip.none,
      children: [
        Container(
          decoration: BoxDecoration(shape: BoxShape.circle, color: kwhite),
          padding: const EdgeInsets.all(3),
          child: CircleAvatar(
            radius: profileHeight / 2,
            backgroundColor: Colors.grey.shade400,
            backgroundImage: const AssetImage('assets/images/person.png'),
          ),
        ),
        Positioned(
          top: profileHeight / 1.4,
          left: profileHeight / 1.3,
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: kwhite,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  spreadRadius: 1,
                  blurRadius: 3,
                  offset: const Offset(0, 1.2),
                ),
              ],
            ),
            child: IconButton(
              onPressed: onPressed,
              icon: Icon(
                Icons.camera_alt,
                color: kblack,
              ),
            ),
          ),
        ),
      ],
    );
Widget infoContainer({required Widget child}) => Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      margin: const EdgeInsets.only(bottom: 10),
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(8), color: kwhite),
      child: child,
    );
Widget infoText({required String text1, required String text2}) => Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
                text: text1,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 10.5.sp,
                  color: const Color.fromARGB(255, 30, 35, 44),
                )),
            WidgetSpan(child: wBox),
            TextSpan(
                text: text2,
                style: TextStyle(
                  color: const Color.fromARGB(255, 30, 35, 44),
                  fontSize: 10.5.sp,
                  // fontWeight: FontWeight.,
                )),
          ],
        ),
      ),
    );

Widget infoHeading(String text) {
  return Text(
      text,
      style:
          TextStyle(fontSize: 16, color: kpurple, fontWeight: FontWeight.w600),
    );
}

Widget contactInfos({required String text, required String svg}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 2),
    child: Row(
      // crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 20,
          width: 20,
          child: SvgPicture.asset(
            svg,
            colorFilter: ColorFilter.mode(kpurple, BlendMode.srcIn),
          ),
        ),
        wBox,
        Expanded(
          child: Text(
            text,
            style: const TextStyle(fontSize: 14),
          ),
        )
      ],
    ),
  );
}
