import 'package:aimshala/controllers/counselor_controllers/counselor_profbg_controller.dart';
import 'package:aimshala/utils/common/widgets/colors_common.dart';
import 'package:aimshala/utils/widgets/widgets_common.dart';
import 'package:aimshala/view/counselor_registration/c_availability_preference_section/c_availability_pref_page.dart';
import 'package:aimshala/view/counselor_registration/common/widgets/counselor_widgets.dart';
import 'package:aimshala/view/profile/common/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CounselorProfBackgroundPage extends StatelessWidget {
  CounselorProfBackgroundPage({super.key});
  final GlobalKey<FormState> formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CounserlorProfBGController());
    return Scaffold(
      appBar: counselorAppBar(backArrow: true),
      body: counselorContainer(
        child: Form(
          key: formKey,
          child: Column(
            children: [
              counselorRichText(text1: 'Professional', text2: 'Background'),
              hLBox,
              counselorFields(
                fieldItem: 'Current Job Title',
                textfiled: TextFormField(
                  controller: controller.jobTitleController,
                  onChanged: (value) =>
                      controller.update(['couns-ProfessionalBG']),
                  validator: (value) => controller.fieldValidation(value),
                  decoration:
                      infoFieldDecoration(hintText: 'Enter Current Job Title'),
                  style: const TextStyle(fontSize: 13),
                ),
              ),
              counselorFields(
                fieldItem: 'Field of Expertise',
                textfiled: TextFormField(
                  controller: controller.expertiesController,
                  onChanged: (value) =>
                      controller.update(['couns-ProfessionalBG']),
                  validator: (value) => controller.fieldValidation(value),
                  decoration:
                      infoFieldDecoration(hintText: 'Enter Field of Expertise'),
                  style: const TextStyle(fontSize: 13),
                ),
              ),
              counselorFields(
                fieldItem: 'Current Employer/Organization',
                textfiled: TextFormField(
                  controller: controller.currentController,
                  validator: (value) => controller.fieldValidation(value),
                  onChanged: (value) =>
                      controller.update(['couns-ProfessionalBG']),
                  decoration: infoFieldDecoration(
                      hintText: 'Enter Current Employer/Organization'),
                  style: const TextStyle(fontSize: 13),
                ),
              ),
              counselorFields(
                fieldItem: 'Years of Professional Experience',
                textfiled: TextFormField(
                  controller: controller.experienceController,
                  validator: (value) => controller.fieldValidation(value),
                  onChanged: (value) =>
                      controller.update(['couns-ProfessionalBG']),
                  decoration: infoFieldDecoration(
                    hintText: 'Enter Professional Experience',
                    // suffixWidget: const Icon(Icons.keyboard_arrow_down),
                  ),
                  style: const TextStyle(fontSize: 13),
                ),
              ),
              hLBox,
              GetBuilder<CounserlorProfBGController>(
                  id: 'couns-ProfessionalBG',
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
                          textColor: c.jobTitleController.text.isNotEmpty &&
                                  c.expertiesController.text.isNotEmpty &&
                                  c.currentController.text.isNotEmpty &&
                                  c.experienceController.text.isNotEmpty
                              ? kwhite
                              : textFieldColor,
                          boxColor: c.jobTitleController.text.isNotEmpty &&
                                  c.expertiesController.text.isNotEmpty &&
                                  c.currentController.text.isNotEmpty &&
                                  c.experienceController.text.isNotEmpty
                              ? mainPurple
                              : buttonColor,
                          onTap: () {
                            if (formKey.currentState!.validate()) {
                              Get.to(() => const CounselorAvailabilityPage());
                            }
                          },
                        ),
                      ],
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
