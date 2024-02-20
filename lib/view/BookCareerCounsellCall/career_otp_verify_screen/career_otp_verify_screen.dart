import 'dart:developer';
import 'package:aimshala/controllers/career_booking_controller.dart';
import 'package:aimshala/utils/common/colors_common.dart';
import 'package:aimshala/utils/common/text_common.dart';
import 'package:aimshala/utils/widgets/widgets_common.dart';
import 'package:aimshala/view/BookCareerCounsellCall/career_home_aimScreen/widgets/career__widgets.dart';
import 'package:aimshala/view/BookCareerCounsellCall/career_otp_verify_screen/widgets/career_otp_widgets.dart';
import 'package:aimshala/view/login/widget/widgets_login.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class CareerOTPVerifyScreen extends StatelessWidget {
  final String mobileNo;
  const CareerOTPVerifyScreen({super.key, required this.mobileNo});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(BookCareerCounsellController());
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: careerAppBar(),
      body: Container(
        decoration: careerMainContainerdecoration(),
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: careerContainerP,
              child: careerSecContainer(
                child: Form(
                  key: controller.otpFormKey,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          twoStyleTexts(text1: 'Verification Code', text2: ''),
                          Container(
                            padding: const EdgeInsets.only(bottom: 5),
                            child: Image.asset(
                              'assets/images/msg.png',
                              height: 25,
                              width: 35,
                            ),
                          )
                        ],
                      ),
                      hBox,
                      primarytxt(
                        "Please enter the Verification Code send to +91$mobileNo",
                        10.7.sp,
                      ),
                      hLBox,
                      SizedBox(
                        width: 50.8.w,
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                CareerOTPField(
                                  controller: controller.otpController1,
                                  onChanged: (value) {
                                    if (value.length == 1) {
                                      FocusScope.of(context).nextFocus();
                                    }
                                    log('valmsg: ${controller.validationMessage.value.toString()}');
                                    controller.validationMessage.value =
                                        'newvalue';
                                    onchangeButton(controller);
                                  },
                                ),
                                CareerOTPField(
                                  controller: controller.otpController2,
                                  onChanged: (value) {
                                    if (value.length == 1) {
                                      FocusScope.of(context).nextFocus();
                                    }
                                    if (value.isEmpty) {
                                      FocusScope.of(context).previousFocus();
                                    }

                                    onchangeButton(controller);
                                  },
                                ),
                                CareerOTPField(
                                  controller: controller.otpController3,
                                  onChanged: (value) {
                                    if (value.length == 1) {
                                      FocusScope.of(context).nextFocus();
                                    }

                                    if (value.isEmpty) {
                                      FocusScope.of(context).previousFocus();
                                    }

                                    onchangeButton(controller);
                                  },
                                ),
                                CareerOTPField(
                                  controller: controller.otpController4,
                                  onChanged: (value) {
                                    if (value.length == 1) {
                                      FocusScope.of(context).unfocus();
                                    }
                                    if (value.isEmpty) {
                                      FocusScope.of(context).previousFocus();
                                    }

                                    onchangeButton(controller);
                                  },
                                ),
                              ],
                            ),
                            Obx(() => controller.validationMessage.value ==
                                    'Please enter valid code'
                                ? Text(controller.validationMessage.value,
                                    style: errorStyle())
                                : const SizedBox.shrink()),
                          ],
                        ),
                      ),
                      hLBox,
                      primarytxt("Didn't recieve Code?", 11.sp),
                      hMBox,
                      GestureDetector(
                        onTap: () {
                          controller.careerResendOTPFunction(mobileNo: '91$mobileNo');
                          log('gesturdetector');
                        },
                        child: Text(
                          "Resend Code",
                          style: TextStyle(
                              color: kpurple,
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      hLBox,
                      Container(
                        width: double.infinity,
                        height: 4.5.h,
                        decoration: boxdecoration(12),
                        child: GetBuilder<BookCareerCounsellController>(
                          id: 'update-careerOTP',
                          builder: (careerotp) {
                            return TextButton(
                              onPressed: () {
                                if (careerotp.otpFormKey.currentState!
                                    .validate()) {
                                  String validationMessage =
                                      careerotp.validateOtp();
                                  log('onpress val: $validationMessage');
                                  if (validationMessage.isEmpty) {
                                    String newOtp = careerotp.otpController1.text +
                                        careerotp.otpController2.text +
                                        careerotp.otpController3.text +
                                        careerotp.otpController4.text;
                                    careerotp.careerVerifyOTPFunction(
                                        mobileNo: '91$mobileNo', otp: newOtp);
                                  } else {
                                    log(validationMessage);
                                  }
                                }
                              },
                              style: ButtonStyle(
                                shape: buttonShape(round: 8),
                                backgroundColor:
                                    MaterialStateProperty.resolveWith<Color>(
                                  (states) {
                                    return careerotp.careerbuttonColor.value;
                                  },
                                ),
                              ),
                              child: Text(
                                "Verify",
                                style: TextStyle(color: careerotp.careerBTextColor.value),
                              ),
                            );
                          }
                        ),
                      ),
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
  void onchangeButton(BookCareerCounsellController data) {
    data.updatebuttonCareerOTP();
  }
}
