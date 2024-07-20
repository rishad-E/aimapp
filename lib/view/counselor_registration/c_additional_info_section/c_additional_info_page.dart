import 'package:aimshala/controllers/counselor_controllers/counselor_additional_info_controller.dart';
import 'package:aimshala/utils/common/widgets/colors_common.dart';
import 'package:aimshala/utils/widgets/widgets_common.dart';
import 'package:aimshala/view/counselor_registration/c_reference_section/c_reference_page.dart';
import 'package:aimshala/view/counselor_registration/common/widgets/counselor_widgets.dart';
import 'package:aimshala/view/profile/common/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CounselorAdditionalinfoPage extends StatelessWidget {
  CounselorAdditionalinfoPage({super.key});
  final GlobalKey<FormState> formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CounselorAdditionalinfoController());
    return Scaffold(
      appBar: counselorAppBar(backArrow: true),
      body: counselorContainer(
        child: Form(
          key: formKey,
          child: Column(
            children: [
              counselorRichText(text1: 'Additional Information', text2: ''),
              hLBox,
              counselorFields(
                fieldItem: 'Briefly Describe Your Counseling Philosophy',
                textfiled: TextFormField(
                  controller: controller.describeController,
                  onChanged: (value) =>
                      controller.update(['update-counsAdditional']),
                  validator: (value) => controller.fieldValidation(value,
                      type: 'Your Counseling Philosophy'),
                  minLines: 3,
                  maxLines: null,
                  decoration: infoFieldDecoration(
                    hintText: 'Enter Describe Your Counseling Philosophy     ',
                  ),
                ),
              ),
              counselorFields(
                fieldItem: 'Why do you want to be a counselor with Aimshala',
                textfiled: TextFormField(
                  controller: controller.whyCounselor,
                  validator: (value) => controller.fieldValidation(value,
                      type: 'Why do you want to be a counselor'),
                  onChanged: (value) =>
                      controller.update(['update-counsAdditional']),
                  minLines: 3,
                  maxLines: null,
                  decoration: infoFieldDecoration(
                    hintText:
                        'Enter Why do you want to be a Counselor with Aimshala?:',
                  ),
                ),
              ),
              hLBox,
              GetBuilder<CounselorAdditionalinfoController>(
                id: 'update-counsAdditional',
                builder: (c) {
                  return Row(
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
                        textColor: c.describeController.text.isNotEmpty &&
                                c.whyCounselor.text.isNotEmpty
                            ? kwhite
                            : textFieldColor,
                        boxColor: c.describeController.text.isNotEmpty &&
                                c.whyCounselor.text.isNotEmpty
                            ? mainPurple
                            : buttonColor,
                        onTap: () {
                          if (formKey.currentState!.validate()) {
                            Get.to(() => CounselorReferencePage());
                          }
                        },
                      )
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
}
