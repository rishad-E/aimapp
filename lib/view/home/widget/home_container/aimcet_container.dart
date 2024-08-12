import 'dart:developer';

import 'package:aimshala/controllers/aimcet_test_controller.dart';
import 'package:aimshala/controllers/all_data_controller.dart';
import 'package:aimshala/utils/common/widgets/colors_common.dart';
import 'package:aimshala/utils/widgets/widgets_common.dart';
import 'package:aimshala/view/AIMCET_test/AIMCET_RESULT_Screen/aimcet_result_page.dart';
import 'package:aimshala/view/AIMCET_test/AIMCET_Test_page/aimcet_test_page.dart';
import 'package:aimshala/view/AIMCET_test/AIMCET_guideline_page/aimcet_guideline_screen.dart';
import 'package:aimshala/view/home/widget/texts.dart';
import 'package:aimshala/view/signup/signup_amy_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class AimcetContainer extends StatelessWidget {
  final String userName;
  final String id;
  const AimcetContainer({super.key, required this.userName, required this.id});

  @override
  Widget build(BuildContext context) {
    // bool isLoading = false;
    final controller = Get.put(AIMCETController());
    final allDataC = Get.put(AllDataController());
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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
            height: 23.h,
            child: Image.asset('assets/images/chip.png'),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: SizedBox(
              height: 5.5.h,
              child: Image.asset('assets/images/acecet-home.png'),
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
              height: 4.2.h,
              child: Obx(
                () {
                  if (controller.testDone.value == 'done') {
                    controller.aimcetTestResultFunction(
                        userId: id, userName: userName);
                    return acecetElevatedButton(
                      bText: "Check AIMCET Result",
                      bIcon: Icons.arrow_forward_ios_sharp,
                      onPressed: () async {
                        try {
                          Get.snackbar(
                            "Hi $userName",
                            "Fetching your AIMCET result...",
                            snackPosition: SnackPosition.TOP,
                            duration: const Duration(seconds: 2),
                            backgroundColor:
                                const Color.fromARGB(255, 86, 21, 171)
                                    .withOpacity(0.7),
                            colorText: Colors.white,
                          );
                          await controller
                              .gpReportSubmitFunction(
                                  uId: id,
                                  personality: controller.personality[0],
                                  trait: controller.traitType.toString())
                              .then((_) {
                            controller.fetchPersonalityReport(userId: id);
                            controller.fetchTraitReport(userId: id);
                          });
                          await Future.delayed(const Duration(seconds: 1));
                          // Navigator.of(context).pop();
                          // Get.back();
                          controller.showAllreview = false;
                          Get.to(() =>
                              AIMCETResultScreen(userName: userName, uId: id));
                        } catch (e) {
                          Get.snackbar(
                            "Hi $userName,Error occured",
                            "Failed to Fetch your AIMCET result...",
                            snackPosition: SnackPosition.TOP,
                            duration: const Duration(seconds: 2),
                            backgroundColor: kred,
                            colorText: Colors.white,
                          );
                        }
                      },
                    );
                  } else if (controller.testDone.value == 'continue') {
                    controller.fetchAllTestQuestions(userId: id);
                    controller.getTestSectionTextsFunc();
                    return acecetElevatedButton(
                      onPressed: () {
                        if (controller.allQuestions != null) {
                          controller.secID.value =
                              controller.allQuestions![0].sectionId;
                        }
                        Get.to(() => const AIMCETTestPage());
                      },
                      bText: "Continue AIMCET Test",
                      bIcon: Icons.arrow_forward_ios_sharp,
                    );
                  } else {
                    return acecetElevatedButton(
                      onPressed: () async {
                        log("career aim=>${allDataC.userDetails?.aim}",
                            name: 'takecha');
                        if (allDataC.userDetails?.aim?.isEmpty == true) {
                          // await Future.delayed(Duration(seconds: 1));
                          Get.to(
                              () => SignUpAmyScreen(
                                    name: userName,
                                    uId: id,
                                    email: allDataC.userData?.email ?? '',
                                    phone: allDataC.userData?.phone ?? '',
                                  ),
                              transition: Transition.fade);
                        } else {
                          Get.to(() => AIMCETGuideLinePage(uId: id),
                              transition: Transition.fade);
                        }
                        // Get.to(() => AIMCETGuideLinePage(uId: id));
                      },
                      bText: "Take Psychometric Test",
                      bIcon: Icons.arrow_forward_ios_sharp,
                    );
                  }
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}

Widget acecetElevatedButton(
    {required void Function()? onPressed,
    required String bText,
    required IconData bIcon}) {
  return ElevatedButton.icon(
    style: ButtonStyle(
      shape: buttonShape(round: 8),
    ),
    onPressed: onPressed,
    icon: Text(
      bText,
      style: TextStyle(
          fontSize: 11.sp,
          color: const Color.fromARGB(255, 147, 38, 143),
          fontWeight: FontWeight.w600),
    ),
    label: Icon(
      bIcon,
      size: 11.sp,
      color: const Color.fromARGB(255, 147, 38, 143),
    ),
  );
}
