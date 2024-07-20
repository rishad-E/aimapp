import 'package:aimshala/controllers/counselor_controllers/counselor_reference_controller.dart';
import 'package:aimshala/utils/common/widgets/colors_common.dart';
import 'package:aimshala/utils/common/widgets/text_common.dart';
import 'package:aimshala/utils/widgets/widgets_common.dart';
import 'package:aimshala/view/counselor_registration/c_final_media_section/c_final_media_page.dart';
import 'package:aimshala/view/counselor_registration/common/widgets/counselor_widgets.dart';
import 'package:aimshala/view/profile/common/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class CounselorReferencePage extends StatelessWidget {
  CounselorReferencePage({super.key});
  final GlobalKey<FormState> formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CounselorReferenceController());
    return Scaffold(
      appBar: counselorAppBar(backArrow: true),
      body: counselorContainer(
        child: Form(
          key: formKey,
          child: Column(
            children: [
              counselorRichText(text1: 'References', text2: ''),
              hLBox,
              Align(
                alignment: Alignment.centerLeft,
                child: boldText(text: 'Reference 1:', size: 14),
              ),
              hBox,
              counselorFields(
                fieldItem: 'Name',
                textfiled: TextFormField(
                  controller: controller.name1Controller,
                  onChanged: (value) => controller.checkAllFileds(),
                  style: const TextStyle(fontSize: 13),
                  decoration: infoFieldDecoration(hintText: 'Enter Name'),
                ),
              ),
              counselorFields(
                fieldItem: 'Relationship',
                textfiled: TextFormField(
                  controller: controller.relation1Controller,
                  onChanged: (value) => controller.checkAllFileds(),
                  style: const TextStyle(fontSize: 13),
                  decoration: infoFieldDecoration(
                      hintText: 'Please select',
                      suffixWidget: const Icon(Icons.keyboard_arrow_down)),
                ),
              ),
              counselorFields(
                fieldItem: 'Mobile Number',
                textfiled: TextFormField(
                  controller: controller.mob1Controller,
                  onChanged: (value) => controller.checkAllFileds(),
                  style: const TextStyle(fontSize: 13),
                  keyboardType: TextInputType.phone,
                  inputFormatters: [LengthLimitingTextInputFormatter(10)],
                  validator: (value) => controller.mobValiation(value),
                  decoration: infoFieldDecoration(
                      hintText: 'Enter Mobile Number', prefix: phoneIcon()),
                ),
              ),
              hLBox,
              Align(
                alignment: Alignment.centerLeft,
                child: boldText(text: 'Reference 2:', size: 14),
              ),
              hBox,
              counselorFields(
                fieldItem: 'Name',
                textfiled: TextFormField(
                  controller: controller.name2Controller,
                  onChanged: (value) => controller.checkAllFileds(),
                  style: const TextStyle(fontSize: 13),
                  decoration: infoFieldDecoration(hintText: 'Enter Name'),
                ),
              ),
              counselorFields(
                fieldItem: 'Relationship',
                textfiled: TextFormField(
                  controller: controller.relation2Controller,
                  onChanged: (value) => controller.checkAllFileds(),
                  style: const TextStyle(fontSize: 13),
                  decoration: infoFieldDecoration(
                      hintText: 'Please select',
                      suffixWidget: const Icon(Icons.keyboard_arrow_down)),
                ),
              ),
              counselorFields(
                fieldItem: 'Mobile Number',
                textfiled: TextFormField(
                  controller: controller.mob2Controller,
                  onChanged: (value) => controller.checkAllFileds(),
                  style: const TextStyle(fontSize: 13),
                  keyboardType: TextInputType.phone,
                  inputFormatters: [LengthLimitingTextInputFormatter(10)],
                  validator: (value) => controller.mobValiation(value),
                  decoration: infoFieldDecoration(
                      hintText: 'Enter Mobile Number', prefix: phoneIcon()),
                ),
              ),
              hLBox,
              GetBuilder<CounselorReferenceController>(
                  id: 'update-counsReference',
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
                          textColor: c.saveText.value,
                          boxColor: c.saveBG.value,
                          onTap: () {
                            if (formKey.currentState!.validate()) {
                              Get.to(()=>CounselorMediaPage());
                            }
                          },
                        )
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
