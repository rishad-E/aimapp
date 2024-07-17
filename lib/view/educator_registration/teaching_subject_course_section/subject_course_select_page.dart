import 'dart:developer';

import 'package:aimshala/controllers/educator_controllers/educator_subject_course_select_controller.dart';
import 'package:aimshala/utils/common/widgets/colors_common.dart';
import 'package:aimshala/utils/common/widgets/text_common.dart';
import 'package:aimshala/utils/widgets/widgets_common.dart';
import 'package:aimshala/view/educator_registration/common/widgets/widgets.dart';
import 'package:aimshala/view/educator_registration/teaching_subject_course_section/widgets/widgets.dart';
import 'package:aimshala/view/educator_registration/work_preference_secton/work_preference_page.dart';
import 'package:aimshala/view/profile/common/widgets/texts.dart';
import 'package:aimshala/view/profile/common/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class EducatorSubjectCourseSelectPage extends StatelessWidget {
  const EducatorSubjectCourseSelectPage({super.key});
  @override
  Widget build(BuildContext context) {
    final c1 = Get.put(EducatorSubjectCourseController());
    return Scaffold(
      appBar: educatorAppBar(title: 'Educator Registration', backArrow: true),
      body: educatorBGContainer(
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            if (c1.subjectController.text.isNotEmpty) {
              c1.addSubject(sub: c1.subjectController.text);
              c1.subjectController.clear();
            }
            if (c1.topicController.text.isNotEmpty) {
              c1.addTopic(sub: c1.topicController.text);
              c1.topicController.clear();
            }
          },
          child: SingleChildScrollView(
            child: Column(
              children: [
                educatorSectionContainer(
                  child: Column(
                    children: [
                      boldText(text: 'Teaching Subjects/Courses', size: 15.sp),
                      hLBox,
                      educatorFields(
                        item: semiBoldChoiceText(
                            text: 'Subjects/Fields You Can Mentor In',
                            size: 9.5.sp),
                        textfiled: Obx(
                          () => subjectMainContainer(
                            child: Wrap(
                              spacing: 5,
                              runSpacing: 4,
                              crossAxisAlignment: WrapCrossAlignment.center,
                              children: [
                                ...List.generate(
                                  c1.seletedSubject.length,
                                  (index) {
                                    return selectedContainer(
                                      sub: c1.seletedSubject[index],
                                      onTap: () {
                                        c1.seletedSubject
                                            .removeAt(index);
                                        c1
                                            .update(['edu-SubjectCourseinfo']);
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
                                    style: const TextStyle(fontSize: 13),
                                    cursorColor: mainPurple,
                                    cursorWidth: 1.5,
                                    onFieldSubmitted: (value) {
                                      if (value.isNotEmpty) {
                                        c1.addSubject(
                                            sub: c1
                                                .subjectController.text);
                                        c1.subjectController.clear();
                                      }
                                    },
                                    decoration: const InputDecoration(
                                        isDense: true,
                                        border: InputBorder.none,
                                        hintText: 'Add more...',
                                        hintStyle: TextStyle(
                                          color: Color.fromARGB(
                                              255, 116, 118, 119),
                                          fontSize: 12,
                                        )),
                                  ),
                                ))
                              ],
                            ),
                          ),
                        ),
                      ),
                      educatorFields(
                        item: semiBoldChoiceText(
                            text: 'Specific Topics Within Those Fields',
                            size: 9.5.sp),
                        textfiled: Obx(
                          () => subjectMainContainer(
                            child: Wrap(
                              spacing: 5,
                              runSpacing: 4,
                              crossAxisAlignment: WrapCrossAlignment.center,
                              children: [
                                ...List.generate(
                                  c1.seletedTopic.length,
                                  (index) {
                                    return selectedContainer(
                                      sub: c1.seletedTopic[index],
                                      onTap: () {
                                        c1.seletedTopic.removeAt(index);
                                        c1
                                            .update(['edu-SubjectCourseinfo']);
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
                                    style: const TextStyle(fontSize: 13),
                                    cursorColor: mainPurple,
                                    cursorWidth: 1.5,
                                    onFieldSubmitted: (value) {
                                      if (value.isNotEmpty) {
                                        c1.addTopic(
                                            sub: c1
                                                .topicController.text);
                                        c1.topicController.clear();
                                      }
                                    },
                                    decoration: const InputDecoration(
                                        isDense: true,
                                        border: InputBorder.none,
                                        hintText: 'Add more...',
                                        hintStyle: TextStyle(
                                            color: Color.fromARGB(
                                                255, 116, 118, 119),
                                            fontSize: 12)),
                                  ),
                                ))
                              ],
                            ),
                          ),
                        ),
                      ),
                      hLBox,
                      GetBuilder<EducatorSubjectCourseController>(
                          id: 'edu-SubjectCourseinfo',
                          builder: (c2) {
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
                                  textColor: c2.seletedSubject.isNotEmpty &&
                                          c2.seletedTopic.isNotEmpty
                                      ? kwhite
                                      : textFieldColor,
                                  boxColor: c2.seletedSubject.isNotEmpty &&
                                          c2.seletedTopic.isNotEmpty
                                      ? mainPurple
                                      : buttonColor,
                                  onTap: () {
                                    if (c2.seletedSubject.isNotEmpty &&
                                        c2.seletedTopic.isNotEmpty) {
                                      log('selec2ted SUB=>${c2.seletedSubject} selec2ted TOP=>${c2.seletedTopic}',
                                          name: 'sub&&Top scren');
                                      Get.to(
                                          () => EducatorWorkPreferencePage());
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
