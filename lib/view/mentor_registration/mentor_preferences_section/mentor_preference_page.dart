import 'package:aimshala/controllers/mentor_controllers/mentor_preference_controller.dart';
import 'package:aimshala/utils/common/colors_common.dart';
import 'package:aimshala/utils/common/text_common.dart';
import 'package:aimshala/utils/widgets/widgets_common.dart';
import 'package:aimshala/view/mentor_registration/common/widgets/widgets.dart';
import 'package:aimshala/view/mentor_registration/mentor_availability_preference_section/mentor_availability_preference_page.dart';
import 'package:aimshala/view/mentor_registration/mentor_preferences_section/widgets/widgets.dart';
import 'package:aimshala/view/profile/common/widgets/texts.dart';
import 'package:aimshala/view/profile/common/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class MentorPreferencePage extends StatelessWidget {
  const MentorPreferencePage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(MentorPreferenceController());
    List<String> mentorModeList = ["Online", "Face-to-Face", "Both"];
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
                      boldText(text: 'Mentoring Preferences', size: 15.sp),
                      hLBox,
                      mentorFields(
                        item: semiBoldChoiceText(
                          text: 'Preferred Mentoring Mode',
                          size: 8.sp,
                        ),
                        textfiled: GetBuilder<MentorPreferenceController>(
                            id: 'update-mentorMode',
                            builder: (c) {
                              return Column(
                                children: List.generate(
                                  mentorModeList.length,
                                  (index) => Padding(
                                    padding:
                                        const EdgeInsets.symmetric(vertical: 2),
                                    child: GestureDetector(
                                        onTap: () => c.selectMentorMode(
                                            mentorModeList[index]),
                                        child: mentoringPreference(
                                          mentorMode: mentorModeList[index],
                                          mode: mentorModeList[index] ==
                                              c.mentorMode,
                                        )),
                                  ),
                                ),
                              );
                            }),
                      ),
                      mentorFields(
                        item: semiBoldChoiceText(
                            text: 'Subjects/Fields You Can Mentor In',
                            size: 9.5.sp),
                        textfiled: Obx(
                          () => subjectContainerMentor(
                            child: Wrap(
                              spacing: 5,
                              runSpacing: 4,
                              crossAxisAlignment: WrapCrossAlignment.center,
                              children: [
                                ...List.generate(
                                  controller.seletedSubject.length,
                                  (index) {
                                    return selectedContainerMentor(
                                      sub: controller.seletedSubject[index],
                                      onTap: () {
                                        controller.seletedSubject
                                            .removeAt(index);
                                        controller
                                            .update(['mentor-preferences']);
                                      },
                                    );
                                  },
                                ),
                                IntrinsicWidth(
                                    child: SizedBox(
                                  // color: Colors.yellow,
                                  height: 3.5.h,
                                  child: TextFormField(
                                    controller: controller.subjectController,
                                    onFieldSubmitted: (value) {
                                      if (value.isNotEmpty) {
                                        controller.addSubject(
                                            sub: controller
                                                .subjectController.text);
                                        controller.subjectController.clear();
                                      }
                                    },
                                    style: const TextStyle(fontSize: 13),
                                    decoration: mentorPreferenceTextfield(),
                                  ),
                                ))
                              ],
                            ),
                          ),
                        ),
                      ),
                      hBox,
                      mentorFields(
                        item: semiBoldChoiceText(
                            text: 'Specific Topics Within Those Fields',
                            size: 9.5.sp),
                        textfiled: Obx(
                          () => subjectContainerMentor(
                            child: Wrap(
                              spacing: 5,
                              runSpacing: 4,
                              crossAxisAlignment: WrapCrossAlignment.center,
                              children: [
                                ...List.generate(
                                  controller.seletedTopic.length,
                                  (index) {
                                    return selectedContainerMentor(
                                      sub: controller.seletedTopic[index],
                                      onTap: () {
                                        controller.seletedTopic.removeAt(index);
                                        controller
                                            .update(['mentor-preferences']);
                                      },
                                    );
                                  },
                                ),
                                IntrinsicWidth(
                                    child: SizedBox(
                                  // color: Colors.yellow,
                                  height: 3.5.h,
                                  child: TextFormField(
                                      controller: controller.topicController,
                                      onFieldSubmitted: (value) {
                                        if (value.isNotEmpty) {
                                          controller.addTopic(
                                              topic: controller
                                                  .topicController.text);
                                          controller.topicController.clear();
                                        }
                                      },
                                      style: const TextStyle(fontSize: 13),
                                      decoration: mentorPreferenceTextfield()),
                                ))
                              ],
                            ),
                          ),
                        ),
                      ),
                      hLBox,
                      GetBuilder<MentorPreferenceController>(
                          id: 'mentor-preferences',
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
                                  textColor: c.mentorMode.isNotEmpty &&
                                          c.seletedSubject.isNotEmpty &&
                                          c.seletedTopic.isNotEmpty
                                      ? kwhite
                                      : textFieldColor,
                                  boxColor: c.mentorMode.isNotEmpty &&
                                          c.seletedSubject.isNotEmpty &&
                                          c.seletedTopic.isNotEmpty
                                      ? mainPurple
                                      : buttonColor,
                                  onTap: () {
                                    if (c.mentorMode.isNotEmpty &&
                                        c.seletedSubject.isNotEmpty &&
                                        c.seletedTopic.isNotEmpty) {
                                          Get.to(()=>MentorAvailabilityPreferencePage());
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
      ),
    );
  }
}
