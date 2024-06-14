import 'dart:developer';
import 'package:aimshala/controllers/mentor_controllers/mentor_background_detail_controller.dart';
import 'package:aimshala/utils/common/widgets/colors_common.dart';
import 'package:aimshala/utils/widgets/widgets_common.dart';
import 'package:aimshala/view/mentor_registration/common/widgets/text_widgets.dart';
import 'package:aimshala/view/mentor_registration/common/widgets/widgets.dart';
import 'package:aimshala/view/mentor_registration/mentor_background_detail_section/degree_bottomsheet.dart';
import 'package:aimshala/view/mentor_registration/mentor_experience_section/mentor_experience_page.dart';
import 'package:aimshala/view/profile/common/widgets/texts.dart';
import 'package:aimshala/view/profile/common/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class MentorBackgroundDetailPage extends StatelessWidget {
  MentorBackgroundDetailPage({super.key});
  final GlobalKey<FormState> formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(MentorBackgroundDetailController());
    return Scaffold(
      appBar: mentorAppbar(title: 'Mentor Registration',backArrow: true),
      body: mentorBGContainer(
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              children: [
                mentorSectionContainer(
                  child: Column(
                    children: [
                      mentorRichText(text1: 'Educational', text2: 'and'),
                      mentorRichText(
                          text1: 'Professional', text2: 'Background'),
                      hLBox,
                      mentorFields(
                        item: semiBoldChoiceText(
                            text: 'Highest Degree Earned', size: 9.5.sp),
                        textfiled: GestureDetector(
                          onTap: () => showDegreeOptions(context),
                          child: AbsorbPointer(
                            child: TextFormField(
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              controller: controller.degreeController,
                              readOnly: true,
                              validator: (value) =>
                                  controller.fieldValidation(value),
                              onChanged: (value) =>
                                  controller.update(['mentor-backgroundinfo']),
                              decoration: infoFieldDecoration(
                                  hintText: 'Enter Full Name',
                                  suffixWidget:
                                      const Icon(Icons.keyboard_arrow_down)),
                              style: const TextStyle(fontSize: 13),
                            ),
                          ),
                        ),
                      ),
                      Obx(
                        () => controller.other.value == "Others"
                            ? TextFormField(
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                controller: controller.otherDegreecontroller,
                                validator: (value) =>
                                    controller.fieldValidation(value),
                                onChanged: (value) => controller
                                    .update(['mentor-backgroundinfo']),
                                decoration: infoFieldDecoration(
                                    hintText: 'Enter Field of Expertise'),
                                style: const TextStyle(fontSize: 13),
                              )
                            : shrinked,
                      ),
                      mentorFields(
                        item: semiBoldChoiceText(
                            text: 'Field of Expertise', size: 9.5.sp),
                        textfiled: TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          controller: controller.expertiesController,
                          validator: (value) =>
                              controller.fieldValidation(value),
                          onChanged: (value) =>
                              controller.update(['mentor-backgroundinfo']),
                          decoration: infoFieldDecoration(
                              hintText: 'Enter Field of Expertise'),
                          style: const TextStyle(fontSize: 13),
                        ),
                      ),
                      mentorFields(
                        item: semiBoldChoiceText(
                            text: 'Years of Professional Experience',
                            size: 9.5.sp),
                        textfiled: TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          controller: controller.professionalController,
                          validator: (value) =>
                              controller.fieldValidation(value),
                          onChanged: (value) =>
                              controller.update(['mentor-backgroundinfo']),
                          decoration: infoFieldDecoration(
                            hintText: 'Enter Years of Professional Experience',
                            // suffixWidget:
                            //     const Icon(Icons.keyboard_arrow_down)
                          ),
                          style: const TextStyle(fontSize: 13),
                        ),
                      ),
                      mentorFields(
                        item: semiBoldChoiceText(
                            text: 'Current/Last Institution Affiliated With',
                            size: 9.5.sp),
                        textfiled: TextFormField(
                          controller: controller.affiliatedController,
                          validator: (value) =>
                              controller.fieldValidation(value),
                          onChanged: (value) =>
                              controller.update(['mentor-backgroundinfo']),
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          decoration: infoFieldDecoration(
                              hintText: 'Enter Current Employer/Institution'),
                          style: const TextStyle(fontSize: 13),
                        ),
                      ),
                      hLBox,
                      GetBuilder<MentorBackgroundDetailController>(
                          id: 'mentor-backgroundinfo',
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
                                  textColor:
                                      c.degreeController.text.isNotEmpty &&
                                              c.expertiesController.text
                                                  .isNotEmpty &&
                                              c.professionalController.text
                                                  .isNotEmpty &&
                                              c.affiliatedController.text
                                                  .isNotEmpty
                                          ? kwhite
                                          : textFieldColor,
                                  boxColor: c.degreeController.text
                                              .isNotEmpty &&
                                          c.expertiesController.text
                                              .isNotEmpty &&
                                          c.professionalController.text
                                              .isNotEmpty &&
                                          c.affiliatedController.text.isNotEmpty
                                      ? mainPurple
                                      : buttonColor,
                                  onTap: () {
                                    if (formKey.currentState!.validate()) {
                                      log('degree=>${c.degreeController.text} experties=>${c.expertiesController.text} profession=>${c.professionalController.text} currently=>${c.affiliatedController.text} other=>${c.otherDegreecontroller.text}',
                                          name: 'edu-backgroundpage');
                                      Get.to(() => MentorExperiencePage());
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

  void showDegreeOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) => const MentorDegreeBottomsheet(),
    );
  }
}
