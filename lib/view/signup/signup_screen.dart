import 'dart:developer';
import 'package:aimshala/controllers/signup_controller.dart';
import 'package:aimshala/utils/common/colors_common.dart';
import 'package:aimshala/utils/common/text_common.dart';
import 'package:aimshala/utils/common/widgets_common.dart';
import 'package:aimshala/view/home.dart';
import 'package:aimshala/view/login/widget/widgets_login.dart';
import 'package:aimshala/view/signup/widget/bottomsheet.dart';
import 'package:aimshala/view/signup/widget/widget_signup.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class SignUpScreen extends StatefulWidget {
  final String mobileNo;
  const SignUpScreen({super.key, required this.mobileNo});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final GlobalKey<FormState> formKey = GlobalKey();
  bool isOk = true;
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
              init: SignUpController(),
              builder: (controller) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 17),
                  child: Column(
                    children: [
                      // Align(
                      //     alignment: Alignment.topLeft,
                      //     child: appbarContainer(onPressed: () {})),
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
                            // color: Colors.yellow,
                        height: 51.h,
                        width: double.infinity,
                        child: signUPContainer(
                          twoText: twoStyleTexts(
                              text1: 'Tell us More about', text2: 'You!'),
                          fieldText: primarytxt(
                              "Your Name, Email& Current Role", 10.7.sp),
                          context: context,
                          textfield: SizedBox(
                            // color: Colors.yellow,
                            height: 30.h,
                            width: 80.w,
                            child: Form(
                              key: formKey,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  signupBox(
                                    text: primarytxt3('Name', 9.5.sp),
                                    textField: TextFormField(
                                      onChanged: (value) =>
                                          allfieldSelection(controller),
                                      controller: controller.nameController,
                                      decoration:
                                          roleContainer(hintText: 'Enter Name'),
                                      validator: (value) =>
                                          controller.validation(
                                              word: value, field: 'Name'),
                                    ),
                                  ),
                                  signupBox(
                                    text: primarytxt3('Email', 9.5.sp),
                                    textField: TextFormField(
                                      onChanged: (value) =>
                                          allfieldSelection(controller),
                                      controller: controller.emailController,
                                      decoration: roleContainer(
                                          hintText: 'Enter Email'),
                                      validator: (value) =>
                                          controller.validation(
                                              word: value, field: 'Email'),
                                      keyboardType: TextInputType.emailAddress,
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      showRoleBottomSheet(context, controller);
                                      allfieldSelection(controller);
                                    },
                                    child: AbsorbPointer(
                                      child: signupBox(
                                        text: primarytxt3('I am', 9.5.sp),
                                        textField: TextFormField(
                                            onChanged: (value) =>
                                                allfieldSelection(controller),
                                            controller:
                                                controller.roleController,
                                            decoration: roleContainer(
                                                hintText: 'Select your role',
                                                suffixWidget: const Icon(
                                                    Icons.keyboard_arrow_down)),
                                            readOnly: true),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          valText: Text(
                            'Sign up',
                            style: TextStyle(
                              color: controller.buttonTextColor.value,
                            ),
                          ),
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.resolveWith<Color>(
                                    (states) {
                              return controller.areAllFieldsSelected.value
                                  ? kpurple
                                  : bbColor;
                            }),
                            shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(14))),
                          ),
                          onPressed: () {
                            if (formKey.currentState!.validate() &&
                                controller.areAllFieldsSelected.value) {
                              log('entered :${controller.nameController.text + controller.emailController.text + widget.mobileNo + controller.roleController.text}');

                              controller
                                  .signUpUserFunction(
                                      name: controller.nameController.text,
                                      email: controller.emailController.text,
                                      mobileNo: widget.mobileNo)
                                  .then(
                                    (value) => {
                                      if (value == true)
                                        {
                                          showDialog(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return AlertDialog(
                                                content: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: [
                                                    CircleAvatar(
                                                        radius: 60.sp,
                                                        backgroundColor:
                                                            Colors.transparent,
                                                        child: Image.asset(
                                                            'assets/images/profile.png',
                                                            fit: BoxFit.cover)),
                                                    hMBox,
                                                    Text('Thank You!',
                                                        style: TextStyle(
                                                            fontSize: 15.sp,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: kpurple)),
                                                    hMBox,
                                                    primarytxt2(
                                                        "For signing up! Welcom to AimShala",
                                                        11.sp),
                                                    hMBox,
                                                    Container(
                                                        width: 80.w,
                                                        height: 6.h,
                                                        decoration: const BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .all(Radius
                                                                        .circular(
                                                                            8))),
                                                        child: ElevatedButton(
                                                            style: ButtonStyle(
                                                              backgroundColor:
                                                                  MaterialStateProperty
                                                                      .all(
                                                                          kpurple),
                                                              shape: MaterialStateProperty.all<
                                                                      RoundedRectangleBorder>(
                                                                  RoundedRectangleBorder(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              14))),
                                                            ),
                                                            onPressed: () {
                                                              Get.offAll(() =>
                                                                  const HomeScreen());
                                                            },
                                                            child: Text('OK',
                                                                style: TextStyle(
                                                                    color:
                                                                        kwhite)))),
                                                  ],
                                                ),
                                              );
                                            },
                                          )
                                        }
                                    },
                                  );
                            }
                          },
                        ),
                      ),
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

  void allfieldSelection(SignUpController controller) {
    return setState(() {
      controller.allFieldsSelected();
    });
  }
}
