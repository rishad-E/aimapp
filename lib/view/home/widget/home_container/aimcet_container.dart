import 'package:aimshala/controllers/aimcet_test_controller.dart';
import 'package:aimshala/utils/common/widgets/colors_common.dart';
import 'package:aimshala/utils/widgets/widgets_common.dart';
import 'package:aimshala/view/AIMCET_test/AIMCET_Test_page/aimcet_test_page.dart';
import 'package:aimshala/view/AIMCET_test/AIMCET_guideline_page/aimcet_guideline_screen.dart';
import 'package:aimshala/view/home/widget/texts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class AimcetContainer extends StatelessWidget {
  final String userName;
  const AimcetContainer({super.key, required this.userName});

  @override
  Widget build(BuildContext context) {
    // bool isLoading = false;
    final c = Get.put(AIMCETController());
    c.fetchAllTestQuestions();
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
                  c.fetchAllTestQuestions();
                  if (c.testDone.value == 'done' ||
                      c.testDone.value == 'resultincomplete') {
                    // c.aimcetTestResultFunction();
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
                          await c.aceTestResultFunction();
                          c.showAllreview = false;
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
                  } else if (c.testDone.value == 'continue') {
                    // c.fetchAllTestQuestions();
                    // if (c.testDone.value == 'continue' &&
                    //     c.allQuestions != null &&
                    //     c.allQuestions!.isNotEmpty) {
                    return acecetElevatedButton(
                      onPressed: () {
                        c.secID.value = c.allQuestions![0].sectionId!;
                        // c.previousSecID = c.allQuestions![0].sectionId!;
                        // log('previousID=>${c.previousSecID}', name: 'previousID container');
                        Get.to(() => AIMCETTestPage(uName: userName));
                      },
                      bText: "Continue AIMCET Test",
                      bIcon: Icons.arrow_forward_ios_sharp,
                    );
                    // } else {
                    //   // Show test completed button if all questions are empty
                    //   return acecetElevatedButton(
                    //     onPressed: () {
                    //       c.aceTestResultFunction();
                    //       Get.snackbar(
                    //         "Hi $userName",
                    //         "Fetching your AIMCET result...Please Wait",
                    //         snackPosition: SnackPosition.TOP,
                    //         duration: const Duration(seconds: 2),
                    //         backgroundColor:
                    //             const Color.fromARGB(255, 86, 21, 171)
                    //                 .withOpacity(0.7),
                    //         colorText: Colors.white,
                    //       );
                    //     },
                    //     bText: "Check AIMCET Result",
                    //     bIcon: Icons.arrow_forward_ios_sharp,
                    //   );
                    // }
                    // c.fetchAllTestQuestions();
                    // // c.getTestSectionTextsFunc();
                    // return acecetElevatedButton(
                    //   onPressed: () {
                    //     if (c.allQuestions != null) {
                    //       c.secID.value = c.allQuestions![0].sectionId!;
                    //     }
                    //     Get.to(() => AIMCETTestPage(uName: userName));
                    //   },
                    //   bText: "Continue AIMCET Test",
                    //   bIcon: Icons.arrow_forward_ios_sharp,
                    // );
                  } else {
                    return acecetElevatedButton(
                      onPressed: () {
                        //  c.fetchToken();
                        Get.to(() => AIMCETGuideLinePage(uName: userName),
                            transition: Transition.fade);
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
