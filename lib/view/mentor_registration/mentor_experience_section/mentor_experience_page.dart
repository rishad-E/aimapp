import 'dart:developer';
import 'package:aimshala/controllers/mentor_controllers/mentor_experience_controller.dart';
import 'package:aimshala/utils/common/colors_common.dart';
import 'package:aimshala/utils/common/text_common.dart';
import 'package:aimshala/utils/widgets/widgets_common.dart';
import 'package:aimshala/view/mentor_registration/common/widgets/widgets.dart';
import 'package:aimshala/view/mentor_registration/mentor_experience_section/widgets/widgets.dart';
import 'package:aimshala/view/mentor_registration/mentor_preferences_section/mentor_preference_page.dart';
import 'package:aimshala/view/profile/common/widgets/texts.dart';
import 'package:aimshala/view/profile/common/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class MentorExperiencePage extends StatelessWidget {
  MentorExperiencePage({super.key});
  final GlobalKey<FormState> formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(MentorExperienceController());
    return Scaffold(
      appBar: mentorAppbar(title: 'Mentor Registration'),
      body: mentorBGContainer(
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              children: [
                mentorSectionContainer(
                  child: Column(
                    children: [
                      boldText(text: 'Mentoring Experience', size: 15.sp),
                      hLBox,
                      mentorFields(
                        item: semiBoldChoiceText(
                          text:
                              'Are you open to contributing your educational resources to others and earning rewards?',
                          size: 8.sp,
                          textAlign: TextAlign.center,
                        ),
                        textfiled: Padding(
                          padding: const EdgeInsets.only(top: 5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              GetBuilder<MentorExperienceController>(
                                  id: 'update-relocateMentor',
                                  builder: (c) {
                                    return GestureDetector(
                                      onTap: () => c.toggleRelocate(val: true),
                                      child: relocateTrueMentor(
                                        relocate: c.relocate.value,
                                      ),
                                    );
                                  }),
                              wMBox,
                              GetBuilder<MentorExperienceController>(
                                  id: 'update-relocateMentor',
                                  builder: (c) {
                                    return GestureDetector(
                                      onTap: () => c.toggleRelocate(val: false),
                                      child: relocateFalseMentor(
                                        relocate: c.relocate.value,
                                      ),
                                    );
                                  }),
                            ],
                          ),
                        ),
                      ),
                      Obx(() {
                        return Visibility(
                          visible: controller.relocteSelected.value == 'no',
                          child: const Padding(
                            padding: EdgeInsets.only(top: 5),
                            child: Text(
                              'Please select an option',
                              style: TextStyle(color: Colors.red, fontSize: 12),
                            ),
                          ),
                        );
                      }),
                      hBox,
                      Obx(() {
                        final data = controller.relocate;
                        return Visibility(
                          visible: data.value != null && data.value == true,
                          child: mentorFields(
                            item: semiBoldChoiceText(
                                text: 'Describe your mentoring experience',
                                size: 9.5.sp),
                            textfiled: TextFormField(
                              controller: controller.experienceController,
                              validator: (value) =>
                                  controller.fieldValidation(value),
                              onChanged: (value) =>
                                  controller.update(['mentor-experience']),
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              decoration: infoFieldDecoration(
                                  hintText: 'Enter Field of Experties'),
                              style: const TextStyle(fontSize: 13),
                              minLines: 4,
                              maxLines: null,
                            ),
                          ),
                        );
                      }),
                      hLBox,
                      GetBuilder<MentorExperienceController>(
                          id: 'mentor-experience',
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
                                  textColor: c.relocate.value != null &&
                                          c.relocate.value == false
                                      ? kwhite
                                      : c.relocate.value != null &&
                                              c.experienceController.text
                                                  .isNotEmpty
                                          ? kwhite
                                          : textFieldColor,
                                  boxColor: c.relocate.value != null &&
                                          c.relocate.value == false
                                      ? mainPurple
                                      : c.relocate.value != null &&
                                              c.experienceController.text
                                                  .isNotEmpty
                                          ? mainPurple
                                          : buttonColor,
                                  onTap: () {
                                    if (formKey.currentState!.validate() &&
                                        c.relocate.value != null) {
                                      log('Relocate=>${c.relocate} experience=>${c.experienceController.text}',
                                          name: 'edu-personalpage');
                                      c.relocteSelected.value = '';
                                          Get.to(()=>MentorPreferencePage());
                                    } else {
                                      c.relocteSelected.value = 'no';
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
