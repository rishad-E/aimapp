import 'package:aimshala/controllers/signup_controller.dart';
import 'package:aimshala/utils/common/widgets/colors_common.dart';
import 'package:aimshala/utils/common/widgets/text_common.dart';
import 'package:aimshala/utils/widgets/widgets_common.dart';
import 'package:aimshala/view/login/login_screen.dart';
import 'package:aimshala/view/login/widget/widgets_login.dart';
import 'package:aimshala/view/profile/common/widgets/texts.dart';
import 'package:aimshala/view/signup/widget/custom_textfiled.dart';
import 'package:aimshala/view/signup/widget/signup_bottomsheet.dart';
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
                          textField: signUpRoleBox(
                            child: GetBuilder<SignUpController>(
                                id: 'update-signupRole',
                                builder: (c) {
                                  return Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            signUpRoleItems(
                                              role: 'Student',
                                              image:
                                                  'assets/images/student-signup.png',
                                              selected: c.selectedRole.value ==
                                                  'Student',
                                              onTap: () => c.toggleRoleSelect(
                                                  'Student', '1'),
                                            ),
                                            wMBox,
                                            signUpRoleItems(
                                              selected: c.selectedRole.value ==
                                                  'Professional',
                                              role: 'Professional',
                                              image:
                                                  'assets/images/professional-signup.png',
                                              onTap: () => c.toggleRoleSelect(
                                                  'Professional', '2'),
                                            ),
                                          ],
                                        ),
                                        c.selectedRole.value != null
                                            ? choiceSizedBox(height: 8)
                                            : shrinked,
                                        c.selectedRole.value != null
                                            ? c.selectedRole.value == 'Student'
                                                //student part contains shool and college
                                                ? Wrap(
                                                    spacing: 5,
                                                    runSpacing: 4,
                                                    children: List.generate(
                                                      c.studentList.length,
                                                      (index) {
                                                        final data = c
                                                            .studentList[index];
                                                        return signUpRoleItems(
                                                          role: data.title
                                                              .toString(),
                                                          selected:
                                                              c.selectedSubRole ==
                                                                  data.title,
                                                          onTap: () {
                                                            c.toggleSubRoleSelect(
                                                                data.title
                                                                    .toString(),
                                                                data.id
                                                                    .toString());
                                                          },
                                                        );
                                                      },
                                                    ),
                                                  )
                                                : Wrap(
                                                    spacing: 5,
                                                    runSpacing: 4,
                                                    children: List.generate(
                                                      c.professionalList.length,
                                                      (index) {
                                                        final data =
                                                            c.professionalList[
                                                                index];
                                                        return signUpRoleItems(
                                                          role: data.title
                                                              .toString(),
                                                          selected:
                                                              c.selectedSubRole ==
                                                                  data.title,
                                                          onTap: () => c
                                                              .toggleSubRoleSelect(
                                                                  data.title
                                                                      .toString(),
                                                                  data.id
                                                                      .toString()),
                                                        );
                                                      },
                                                    ),
                                                  )
                                            : shrinked,
                                        c.selectedSubRole != null
                                            ? choiceSizedBox(height: 8)
                                            : shrinked,
                                        c.selectedSubRole != null
                                            ? c.selectedSubRole ==
                                                    'School Student'
                                                //subschool part form 8 to 12 th
                                                ? Wrap(
                                                    spacing: 5,
                                                    runSpacing: 4,
                                                    children: List.generate(
                                                      c.subListSchool.length,
                                                      (index) {
                                                        final data =
                                                            c.subListSchool[
                                                                index];
                                                        return signUpRoleItems(
                                                          role: data.name
                                                              .toString(),
                                                          selected:
                                                              c.selectedFinalRole ==
                                                                  data.name,
                                                          onTap: () => c
                                                              .toggleFinalRoleSelect(
                                                                  data.name
                                                                      .toString(),
                                                                  data.id
                                                                      .toString()),
                                                        );
                                                      },
                                                    ),
                                                  )
                                                //sub college part from ug to pg
                                                : c.selectedSubRole ==
                                                        'College Student'
                                                    ? Wrap(
                                                        spacing: 5,
                                                        runSpacing: 4,
                                                        children: List.generate(
                                                          c.subListCollege
                                                              .length,
                                                          (index) {
                                                            final data =
                                                                c.subListCollege[
                                                                    index];
                                                            return signUpRoleItems(
                                                              role: data.name
                                                                  .toString(),
                                                              selected:
                                                                  c.selectedFinalRole ==
                                                                      data.name,
                                                              onTap: () => c
                                                                  .toggleFinalRoleSelect(
                                                                      data.name
                                                                          .toString(),
                                                                      data.id
                                                                          .toString()),
                                                            );
                                                          },
                                                        ),
                                                      )
                                                    : shrinked
                                            : shrinked,
                                      ]);
                                }),
                          ),
                        ),
                        Obx(() => signUp.roleNotSelected.value == 'no'
                            ? Column(
                                children: [
                                  hBox,
                                  Text('Please Select your Role',
                                      style: errorStyle()),
                                ],
                              )
                            : shrinked),
                        hLBox,
                        GetBuilder<SignUpController>(
                          id: 'button-signup',
                          builder: (c) {
                            // log("signup");
                            return Column(
                              children: [
                                SizedBox(
                                  width: double.infinity,
                                  height: 4.5.h,
                                  child: signUpButton(
                                    onPressed: () {
                                      if (c.selectedRole.value == null) {
                                        c.roleNotSelected.value = 'no';
                                      }
                                      if (formKey.currentState!.validate()) {
                                        if (c.selectedRole.value != null) {
                                          String mobileWithoutCountryCode =
                                              mobileNo.substring(2);
                                          // log('name=>${c.nameController.text} email=>${c.emailController.text} mobile=>$mobileWithoutCountryCode gender=>${c.genderController.text} dob=>${c.dobController.text} role=>${c.selectedRole}id=>${c.qualiController.text} subrole=>${c.selectedSubRole}subId=>${c.classController.text} final=>${c.selectedFinalRole}finalID=>${c.roleController.text} S-type=>Complete',
                                          //     name: 'signupScreen');
                                          c.signUpUserFunction(
                                              name: c.nameController.text,
                                              email: c.emailController.text,
                                              mobileNo:
                                                  mobileWithoutCountryCode,
                                              gender: c.genderController.text,
                                              dob: c.dobController.text,
                                              qualification:
                                                  c.qualiController.text,
                                              clases: c.classController.text,
                                              role: c.roleController.text,
                                              submit: 'complete_onboarding');
                                        }
                                      }
                                    },
                                    backgroundColor: MaterialStateProperty
                                        .resolveWith<Color>(
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
                                  ),
                                ),
                                choiceSizedBox(height: 12),
                                InkWell(
                                  onTap: () {
                                    if (c.selectedRole.value == null) {
                                      c.roleNotSelected.value = 'no';
                                    }
                                    if (formKey.currentState!.validate()) {
                                      if (c.selectedRole.value != null) {
                                        String mobileWithoutCountryCode =
                                            mobileNo.substring(2);
                                        // log('name=>${c.nameController.text} email=>${c.emailController.text} mobile=>$mobileWithoutCountryCode gender=>${c.genderController.text} dob=>${c.dobController.text} role=>${c.selectedRole}id=>${c.qualiController.text} subrole=>${c.selectedSubRole}subId=>${c.classController.text} final=>${c.selectedFinalRole}finalID=>${c.roleController.text} S-type=>Later',
                                        //     name: 'signupScreen');
                                        c.signUpUserFunction(
                                            name: c.nameController.text,
                                            email: c.emailController.text,
                                            mobileNo: mobileWithoutCountryCode,
                                            gender: c.genderController.text,
                                            dob: c.dobController.text,
                                            qualification:
                                                c.qualiController.text,
                                            clases: c.classController.text,
                                            role: c.roleController.text,
                                            submit: 'do_it_later');
                                      }
                                    }
                                  },
                                  child: c.isSaving.value
                                      ? CircularProgressIndicator(
                                          color: kwhite, strokeWidth: 1)
                                      : semiBoldChoiceText(
                                          text: 'I\'ll do it later',
                                          size: 14,
                                          color: mainPurple),
                                )
                              ],
                            );
                          },
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
