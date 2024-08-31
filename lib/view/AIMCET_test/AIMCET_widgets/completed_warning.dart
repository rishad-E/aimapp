import 'package:aimshala/controllers/aimcet_test_controller.dart';
import 'package:aimshala/utils/common/widgets/colors_common.dart';
import 'package:aimshala/utils/common/widgets/text_common.dart';
import 'package:aimshala/utils/widgets/widgets_common.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class CompletedWarningBox extends StatelessWidget {
  final String uName;
  const CompletedWarningBox({super.key, required this.uName});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AIMCETController());
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 55.sp,
            backgroundColor: kwhite,
            backgroundImage: const AssetImage('assets/images/person.png'),
          ),
          hBox,
          Text(
            'Thank You!',
            style: TextStyle(
                fontSize: 15.sp, fontWeight: FontWeight.bold, color: kpurple),
          ),
          primarytxt2(
            "You have already Completed this Section.",
            11.sp,
          ),
          hMBox,
          Container(
              // width: double.infinity,
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
