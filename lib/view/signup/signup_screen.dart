import 'dart:developer';
import 'package:aimshala/controllers/signup_controller.dart';
import 'package:aimshala/utils/common/widgets/colors_common.dart';
import 'package:aimshala/utils/common/widgets/text_common.dart';
import 'package:aimshala/utils/widgets/widgets_common.dart';
import 'package:aimshala/view/login/login_screen.dart';
import 'package:aimshala/view/login/widget/widgets_login.dart';
import 'package:aimshala/view/signup/widget/widget_signup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class SignUpScreen extends StatelessWidget {
  final String mobileNo;
  SignUpScreen({super.key, required this.mobileNo});
  final storage = const FlutterSecureStorage();
  final GlobalKey<FormState> formKey = GlobalKey();
  final signUp = Get.put(SignUpController());

  void getphone() async {
    String? phone = await storage.read(key: 'phone');
    log(phone.toString(), name: 'signupscreen');
  }

  @override
  Widget build(BuildContext context) {
    getphone();
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
                          text: primarytxt3('Name', 9.5.sp),
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
                          text: primarytxt3('Email', 9.5.sp),
                          textField: TextFormField(
                            onChanged: (value) => signUp.allFieldsSelected(),
                            controller: signUp.emailController,
                            decoration: roleContainer(hintText: 'Enter Email'),
                            validator: (value) => signUp.emailValidation(value),
                            keyboardType: TextInputType.emailAddress,
                            style: const TextStyle(fontSize: 13),
                          ),
                        ),
                        // hBox,
                        // signupBox(
                        //   text: primarytxt3('Gender', 9.5.sp),
                        //   textField: TextFormField(
                        //     onChanged: (value) => signUp.allFieldsSelected(),
                        //     controller: signUp.genderController,
                        //     decoration: roleContainer(hintText: 'Enter Email'),
                        //     validator: (value) => signUp.emailValidation(value),
                        //     keyboardType: TextInputType.emailAddress,
                        //     style: const TextStyle(fontSize: 13),
                        //   ),
                        // ),
                        // hBox,
                        // signupBox(
                        //   text: primarytxt3('Date Of Birth', 9.5.sp),
                        //   textField: TextFormField(
                        //     onChanged: (value) => signUp.allFieldsSelected(),
                        //     controller: signUp.dobController,
                        //     decoration: roleContainer(hintText: 'DD/MM/YYYY'),
                        //     validator: (value) => signUp.emailValidation(value),
                        //     keyboardType: TextInputType.emailAddress,
                        //     style: const TextStyle(fontSize: 13),
                        //   ),
                        // ),
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
                                    log('name=>${c.nameController.text} email=>${c.emailController.text} mobile=>$mobileWithoutCountryCode',
                                        name: 'signupScreen');
                                    c.signUpUserFunction(
                                      name: c.nameController.text,
                                      email: c.emailController.text,
                                      mobileNo: mobileWithoutCountryCode,
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
