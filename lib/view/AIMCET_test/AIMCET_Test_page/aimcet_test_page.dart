import 'dart:developer';
import 'package:aimshala/controllers/aimcet_test_controller.dart';
import 'package:aimshala/controllers/login_controller.dart';
import 'package:aimshala/models/UserModel/user_model.dart';
import 'package:aimshala/utils/common/colors_common.dart';
import 'package:aimshala/utils/widgets/widgets_common.dart';
import 'package:aimshala/view/AIMCET_test/AIMCET_bottomsheet/aimcet_dailoguebox.dart';
import 'package:aimshala/view/AIMCET_test/AIMCET_bottomsheet/test_bottomsheet.dart';
import 'package:aimshala/view/AIMCET_test/AIMCET_widgets/aimcet_bottom_list.dart';
import 'package:aimshala/view/AIMCET_test/AIMCET_widgets/aimcet_texts.dart';
import 'package:aimshala/view/AIMCET_test/AIMCET_widgets/aimcet_widgets.dart';
import 'package:aimshala/view/AIMCET_test/AIMCET_widgets/completed_warning.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AIMCETTestPage extends StatelessWidget {
  const AIMCETTestPage({super.key});

  @override
  Widget build(BuildContext context) {
    String? uId;
    String? uName;
    final UserDataModel? userData = Get.put(LoginController()).userData;
    if (userData != null) {
      uId = userData.user?.id.toString() ?? '';
      uName = userData.user?.name ?? '';
    }
    final controller = Get.put(AIMCETController());
    PageController pageController = PageController();
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: aimcetAppBar(),
      body: Container(
        decoration: aimcetMainContainerdecoration(),
        child: Padding(
          padding: const EdgeInsets.only(left: 17, right: 17, top: 30),
          child: controller.allQuestions?.isEmpty == true
              ? Center(
                child: CompletedWarningBox(
                    uId: uId.toString(), uName: uName.toString()),
              )
              : PageView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: controller.allQuestions?.length,
                  controller: pageController,
                  itemBuilder: (context, index) {
                    String answer = controller.allQuestions![index].answers;
                    List<String> pageItems =
                        answer.split('|').map((data) => data.trim()).toList();
                    log(pageItems.toString());
                    int? isSelected;
                    return GetBuilder<AIMCETController>(
                      id: 'aimcet-test',
                      builder: (c) {
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            questionText(c.allQuestions![index].question),
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
                                      if (index == length - 1 ||
                                          c.submitRes == 'failed') {
                                        showAIMCETDialogFunction(
                                            context: context,
                                            userId: uId.toString(),
                                            userName:
                                                uName.toString());
                                      }
                                      c.update(['aimcet-test']);
                                      log('${pageIndex.toString()} ${data.id} ${data.sectionId} $answerText $uId');
                                      log('${c.secID}',
                                          name: 'cheeeeeeeeek');
                                      c.secID.value =
                                          data.sectionId;
                                      c.submitAimTest(
                                        userId: uId.toString(),
                                        cAnswer: answerText,
                                        sectionId: data.sectionId
                                            .toString(),
                                        questionId:
                                            data.id.toString(),
                                      );
                                      if (index < length - 1) {
                                        pageController.animateToPage(
                                          index + 1,
                                          duration: const Duration(
                                              milliseconds: 800),
                                          curve: Curves.ease,
                                        );
                                      }
                                      if (index == 39) {
                                        log(
                                            uId.toString() +
                                                data.sectionId
                                                    .toString(),
                                            name: '40th index');
                                        c.careerResultSubmittion(
                                            userId: uId.toString(),
                                            secId: '1');
                                      }
                                      if (index == 54) {
                                        log(
                                            uId.toString() +
                                                data.sectionId
                                                    .toString(),
                                            name: '55th index');
                                        c.careerResultSubmittion(
                                            userId: uId.toString(),
                                            secId: '3');
                                      }
          
                                      if (index == length - 1) {
                                        c.aimcetTestResultFunction(
                                          userId: uId.toString(),
                                          userName:
                                              uName.toString(),
                                        );
                                      }
                                      if (length - 2 == index ||
                                          length - 1 == index) {
                                        log('${data.sectionId}   ind $index',
                                            name: 'cheeeeeeeeek');
                                        c.end.value = 'yes';
                                      } else {
                                        c.end.value = 'no';
                                      }
                                    },
                                    child: answerContainer(
                                      (pageIndex + 1).toString(),
                                      // pageIndex.toString(),
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
        onTap: () {
          showsheet(context);
          log("message");
        },
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
                              ? aimcetList[
                                  int.parse((aimcetList.length - 1).toString())]
                              : controller.end.value == 'yes'
                                  ? aimcetList[int.parse(
                                      controller.secID.value.toString())]
                                  : aimcetList[int.parse(
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
                        aimcetList.length,
                        (index) {
                          if (index == aimcetList.length - 1) {
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
    );
  }

  void showsheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return const Bottoooommmmm();
      },
    );
  }

  void showAIMCETDialogFunction(
      {required BuildContext context,
      required String userId,
      required String userName}) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AIMCETDialogueBox(
          userId: userId,
          userName: userName,
        );
      },
    );
  }
}

// Row(
//   mainAxisSize: MainAxisSize.min,
//   children: List.generate(
//     aimcetList.length,
//     (index) {
//       // Determine completion based on section ID
//       final completed = int.parse(controller.allQuestions![index].sectionId) > index + 1;

//       return Row(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           // Bar indicating completion
//           Container(
//             height: 6,
//             width: 11,
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(4),
//               color: completed ? mainPurple : mainPurple.withOpacity(0.4),
//             ),
//           ),
//           // Spacer
//           Container(
//             height: 5,
//             width: 18,
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(1),
//               color: completed ? mainPurple.withOpacity(0.4) : mainPurple.withOpacity(0.2),
//             ),
//           ),
//         ],
//       );
//     },
//   ),
// )

// class StepperExample extends StatelessWidget {
//   const StepperExample({super.key});

//   @override
//   Widget build(BuildContext context) {
//     // int _index = 0;
//     return Stepper(
//       // currentStep: _index,
//       // onStepCancel: () {
//       //   if (_index > 0) {
//       //     setState(() {
//       //       _index -= 1;
//       //     });
//       //   }
//       // },
//       // onStepContinue: () {
//       //   if (_index <= 0) {
//       //     setState(() {
//       //       _index += 1;
//       //     });
//       //   }
//       // },
//       // onStepTapped: (int index) {
//       //   setState(() {
//       //     _index = index;
//       //   });
//       // },

//       steps: const <Step>[
//         Step(
//           title: Text('Step 1 title'),
//           content:Text(''),
//         ),
//         Step(
//           title: Text('Step 1 title'),
//           content:Text(''),
//         ),Step(
//           title: Text('Step 1 title'),
//           content:Text(''),
//         ),Step(
//           title: Text('Step 1 title'),
//           content:Text(''),
//         ),Step(
//           title: Text('Step 1 title'),
//           content:Text(''),
//         ),
//       ],
//     );
//   }
// }
