import 'package:aimshala/controllers/aimcet_test_controller.dart';
import 'package:aimshala/utils/common/widgets/colors_common.dart';
import 'package:aimshala/utils/common/widgets/text_common.dart';
import 'package:aimshala/utils/widgets/widgets_common.dart';
import 'package:aimshala/view/AIMCET_test/AIMCET_RESULT_Screen/aimcet_result_page.dart';
import 'package:aimshala/view/AIMCET_test/AIMCET_guideline_page/aimcet_guideline_screen.dart';
import 'package:aimshala/view/chatbot/widgets/amy_radial_gradient.dart';
import 'package:aimshala/view/home/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class BookingDialogueBox extends StatelessWidget {
  final String userName;
  final String id;
  const BookingDialogueBox(
      {super.key, required this.userName, required this.id});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AIMCETController());
    return AlertDialog(
      backgroundColor: kwhite,
      surfaceTintColor: kwhite,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Padding(
            padding: EdgeInsets.only(right: 50),
            child: AmyBotRadialColor(),
          ),
          hMBox,
          Text('Thank You!',
              style: TextStyle(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.bold,
                  color: kpurple)),
          hBox,
          primarytxt2("For booking a counseling session!", 11.sp),
          hBox,
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
            decoration: BoxDecoration(
              border:
                  Border.all(color: const Color.fromARGB(255, 217, 219, 219)),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              children: [
                SizedBox(
                  // color: Colors.yellow,
                  height: 4.h,
                  child: Image.asset('assets/images/AimCET_LOGO2.png'),
                ),
                hBox,
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                  child: primarytxt2(
                      'Enhance your experience by taking a suggested Aimshala Career explorer test',
                      12),
                )
              ],
            ),
          ),
          hMBox,
          Container(
            width: 79.w,
            height: 4.5.h,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(15),
              ),
            ),
            child: Obx(
              () {
                if (controller.testDone.value == 'done') {
                  return ElevatedButton.icon(
                    style: ButtonStyle(
                        shape: buttonShape(round: 8),
                        side: MaterialStatePropertyAll(
                            BorderSide(color: mainPurple))),
                    icon: Text(
                      "Check AIMCET Result",
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
                    onPressed: () {
                      controller
                          .gpReportSubmitFunction(
                              uId: id,
                              personality: controller.personality[0],
                              trait: controller.traitType.toString())
                          .then((_) {
                        controller.fetchPersonalityReport(userId: id);
                        controller.fetchTraitReport(userId: id);
                      });
                      Get.to(() =>
                          AIMCETResultScreen(userName: userName, uId: id));
                    },
                  );
                } else if (controller.testDone.value == 'continue') {
                  return ElevatedButton.icon(
                    style: ButtonStyle(
                        shape: buttonShape(round: 8),
                        side: MaterialStatePropertyAll(
                            BorderSide(color: mainPurple))),
                    onPressed: () => Get.to(
                      () => AIMCETGuideLinePage(uId: id, uName: userName),
                    ),
                    icon: Text(
                      "Continue Psychometric Test",
                      style: TextStyle(
                          fontSize: 11.sp,
                          color: mainPurple,
                          fontWeight: FontWeight.w600),
                    ),
                    label: Icon(Icons.arrow_forward_ios_sharp,
                        size: 11.sp, color: mainPurple),
                  );
                } else {
                  return ElevatedButton.icon(
                    style: ButtonStyle(
                        shape: buttonShape(round: 8),
                        backgroundColor: MaterialStatePropertyAll(mainPurple)),
                    onPressed: () => Get.to(
                      () => AIMCETGuideLinePage(uId: id, uName: userName),
                    ),
                    icon: Text(
                      "Take Psychometric Test",
                      style: TextStyle(
                          fontSize: 11.sp,
                          color: kwhite,
                          fontWeight: FontWeight.w600),
                    ),
                    label: Icon(Icons.arrow_forward_ios_sharp,
                        size: 11.sp, color: kwhite),
                  );
                }
              },
            ),
          ),
          hMBox,
          GestureDetector(
            onTap: () => Get.offAll(() => const HomeScreen()),
            child: Text('Not Now',
                style: TextStyle(color: kpurple, fontWeight: FontWeight.w600)),
          )
        ],
      ),
    );
  }
}
