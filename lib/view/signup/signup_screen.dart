import 'dart:developer';
import 'package:aimshala/controllers/signup_controller.dart';
import 'package:aimshala/utils/common/colors_common.dart';
import 'package:aimshala/utils/common/text_common.dart';
import 'package:aimshala/utils/widgets/widgets_common.dart';
import 'package:aimshala/view/login/login_screen.dart';
import 'package:aimshala/view/login/widget/widgets_login.dart';
import 'package:aimshala/view/signup/widget/signup_bottomsheet.dart';
import 'package:aimshala/view/signup/widget/signup_dialoguebox.dart';
import 'package:aimshala/view/signup/widget/widget_signup.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class SignUpScreen extends StatelessWidget {
  final String mobileNo;
  SignUpScreen({super.key, required this.mobileNo});

  final GlobalKey<FormState> formKey = GlobalKey();
  final signUp = Get.put(SignUpController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        title: appbarContainer(onPressed: () {
          Get.offAll(() => const LoginScreen());
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
                        child: Image.asset('assets/images/aimshala-logo.png'),
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
                  // color: Colors.yellow,
                  height: 51.h,
                  width: double.infinity,
                  child: signUPContainer(
                    twoText: twoStyleTexts(
                        text1: 'Tell us More about', text2: 'You!'),
                    fieldText:
                        primarytxt("Your Name, Email& Current Role", 10.7.sp),
                    context: context,
                    textfield: SizedBox(
                      // color: Colors.yellow,
                      height: 30.h,
                      width: 80.w,
                      child: Form(
                        key: formKey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            signupBox(
                              text: primarytxt3('Name', 9.5.sp),
                              textField: TextFormField(
                                onChanged: (value) =>
                                    signUp.allFieldsSelected(),
                                controller: signUp.nameController,
                                decoration:
                                    roleContainer(hintText: 'Enter Name'),
                                validator: (value) =>
                                    signUp.nameValidation(value),
                              ),
                            ),
                            signupBox(
                              text: primarytxt3('Email', 9.5.sp),
                              textField: TextFormField(
                                onChanged: (value) =>
                                    signUp.allFieldsSelected(),
                                controller: signUp.emailController,
                                decoration:
                                    roleContainer(hintText: 'Enter Email'),
                                validator: (value) =>
                                    signUp.emailValidation(value),
                                keyboardType: TextInputType.emailAddress,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                showSignUpBottomsheet(context);
                              },
                              child: AbsorbPointer(
                                child: signupBox(
                                  text: primarytxt3('I am', 9.5.sp),
                                  textField: TextFormField(
                                    onChanged: (value) =>
                                        signUp.allFieldsSelected(),
                                    controller: signUp.roleController,
                                    decoration: roleContainer(
                                        hintText: 'Select your role',
                                        suffixWidget: const Icon(
                                            Icons.keyboard_arrow_down)),
                                    readOnly: true,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    button: GetBuilder<SignUpController>(
                        id: 'button-signup',
                        builder: (c) {
                          // log("signup");
                          return TextButton(
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.resolveWith<Color>(
                                  (states) {
                                    return c.areAllFieldsSelected.value
                                        ? kpurple
                                        : bbColor;
                                  },
                                ),
                                shape: buttonShape(round: 10)),
                            onPressed: () {
                              if (formKey.currentState!.validate() &&
                                  c.areAllFieldsSelected.value) {
                                String mobileWithoutCountryCode =
                                    mobileNo.substring(2);
                                log(mobileWithoutCountryCode);
                                log('entered :${c.nameController.text + c.emailController.text + mobileWithoutCountryCode + c.roleController.text}');

                                c.signUpUserFunction(
                                      name: c.nameController.text,
                                      email: c.emailController.text,
                                      mobileNo: mobileWithoutCountryCode,
                                    )
                                    .then(
                                      (value) => {
                                        if (value == true)
                                          {showSignUpDialogueBox(context)}
                                      },
                                    );
                              }
                            },
                            child: Text(
                              'Sign up',
                              style: TextStyle(
                                color: c.buttonTextColor.value,
                              ),
                            ),
                          );
                        }),
                  ),
                ),
              ],
            ),
          )),
        ),
      ),
    );
  }
}

void showSignUpBottomsheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    builder: (context) {
      return const SingUpBottomSheet();
    },
  );
}

void showSignUpDialogueBox(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) {
      return const SignUpDialogueBox();
    },
  );
}
