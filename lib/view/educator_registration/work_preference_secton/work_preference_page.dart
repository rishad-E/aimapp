import 'dart:developer';

import 'package:aimshala/controllers/educator_controllers/educator_work_preferences_controller.dart';
import 'package:aimshala/utils/common/widgets/colors_common.dart';
import 'package:aimshala/utils/common/widgets/text_common.dart';
import 'package:aimshala/utils/widgets/widgets_common.dart';
import 'package:aimshala/view/educator_registration/availability_preference_section/availability_preference_page.dart';
import 'package:aimshala/view/educator_registration/common/widgets/widgets.dart';
import 'package:aimshala/view/educator_registration/work_preference_secton/widget/widgets.dart';
import 'package:aimshala/view/profile/common/widgets/texts.dart';
import 'package:aimshala/view/profile/common/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class EducatorWorkPreferencePage extends StatelessWidget {
  EducatorWorkPreferencePage({super.key});
  final controller = Get.put(EducatorWorkPreferenceController());
  @override
  Widget build(BuildContext context) {
    List<String> workModeList = ["Work from Home", "Work from Office", "Both"];
    List<String> teachingModeList = ["Online Courses", "Institute Near Me"];
    return Scaffold(
      appBar: educatorAppBar(title: 'Educator Registration', backArrow: true),
      body: educatorBGContainer(
        child: SingleChildScrollView(
          child: Column(
            children: [
              educatorSectionContainer(
                child: Column(
                  children: [
                    boldText(text: 'Work Preferences', size: 15.sp),
                    hLBox,
                    educatorFields(
                      item: semiBoldChoiceText(
                          text: 'Willingness to Relocate to Noida',
                          size: 9.5.sp),
                      textfiled: Row(
                        children: [
                          GetBuilder<EducatorWorkPreferenceController>(
                            id: 'update-relocate',
                            builder: (c) {
                              return GestureDetector(
                                  onTap: () {
                                    c.toggleRelocate(val: true);
                                  },
                                  child: relocateTrueContainer(
                                      relocate: c.relocate));
                            },
                          ),
                          wMBox,
                          wBox,
                          GetBuilder<EducatorWorkPreferenceController>(
                            id: 'update-relocate',
                            builder: (c) {
                              return GestureDetector(
                                  onTap: () => c.toggleRelocate(val: false),
                                  child: relocateFalseContainer(
                                      relocate: c.relocate));
                            },
                          ),
                        ],
                      ),
                    ),
                    hBox,
                    educatorFields(
                      item: primarytxt3('Preference for Work Mode', 9.5.sp),
                      textfiled: GetBuilder<EducatorWorkPreferenceController>(
                          id: 'update-workMode',
                          builder: (c) {
                            return Column(
                              children: List.generate(
                                workModeList.length,
                                (index) => Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 2),
                                  child: GestureDetector(
                                      onTap: () =>
                                          c.selectWorkMode(workModeList[index]),
                                      child: workModelContainer(
                                        workMode: workModeList[index],
                                        work: workModeList[index] == c.workMode,
                                      )),
                                ),
                              ),
                            );
                          }),
                    ),
                    hBox,
                    educatorFields(
                      item: primarytxt3('Teaching Preferences:', 9.5.sp),
                      textfiled: GetBuilder<EducatorWorkPreferenceController>(
                          id: 'update-teachingMode',
                          builder: (c) {
                            return Column(
                              children: List.generate(
                                teachingModeList.length,
                                (index) => Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 2),
                                  child: GestureDetector(
                                      onTap: () => c.selectTeachingMode(
                                          teachingModeList[index]),
                                      child: workModelContainer(
                                        workMode: teachingModeList[index],
                                        work: teachingModeList[index] ==
                                            c.teachingMode,
                                      )),
                                ),
                              ),
                            );
                          }),
                    ),
                    hLBox,
                    GetBuilder<EducatorWorkPreferenceController>(
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
                                textColor: c.workMode.isNotEmpty &&
                                        c.teachingMode.isNotEmpty
                                    ? kwhite
                                    : textFieldColor,
                                boxColor: c.workMode.isNotEmpty &&
                                        c.teachingMode.isNotEmpty
                                    ? mainPurple
                                    : buttonColor,
                                onTap: () {
                                  log('relocate=>${c.relocate} workMode=>${c.workMode} teachingMode=>${c.teachingMode}',
                                      name: 'work preference');
                                  if (c.workMode.isNotEmpty &&
                                      c.teachingMode.isNotEmpty) {
                                    Get.to(() =>
                                        const EducatorAvailabilitySelectPage());
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
