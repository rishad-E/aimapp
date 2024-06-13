import 'dart:developer';

import 'package:aimshala/controllers/educator_controllers/educator_additional_info_controller.dart';
import 'package:aimshala/utils/common/widgets/colors_common.dart';
import 'package:aimshala/utils/common/widgets/text_common.dart';
import 'package:aimshala/utils/widgets/widgets_common.dart';
import 'package:aimshala/view/educator_registration/common/widgets/widgets.dart';
import 'package:aimshala/view/educator_registration/reference_section/reference_section_page.dart';
import 'package:aimshala/view/profile/common/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class EducatorAdditionalInfoPage extends StatelessWidget {
  EducatorAdditionalInfoPage({super.key});
  final GlobalKey<FormState> formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(EducatorAdditionalInfoController());
    return Scaffold(
       appBar: educatorAppBar(title: 'Educator Registration',backArrow: true),

      body: educatorBGContainer(
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              children: [
                educatorSectionContainer(
                  child: Column(
                    children: [
                      boldText(text: 'Additional Information', size: 15.sp),
                      hLBox,
                      educatorFields(
                        item: primarytxt3('Description', 9.5.sp),
                        textfiled: TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          controller: controller.descriptionController,
                          validator: (value) =>
                              controller.filedValidation(value),
                          onChanged: (value) =>
                              controller.update(['edu-additionalInfo']),
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
                      educatorFields(
                        item: primarytxt3(
                            'Why do you want to join Aimshala?', 9.5.sp),
                        textfiled: TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          controller: controller.joinAimshalaController,
                          validator: (value) =>
                              controller.filedValidation(value),
                          onChanged: (value) =>
                              controller.update(['edu-additionalInfo']),
                          decoration: infoFieldDecoration(
                            hintText:
                                'Enter Why do you want to be a mentor with Aimshala?:',
                          ),
                          style: const TextStyle(fontSize: 13),
                          minLines: 4,
                          maxLines: null,
                        ),
                      ),
                      hLBox,
                      GetBuilder<EducatorAdditionalInfoController>(
                          id: 'edu-additionalInfo',
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
                                      c.descriptionController.text.isNotEmpty &&
                                              c.joinAimshalaController.text
                                                  .isNotEmpty
                                          ? kwhite
                                          : textFieldColor,
                                  boxColor:
                                      c.descriptionController.text.isNotEmpty &&
                                              c.joinAimshalaController.text
                                                  .isNotEmpty
                                          ? mainPurple
                                          : buttonColor,
                                  onTap: () {
                                    if (formKey.currentState!.validate()) {
                                      log('questions=>${c.questions}  answers=>${c.answers}',
                                          name: 'addition-info page');
                                      c.addAnswers(
                                          ans1: c.descriptionController.text,
                                          ans2: c.joinAimshalaController.text);
                                      Get.to(() => EducatorReferencePage());
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
