import 'dart:developer';

import 'package:aimshala/controllers/counselor_controllers/counselor_reference_controller.dart';
import 'package:aimshala/utils/common/widgets/colors_common.dart';
import 'package:aimshala/utils/common/widgets/text_common.dart';
import 'package:aimshala/utils/widgets/widgets_common.dart';
import 'package:aimshala/view/counselor_registration/c_final_media_section/c_final_media_page.dart';
import 'package:aimshala/view/counselor_registration/c_reference_section/widget/c_reference_relation_bottomsheet.dart';
import 'package:aimshala/view/counselor_registration/common/widgets/counselor_widgets.dart';
import 'package:aimshala/view/profile/common/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class CounselorReferencePage extends StatelessWidget {
  CounselorReferencePage({super.key});
  final GlobalKey<FormState> formKey = GlobalKey();
  final controller = Get.put(CounselorReferenceController(), permanent: true);
  @override
  Widget build(BuildContext context) {
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
                  readOnly: true,
                  onTap: () => showCounselorRelation(context, '1'),
                  controller: controller.relation1Controller,
                  onChanged: (value) => controller.checkAllFileds(),
                  style: const TextStyle(fontSize: 13),
                  decoration: infoFieldDecoration(
                      hintText: 'Please select',
                      suffixWidget: const Icon(Icons.keyboard_arrow_down)),
                ),
              ),
              Obx(
                () => controller.otherRela1.value == 'Other (Please Specify)'
                    ? TextFormField(
                        controller: controller.otherRela1Controller,
                        onChanged: (value) => controller.checkAllFileds(),
                        style: const TextStyle(fontSize: 13),
                        decoration:
                            infoFieldDecoration(hintText: 'Enter Relation'),
                      )
                    : shrinked,
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
                  readOnly: true,
                  onTap: () => showCounselorRelation(context, '2'),
                  controller: controller.relation2Controller,
                  onChanged: (value) => controller.checkAllFileds(),
                  style: const TextStyle(fontSize: 13),
                  decoration: infoFieldDecoration(
                      hintText: 'Please select',
                      suffixWidget: const Icon(Icons.keyboard_arrow_down)),
                ),
              ),
              Obx(
                () => controller.otherRela2.value == 'Other (Please Specify)'
                    ? TextFormField(
                        controller: controller.otherRela2Controller,
                        onChanged: (value) => controller.checkAllFileds(),
                        style: const TextStyle(fontSize: 13),
                        decoration:
                            infoFieldDecoration(hintText: 'Enter Relation'),
                      )
                    : shrinked,
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
                              c.referenceNames.clear();
                              c.referenceRelation.clear();
                              c.referencePhone.clear();
                              c.refOtherRelation.clear();
                              c.addReferenceFields(
                                refName1: c.name1Controller.text,
                                refRelation1: c.relation1Controller.text,
                                refPhone1: c.mob1Controller.text,
                                refName2: c.name2Controller.text,
                                refRelation2: c.relation2Controller.text,
                                refPhone2: c.mob2Controller.text,
                                otherRelation1: c.otherRela1Controller.text,
                                otherRelation2: c.otherRela2Controller.text,
                              );
                              log('nameL=>${c.referenceNames} relaL=>${c.referenceRelation} phoneL=>${c.referencePhone}  otherRL=>${c.refOtherRelation}');
                              Get.to(() => CounselorMediaPage());
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

  void showCounselorRelation(BuildContext context, String ref) {
    showModalBottomSheet(
      context: context,
      builder: (context) => CounselorRelationSheet(ref: ref),
    );
  }
}
