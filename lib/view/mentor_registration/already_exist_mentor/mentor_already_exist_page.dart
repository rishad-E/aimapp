import 'package:aimshala/utils/common/widgets/colors_common.dart';
import 'package:aimshala/utils/common/widgets/text_common.dart';
import 'package:aimshala/utils/widgets/widgets_common.dart';
import 'package:aimshala/view/home/home.dart';
import 'package:aimshala/view/mentor_registration/common/widgets/widgets.dart';
import 'package:aimshala/view/mentor_registration/mentor_final_submit_page/widgets/texts.dart';
import 'package:aimshala/view/profile/common/widgets/texts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class MentorAlreadyExistPage extends StatelessWidget {
  final String name;
  const MentorAlreadyExistPage({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        appBar: mentorAppbar(title: 'Mentor Registration',backArrow: false),
        body: mentorBGContainer(
            child: SingleChildScrollView(
          child: Column(
            children: [
              mentorSectionContainer(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    hLBox,
                    Align(
                      alignment: Alignment.center,
                      child: boldText(text: 'Dear $name,', size: 9.sp),
                    ),
                    hBox,
                    Align(
                      alignment: Alignment.center,
                      child: boldText(
                          text: 'Thank You', size: 12.5.sp, color: mainPurple),
                    ),
                    hBox,
                    regularText(
                        "For your interest in becoming a mentor with Aimshala. It looks like you are already registered as a Mentor. ", 9.sp,
                        textAlign: TextAlign.center),
                    hBox,
                    Container(
                      padding: const EdgeInsets.all(8),
                      color: const Color.fromARGB(255, 250, 250, 252),
                      child: Column(
                        children: [
                          regularText(decisionText, 9.sp),
                          regularText(decisionText2, 9.sp),
                        ],
                      ),
                    ),
                    hBox,
                    semiBoldChoiceText(
                      text: "Here's what will happen next: ",
                      size: 12.5.sp,
                      textAlign: TextAlign.left,
                    ),
                    choiceSizedBox(height: 8),
                    boldText(text: '1. Review Process', size: 9.sp),
                    regularText(reviewTextMentor, 9.sp),
                    choiceSizedBox(height: 8),
                    boldText(text: '2. Email Notification', size: 9.sp),
                    regularText(emailTextMentor, 9.sp),
                    choiceSizedBox(height: 8),
                    boldText(text: '3. Dashboard Access', size: 9.sp),
                    regularText(dashBoardText, 9.sp),
                    choiceSizedBox(height: 8),
                    Container(
                      padding: const EdgeInsets.all(8),
                      color: const Color.fromARGB(255, 250, 250, 252),
                      child: Column(
                        children: [
                          regularText(noticeTextMentor1, 9.sp),
                          hBox,hBox,
                          regularText(noticeTextMentor2, 9.sp),
                        ],
                      ),
                    ),
                    choiceSizedBox(height: 8),
                    regularText(
                        "Thank you for trusting Aimshala and for your eagerness to make a difference. Let's together empower the next generation!",
                        9.sp,
                        color: kblack),
                    choiceSizedBox(height: 8),
                    regularText("Warm regards,", 9.sp, color: kblack),
                    choiceSizedBox(height: 8),
                    semiBoldChoiceText(
                        text: 'The Aimshala Team', size: 9.sp, color: mainPurple),
                    choiceSizedBox(height: 8),
                    GestureDetector(
                      onTap: () => Get.offAll(() => const HomeScreen()),
                      child: Container(
                        height: 4.h,
                        decoration: BoxDecoration(
                          color: mainPurple,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Center(
                            child: Text(
                          'Back to home',
                          style: TextStyle(
                            color: kwhite,
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                          ),
                        )),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        )),
      ),
    );
  }
}
