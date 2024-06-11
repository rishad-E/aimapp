import 'dart:developer';

import 'package:aimshala/controllers/mentor_controllers/mentor_additional_info_controller.dart';
import 'package:aimshala/utils/common/widgets/colors_common.dart';
import 'package:aimshala/utils/common/widgets/text_common.dart';
import 'package:aimshala/utils/widgets/widgets_common.dart';
import 'package:aimshala/view/mentor_registration/common/widgets/widgets.dart';
import 'package:aimshala/view/mentor_registration/mentor_references_section/mentor_reference_page.dart';
import 'package:aimshala/view/profile/common/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class MentorAdditionalInfoPage extends StatelessWidget {
  MentorAdditionalInfoPage({super.key});
  final GlobalKey<FormState> formkey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(MentorAdditionalInfoController());
    return Scaffold(
      appBar: mentorAppbar(title: 'Mentor Registration'),
      body: mentorBGContainer(
        child: SingleChildScrollView(
          child: Form(
            key: formkey,
            child: Column(
              children: [
                mentorSectionContainer(
                  child: Column(
                    children: [
                      boldText(text: 'Additional Information', size: 15.sp),
                      hLBox,
                      mentorFields(
                        item: primarytxt3(
                            'Briefly Describe Your Mentoring Philosophy',
                            9.5.sp),
                        textfiled: TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          controller: controller.philosophyController,
                          validator: (value) =>
                              controller.filedValidation(value),
                          onChanged: (value) =>
                              controller.update(['mentor-additionalInfo']),
                          decoration: infoFieldDecoration(
                            hintText:
                                'Enter Describe Your Mentoring Philosophy',
                          ),
                          style: const TextStyle(fontSize: 13),
                          minLines: 4,
                          maxLines: null,
                        ),
                      ),
                      hBox,
                      mentorFields(
                        item: primarytxt3(
                            'Why do you want to be a mentor with Aimshala',
                            9.5.sp),
                        textfiled: TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          controller: controller.mentorController,
                          validator: (value) =>
                              controller.filedValidation(value),
                          onChanged: (value) =>
                              controller.update(['mentor-additionalInfo']),
                          decoration: infoFieldDecoration(
                            hintText:
                                'Enter Why do you want to be a mentor with Aimshala?',
                          ),
                          style: const TextStyle(fontSize: 13),
                          minLines: 4,
                          maxLines: null,
                        ),
                      ),
                      hLBox,
                      GetBuilder<MentorAdditionalInfoController>(
                          init: MentorAdditionalInfoController(),
                          id: 'mentor-additionalInfo',
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
                                  textColor:
                                      c.philosophyController.text.isNotEmpty &&
                                              c.mentorController.text.isNotEmpty
                                          ? kwhite
                                          : textFieldColor,
                                  boxColor:
                                      c.philosophyController.text.isNotEmpty &&
                                              c.mentorController.text.isNotEmpty
                                          ? mainPurple
                                          : buttonColor,
                                  onTap: () {
                                    if (formkey.currentState!.validate()) {
                                      log('philossophy=>${c.philosophyController.text}  whymentor=>${c.mentorController.text}');
                                      Get.to(()=>MentorReferencesPage());
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
