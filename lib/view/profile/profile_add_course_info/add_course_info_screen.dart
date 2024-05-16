import 'dart:developer';

import 'package:aimshala/controllers/profile_controller/profile_language_course_controller.dart';
import 'package:aimshala/models/profile_model/profile_all_data_model.dart';
import 'package:aimshala/utils/common/colors_common.dart';
import 'package:aimshala/utils/common/text_common.dart';
import 'package:aimshala/utils/widgets/widgets_common.dart';
import 'package:aimshala/view/profile/common/widgets/widgets.dart';
import 'package:aimshala/view/profile/profile_add_course_info/widgets/widgets.dart';
import 'package:aimshala/view/profile/profile_home/profile_home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class ProfileAddCourseScreen extends StatelessWidget {
  final String uId;
  final Course? course;
  ProfileAddCourseScreen({super.key, required this.uId, this.course});

  final GlobalKey<FormState> formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LanguageAndCourseController());
    return PopScope(
      onPopInvoked: (didPop) =>
          Future.microtask(() => Get.off(() => const ProfileHomeScreen())),
      child: Scaffold(
        appBar: profileAppBar(title: 'Add Course', doneWidget: shrinked),
        body: Container(
          decoration: profileMainContainer(),
          child: Center(
            child: Container(
              decoration: profileSecondaryContainer(),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
              margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
              child: SingleChildScrollView(
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      profileRichText('Add', 'Course'),
                      hLBox,
                      courseInfoFiled(
                        text: primarytxt3('Course name', 9.5.sp),
                        textField: TextFormField(
                          controller: controller.courseController
                            ..text = course?.courseName.toString() ?? '',
                          validator: (value) =>
                              controller.fieldValidation(value),
                          onChanged: (value) =>
                              controller.update(['update-courseInfo']),
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          decoration: infoFieldDecoration(
                            hintText: 'Ex: World History',
                          ),
                          style: const TextStyle(fontSize: 13),
                        ),
                      ),
                      courseInfoFiled(
                        text: primarytxt3('Number', 9.5.sp),
                        textField: TextFormField(
                          controller: controller.courseNoController
                            ..text = course?.courseNumber.toString() ?? '',
                          validator: (value) =>
                              controller.fieldValidation(value),
                          onChanged: (value) =>
                              controller.update(['update-courseInfo']),
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          decoration: infoFieldDecoration(
                            hintText: 'Ex: HIS101',
                          ),
                          style: const TextStyle(fontSize: 13),
                        ),
                      ),
                      hBox,
                      GetBuilder<LanguageAndCourseController>(
                          id: 'update-workingButton',
                          builder: (c) {
                            bool currently = course?.workingCurrently == 'Yes'
                                ? true
                                : course?.workingCurrently == 'No'
                                    ? false
                                    : c.currentlyWorking;
                            return GestureDetector(
                              onTap: () => c.toggleCurrentlyWorking(),
                              child: currentlyWorkingCourse(working: currently),
                            );
                          }),
                      hBox,
                      courseInfoFiled(
                        text: primarytxt3('Associated with', 9.5.sp),
                        textField: TextFormField(
                          controller: controller.courseAssosiatedController
                            ..text = course?.associatedWith ?? '',
                          validator: (value) =>
                              controller.fieldValidation(value),
                          onChanged: (value) =>
                              controller.update(['update-courseInfo']),
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          decoration: infoFieldDecoration(
                              hintText: 'Please Select',
                              suffixWidget:
                                  const Icon(Icons.keyboard_arrow_down)),
                          style: const TextStyle(fontSize: 13),
                        ),
                      ),
                      hMBox,
                      GetBuilder<LanguageAndCourseController>(
                          id: 'update-courseInfo',
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
                                  text: 'Save',
                                  textColor:
                                      c.courseController.text.isNotEmpty &&
                                              c.courseNoController.text
                                                  .isNotEmpty &&
                                              c.courseAssosiatedController.text
                                                  .isNotEmpty
                                          ? kwhite
                                          : textFieldColor,
                                  boxColor:
                                      c.courseController.text.isNotEmpty &&
                                              c.courseNoController.text
                                                  .isNotEmpty &&
                                              c.courseAssosiatedController.text
                                                  .isNotEmpty
                                          ? mainPurple
                                          : buttonColor,
                                  onTap: () {
                                    if (formKey.currentState!.validate()) {
                                      String working =
                                          c.currentlyWorking == true
                                              ? 'Yes'
                                              : 'No';
                                      log('courseID=>${course?.id}  ID=>$uId course=>${c.courseController.text} number=>${c.courseNoController.text} assosiated=>${c.courseAssosiatedController.text} currently=>$working',
                                          name: 'course-screen');
                                      // c.saveCourseFunction(
                                      //     uId: uId,
                                      //     course: c.courseController.text,
                                      //     courseNo: c.courseNoController.text,
                                      //     courseAssosiated:
                                      //         c.courseAssosiatedController.text,
                                      //     working: working);
                                    }
                                  },
                                ),
                              ],
                            );
                          })
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
