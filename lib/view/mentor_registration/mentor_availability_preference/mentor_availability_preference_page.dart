import 'package:aimshala/utils/common/colors_common.dart';
import 'package:aimshala/utils/common/text_common.dart';
import 'package:aimshala/utils/widgets/widgets_common.dart';
import 'package:aimshala/view/mentor_registration/common/widgets/widgets.dart';
import 'package:aimshala/view/profile/common/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class MentorAvailabilityPreferencePage extends StatelessWidget {
  const MentorAvailabilityPreferencePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: mentorAppbar(title: 'Mentor Registration'),
      body: mentorBGContainer(
        child: SingleChildScrollView(
          child: Form(
            child: Column(
              children: [
                mentorSectionContainer(
                  child: Column(
                    children: [
                      boldText(text: 'Availability Preferences', size: 15.sp),
                      hLBox,

                      hLBox,
                      // GetBuilder<MentorPreferenceController>(
                      //     id: 'mentor-preferences',
                      //     builder: (c) {
                      //       return
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          actionContainer(
                            text: 'Cancel',
                            textColor: mainPurple,
                            boxColor: kwhite,
                            borderColor: mainPurple,
                            onTap: () => Get.back(),
                          ),
                          wMBox,
                          actionContainer(
                            text: 'Next',
                            textColor: textFieldColor,
                            boxColor: buttonColor,
                            onTap: () {},
                          ),
                        ],
                      )
                      // })
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
