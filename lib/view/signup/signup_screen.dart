import 'dart:developer';
import 'package:aimshala/controllers/signup_controller.dart';
import 'package:aimshala/utils/common/widgets/colors_common.dart';
import 'package:aimshala/utils/common/widgets/text_common.dart';
import 'package:aimshala/utils/widgets/widgets_common.dart';
import 'package:aimshala/view/login/login_screen.dart';
import 'package:aimshala/view/login/widget/widgets_login.dart';
import 'package:aimshala/view/signup/widget/custom_textfiled.dart';
import 'package:aimshala/view/signup/widget/signup_bottomsheet.dart';
import 'package:aimshala/view/signup/widget/widget_signup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class SignUpScreen extends StatelessWidget {
  final String mobileNo;
  SignUpScreen({super.key, required this.mobileNo});
  final storage = const FlutterSecureStorage();
  final GlobalKey<FormState> formKey = GlobalKey();
  final signUp = Get.put(SignUpController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        title: appbarContainer(
            onPressed: () => Get.offAll(() => const LoginScreen())),
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
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  aimshalaContainerSignUp(),
                  signUPContainer(
                    child: Column(
                      children: [
                        twoStyleTexts(
                            text1: 'Tell us More about', text2: 'You!'),
                        hBox,
                        primarytxt("Your Name & Email", 10.7.sp),
                        hLBox,
                        signupBox(
                          text: primarytxt3('Name', 9.sp),
                          textField: TextFormField(
                            onChanged: (value) => signUp.allFieldsSelected(),
                            controller: signUp.nameController,
                            decoration: roleContainer(hintText: 'Enter Name'),
                            validator: (value) => signUp.nameValidation(value),
                            style: const TextStyle(fontSize: 13),
                          ),
                        ),
                        hBox,
                        signupBox(
                          text: primarytxt3('Email', 9.sp),
                          textField: TextFormField(
                            onChanged: (value) => signUp.allFieldsSelected(),
                            controller: signUp.emailController,
                            decoration: roleContainer(hintText: 'Enter Email'),
                            validator: (value) => signUp.emailValidation(value),
                            keyboardType: TextInputType.emailAddress,
                            style: const TextStyle(fontSize: 13),
                          ),
                        ),
                        hBox,
                        signupBox(
                          text: primarytxt3('Gender', 9.sp),
                          textField: TextFormField(
                            onChanged: (value) => signUp.allFieldsSelected(),
                            controller: signUp.genderController,
                            decoration:
                                roleContainer(hintText: 'Select Gender'),
                            validator: (value) => signUp.fieldValidation(value),
                            // keyboardType: TextInputType.emailAddress,
                            style: const TextStyle(fontSize: 13),
                            readOnly: true,
                            onTap: () => showSignUpGenderOptions(context),
                          ),
                        ),
                        hBox,
                        signupBox(
                          text: primarytxt3('Date Of Birth', 9.sp),
                          textField: TextFormField(
                            onChanged: (value) => signUp.allFieldsSelected(),
                            controller: signUp.dobController,
                            decoration: roleContainer(hintText: 'DD/MM/YYYY'),
                            validator: (value) => signUp.fieldValidation(value),
                            keyboardType: TextInputType.datetime,
                            inputFormatters: [DateInputFormatter()],
                            style: const TextStyle(fontSize: 13),
                          ),
                        ),
                        hBox,
                        signupBox(
                          text: primarytxt3('Your Role', 9.sp),
                          textField: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 12, vertical: 10),
                            width: double.infinity,
                            height: 50,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(
                                  color: kblack.withOpacity(0.3),
                                )),
                            child: Row(
                              children: [
                                Container(
                                  width: 50,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      border: Border.all(
                                        color: kblack.withOpacity(0.3),
                                      )),
                                      child: Row(children: [SvgPicture.asset('assets/images/Video-booked.svg')],),
                                )
                              ],
                            ),
                          ),
                        ),
                        hLBox,
                        SizedBox(
                          width: double.infinity,
                          height: 4.5.h,
                          child: GetBuilder<SignUpController>(
                            id: 'button-signup',
                            builder: (c) {
                              // log("signup");
                              return signUpButton(
                                onPressed: () {
                                  if (formKey.currentState!.validate() &&
                                      c.areAllFieldsSelected.value) {
                                    String mobileWithoutCountryCode =
                                        mobileNo.substring(2);
                                    log('name=>${c.nameController.text} email=>${c.emailController.text} mobile=>$mobileWithoutCountryCode gender=>${c.genderController.text} dob=>${c.dobController.text}',
                                        name: 'signupScreen');
                                    c.signUpUserFunction(
                                      name: c.nameController.text,
                                      email: c.emailController.text,
                                      mobileNo: mobileWithoutCountryCode,
                                      gender: c.genderController.text,
                                      dob: c.dobController.text,
                                    );
                                  }
                                },
                                backgroundColor:
                                    MaterialStateProperty.resolveWith<Color>(
                                  (states) {
                                    return c.areAllFieldsSelected.value
                                        ? kpurple
                                        : bbColor;
                                  },
                                ),
                                child: c.isSaving.value
                                    ? CircularProgressIndicator(
                                        color: kwhite, strokeWidth: 1)
                                    : signUpText(
                                        textColor: c.buttonTextColor.value),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )),
        ),
      ),
    );
  }

  void showSignUpGenderOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) => const SignupGenderSheet(),
    );
  }
}

// void showSignUpBottomsheet(BuildContext context) {
//   showModalBottomSheet(
//     context: context,
//     builder: (context) {
//       return const SingUpBottomSheet();
//     },
//   );
// }

// void showSignUpDialogueBox(BuildContext context) {
//   showDialog(
//     context: context,
//     barrierDismissible: false,
//     builder: (context) {
//       return const SignUpDialogueBox();
//     },
//   );
// }
