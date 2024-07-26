import 'package:aimshala/controllers/counselor_controllers/counselor_experties_controller.dart';
import 'package:aimshala/utils/common/widgets/colors_common.dart';
import 'package:aimshala/utils/widgets/widgets_common.dart';
import 'package:aimshala/view/counselor_registration/c_additional_info_section/c_additional_info_page.dart';
import 'package:aimshala/view/counselor_registration/common/widgets/counselor_widgets.dart';
import 'package:aimshala/view/profile/common/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CounselorExpertiesPage extends StatelessWidget {
  CounselorExpertiesPage({super.key});
  final GlobalKey<FormState> formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CounselorExpertiesController());
    List<String> primaryExperties = [
      'Career Counseling',
      'Academic Counseling',
      'Mental Health Counseling',
      'Personal Development',
      'Other'
    ];
    List<String> secondaryExperties = [
      'Interview Preparation',
      'Resume Writing',
      'College Applications',
      'Skill Development',
      'Other'
    ];
    return Scaffold(
      appBar: counselorAppBar(backArrow: true),
      body: counselorContainer(
        child: Form(
          key: formKey,
          child: Column(
            children: [
              counselorRichText(text1: 'Areas of Expertise', text2: ''),
              hLBox,
              counselorFields(
                fieldItem: 'Primary Areas of Expertise',
                textfiled: GetBuilder<CounselorExpertiesController>(
                  id: 'update-Primary',
                  builder: (c) {
                    return Column(
                      children: List.generate(
                        primaryExperties.length,
                        (index) => GestureDetector(
                          onTap: () =>
                              c.addPrimaryArea(primaryExperties[index]),
                          child: checkBoxContainer(
                            item: primaryExperties[index],
                            selected: c.primaryAreaList
                                .any((i) => i == primaryExperties[index]),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              Obx(
                () => controller.isPrimaryOther.value == 'Other'
                    ? TextFormField(
                        controller: controller.primaryController,
                        validator: (value) => controller.fieldValidation(value),
                        style: const TextStyle(fontSize: 13),
                        decoration: infoFieldDecoration(
                          hintText: 'Write Other Primary Areas of Expertise ',
                        ),
                      )
                    : shrinked,
              ),
              counselorFields(
                fieldItem: 'Secondary Areas of Expertise',
                textfiled: GetBuilder<CounselorExpertiesController>(
                    id: 'update-Secondary',
                    builder: (c) {
                      return Column(
                        children: List.generate(
                          secondaryExperties.length,
                          (index) => GestureDetector(
                            onTap: () =>
                                c.addSecondaryArea(secondaryExperties[index]),
                            child: checkBoxContainer(
                              item: secondaryExperties[index],
                              selected: c.secondaryAreaList
                                  .any((i) => i == secondaryExperties[index]),
                            ),
                          ),
                        ),
                      );
                    }),
              ),
              Obx(
                () => controller.isSecondaryOther.value == 'Other'
                    ? TextFormField(
                        controller: controller.secondaryController,
                        validator: (value) => controller.fieldValidation(value),
                        style: const TextStyle(fontSize: 13),
                        decoration: infoFieldDecoration(
                          hintText: 'Write Other Secondary Areas of Expertise ',
                        ),
                      )
                    : shrinked,
              ),
              hLBox,
              GetBuilder<CounselorExpertiesController>(
                  id: 'update-Experties',
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
                          textColor: c.primaryAreaList.isNotEmpty &&
                                  c.secondaryAreaList.isNotEmpty
                              ? kwhite
                              : textFieldColor,
                          boxColor: c.primaryAreaList.isNotEmpty &&
                                  c.secondaryAreaList.isNotEmpty
                              ? mainPurple
                              : buttonColor,
                          onTap: () {
                            if (formKey.currentState!.validate()) {
                              if (c.primaryAreaList.isNotEmpty &&
                                  c.secondaryAreaList.isNotEmpty) {
                                Get.to(() => CounselorAdditionalinfoPage());
                              }
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
    );
  }
}
