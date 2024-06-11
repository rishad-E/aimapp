import 'package:aimshala/utils/common/widgets/colors_common.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class AmyBotRadialColor extends StatelessWidget {
  const AmyBotRadialColor({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        Stack(
          alignment: Alignment.center,
          clipBehavior: Clip.none,
          children: [
            Container(
              //   height: 10.5.h,
              //  width: 25.5.w,
              width: 25.5.w,
              height: 12.h,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [
                    const Color.fromARGB(255, 15, 187, 195).withOpacity(0.4),
                    kwhite.withOpacity(0.3),
                  ],
                  radius: 0.5,
                ),
              ),
            ),
            Positioned(
              left: 50,
              child: Container(
                width: 25.5.w,
                height: 12.h,
                //   height: 10.5.h,
                //  width: 25.5.w,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: RadialGradient(
                    colors: [
                      const Color.fromARGB(255, 147, 38, 143).withOpacity(0.4),
                      kwhite.withOpacity(0.3),
                    ],
                    radius: 0.5,
                  ),
                ),
              ),
            ),
          ],
        ),
        Positioned(
          left: 23,
          top: 12,
          child: Container(
            height: 10.5.h,
            width: 25.5.w,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: kwhite,
              image: const DecorationImage(
                image: AssetImage('assets/images/person.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
