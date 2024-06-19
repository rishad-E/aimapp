import 'dart:developer';
import 'package:aimshala/controllers/login_controller.dart';
import 'package:aimshala/utils/common/widgets/colors_common.dart';
import 'package:aimshala/utils/common/widgets/text_common.dart';
import 'package:aimshala/utils/widgets/widgets_common.dart';
import 'package:aimshala/view/login/widget/widgets_login.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';
import 'package:sizer/sizer.dart';

class OTPScreen extends StatelessWidget {
  final String mobileNo;
  const OTPScreen({super.key, required this.mobileNo});

  @override
  Widget build(BuildContext context) {
    final otpController = Get.put(LoginController());
    final GlobalKey<FormState> otpFormKey = GlobalKey();

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        title: appbarContainer(onPressed: () {
          Get.back();
        }),
      ),
      body: Container(
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/bg-image.png'),
              fit: BoxFit.cover),
        ),
        child: Center(
          child: SingleChildScrollView(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 17),
            child: Column(
              children: [
                Form(
                  key: otpFormKey,
                  child: Column(
                    children: [
                      Container(
                        // color: Colors.yellow,
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        height: 20.h,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            SizedBox(
                              width: 61.w,
                              height: 7.h,
                              child: Image.asset(
                                  'assets/images/aimshala-logo.png'),
                            ),
                            const SizedBox(height: 12),
                            primarytxt2(
                                'We envision a world where individuals are equipped to Take charge of their lives, realise their aspirations, and make meaningful contributions to society, fostering a future of limitless possibilities.',
                                9.sp),
                            const SizedBox(height: 12)
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 42.h,
                        width: double.infinity,
                        child: loginContainer(
                          twoText: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              twoStyleTexts(
                                  text1: 'Verification Code', text2: ''),
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
                          fieldText: primarytxt(
                              "Please enter the Verification Code send to +$mobileNo",
                              10.7.sp),
                          context: context,
                          textfield: SizedBox(
                            width: 50.8.w,
                            child: Column(
                              children: [
                                Obx(
                                  () {
                                    final defaultpin = PinTheme(
                                      height: 5.2.h,
                                      width: 11.w,
                                      textStyle: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                        color: kblack,
                                      ),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        border: Border.all(
                                            color: otpController
                                                        .validationMessage
                                                        .value ==
                                                    'Please enter valid code'
                                                ? kred
                                                : kblack.withOpacity(0.2)),
                                      ),
                                    );
                                    return Pinput(
                                      defaultPinTheme: defaultpin,
                                      focusedPinTheme: defaultpin.copyWith(
                                        decoration:
                                            defaultpin.decoration!.copyWith(
                                          border: Border.all(color: kpurple),
                                        ),
                                      ),
                                      onCompleted: (value) => log(value),
                                      onChanged: (value) {
                                        otpController.validationMessage.value =
                                            'newvalue';
                                        log(otpController
                                            .validationMessage.value
                                            .toString());
                                        onchangeButton(otpController);
                                      },
                                      controller: otpController.otpController,
                                    );
                                  },
                                ),
                               
                                Obx(() => otpController
                                            .validationMessage.value ==
                                        'Please enter valid code'
                                    ? Text(
                                        otpController.validationMessage.value,
                                        style: errorStyle())
                                    : const SizedBox.shrink()),
                              ],
                            ),
                          ),
                          otpWidget: SizedBox(
                            // color: Colors.yellow,
                            height: 8.h,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                primarytxt("Didn't recieve Code?", 11.sp),
                                GestureDetector(
                                  onTap: () {
                                    otpController.resendOTPFunction(
                                        mobileNo: mobileNo);
                                    //91${controller.phoneController.text}
                                  },
                                  child: Text(
                                    "Resend Code",
                                    style: TextStyle(
                                        color: mainPurple,
                                        fontSize: 13.sp,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          button: GetBuilder<LoginController>(
                              id: 'button-otp',
                              builder: (otp) {
                                return TextButton(
                                    style: ButtonStyle(
                                      backgroundColor: MaterialStateProperty
                                          .resolveWith<Color>(
                                        (Set<MaterialState> states) {
                                          return otp.buttonColor.value;
                                        },
                                      ),
                                      shape: buttonShape(round: 10),
                                    ),
                                    onPressed: () {
                                      if (otpFormKey.currentState!
                                          .validate()) {
                                        String validationMessage =
                                            otp.validateOtp();
                                        if (validationMessage.isEmpty) {
                                          log(otpController.otpController.text,
                                              name: 'pinput otp');
                                          otp.verifyOTPFunction(
                                              mobileNo: mobileNo, otp: otpController.otpController.text);
                                        } else {
                                          log(validationMessage);
                                        }
                                      }
                                    },
                                    child: Text(
                                      'Verify',
                                      style: TextStyle(
                                          color: otp.buttonTextColor.value),
                                    ));
                              }),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )),
        ),
      ),
    );
  }

  void onchangeButton(LoginController data) {
    data.updateButtonColor();
  }
}
