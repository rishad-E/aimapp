// import 'dart:developer';

// import 'package:aimshala/controllers/career_booking_controller.dart';
// import 'package:aimshala/utils/common/colors_common.dart';
// import 'package:aimshala/utils/common/text_common.dart';
// import 'package:aimshala/utils/widgets/widgets_common.dart';
// import 'package:aimshala/view/BookCareerCounsellCall/career_home_aimScreen/widgets/career__widgets.dart';
// import 'package:aimshala/view/BookCareerCounsellCall/career_home_aimScreen/widgets/career_colors.dart';
// import 'package:aimshala/view/BookCareerCounsellCall/career_otp_verify_screen/career_otp_verify_screen.dart';
// import 'package:aimshala/view/login/widget/widgets_login.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:get/get.dart';
// import 'package:sizer/sizer.dart';

// class CareerVerificationScreen extends StatelessWidget {
//   const CareerVerificationScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final controller = Get.put(BookCareerCounsellController());
//     final GlobalKey<FormState> formKey = GlobalKey();

//     return Scaffold(
//       extendBodyBehindAppBar: true,
//       appBar: careerAppBar(),
//       body: Container(
//         decoration: careerMainContainerdecoration(),
//         child: Center(
//           child: SingleChildScrollView(
//               child: Padding(
//             padding: careerContainerP,
//             child: careerSecContainer(
//               child: Form(
//                 key: formKey,
//                 child: Column(
//                   children: [
//                     twoStyleTexts(text1: "Hi,", text2: 'John Doe'),
//                     boldText(text: 'How can we reach You!', size: 14.sp),
//                     hLBox,
//                     careerHomeField(
//                       text: primarytxt3('Mobile Number', 11),
//                       textField: TextFormField(
//                         inputFormatters: [LengthLimitingTextInputFormatter(10)],
//                         controller: controller.mobNumberController,
//                         style: const TextStyle(fontSize: 14, height: 1),
//                         keyboardType: TextInputType.phone,
//                         decoration: decorTextfield(
//                           hintText: " Enter Mobile Number",
//                           prefixWidget: Row(
//                             mainAxisSize: MainAxisSize.min,
//                             children: [
//                               Text(
//                                 '+91',
//                                 style: TextStyle(
//                                     fontWeight: FontWeight.w400,
//                                     fontSize: 17,
//                                     color: kblack.withOpacity(0.4)),
//                               ),
//                               Icon(
//                                 Icons.keyboard_arrow_down,
//                                 size: 26,
//                                 color: kblack.withOpacity(0.4),
//                               )
//                             ],
//                           ),
//                         ),
//                         onChanged: (value) {
//                           controller.update(['button-careerVerify']);
//                         },
//                         validator: (value) => controller.phoneValidation(value),
//                       ),
//                     ),
//                     hMBox,
//                     careerHomeField(
//                       text: primarytxt3('Enter Email', 11),
//                       textField: TextFormField(
//                         style: TextStyle(fontSize: 14, color: textFieldColor),
//                         decoration: careerTextFiled(
//                           hintText: 'Enter Email',
//                         ),
//                         onChanged: (value) {
//                           controller.update(['button-careerVerify']);
//                         },
//                         controller: controller.emailController,
//                         keyboardType: TextInputType.emailAddress,
//                         validator: (word) => controller.emailValidation(word),
//                       ),
//                     ),
//                     hLBox,
//                     Container(
//                       width: double.infinity,
//                       height: 4.5.h,
//                       decoration: boxdecoration(12),
//                       child: GetBuilder<BookCareerCounsellController>(
//                           id: 'button-careerVerify',
//                           builder: (verify) {
//                             return TextButton(
//                               onPressed: () {
//                                 if (formKey.currentState!.validate()) {
//                                   log('mobilNo: 91${verify.mobNumberController.text}');
//                                   verify.careerSendOTPFunction(
//                                       mobileNo:
//                                           '91${verify.mobNumberController.text}');
//                                   Get.to(() => CareerOTPVerifyScreen(
//                                         mobileNo:
//                                             verify.mobNumberController.text,
//                                       ));
//                                 }
//                               },
//                               style: ButtonStyle(
//                                 shape: buttonShape(round: 8),
//                                 backgroundColor:
//                                     MaterialStateProperty.resolveWith<Color>(
//                                   (states) {
//                                     return verify.mobNumberController.text
//                                                 .isNotEmpty &&
//                                             verify
//                                                 .emailController.text.isNotEmpty
//                                         ? kpurple
//                                         : buttonColor;
//                                   },
//                                 ),
//                               ),
//                               child: Text(
//                                 "Next",
//                                 style: TextStyle(
//                                     color: verify.mobNumberController.text
//                                                 .isNotEmpty &&
//                                             verify
//                                                 .emailController.text.isNotEmpty
//                                         ? Colors.white
//                                         : disableText),
//                               ),
//                             );
//                           }),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           )),
//         ),
//       ),
//     );
//   }
// }
