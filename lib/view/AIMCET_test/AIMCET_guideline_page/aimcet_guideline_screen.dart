import 'package:aimshala/controllers/aimcet_test_controller.dart';
import 'package:aimshala/utils/common/colors_common.dart';
import 'package:aimshala/utils/widgets/widgets_common.dart';
import 'package:aimshala/view/AIMCET_test/AIMCET_Test_page/aimcet_test_page.dart';
import 'package:aimshala/view/AIMCET_test/AIMCET_widgets/aimcet_texts.dart';
import 'package:aimshala/view/AIMCET_test/AIMCET_widgets/aimcet_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class AIMCETGuideLinePage extends StatelessWidget {
  const AIMCETGuideLinePage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AIMCETController());
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: aimcetAppBar(),
      body: Container(
        decoration: aimcetMainContainerdecoration(),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 17, right: 17, top: 110),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                aimcetBoldText(
                    text: "User Guidelines and Terms", size: 15.3.sp),
                hBox,
                welcomeText(
                  "Welcome to the Aimshala Aim CET Before you begin, please read and understand the following user guidelines and terms for a smooth and meaningful experience:",
                  14,
                ),
                hLBox,
                Container(
                  width: double.infinity,
                  decoration: guidelineContainerDecoration(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: guidelineSecContainerDecoration(),
                        width: double.infinity,
                        child: aimcetBoldText(
                            text: "User Guidelines", size: 9.3.sp),
                      ),
                      hBox,
                      guidelineComponent(
                        title: "Instructions :",
                        subtitile:
                            "Follow the provided test instructions carefully to ensure accurate results.",
                      ),
                      hBox,
                      guidelineComponent(
                        title: "Honest Responses :",
                        subtitile:
                            "Answer the questions honestly and authentically, as your responses contribute to accurate insights.",
                      ),
                      hBox,
                      guidelineComponent(
                        title: "Test Completion :",
                        subtitile:
                            "Progress through the questionnaire at your own pace. You can save and resume your progress.",
                      ),
                      hBox,
                      guidelineComponent(
                        title: "Review and Confirmation :",
                        subtitile:
                            "Before submitting, review and confirm your answers.",
                      ),
                      hBox,
                      guidelineComponent(
                        title: "Report Interpretation :",
                        subtitile:
                            "Take time to understand the insights and recommendations provided in your psychometric test report.",
                      ),
                      hBox,
                      guidelineComponent(
                        title: "Goal Setting :",
                        subtitile:
                            "Utilize the recommendations to set personal and professional goals.",
                      ),
                      hBox,
                      guidelineComponent(
                        title: "Exploration :",
                        subtitile:
                            "Explore Aimshala's offerings based on your psychometric test insights.",
                      ),
                      hBox,
                      guidelineComponent(
                        title: "Next Steps :",
                        subtitile:
                            "Make informed decisions about your educational and career path using the insights gained.",
                      ),
                      hBox,
                    ],
                  ),
                ),
                hMBox,
                Container(
                  width: double.infinity,
                  decoration: guidelineContainerDecoration(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: guidelineSecContainerDecoration(),
                        width: double.infinity,
                        child: aimcetBoldText(
                            text: "Terms and Conditions:", size: 9.3.sp),
                      ),
                      hBox,
                      guidelineComponent(
                        title: "Confidentiality :",
                        subtitile:
                            "Follow the provided test instructions carefully to ensure accurate results.",
                      ),
                      hBox,
                      guidelineComponent(
                        title: "Accuracy :",
                        subtitile:
                            "Aimshala strives to provide accurate insights based on your responses; however, results may not be exhaustive.",
                      ),
                      hBox,
                      guidelineComponent(
                        title: "Personal Responsibility :",
                        subtitile:
                            "You are responsible for interpreting and utilizing the psychometric test insights.",
                      ),
                      hBox,
                      guidelineComponent(
                        title: "Limitations :",
                        subtitile:
                            "The psychometric test provides guidance, but outcomes should be considered alongside other factors.",
                      ),
                      hBox,
                      guidelineComponent(
                        title: "Data Usage :",
                        subtitile:
                            "Aimshala may use aggregated, non-identifiable data for research and improvement purposes.",
                      ),
                      hBox,
                      guidelineComponent(
                        title: "Age Requirement :",
                        subtitile:
                            "Users must meet the age requirement specified by Aimshala to take the test.",
                      ),
                      hBox,
                      guidelineComponent(
                        title: "Termination :",
                        subtitile:
                            "Aimshala reserves the right to terminate or modify the test at any time.",
                      ),
                    ],
                  ),
                ),
                hLBox,
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GetBuilder<AIMCETController>(
                        id: 'button-proceed',
                        builder: (aimcet) {
                          return GestureDetector(
                            onTap: () {
                              aimcet.toggleSelection();
                            },
                            child: Container(
                              height: 24,
                              width: 24,
                              decoration: BoxDecoration(
                                color: aimcet.guideSelect ? mainPurple : kwhite,
                                border: Border.all(
                                    width: 1,
                                    color: const Color.fromARGB(
                                        255, 195, 197, 198)),
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: aimcet.guideSelect
                                  ? Center(
                                      child: Icon(
                                      Icons.done,
                                      color: kwhite,
                                      size: 15,
                                    ))
                                  : null,
                            ),
                          );
                        }),
                    wMBox,
                    Expanded(
                      child: welcomeText(
                        'By proceeding with the Aimshala Psychometric Test, you acknowledge that you have read, understood, and agreed to the user guidelines and terms outlined above. Enjoy your journey of self-discovery and growth!',
                        8.5.sp,
                      ),
                    )
                  ],
                ),
                hLBox,
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Container(
                        height: 4.h,
                        // width: 24,
                        decoration: BoxDecoration(
                          color: kwhite,
                          border: Border.all(width: 1, color: mainPurple),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Center(
                            child: Text(
                          "Cancel",
                          style: TextStyle(color: mainPurple),
                        )),
                      ),
                    ),
                    wMBox,
                    Obx(
                      () => Expanded(
                        child: GestureDetector(
                          onTap: () {
                            if (controller.guideSelect == true) {
                              // log("message");
                              Get.to(() => const AIMCETTestPage());
                            }
                          },
                          child: Container(
                            height: 4.h,
                            decoration: BoxDecoration(
                              color: controller.guidebutton.value
                                  ? mainPurple
                                  : buttonColor,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Center(
                              child: Text(
                                "Proceed",
                                style: TextStyle(
                                    color: controller.guidebutton.value
                                        ? kwhite
                                        : textFieldColor),
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                hLBox,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
