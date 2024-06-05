import 'dart:developer';
import 'package:aimshala/controllers/aimcet_test_controller.dart';
import 'package:aimshala/utils/common/colors_common.dart';
import 'package:aimshala/utils/common/text_common.dart';
import 'package:aimshala/utils/widgets/widgets_common.dart';
import 'package:aimshala/view/AIMCET_test/AIMCET_guideline_page/aimcet_guideline_screen.dart';
import 'package:aimshala/view/AIMCET_test/AIMCET_widgets/aimcet_widgets.dart';
import 'package:aimshala/view/AIMCET_test/AIMCET_bottomsheet/qualification_bottomsheet.dart';
import 'package:aimshala/view/bookcareercounsellcall/career_home_aimScreen/widgets/career__widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class AIMCETQualificationScreen extends StatelessWidget {
  final String uId;
  AIMCETQualificationScreen({super.key, required this.uId});
  final GlobalKey<FormState> aimcetFormKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final aimcetController = Get.put(AIMCETController());
    aimcetController.getQualifications();

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: aimcetAppBar(),
      body: Container(
        decoration: aimcetMainContainerdecoration(),
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(left: 17, right: 17, top: 15),
              child: Form(
                key: aimcetFormKey,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 17, vertical: 24),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: kwhite,
                  ),
                  child: Column(
                    children: [
                      const Text(
                        "Next Step",
                        style:
                            TextStyle(color: Color.fromARGB(255, 111, 29, 107)),
                      ),
                      hBox,
                      SizedBox(
                        // color: Colors.yellow,
                        height: 4.h,
                        width: 35.5.w,
                        child: Image.asset(
                          'assets/images/acecet.png',
                        ),
                        // child: SvgPicture.asset(
                        //   'assets/images/ACETEST_LOGO.svg',
                        //   fit: BoxFit.cover,
                        // ),
                      ),
                      hLBox,
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 9),
                        child: Text(
                          "Welcome to the Aimshala Aim CET Before you begin, please read and understand the following user guidelines and terms for a smooth and meaningful experience.",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 14,
                              color: Color.fromARGB(255, 116, 118, 119)),
                        ),
                      ),
                      hLBox,
                      Column(
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: primarytxt3('I am', 8.5.sp),
                          ),
                          GestureDetector(
                            onTap: () {
                              showQualificationBottomsheet(context);
                            },
                            child: AbsorbPointer(
                              child: TextFormField(
                                decoration: aimCETTextFiled(
                                  hintText: 'Tell us your Qualification...',
                                  suffixWidget:
                                      const Icon(Icons.keyboard_arrow_down),
                                ),
                                style: TextStyle(fontSize: 9.5.sp),
                                controller:
                                    aimcetController.qualificationController,
                                // readOnly: true,
                                onChanged: (value) => aimcetController
                                    .update(['button-qualification']),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please select your Qualification';
                                  } else {
                                    return null;
                                  }
                                },
                              ),
                            ),
                          ),
                          hLBox,
                          Container(
                              width: double.infinity,
                              height: 4.5.h,
                              decoration: boxdecoration(12),
                              child: GetBuilder<AIMCETController>(
                                  id: 'button-qualification',
                                  builder: (c) {
                                    return TextButton(
                                      onPressed: () {
                                        if (aimcetFormKey.currentState!
                                            .validate()) {
                                          log('${c.qualificationController.text}  ${c.qualifyId}');
                                          log(
                                            'qualify=>${c.qualifyId}'
                                            'userId=>$uId',
                                          );
                                          c.fetchAllTestQuestions(
                                              userId: uId,
                                              qualifyId:
                                                  c.qualifyId.toString());
                                          Get.to(() =>
                                              const AIMCETGuideLinePage());
                                        }
                                      },
                                      style: ButtonStyle(
                                        shape: buttonShape(round: 8),
                                        backgroundColor: MaterialStateProperty
                                            .resolveWith<Color>(
                                          (states) {
                                            return c.qualificationController
                                                    .text.isNotEmpty
                                                ? kpurple
                                                : buttonColor;
                                          },
                                        ),
                                      ),
                                      child: Text(
                                        "Start Test Now!",
                                        style: TextStyle(
                                          color: c.qualificationController.text
                                                  .isNotEmpty
                                              ? Colors.white
                                              : disableText,
                                        ),
                                      ),
                                    );
                                  })),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

void showQualificationBottomsheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    builder: (context) {
      return const QualificationBottomSheet();
    },
  );
}
