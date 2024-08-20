import 'dart:developer';
import 'package:aimshala/controllers/aimcet_test_controller.dart';
import 'package:aimshala/utils/common/widgets/colors_common.dart';
import 'package:aimshala/utils/widgets/widgets_common.dart';
import 'package:aimshala/view/AIMCET_test/AIMCET_bottomsheet/aimcet_dailoguebox.dart';
import 'package:aimshala/view/AIMCET_test/AIMCET_bottomsheet/test_bottomsheet.dart';
import 'package:aimshala/view/AIMCET_test/AIMCET_widgets/aimcet_texts.dart';
import 'package:aimshala/view/AIMCET_test/AIMCET_widgets/aimcet_widgets.dart';
import 'package:aimshala/view/AIMCET_test/AIMCET_widgets/completed_warning.dart';
import 'package:aimshala/view/AIMCET_test/AIMCET_widgets/error_warning.dart';
import 'package:aimshala/view/home/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AIMCETTestPage extends StatelessWidget {
  final String uId;
  final String uName;
  const AIMCETTestPage({super.key, required this.uId, required this.uName});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AIMCETController());
    PageController pageController = PageController();
    return PopScope(
      onPopInvoked: (didPop) {
        Future.microtask(() {
          controller.checkAimcetTestTakenFunction(userId: uId);
          Get.offAll(() => const HomeScreen());
        });
      },
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: aimcetAppBar(),
        body: Container(
          decoration: aimcetMainContainerdecoration(),
          child: Padding(
            padding: const EdgeInsets.only(left: 17, right: 17, top: 30),
            child: controller.allQuestions == null
                ? const ErrorWarning()
                : controller.allQuestions?.isEmpty == true
                    ? CompletedWarningBox(uId: uId, uName: uName)
                    : PageView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: controller.allQuestions?.length,
                        controller: pageController,
                        itemBuilder: (context, index) {
                          String answer = controller
                              .allQuestions![index].answers
                              .toString();
                          List<String> pageItems = answer
                              .split('|')
                              .map((data) => data.trim())
                              .toList();
                          int? isSelected;
                          return GetBuilder<AIMCETController>(
                            id: 'aimcet-test',
                            builder: (c) {
                              return Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  questionText(c.allQuestions![index].question
                                      .toString()),
                                  ...List.generate(
                                    pageItems.length,
                                    (pageIndex) {
                                      String answerText = pageItems[pageIndex];
                                      final data = c.allQuestions![index];
                                      final length = c.allQuestions!.length;
                                      return Padding(
                                        padding: const EdgeInsets.only(
                                            top: 5, bottom: 5),
                                        child: GestureDetector(
                                          onTap: () {
                                            isSelected = pageIndex;
                                            
                                            // if (index == length - 1) {
                                            //   showAIMCETDialogFunction(
                                            //       context: context,
                                            //       userId: uId,
                                            //       userName: uName);
                                            //   c.aimcetTestResultFunction(
                                            //       userId: uId, userName: uName);
                                            // }
                                            c.secID.value = data.sectionId!;
                                            c.updateTestFileds(data.sectionId!);
                                            // log('uId=>$uId qusID=>${data.id} c_answer=>$answerText sectionID==>${data.sectionId} subsectionID=>${data.subSectionId} totalQus=>${c.totalQ} subQuesCount=>${c.subQusCount} ',
                                            //     name: 'items');
                                            log('section=>${c.secID} totalqus=>${c.sectionQusCount}',
                                                name:
                                                    'new sectionID and totalques');
                                            c.update(['aimcet-test']);

                                            c.submitAceTestQuestion(
                                              userId: uId,
                                              questionId: data.id.toString(),
                                              cAnswer: answerText,
                                              sectionId:
                                                  data.sectionId.toString(),
                                            );
                                            if (index < length - 1) {
                                              pageController.animateToPage(
                                                index + 1,
                                                duration: const Duration(
                                                    milliseconds: 800),
                                                curve: Curves.ease,
                                              );
                                            }
                                            // if (c.totalQ == 40) {
                                            //   log('userId=>$uId  secId=>1',
                                            //       name: '40th index');
                                            //   c.careerResultSubmittion(
                                            //       userId: uId, secId: '1');
                                            // }
                                            // if (c.totalQ == 55) {
                                            //   log('userId=>$uId  secId=>3',
                                            //       name: '55th index');
                                            //   c.careerResultSubmittion(
                                            //       userId: uId, secId: '3');
                                            // }

                                            // if (length - 2 == index ||
                                            //     length - 1 == index) {
                                            //   log('sectionid=>${data.sectionId}   index=>$index',
                                            //       name: 'check END val');
                                            //   c.end.value = 'yes';
                                            // } else {
                                            //   c.end.value = 'no';
                                            // }
                                          },
                                          child: answerContainer(
                                            (pageIndex + 1).toString(),
                                            answerText,
                                            isSelected == pageIndex,
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ],
                              );
                            },
                          );
                        },
                      ),
          ),
        ),
        bottomNavigationBar: GestureDetector(
          onTap: () => showsheet(context),
          child: Container(
              height: 100,
              color: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Obx(() => Column(
                    children: [
                      const Icon(Icons.keyboard_arrow_up_sharp),
                      Padding(
                        padding: const EdgeInsets.only(left: 28),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            controller.end.value == 'done'
                                ? controller.aimcetList[int.parse(
                                    (controller.aimcetList.length - 1)
                                        .toString())]
                                : controller.end.value == 'yes'
                                    ? controller.aimcetList[int.parse(
                                        controller.secID.value.toString())]
                                    : controller.aimcetList[int.parse(
                                            controller.secID.value.toString()) -
                                        1],
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                                color: mainPurple),
                          ),
                        ),
                      ),
                      hBox,
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: List.generate(
                          controller.aimcetList.length,
                          (index) {
                            if (index == controller.aimcetList.length - 1) {
                              {
                                return Container(
                                  height: 6,
                                  // height: 20,
                                  width: 11,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(4),
                                    color: controller.secID.value == index &&
                                                controller.end.value == 'yes' ||
                                            controller.end.value == 'done'
                                        ? mainPurple
                                        : mainPurple.withOpacity(0.4),
                                  ),
                                );
                              }
                            } else {
                              {
                                return Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Container(
                                      height: 6,
                                      // height: 20,
                                      width: 11,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(4),
                                        color: controller.secID > index ||
                                                controller.end.value == 'done'
                                            // &&controller.attempt.value == 5
                                            ? mainPurple
                                            : mainPurple.withOpacity(0.4),
                                      ),
                                    ),
                                    Container(
                                      height: 5,
                                      // height: 20,
                                      width: 18,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(1),
                                        color: controller.secID > index ||
                                                controller.end.value == 'done'
                                            // &&controller.attempt.value == 5
                                            ? mainPurple.withOpacity(0.3)
                                            : mainPurple.withOpacity(0.1),
                                      ),
                                    ),
                                  ],
                                );
                              }
                            }
                          },
                        ),
                      )
                    ],
                  ))),
        ),
      ),
    );
  }

  void showsheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) => const AimcetTestBottomsheet(),
    );
  }

  void showAIMCETDialogFunction(
      {required BuildContext context,
      required String userId,
      required String userName}) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) =>
          AIMCETDialogueBox(userId: userId, userName: userName),
    );
  }
}
