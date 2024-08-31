import 'package:aimshala/controllers/aimcet_test_controller.dart';
import 'package:aimshala/utils/common/widgets/colors_common.dart';
import 'package:aimshala/utils/common/widgets/text_common.dart';
import 'package:aimshala/utils/widgets/widgets_common.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class AIMCETDialogueBox extends StatelessWidget {
  const AIMCETDialogueBox({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<AIMCETController>();
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
          Text(
            'Thank You!',
            style: TextStyle(
                fontSize: 15.sp, fontWeight: FontWeight.bold, color: kpurple),
          ),
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
              child: Obx(
                () => ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(kpurple),
                      shape: buttonShape(round: 10)),
                  onPressed: controller.isResLoading.value
                      ? null
                      : () => controller.aceTestResultFunction(),
                  child: controller.isResLoading.value
                      ? Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Fetching your Result',
                              style: TextStyle(
                                  color: kwhite,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12),
                            ),
                            wMBox,
                            CircularProgressIndicator(
                                strokeWidth: 1, color: kwhite),
                          ],
                        )
                      : Text(
                          'Click Here To Check Result',
                          style: TextStyle(
                              color: kwhite,
                              fontWeight: FontWeight.w600,
                              fontSize: 14),
                        ),
                ),
              )),
        ],
      ),
    );
  }
}
