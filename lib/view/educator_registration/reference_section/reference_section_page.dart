import 'dart:developer';

import 'package:aimshala/controllers/educator_controllers/educator_reference_controller.dart';
import 'package:aimshala/utils/common/widgets/colors_common.dart';
import 'package:aimshala/utils/common/widgets/text_common.dart';
import 'package:aimshala/utils/widgets/widgets_common.dart';
import 'package:aimshala/view/educator_registration/common/widgets/widgets.dart';
import 'package:aimshala/view/educator_registration/final_media_section/final_media_add_page.dart';
import 'package:aimshala/view/educator_registration/reference_section/widgets/reference_relation_bottomsheet.dart';
import 'package:aimshala/view/profile/common/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class EducatorReferencePage extends StatelessWidget {
  EducatorReferencePage({super.key});
  final GlobalKey<FormState> formKey = GlobalKey();
  final controller = Get.put(EducatorReferenceController(), permanent: true);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: educatorAppBar(title: 'Educator Registration', backArrow: true),
      body: educatorBGContainer(
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              children: [
                educatorSectionContainer(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: boldText(text: 'References', size: 15.sp),
                      ),
                      hLBox,
                      boldText(text: 'Reference 1:', size: 11.sp),
                      educatorFields(
                        item: primarytxt3('Name', 9.5.sp),
                        textfiled: TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          controller: controller.nameController1,
                          onChanged: (value) {
                            controller.checkAlFields();
                            controller.update(['edu-referenceInfo']);
                          },
                          decoration:
                              infoFieldDecoration(hintText: 'Enter Name'),
                          style: const TextStyle(fontSize: 13),
                        ),
                      ),
                      hBox,
                      educatorFields(
                        item: primarytxt3('Relationship', 9.5.sp),
                        textfiled: GestureDetector(
                          onTap: () => showRelationShipOption(context, '1'),
                          child: AbsorbPointer(
                            child: TextFormField(
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              controller: controller.relationController1,
                              onChanged: (value) {
                                controller.checkAlFields();
                                controller.update(['edu-referenceInfo']);
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
                      Obx(
                        () => controller.otherRelation1.value ==
                                "Other (Please Specify)"
                            ? TextFormField(
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                controller: controller.otherRelationController1,
                                onChanged: (value) {
                                  controller.checkAlFields();
                                  controller.update(['edu-referenceInfo']);
                                },
                                decoration: infoFieldDecoration(
                                    hintText: 'Enter Relationship'),
                                style: const TextStyle(fontSize: 13),
                              )
                            : shrinked,
                      ),
                      hBox,
                      educatorFields(
                        item: primarytxt3('Mobile Number', 9.5.sp),
                        textfiled: TextFormField(
                          controller: controller.mobileController1,
                          onChanged: (value) {
                            controller.checkAlFields();
                            controller.update(['edu-referenceInfo']);
                          },
                          keyboardType: TextInputType.phone,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(10)
                          ],
                          decoration: infoFieldDecoration(
                              prefix: phoneIcon(),
                              hintText: 'Enter Mobile Number'),
                          style: const TextStyle(fontSize: 13),
                        ),
                      ),
                      hLBox,
                      boldText(text: 'Reference 2:', size: 11.sp),
                      educatorFields(
                        item: primarytxt3('Name', 9.5.sp),
                        textfiled: TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          controller: controller.nameController2,
                          onChanged: (value) {
                            controller.checkAlFields();
                            controller.update(['edu-referenceInfo']);
                          },
                          decoration: infoFieldDecoration(
                            hintText: 'Enter Name',
                          ),
                          style: const TextStyle(fontSize: 13),
                        ),
                      ),
                      hBox,
                      educatorFields(
                        item: primarytxt3('Relationship', 9.5.sp),
                        textfiled: GestureDetector(
                          onTap: () => showRelationShipOption(context, '2'),
                          child: AbsorbPointer(
                            child: TextFormField(
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              controller: controller.relationController2,
                              onChanged: (value) {
                                controller.checkAlFields();
                                controller.update(['edu-referenceInfo']);
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
                              "Other (Please Specify)"
                          ? TextFormField(
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              controller: controller.otherRelationController2,
                              onChanged: (value) {
                                controller.checkAlFields();
                                controller.update(['edu-referenceInfo']);
                              },
                              decoration: infoFieldDecoration(
                                  hintText: 'Enter Relationship'),
                              style: const TextStyle(fontSize: 13),
                            )
                          : shrinked),
                      hBox,
                      educatorFields(
                        item: primarytxt3('Mobile Number', 9.5.sp),
                        textfiled: TextFormField(
                          controller: controller.mobileController2,
                          onChanged: (value) {
                            controller.checkAlFields();
                            controller.update(['edu-referenceInfo']);
                          },
                          keyboardType: TextInputType.phone,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(10)
                          ],
                          decoration: infoFieldDecoration(
                              prefix: phoneIcon(),
                              hintText: 'Enter Mobile Number'),
                          style: const TextStyle(fontSize: 13),
                        ),
                      ),
                      hLBox,
                      GetBuilder<EducatorReferenceController>(
                          id: 'edu-referenceInfo',
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
                                  textColor: c.nextText.value,
                                  boxColor: c.nextBG.value,
                                  onTap: () {
                                    if (formKey.currentState!.validate()) {
                                      // log('name1=${c.nameController1.text} relation1=${c.relationController1.text} mob=>${c.mobileController1.text} name2=${c.nameController2.text} relation2=${c.relationController2.text} mob2=>${c.mobileController2.text} other1=>${c.otherRelationController1.text} other2=>${c.otherRelationController2.text}',
                                      //     name: 'reference page');
                                      c.addtoLists(
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
                                              c.otherRelationController2.text);
                                      log('nameList=${c.referenceNames} relationList=${c.referenceRelation} mobList=>${c.referencePhone}  otherRelList=>${c.otherRelation}',
                                          name: 'reference page');
                                      Get.to(() => EducatorMediaAddPage());
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

  void showRelationShipOption(BuildContext context, String ref) {
    showModalBottomSheet(
        context: context,
        builder: (context) => ReferenceRelationBottomSheet(reference: ref));
  }
}
