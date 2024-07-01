import 'package:aimshala/controllers/aimcet_test_controller.dart';
import 'package:aimshala/utils/common/widgets/colors_common.dart';
import 'package:aimshala/utils/widgets/widgets_common.dart';
import 'package:aimshala/view/AIMCET_test/AIMCET_RESULT_Screen/aimcet_result_page.dart';
import 'package:aimshala/view/AIMCET_test/AIMCET_Test_page/aimcet_test_page.dart';
import 'package:aimshala/view/AIMCET_test/AIMCET_qualification_page/aimcet_qualification_screen.dart';
import 'package:aimshala/view/home/widget/texts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class AimcetContainer extends StatelessWidget {
  final String userName;
  final String id;
  const AimcetContainer({super.key, required this.userName, required this.id});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AIMCETController());
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
                    return ElevatedButton.icon(
                      style: ButtonStyle(
                        shape: buttonShape(round: 8),
                      ),
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
                    controller.fetchAllTestQuestions(
                        userId: id, qualifyId: controller.qualifyId.toString());
                    return ElevatedButton.icon(
                      style: ButtonStyle(
                        shape: buttonShape(round: 8),
                      ),
                      onPressed: () {
                        if (controller.allQuestions != null) {
                          controller.secID.value =
                              controller.allQuestions![0].sectionId;
                        }
                        Get.to(() => const AIMCETTestPage());
                      },
                      icon: Text(
                        "Continue AIMCET Test",
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
                    );
                  } else {
                    return ElevatedButton.icon(
                      style: ButtonStyle(
                        shape: buttonShape(round: 8),
                      ),
                      onPressed: () {
                        Get.to(() => AIMCETQualificationScreen(uId: id));
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


 // return controller.testDone.value == 'done'
                  //   ?
                  // ElevatedButton.icon(
                  //       style: ButtonStyle(
                  //         shape: buttonShape(round: 8),
                  //       ),
                  //       icon: Text(
                  //         "Check AIMCET Result",
                  //         style: TextStyle(
                  //             fontSize: 11.sp,
                  //             color: const Color.fromARGB(255, 147, 38, 143),
                  //             fontWeight: FontWeight.w600),
                  //       ),
                  //       label: Icon(
                  //         Icons.arrow_forward_ios_sharp,
                  //         size: 11.sp,
                  //         color: const Color.fromARGB(255, 147, 38, 143),
                  //       ),
                  //       onPressed: () {
                  //         // Get.to(() => AIMCETQualificationScreen());
                  //         controller
                  //             .gpReportSubmitFunction(
                  //                 uId: id,
                  //                 personality: controller.personality[0],
                  //                 trait: controller.traitType.toString())
                  //             .then((_) {
                  //           controller.fetchPersonalityReport(userId: id);
                  //           controller.fetchTraitReport(userId: id);
                  //         });
                  //         Get.to(() => AIMCETResultScreen(
                  //               userName: userName,
                  //               uId: id,
                  //             ));
                  //       },
                  //     )
                  //   : controller.testDone.value == 'continue'
                  //       ?
                  // ElevatedButton.icon(
                  //           style: ButtonStyle(
                  //             shape: buttonShape(round: 8),
                  //           ),
                  //           onPressed: () =>
                  //               Get.to(() => AIMCETQualificationScreen()),
                  //           icon: Text(
                  //             "Continue Psychometric Test",
                  //             style: TextStyle(
                  //                 fontSize: 11.sp,
                  //                 color:
                  //                     const Color.fromARGB(255, 147, 38, 143),
                  //                 fontWeight: FontWeight.w600),
                  //           ),
                  //           label: Icon(
                  //             Icons.arrow_forward_ios_sharp,
                  //             size: 11.sp,
                  //             color: const Color.fromARGB(255, 147, 38, 143),
                  //           ),
                  //         )
                  //       :
                  // ElevatedButton.icon(
                  //           style: ButtonStyle(
                  //             shape: buttonShape(round: 8),
                  //           ),
                  //           onPressed: () =>
                  //               Get.to(() => AIMCETQualificationScreen()),
                  //           icon: Text(
                  //             "Take Psychometric Test",
                  //             style: TextStyle(
                  //                 fontSize: 11.sp,
                  //                 color:
                  //                     const Color.fromARGB(255, 147, 38, 143),
                  //                 fontWeight: FontWeight.w600),
                  //           ),
                  //           label: Icon(
                  //             Icons.arrow_forward_ios_sharp,
                  //             size: 11.sp,
                  //             color: const Color.fromARGB(255, 147, 38, 143),
                  //           ),
                  //         );