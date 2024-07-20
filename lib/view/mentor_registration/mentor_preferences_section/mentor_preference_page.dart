import 'package:aimshala/controllers/mentor_controllers/mentor_preference_controller.dart';
import 'package:aimshala/utils/common/widgets/colors_common.dart';
import 'package:aimshala/utils/common/widgets/text_common.dart';
import 'package:aimshala/utils/widgets/widgets_common.dart';
import 'package:aimshala/view/mentor_registration/common/widgets/widgets.dart';
import 'package:aimshala/view/mentor_registration/mentor_availability_preference_section/mentor_availability_preference_page.dart';
import 'package:aimshala/view/mentor_registration/mentor_preferences_section/widgets/widgets.dart';
import 'package:aimshala/view/profile/common/widgets/texts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class MentorPreferencePage extends StatelessWidget {
  const MentorPreferencePage({super.key});

  @override
  Widget build(BuildContext context) {
    final c1 = Get.put(MentorPreferenceController());
    List<String> mentorModeList = ["Online", "Face-to-Face", "Both"];
    return Scaffold(
      appBar: mentorAppbar(title: 'Mentor Registration', backArrow: true),
      body: mentorBGContainer(
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            if (c1.subjectController.text.isNotEmpty) {
              c1.addSubject(sub: c1.subjectController.text);
              c1.subjectController.clear();
            }
            if (c1.topicController.text.isNotEmpty) {
              c1.addTopic(topic: c1.topicController.text);
              c1.topicController.clear();
            }
          },
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
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 2),
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
                                    c1.seletedSubject.length,
                                    (index) {
                                      return selectedContainerMentor(
                                        sub: c1.seletedSubject[index],
                                        onTap: () {
                                          c1.seletedSubject.removeAt(index);
                                          c1.update(['mentor-preferences']);
                                        },
                                      );
                                    },
                                  ),
                                  IntrinsicWidth(
                                      child: SizedBox(
                                    // color: Colors.yellow,
                                    height: 3.5.h,
                                    child: TextFormField(
                                      controller: c1.subjectController,
                                      cursorColor: mainPurple,
                                      onFieldSubmitted: (value) {
                                        if (value.isNotEmpty) {
                                          c1.addSubject(
                                              sub: c1.subjectController.text);
                                          c1.subjectController.clear();
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
                                    c1.seletedTopic.length,
                                    (index) {
                                      return selectedContainerMentor(
                                        sub: c1.seletedTopic[index],
                                        onTap: () {
                                          c1.seletedTopic.removeAt(index);
                                          c1.update(['mentor-preferences']);
                                        },
                                      );
                                    },
                                  ),
                                  IntrinsicWidth(
                                      child: SizedBox(
                                    // color: Colors.yellow,
                                    height: 3.5.h,
                                    child: TextFormField(
                                        controller: c1.topicController,
                                        cursorColor: mainPurple,
                                        onFieldSubmitted: (value) {
                                          if (value.isNotEmpty) {
                                            c1.addTopic(
                                                topic: c1.topicController.text);
                                            c1.topicController.clear();
                                          }
                                        },
                                        style: const TextStyle(fontSize: 13),
                                        decoration:
                                            mentorPreferenceTextfield()),
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
                                        Get.to(() =>
                                            const MentorAvailabilityPreferencePage());
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
      ),
    );
  }
}
