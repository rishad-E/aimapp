import 'dart:developer';

import 'package:aimshala/controllers/mentor_controllers/mentor_reference_controller.dart';
import 'package:aimshala/utils/common/widgets/colors_common.dart';
import 'package:aimshala/utils/common/widgets/text_common.dart';
import 'package:aimshala/utils/widgets/widgets_common.dart';
import 'package:aimshala/view/mentor_registration/common/widgets/widgets.dart';
import 'package:aimshala/view/mentor_registration/mentor_final_media_section/mentor_final_media_page.dart';
import 'package:aimshala/view/mentor_registration/mentor_references_section/mentor_relation_bottom_sheet.dart';
import 'package:aimshala/view/profile/common/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class MentorReferencesPage extends StatelessWidget {
  MentorReferencesPage({super.key});
  final GlobalKey<FormState> formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(MentorReferencesController());
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: boldText(text: 'References', size: 15.sp),
                      ),
                      hLBox,
                      boldText(text: 'Reference 1:', size: 11.sp),
                      mentorFields(
                        item: primarytxt3('Name', 9.5.sp),
                        textfiled: TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          controller: controller.nameController1,
                          validator: (value) =>
                              controller.filedValidation(value),
                          onChanged: (value) {
                            controller.checkAlFields();
                            controller.update(['mentor-reference']);
                          },
                          decoration:
                              infoFieldDecoration(hintText: 'Enter Name'),
                          style: const TextStyle(fontSize: 13),
                        ),
                      ),
                      hBox,
                      mentorFields(
                        item: primarytxt3('Relationship', 9.5.sp),
                        textfiled: GestureDetector(
                          onTap: () =>
                              showOtherRelationshipOptions(context, '1'),
                          child: AbsorbPointer(
                            child: TextFormField(
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              controller: controller.relationController1,
                              validator: (value) =>
                                  controller.filedValidation(value),
                              onChanged: (value) {
                                controller.checkAlFields();
                                controller.update(['mentor-reference']);
                              },
                              decoration: infoFieldDecoration(
                                  hintText: 'Please Select',
                                  suffixWidget:
                                      const Icon(Icons.keyboard_arrow_down)),
                              style: const TextStyle(fontSize: 13),
                            ),
                          ),
                        ),
                      ),
                      Obx(() => controller.otherRelation1.value ==
                              "Other(Please Specify)"
                          ? mentorFields(
                              item: choiceSizedBox(height: 5),
                              textfiled: TextFormField(
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                controller: controller.otherRelationController1,
                                validator: (value) =>
                                    controller.filedValidation(value),
                                onChanged: (value) {
                                  controller.checkAlFields();
                                  controller.update(['mentor-reference']);
                                },
                                decoration: infoFieldDecoration(
                                    hintText: 'Enter Relationship'),
                                style: const TextStyle(fontSize: 13),
                              ))
                          : shrinked),
                      // hBox,
                      hBox,
                      mentorFields(
                        item: primarytxt3('Mobile Number', 9.5.sp),
                        textfiled: TextFormField(
                          controller: controller.mobileController1,
                          validator: (value) =>
                              controller.mobileValidation(value),
                          onChanged: (value) {
                            controller.checkAlFields();
                            controller.update(['mentor-reference']);
                          },
                          keyboardType: TextInputType.phone,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(10)
                          ],
                          decoration: infoFieldDecoration(prefix: phoneIcon()),
                          style: const TextStyle(fontSize: 13),
                        ),
                      ),
                      hLBox,
                      boldText(text: 'Reference 2:', size: 11.sp),
                      mentorFields(
                        item: primarytxt3('Name', 9.5.sp),
                        textfiled: TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          controller: controller.nameController2,
                          validator: (value) =>
                              controller.filedValidation(value),
                          onChanged: (value) {
                            controller.checkAlFields();
                            controller.update(['mentor-reference']);
                          },
                          decoration: infoFieldDecoration(
                            hintText: 'Enter Name',
                          ),
                          style: const TextStyle(fontSize: 13),
                        ),
                      ),
                      hBox,
                      mentorFields(
                        item: primarytxt3('Relationship', 9.5.sp),
                        textfiled: GestureDetector(
                          onTap: () =>
                              showOtherRelationshipOptions(context, '2'),
                          child: AbsorbPointer(
                            child: TextFormField(
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              controller: controller.relationController2,
                              validator: (value) =>
                                  controller.filedValidation(value),
                              onChanged: (value) {
                                controller.checkAlFields();
                                controller.update(['mentor-reference']);
                              },
                              decoration: infoFieldDecoration(
                                  hintText: 'Please Select',
                                  suffixWidget:
                                      const Icon(Icons.keyboard_arrow_down)),
                              style: const TextStyle(fontSize: 13),
                            ),
                          ),
                        ),
                      ),
                      Obx(() => controller.otherRelation2.value ==
                              "Other(Please Specify)"
                          ? TextFormField(
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                controller: controller.otherRelationController2,
                                validator: (value) =>
                                    controller.filedValidation(value),
                                onChanged: (value) {
                                  controller.checkAlFields();
                                  controller.update(['mentor-reference']);
                                },
                                decoration: infoFieldDecoration(
                                    hintText: 'Enter Relationship'),
                                style: const TextStyle(fontSize: 13),
                              )
                          : shrinked),
                      hBox,
                      mentorFields(
                        item: primarytxt3('Mobile Number', 9.5.sp),
                        textfiled: TextFormField(
                          controller: controller.mobileController2,
                          validator: (value) =>
                              controller.mobileValidation(value),
                          onChanged: (value) {
                            controller.checkAlFields();
                            controller.update(['mentor-reference']);
                          },
                          keyboardType: TextInputType.phone,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(10)
                          ],
                          decoration: infoFieldDecoration(
                            prefix: phoneIcon(),
                          ),
                          style: const TextStyle(fontSize: 13),
                        ),
                      ),
                      hLBox,
                      GetBuilder<MentorReferencesController>(
                          id: 'mentor-reference',
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
                                  textColor: c.nextText.value,
                                  boxColor: c.nextBG.value,
                                  onTap: () {
                                    if (formKey.currentState!.validate()) {
                                      c.addReferenceFields(
                                        refName1: c.nameController1.text,
                                        refRelation1:
                                            c.relationController1.text,
                                        refPhone1: c.mobileController1.text,
                                        refName2: c.nameController2.text,
                                        refRelation2:
                                            c.relationController2.text,
                                        refPhone2: c.mobileController2.text,
                                        otherRelation1:
                                            c.otherRelationController1.text,
                                        otherRelation2:
                                            c.otherRelationController2.text,
                                      );
                                      log('nameList=${c.referenceNames} relationList=${c.referenceRelation} mobList=>${c.referencePhone}  otherRelList=>${c.otherRelation}',
                                          name: 'reference page');
                                      Get.to(() => const MentorMediaPage());
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

  void showOtherRelationshipOptions(BuildContext context, String ref) {
    showModalBottomSheet(
        context: context,
        builder: (context) => MentorOtherRelationBottomsheet(ref: ref));
  }
}
