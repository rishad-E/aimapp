import 'dart:developer';
import 'package:aimshala/controllers/aimcet_test_controller.dart';
import 'package:aimshala/utils/common/colors_common.dart';
import 'package:aimshala/utils/common/text_common.dart';
import 'package:aimshala/utils/widgets/widgets_common.dart';
import 'package:aimshala/view/AIMCET_test/AIMCET_guideline_page/aimcet_guideline_screen.dart';
import 'package:aimshala/view/AIMCET_test/AIMCET_widgets/aimcet_widgets.dart';
import 'package:aimshala/view/AIMCET_test/AIMCET_widgets/qualification_bottomsheet.dart';
import 'package:aimshala/view/BookCareerCounsellCall/career_home_aimScreen/widgets/career__widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class AIMCETQualificationScreen extends StatelessWidget {
  AIMCETQualificationScreen({super.key});
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
                        height: 4.2.h,
                        child: Image.asset('assets/images/AimCET_LOGO2.png'),
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
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please select your Qualification';
                                  }else{
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
                              child: TextButton(
                                onPressed: () {
                                  if (aimcetFormKey.currentState!.validate()) {
                                    log('${aimcetController.qualificationController.text}  ${aimcetController.qualifyId}');
                                    Get.to(()=>const AIMCETGuideLinePage());
                                  }
                                },
                                style: ButtonStyle(
                                  shape: buttonShape(round: 8),
                                  backgroundColor:
                                      MaterialStateProperty.resolveWith<Color>(
                                    (states) {
                                      return buttonColor;
                                    },
                                  ),
                                ),
                                child: Text(
                                  "Start Test Now!",
                                  style: TextStyle(color: textFieldColor),
                                ),
                              )),
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
