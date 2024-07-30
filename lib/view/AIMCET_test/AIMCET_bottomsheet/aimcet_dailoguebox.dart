// ignore_for_file: use_build_context_synchronously

import 'package:aimshala/controllers/aimcet_test_controller.dart';
import 'package:aimshala/utils/common/widgets/colors_common.dart';
import 'package:aimshala/utils/common/widgets/text_common.dart';
import 'package:aimshala/utils/widgets/widgets_common.dart';
import 'package:aimshala/view/AIMCET_test/AIMCET_RESULT_Screen/aimcet_result_page.dart';
import 'package:aimshala/view/home/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class AIMCETDialogueBox extends StatelessWidget {
  final String userId;
  final String userName;
  const AIMCETDialogueBox(
      {super.key, required this.userId, required this.userName});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AIMCETController());
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
            child: ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(kpurple),
                  shape: buttonShape(round: 10)),
              onPressed: () async {
                try {
                  await controller.aimcetTestResultFunction(
                      userId: userId, userName: userName);

                  // Show the dialog with CircularProgressIndicator for 5 seconds
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
                                color: mainPurple, strokeWidth: 1),
                            hLBox,
                            primarytxt2(
                                "Your result is being processed...", 11.sp),
                          ],
                        ),
                      );
                    },
                  );
                  await Future.delayed(const Duration(seconds: 5));
                  // Call gpReportSubmitFunction
                  await controller
                      .gpReportSubmitFunction(
                    uId: userId,
                    personality: controller.personality[0],
                    trait: controller.traitType.toString(),
                  )
                      .then((_) async {
                    // Call fetchPersonalityReport and fetchTraitReport
                    await Future.wait([
                      controller.fetchPersonalityReport(userId: userId),
                      controller.fetchTraitReport(userId: userId),
                    ]);
                  });

                  // Navigate to AIMCETResultScreen
                  Get.off(() =>
                      AIMCETResultScreen(userName: userName, uId: userId));
                } catch (e) {
                  Get.snackbar(
                    'Error',
                    'An error occurred: ${e.toString()}',
                    snackPosition: SnackPosition.TOP,
                    backgroundColor: Colors.red,
                    colorText: Colors.white,
                  );
                  // Navigate to the homepage
                  Get.offAll(() => const HomeScreen());
                }
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
 // controller.aimcetTestResultFunction(
                //     userId: userId, userName: userName);
                // showDialog(
                //   context: context,
                //   barrierDismissible: false,
                //   builder: (BuildContext context) {
                //     return AlertDialog(
                //       backgroundColor: kwhite,
                //       surfaceTintColor: kwhite,
                //       content: Column(
                //         mainAxisSize: MainAxisSize.min,
                //         children: [
                //           CircularProgressIndicator(
                //             color: mainPurple,
                //           ),
                //           hLBox,
                //           primarytxt2(
                //             "Your result is being processed...",
                //             11.sp,
                //           ),
                //         ],
                //       ),
                //     );
                //   },
                // );

                // Future.delayed(const Duration(seconds: 5), () {
                //   log(
                //       controller.personality[0] +
                //           controller.traitType.toString() +
                //           controller.gp.value,
                //       name: 'traaaaaaaaaaaai');
                //   controller
                //       .gpReportSubmitFunction(
                //           uId: userId,
                //           personality: controller.personality[0],
                //           trait: controller.traitType.toString())
                //       .then((_) {
                //     controller.fetchPersonalityReport(userId: userId);
                //     controller.fetchTraitReport(userId: userId);
                //   });
                //   Get.off(() =>
                //       AIMCETResultScreen(userName: userName, uId: userId));
                // });