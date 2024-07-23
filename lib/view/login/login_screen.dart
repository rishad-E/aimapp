import 'package:aimshala/controllers/login_controller.dart';
import 'package:aimshala/utils/common/widgets/colors_common.dart';
import 'package:aimshala/utils/common/widgets/text_common.dart';
import 'package:aimshala/utils/widgets/widgets_common.dart';
import 'package:aimshala/view/login/widget/widgets_login.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formKey = GlobalKey();
    final controller = Get.put(LoginController());
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
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
                aimshalaContainer(),
                loginContainer(
                  child: Column(
                    children: [
                      twoStyleTexts(
                          text1: 'Get started with', text2: 'AimShala!'),
                      hBox,
                      primarytxt("Continue with your mobile number", 10.7.sp),
                      hLBox,
                      Form(
                        key: formKey,
                        child: Column(
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: primarytxt3("Mobile Number", 10.sp),
                            ),
                            TextFormField(
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(10)
                              ],
                              controller: controller.phoneController,
                              style: const TextStyle(fontSize: 14, height: 1),
                              keyboardType: TextInputType.phone,
                              decoration: decorTextfield(
                                hintText: " Enter Mobile Number",
                                prefixWidget: phoneIcon(),
                              ),
                              onChanged: (value) => onchanged(controller, value),
                              validator: (value) =>
                                  controller.phoneValidation(value),
                            ),
                            hLBox,
                            SizedBox(
                              width: double.infinity,
                              height: 4.5.h,
                              child: GetBuilder<LoginController>(
                                id: 'continue-button',
                                builder: (logincontroller) {
                                  return TextButton(
                                    style: ButtonStyle(
                                        backgroundColor: MaterialStateProperty
                                            .resolveWith<Color>((states) {
                                          return logincontroller
                                                  .isButtonEnabled.value
                                              ? mainPurple
                                              : bbColor;
                                        }),
                                        shape: buttonShape(round: 10)),
                                    onPressed: () {
                                      if (formKey.currentState!.validate()) {
                                        controller.sendOTPFunction(
                                            mobileNo:
                                                '91${controller.phoneController.text}');
                                      }
                                    },
                                    child: Text(
                                      'Continue',
                                      style: TextStyle(
                                        color: logincontroller
                                                .isButtonEnabled.value
                                            ? Colors.white
                                            : Colors.black.withOpacity(0.6),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          )),
        ),
      ),
    );
  }

  void onchanged(LoginController controller, String value) {
    controller.isButtonEnabled.value = value.length == 10;
    controller.update(['continue-button']);
  }
}
