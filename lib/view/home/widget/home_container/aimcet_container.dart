import 'package:aimshala/utils/common/colors_common.dart';
import 'package:aimshala/utils/widgets/widgets_common.dart';
import 'package:aimshala/view/AIMCET_test/AIMCET_qualification_page/aimcet_qualification_screen.dart';
import 'package:aimshala/view/home/widget/texts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class AimcetContainer extends StatelessWidget {
  const AimcetContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 18),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        gradient: const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFF12054E),
            Color(0xFF37065D),
            Color(0xFF45108A),
          ],
          stops: [0.0, 0.4531, 1.0],
        ),
      ),
      // height: 44.5.h,
      // width: 40.h,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
            // color: Colors.yellow,
            height: 23.h,
            child: Image.asset('assets/images/chip.png'),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: SizedBox(
              // color: Colors.yellow,
              height: 5.8.h,
              child: SvgPicture.asset('assets/images/AimCET_LOGO.svg'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(5, 5, 5, 0),
            child: Text(
              home3Ctext,
              textAlign: TextAlign.center,
              style: TextStyle(color: kwhite, fontSize: 9.8.sp),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 12, bottom: 8),
            child: SizedBox(
                // color: Colors.yellow,
                height: 4.2.h,
                // width: 113,
                child: ElevatedButton.icon(
                  style: ButtonStyle(
                    shape: buttonShape(round: 8),
                  ),
                  onPressed: () {
                    Get.to(() => AIMCETQualificationScreen());
                  },
                  icon: Text(
                    "Take Psychometric Test",
                    style: TextStyle(
                        fontSize: 11.sp,
                        color: const Color.fromARGB(255, 147, 38, 143),
                        fontWeight: FontWeight.w600),
                  ),
                  label: Icon(
                    Icons.arrow_forward_ios_sharp,
                    size: 11.sp,
                    color: const Color.fromARGB(255, 147, 38, 143),
                  ),
                )),
          )
        ],
      ),
    );
  }
}
