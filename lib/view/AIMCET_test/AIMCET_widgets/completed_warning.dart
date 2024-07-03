import 'dart:developer';

import 'package:aimshala/controllers/aimcet_test_controller.dart';
import 'package:aimshala/utils/common/widgets/colors_common.dart';
import 'package:aimshala/utils/common/widgets/text_common.dart';
import 'package:aimshala/utils/widgets/widgets_common.dart';
import 'package:aimshala/view/AIMCET_test/AIMCET_RESULT_Screen/aimcet_result_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class CompletedWarningBox extends StatelessWidget {
  final String uId;
  final String uName;
  const CompletedWarningBox({super.key, required this.uId, required this.uName});

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
            child: ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(kpurple),
                  shape: buttonShape(round: 10)),
              onPressed: () {
                // controller.aimcetTestResultFunction(
                //     userId: uId, userName: uName);
                //     Future.delayed(Duration(seconds: 3))
                // Get.off(() =>  AIMCETResultScreen(userName: uName,));
                controller.aimcetTestResultFunction(
                      userId: uId, userName: uName);
                  showDialog(
                    context: context,
                    barrierDismissible: false,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        backgroundColor: kwhite,
                        surfaceTintColor: kwhite,
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            CircularProgressIndicator(
                              color: mainPurple,
                            ),
                            hLBox,
                            primarytxt2(
                              "Your result is being processed...",
                              11.sp,
                            ),
                          ],
                        ),
                      );
                    },
                  );
                  
                  Future.delayed(const Duration(seconds: 4), () {
                    log(controller.personality[0]+controller.traitType.toString()+controller.gp.value,name: 'traaaaaaaaaaaai');
                    controller.gpReportSubmitFunction(uId: uId, personality: controller.personality[0], trait: controller.traitType.toString()).then((_) {
                      controller.fetchPersonalityReport(userId: uId);
                      controller.fetchTraitReport(userId:uId);
                    });
                    Get.off(() =>  AIMCETResultScreen(userName: uName,uId: uId));
                  });
              },
              child: Text(
                'Click Here To Check Result',
                style: TextStyle(
                    color: kwhite, fontWeight: FontWeight.w600, fontSize: 14),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
