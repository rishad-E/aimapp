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
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AIMCETTestPage extends StatelessWidget {
  const AIMCETTestPage({super.key});

  @override
  Widget build(BuildContext context) {
    String? uId;
    final UserDataModel? userData = Get.put(LoginController()).userData;
    if (userData != null) {
      uId = userData.user?.id.toString() ?? '';
    }
    final controller = Get.put(AIMCETController());
    PageController pageController = PageController();
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: aimcetAppBar(),
      body: Container(
        decoration: aimcetMainContainerdecoration(),
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(left: 17, right: 17, top: 30),
              child: Column(
                children: [
                  Container(
                    // color: Colors.yellow,
                    height: 350,
                    child: PageView.builder(
                      itemCount: controller.allQuestions?.length,
                      controller: pageController,
                      itemBuilder: (context, index) {
                        String answer = controller.allQuestions![index].answers;
                        List<String> pageItems = answer
                            .split('|')
                            .map((data) => data.trim())
                            .toList();
                        log(pageItems.toString());
                        return SingleChildScrollView(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: List.generate(
                              pageItems.length + 1,
                              (pageIndex) {
                                if (pageIndex == 0) {
                                  return questionText(
                                    controller.allQuestions![index].question,
                                  );
                                } else {
                                  String answerText = pageItems[pageIndex - 1];
                                  final data = controller.allQuestions![index];
                                  return Padding(
                                    padding: const EdgeInsets.only(
                                        top: 5, bottom: 5),
                                    child: GestureDetector(
                                      onTap: () {
                                        // log('${pageIndex.toString()} ${data.id} ${data.sectionId} $answerText $uId');
                                        log('${data.sectionId}',
                                            name: 'cheeeeeeeeek');

                                        controller.secID.value = data.sectionId;
                                        // controller.submitAimTest(
                                        //   userId: uId.toString(),
                                        //   cAnswer: answerText,
                                        //   sectionId: data.sectionId.toString(),
                                        //   questionId: data.id.toString(),
                                        // );
                                        if (index <
                                            controller.allQuestions!.length -
                                                1) {
                                          pageController.animateToPage(
                                            index + 1,
                                            duration: const Duration(
                                                milliseconds: 500),
                                            curve: Curves.ease,
                                          );
                                        }
                                        // if (index == 39) {
                                        //   log(
                                        //       uId.toString() +
                                        //           data.sectionId.toString(),
                                        //       name: '40th index');
                                        //   controller.careerResultSubmittion(
                                        //       userId: uId.toString(),
                                        //       secId: '1');
                                        // }
                                        // if (index == 54) {
                                        //   log(
                                        //       uId.toString() +
                                        //           data.sectionId.toString(),
                                        //       name: '55th index');
                                        //   controller.careerResultSubmittion(
                                        //       userId: uId.toString(),
                                        //       secId: '3');
                                        // }
                                        if (index ==
                                                controller
                                                        .allQuestions!.length -
                                                    1 ||
                                            controller.submitRes == 'failed') {
                                          showAIMCETDialogFunction(context);
                                        }
                                        if (controller.allQuestions!.length -
                                                1 ==
                                            index) {
                                          log('${data.sectionId}   ind $index',
                                              name: 'cheeeeeeeeek');
                                          controller.end.value = 'yes';
                                        } else {
                                          controller.end.value = 'no';
                                        }
                                      },
                                      child: answerContainer(
                                          pageIndex.toString(), answerText),
                                    ),
                                  );
                                }
                              },
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
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
                          controller.end.value == 'yes'
                              ? aimcetList[
                                  int.parse(controller.secID.value.toString())]
                              : aimcetList[
                                  int.parse(controller.secID.value.toString()) -
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
                                          controller.end.value == 'yes'
                                      ? mainPurple
                                      : mainPurple.withOpacity(0.4),
                                ),
                                // child: Center(
                                //   child: Text('$index'),
                                // ),
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
                                      color: controller.secID > index
                                          ? mainPurple
                                          : mainPurple.withOpacity(0.4),
                                    ),
                                    // child: Center(
                                    //   child: Text('$index'),
                                    // ),
                                  ),
                                  Container(
                                    height: 5,
                                    // height: 20,
                                    width: 18,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(1),
                                      color: controller.secID > index
                                          ? mainPurple.withOpacity(0.3)
                                          : mainPurple.withOpacity(0.1),
                                    ),
                                    // child: Center(
                                    //   child: Text('$index'),
                                    // ),
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

  void showAIMCETDialogFunction(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return const AIMCETDialogueBox();
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
