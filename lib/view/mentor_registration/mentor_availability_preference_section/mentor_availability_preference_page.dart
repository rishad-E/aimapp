import 'dart:developer';

import 'package:aimshala/controllers/mentor_controllers/mentor_availability_controller.dart';
import 'package:aimshala/utils/common/widgets/colors_common.dart';
import 'package:aimshala/utils/common/widgets/text_common.dart';
import 'package:aimshala/utils/widgets/widgets_common.dart';
import 'package:aimshala/view/educator_registration/common/widgets/widgets.dart';
import 'package:aimshala/view/mentor_registration/common/widgets/widgets.dart';
import 'package:aimshala/view/mentor_registration/mentor_additional_information_section/mentor_additional_information_page.dart';
import 'package:aimshala/view/mentor_registration/mentor_availability_preference_section/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class MentorAvailabilityPreferencePage extends StatelessWidget {
  const MentorAvailabilityPreferencePage({super.key});

  @override
  Widget build(BuildContext context) {
    // final controller = Get.put(MentorAvailabilityController());
    List<String> dayList = [
      "Monday",
      "Tuesday",
      "Wednesday",
      "Thursday",
      "Friday",
      "Saturday",
      "Sunday"
    ];
    List<String> timeSlote = [
      "Morning (8-12)",
      "Afternoon (12-4)",
      "Evening (4-8)",
      "Night (8-12)"
    ];
    return Scaffold(
      appBar: mentorAppbar(title: 'Mentor Registration',backArrow: true),
      body: mentorBGContainer(
        child: SingleChildScrollView(
          child: Column(
            children: [
              mentorSectionContainer(
                child: Column(
                  children: [
                    boldText(text: 'Availability Preferences', size: 15.sp),
                    hLBox,
                    educatorFields(
                      item:
                          primarytxt3('Preferred Days for Teaching', 9.5.sp),
                      textfiled: GetBuilder<MentorAvailabilityController>(
                        init: MentorAvailabilityController(),
                        id: 'mentor-availableDay',
                        builder: (c) {
                          return Column(
                            children: List.generate(
                              dayList.length,
                              (index) => GestureDetector(
                                onTap: () => c.selectDays(dayList[index]),
                                child: avaliabilityDayContainer(
                                  day: dayList[index],
                                  selectedDay: c.availableDays
                                      .any((i) => i == dayList[index]),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    hBox,
                    educatorFields(
                      item: primarytxt3('Preferred Time Slots', 9.5.sp),
                      textfiled: GetBuilder<MentorAvailabilityController>(
                        init: MentorAvailabilityController(),
                        id: 'mentor-availableTime',
                        builder: (c) {
                          return Column(
                            children: List.generate(
                              timeSlote.length,
                              (index) => GestureDetector(
                                onTap: () => c.selectTimes(timeSlote[index]),
                                child: avaliabilityDayContainer(
                                  day: timeSlote[index],
                                  selectedDay: c.availableTimes
                                      .any((i) => i == timeSlote[index]),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    hLBox,
                    GetBuilder<MentorAvailabilityController>(
                        id: 'mentor-availability',
                        builder: (c) {
                          return Row(
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
                                textColor: c.availableDays.isNotEmpty &&
                                        c.availableTimes.isNotEmpty
                                    ? kwhite
                                    : textFieldColor,
                                boxColor: c.availableDays.isNotEmpty &&
                                        c.availableTimes.isNotEmpty
                                    ? mainPurple
                                    : buttonColor,
                                onTap: () {
                                  if (c.availableDays.isNotEmpty &&
                                      c.availableTimes.isNotEmpty) {
                                    log('days=>${c.availableDays} times=>${c.availableTimes}');
                                    Get.to(()=>MentorAdditionalInfoPage());
                                  }
                                },
                              ),
                            ],
                          );
                        })
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
