import 'package:aimshala/controllers/counselor_controllers/counselor_edubg_controller.dart';
import 'package:aimshala/utils/common/widgets/colors_common.dart';
import 'package:aimshala/utils/widgets/widgets_common.dart';
import 'package:aimshala/view/counselor_registration/c_background_details_section/c_prof_background_detail_page.dart';
import 'package:aimshala/view/counselor_registration/c_background_details_section/widgets/c_degree_bottomsheet.dart';
import 'package:aimshala/view/counselor_registration/common/widgets/counselor_widgets.dart';
import 'package:aimshala/view/profile/common/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CounselorEduBackgroundPage extends StatelessWidget {
  CounselorEduBackgroundPage({super.key});
  final GlobalKey<FormState> formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CounserlorEduBGController());
    return Scaffold(
      appBar: counselorAppBar(backArrow: true),
      body: counselorContainer(
        child: Form(
          key: formKey,
          child: Column(
            children: [
              counselorRichText(text1: 'Educational', text2: 'Background'),
              hLBox,
              counselorFields(
                fieldItem: 'Highest Degree Earned',
                textfiled: TextFormField(
                  readOnly: true,
                  controller: controller.degreeController,
                  onChanged: (value) =>
                      controller.update(['couns-EduBGupdate']),
                  onTap: () => showCounselDegreeOption(context),
                  validator: (value) => controller.fieldValidation(value),
                  decoration: infoFieldDecoration(
                    hintText: 'please select',
                    suffixWidget: const Icon(Icons.keyboard_arrow_down),
                  ),
                  style: const TextStyle(fontSize: 13),
                ),
              ),
              counselorFields(
                fieldItem: 'Certifications',
                textfiled: TextFormField(
                  onChanged: (value) =>
                      controller.update(['couns-EduBGupdate']),
                  controller: controller.certificationController,
                  validator: (value) => controller.fieldValidation(value),
                  decoration:
                      infoFieldDecoration(hintText: 'Enter Certifications'),
                  style: const TextStyle(fontSize: 13),
                ),
              ),
              counselorFields(
                fieldItem: 'Specializations',
                textfiled: TextFormField(
                  controller: controller.specializationController,
                  validator: (value) => controller.fieldValidation(value),
                  onChanged: (value) =>
                      controller.update(['couns-EduBGupdate']),
                  decoration:
                      infoFieldDecoration(hintText: 'Enter Specializations'),
                  style: const TextStyle(fontSize: 13),
                ),
              ),
              hLBox,
              GetBuilder<CounserlorEduBGController>(
                id: 'couns-EduBGupdate',
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
                        textColor: c.degreeController.text.isNotEmpty &&
                                c.certificationController.text.isNotEmpty &&
                                c.specializationController.text.isNotEmpty
                            ? kwhite
                            : textFieldColor,
                        boxColor: c.degreeController.text.isNotEmpty &&
                                c.certificationController.text.isNotEmpty &&
                                c.specializationController.text.isNotEmpty
                            ? mainPurple
                            : buttonColor,
                        onTap: () {
                          if (formKey.currentState!.validate()) {
                            Get.to(() => CounselorProfBackgroundPage());
                          }
                        },
                      ),
                    ],
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  void showCounselDegreeOption(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) => const CounselDegreeSheet(),
    );
  }
}
