import 'dart:developer';

import 'package:aimshala/controllers/educator_controllers/educator_availability_preference_controller.dart';
import 'package:aimshala/utils/common/widgets/colors_common.dart';
import 'package:aimshala/utils/common/widgets/text_common.dart';
import 'package:aimshala/utils/widgets/widgets_common.dart';
import 'package:aimshala/view/educator_registration/additional_information_section/additional_information_page.dart';
import 'package:aimshala/view/educator_registration/availability_preference_section/widgets/widgets.dart';
import 'package:aimshala/view/educator_registration/common/widgets/widgets.dart';
import 'package:aimshala/view/profile/common/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class EducatorAvailabilitySelectPage extends StatelessWidget {
  const EducatorAvailabilitySelectPage({super.key});

  @override
  Widget build(BuildContext context) {
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
      appBar: educatorAppBar(title: 'Educator Registration',backArrow: true),

      body: educatorBGContainer(
        child: SingleChildScrollView(
          child: Column(
            children: [
              educatorSectionContainer(
                child: Column(
                  children: [
                    boldText(text: 'Availability Preferences', size: 15.sp),
                    hLBox,
                    educatorFields(
                      item: primarytxt3('Preferred Days for Teaching', 9.5.sp),
                      textfiled: GetBuilder<EducatorAvailabilityController>(
                          init: EducatorAvailabilityController(),
                          id: 'update-selectedDay',
                          builder: (c) {
                            return Column(
                                children: List.generate(
                                    dayList.length,
                                    (index) => Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 3),
                                          child: GestureDetector(
                                            onTap: () => c.selectPreferedDay(
                                                dayList[index]),
                                            child: selectDayContainer(
                                              day: dayList[index],
                                              selectedDay: c.selectedDays.any(
                                                  (i) => i == dayList[index]),
                                            ),
                                          ),
                                        )));
                          }),
                    ),
                    hBox,
                    educatorFields(
                      item: primarytxt3('Preferred Time Slots', 9.5.sp),
                      textfiled: GetBuilder<EducatorAvailabilityController>(
                          init: EducatorAvailabilityController(),
                          id: 'update-selectedTime',
                          builder: (c) {
                            return Column(
                                children: List.generate(
                                    timeSlote.length,
                                    (index) => Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 3),
                                          child: GestureDetector(
                                            onTap: () => c.selectPreferedTime(
                                                timeSlote[index]),
                                            child: selectDayContainer(
                                              day: timeSlote[index],
                                              selectedDay: c.selectedTimes.any(
                                                  (i) => i == timeSlote[index]),
                                            ),
                                          ),
                                        )));
                          }),
                    ),
                    hLBox,
                    GetBuilder<EducatorAvailabilityController>(
                        init: EducatorAvailabilityController(),
                        id: 'edu-WorkPreference',
                        builder: (c) {
                          return Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              actionContainer(
                                text: 'Previous',
                                textColor: mainPurple,
                                boxColor: kwhite,
                                borderColor: mainPurple,
                                onTap: () => Get.back(),
                              ),
                              wMBox,
                              actionContainer(
                                text: 'Next',
                                textColor: c.selectedDays.isNotEmpty &&
                                        c.selectedTimes.isNotEmpty
                                    ? kwhite
                                    : textFieldColor,
                                boxColor: c.selectedDays.isNotEmpty &&
                                        c.selectedTimes.isNotEmpty
                                    ? mainPurple
                                    : buttonColor,
                                onTap: () {
                                  log('selectedDay=${c.selectedDays} selectedTIme=${c.selectedTimes}',
                                      name: 'avaliability-preference');
                                  if (c.selectedDays.isNotEmpty &&
                                      c.selectedTimes.isNotEmpty) {
                                    Get.to(() => EducatorAdditionalInfoPage());
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
