import 'package:aimshala/controllers/login_controller.dart';
import 'package:aimshala/utils/common/colors_common.dart';
import 'package:aimshala/utils/common/text_common.dart';
import 'package:aimshala/utils/common/widgets_common.dart';
import 'package:aimshala/view/login/otp_screen.dart';
import 'package:aimshala/view/login/widget/widgets_login.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> formKey = GlobalKey();

  String selectedCountryCode = '91';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        title: appbarContainer(onPressed: () {}),
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
            child: GetBuilder(
              init: LoginController(),
              builder: (controller) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 17),
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
                            const SizedBox(
                              height: 12,
                            )
                          ],
                        ),
                      ),
                      // SizedBox(height: 200),
                      SizedBox(
                        height: 32.h,
                        width: double.infinity,
                        child: loginContainer(
                          otpWidget: const SizedBox(),
                          twoText: twoStyleTexts(
                              text1: 'Get started with', text2: 'AimShala!'),
                          fieldText: primarytxt(
                              "Continue with your mobile number", 10.7.sp),
                          context: context,
                          textfield: SizedBox(
                            // color: Colors.yellow,
                            width: 79.w,
                            // height: 44,
                            child: Form(
                              key: formKey,
                              child: Column(
                                children: [
                                  Align(
                                      alignment: Alignment.centerLeft,
                                      child:
                                          primarytxt3("Mobile Number", 10.sp)),
                                  TextFormField(
                                    inputFormatters: [
                                      LengthLimitingTextInputFormatter(10)
                                    ],
                                    controller: controller.phoneController,
                                    style: const TextStyle(
                                        fontSize: 14, height: 1),
                                    keyboardType: TextInputType.phone,
                                    decoration: decorTextfield(
                                      hintText: " Enter Mobile Number",
                                      prefixWidget: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Text(
                                            '+91',
                                            style: TextStyle(
                                                fontWeight: FontWeight.w400,
                                                fontSize: 17,
                                                color: kblack.withOpacity(0.4)),
                                          ),
                                         Icon(Icons.keyboard_arrow_down,size: 26,color: kblack.withOpacity(0.4),)
                                        ],
                                      ),
                                    ),
                                    onChanged: (value) {
                                      onchanged(controller, value);
                                    },
                                    validator: (value) =>
                                        controller.phoneValidation(value),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          valText: Text(
                            'Continue',
                            style: TextStyle(
                              color: controller.isButtonEnabled.value
                                  ? Colors.white
                                  : Colors.black.withOpacity(0.6),
                            ),
                          ),
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.resolveWith<Color>(
                                    (states) {
                              return controller.isButtonEnabled.value
                                  ? mainPurple
                                  : bbColor;
                            }),
                            shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10))),
                          ),
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              controller.sendOTPFunction(
                                  mobileNo:
                                      '91${controller.phoneController.text}');
                              Get.to(() => OTPScreen(mobileNo: controller.phoneController.text));
                            }
                          },
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  void onchanged(LoginController controller, String value) {
    return setState(() {
      controller.isButtonEnabled.value = value.length == 10;
    });
  }
}
