import 'package:aimshala/utils/common/widgets/colors_common.dart';
import 'package:aimshala/utils/common/widgets/text_common.dart';
import 'package:aimshala/utils/widgets/widgets_common.dart';
import 'package:aimshala/view/educator_registration/common/widgets/widgets.dart';
import 'package:aimshala/view/educator_registration/submitted_section/widgets/texts.dart';
import 'package:aimshala/view/home/home.dart';
import 'package:aimshala/view/profile/common/widgets/texts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class EducatorSubmitFinalPage extends StatelessWidget {
  const EducatorSubmitFinalPage({super.key});
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        appBar:
            educatorAppBar(title: 'Educator Registration', backArrow: false),
        body: educatorBGContainer(
          child: SingleChildScrollView(
            child: Column(
              children: [
                educatorSectionContainer(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      hLBox,
                      Align(
                        alignment: Alignment.center,
                        child: boldText(text: 'Dear Sunil,', size: 9.sp),
                      ),
                      hBox,
                      Align(
                        alignment: Alignment.center,
                        child: boldText(
                            text: 'Thank You',
                            size: 12.5.sp,
                            color: mainPurple),
                      ),
                      hBox,
                      regularText(thanksText, 9.sp,
                          textAlign: TextAlign.center),
                      hBox,
                      Container(
                        padding: const EdgeInsets.all(8),
                        color: const Color.fromARGB(255, 250, 250, 252),
                        child: regularText(dedicationText, 9.sp),
                      ),
                      hBox,
                      semiBoldChoiceText(
                        text: "Here's what you can expect next:",
                        size: 12.5.sp,
                        textAlign: TextAlign.left,
                      ),
                      choiceSizedBox(height: 8),
                      boldText(text: '1. Review Process', size: 9.sp),
                      regularText(reviewText, 9.sp),
                      choiceSizedBox(height: 8),
                      boldText(text: '2. Email Notification', size: 9.sp),
                      regularText(emailText, 9.sp),
                      choiceSizedBox(height: 8),
                      boldText(text: '3. Review Process', size: 9.sp),
                      regularText(reviewText2, 9.sp),
                      choiceSizedBox(height: 8),
                      Container(
                        padding: const EdgeInsets.all(8),
                        color: const Color.fromARGB(255, 250, 250, 252),
                        child: Column(
                          children: [
                            regularText(noticeText1, 9.sp),
                            regularText(noticeText2, 9.sp),
                          ],
                        ),
                      ),
                      choiceSizedBox(height: 8),
                      regularText(
                          "Thank you once again for your trust and interest in Aimshala. Together, let's shape the future of education!",
                          9.sp,
                          color: kblack),
                      choiceSizedBox(height: 8),
                      regularText("Warm regards,", 9.sp, color: kblack),
                      choiceSizedBox(height: 8),
                      semiBoldChoiceText(
                          text: 'The Aimshala Team',
                          size: 9.sp,
                          color: mainPurple),
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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
