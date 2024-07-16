import 'dart:developer';

import 'package:aimshala/controllers/profile_controller/profile_language_course_controller.dart';
import 'package:aimshala/models/profile_model/profile_section_data_model.dart';
import 'package:aimshala/utils/common/widgets/colors_common.dart';
import 'package:aimshala/utils/common/widgets/text_common.dart';
import 'package:aimshala/utils/widgets/widgets_common.dart';
import 'package:aimshala/view/profile/common/widgets/widgets.dart';
import 'package:aimshala/view/profile/profile_add_course_section/widgets/course_bottom_sheet.dart';
import 'package:aimshala/view/profile/profile_add_course_section/widgets/widgets.dart';
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
    String? courseID;
    log(course.toString(), name: 'course data');
    final controller = Get.put(LanguageAndCourseController());
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      initializeFormfield(course, controller);
      courseID = course?.id.toString();
    });
    return PopScope(
      onPopInvoked: (didPop) =>
          Future.microtask(() => Get.off(() => ProfileHomeScreen(id: uId))),
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
                          controller: controller.courseController,
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
                          controller: controller.courseNoController,
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
                      courseInfoFiled(
                        text: primarytxt3('Associated with', 9.5.sp),
                        textField: GestureDetector(
                          onTap: () => showAssosiatedBottomsheet(context),
                          child: AbsorbPointer(
                            child: TextFormField(
                              readOnly: true,
                              minLines: 1,
                              maxLines: null,
                              controller: controller.courseAssosiatedController,
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              decoration: infoFieldDecoration(
                                  hintText: 'Please Select',
                                  suffixWidget:
                                      const Icon(Icons.keyboard_arrow_down)),
                              style: const TextStyle(fontSize: 13),
                            ),
                          ),
                        ),
                      ),
                      hMBox,
                      GetBuilder<LanguageAndCourseController>(
                          id: 'update-courseInfo',
                          builder: (c) {
                            return Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                saveContainer(
                                  boxColor: kwhite,
                                  borderColor: mainPurple,
                                  child: saveContainerText(
                                    text: 'Cancel',
                                    textColor: mainPurple,
                                  ),
                                  onTap: () => Get.back(),
                                ),
                                wMBox,
                                saveContainer(
                                  boxColor: c.courseController.text
                                              .isNotEmpty &&
                                          c.courseNoController.text.isNotEmpty
                                      ? mainPurple
                                      : buttonColor,
                                  child: Obx(
                                    () => c.isSavingCourse.value
                                        ? CircularProgressIndicator(
                                            color: kwhite,
                                            strokeWidth: 1,
                                          )
                                        : saveContainerText(
                                            text: 'Save',
                                            textColor: c.courseController.text
                                                        .isNotEmpty &&
                                                    c.courseNoController.text
                                                        .isNotEmpty
                                                ? kwhite
                                                : textFieldColor,
                                          ),
                                  ),
                                  onTap: () {
                                    if (formKey.currentState!.validate()) {
                                      log('courseID=>${course?.id}  ID=>$uId course=>${c.courseController.text} number=>${c.courseNoController.text} assosiated=>${c.courseAssosiatedController.text} ',
                                          name: 'course-screen');
                                      course == null
                                          ? c.saveCourseFunction(
                                              uId: uId,
                                              course: c.courseController.text,
                                              courseNo:
                                                  c.courseNoController.text,
                                              courseAssosiated: c
                                                  .courseAssosiatedController
                                                  .text,
                                            )
                                          : c.updateCourseInfo(
                                              uId: uId,
                                              courseID: courseID.toString(),
                                              course: c.courseController.text,
                                              courseNo:
                                                  c.courseNoController.text,
                                              courseAssosiated: c
                                                  .courseAssosiatedController
                                                  .text,
                                            );
                                    }
                                  },
                                ),
                              ],
                            );
                          }),
                      hBox,
                      course == null
                          ? shrinked
                          : deleteSectionWidget(
                              onPressed: () => controller.deleteCourseInfo(
                                  uId: uId, courseID: courseID.toString()),
                              section: 'Courses',
                            )
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

  void initializeFormfield(Course? course, LanguageAndCourseController c) {
    if (course == null) return;
    c.courseController.text =
        c.courseController.text.isEmpty && course.courseName != null
            ? course.courseName as String
            : c.courseController.text;
    c.courseNoController.text =
        c.courseNoController.text.isEmpty && course.courseNumber != null
            ? course.courseNumber.toString()
            : c.courseNoController.text;
    c.courseAssosiatedController.text =
        c.courseAssosiatedController.text.isEmpty &&
                course.associatedWith != null
            ? course.associatedWith
            : c.courseAssosiatedController.text;
    c.update(['update-courseInfo']);
  }

  void showAssosiatedBottomsheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) => const CourseBottomsheet(),
    );
  }
}
