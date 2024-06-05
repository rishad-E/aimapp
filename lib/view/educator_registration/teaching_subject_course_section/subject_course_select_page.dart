import 'dart:developer';

import 'package:aimshala/controllers/educator_controllers/educator_subject_course_select_controller.dart';
import 'package:aimshala/utils/common/colors_common.dart';
import 'package:aimshala/utils/common/text_common.dart';
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
    final controller = Get.put(EducatorSubjectCourseController());
    return Scaffold(
      appBar: educatorAppBar(title: 'Educator Registration'),
      body: educatorBGContainer(
        child: SingleChildScrollView(
          child: Column(
            children: [
              educatorSectionContainer(
                child: Column(
                  children: [
                    boldText(text: 'Teaching Subjects/Courses', size: 15.sp),
                    hLBox,
                    educatorFields(
                      item: semiBoldChoiceText(text: 
                          'Subjects/Fields You Can Mentor In',size:  9.5.sp),
                      textfiled: Obx(
                        () => subjectMainContainer(
                          child: Wrap(
                            spacing: 5,
                            runSpacing: 4,
                            crossAxisAlignment: WrapCrossAlignment.center,
                            children: [
                              ...List.generate(
                                controller.seletedSubject.length,
                                (index) {
                                  return selectedContainer(
                                    sub: controller.seletedSubject[index],
                                    onTap: () {
                                      controller.seletedSubject.removeAt(index);
                                      controller
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
                                  controller: controller.subjectController,
                                  onFieldSubmitted: (value) {
                                    if (value.isNotEmpty) {
                                      controller.addSubject(
                                          sub: controller
                                              .subjectController.text);
                                      controller.subjectController.clear();
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
                    educatorFields(
                      item: semiBoldChoiceText(text: 
                          'Specific Topics Within Those Fields',size:  9.5.sp),
                      textfiled: Obx(
                        () => subjectMainContainer(
                          child: Wrap(
                            spacing: 5,
                            runSpacing: 4,
                            crossAxisAlignment: WrapCrossAlignment.center,
                            children: [
                              ...List.generate(
                                controller.seletedTopic.length,
                                (index) {
                                  return selectedContainer(
                                    sub: controller.seletedTopic[index],
                                    onTap: () {
                                      controller.seletedTopic.removeAt(index);
                                      controller
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
                                  controller: controller.topicController,
                                  onFieldSubmitted: (value) {
                                    if (value.isNotEmpty) {
                                      controller.addTopic(
                                          sub: controller.topicController.text);
                                      controller.topicController.clear();
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
                                textColor: c.seletedSubject.isNotEmpty &&
                                        c.seletedTopic.isNotEmpty
                                    ? kwhite
                                    : textFieldColor,
                                boxColor: c.seletedSubject.isNotEmpty &&
                                        c.seletedTopic.isNotEmpty
                                    ? mainPurple
                                    : buttonColor,
                                onTap: () {
                                  if (c.seletedSubject.isNotEmpty && c.seletedTopic.isNotEmpty) {
                                    log('selected SUB=>${c.seletedSubject} selected TOP=>${c.seletedTopic}',name: 'sub&&Top scren');
                                    Get.to(()=>EducatorWorkPreferencePage());
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
