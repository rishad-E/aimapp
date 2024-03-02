import 'package:aimshala/utils/common/colors_common.dart';
import 'package:aimshala/utils/common/text_common.dart';
import 'package:aimshala/utils/widgets/widgets_common.dart';
import 'package:aimshala/view/AIMCET_test/AIMCET_RESULT_Screen/aimcet_result_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class AIMCETDialogueBox extends StatelessWidget {
  const AIMCETDialogueBox({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: kwhite,
      surfaceTintColor: kwhite,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircleAvatar(
            radius: 55.sp,
            backgroundColor: kwhite,
            backgroundImage: const AssetImage('assets/images/person.png'),
          ),
          hMBox,
          Text('Thank You!',
              style: TextStyle(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.bold,
                  color: kpurple)),
          hMBox,
          primarytxt2(
              "For taking the time to complete our Aim CET Your responses will help us tailor Aimshala's offerings to best suit your needs and aspirations.",
              11.sp),
          hBox,
          hMBox,
          Container(
            width: double.infinity,
            height: 4.5.h,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(15),
              ),
            ),
            child: ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(kpurple),
                  shape: buttonShape(round: 10)),
              onPressed: () {
                Get.off(() => const AIMCETResultScreen());
              },
              child: Text(
                'Click Here To Check Result',
                style: TextStyle(color: kwhite,fontWeight: FontWeight.w600,fontSize: 14),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
