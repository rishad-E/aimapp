import 'dart:developer';

import 'package:aimshala/controllers/educator_controllers/educator_personal_detail_controller.dart';
import 'package:aimshala/utils/common/widgets/colors_common.dart';
import 'package:aimshala/utils/widgets/widgets_common.dart';
import 'package:aimshala/view/educator_registration/common/widgets/text_widgets.dart';
import 'package:aimshala/view/educator_registration/common/widgets/widgets.dart';
import 'package:aimshala/view/educator_registration/personal_detail_section/widget/current_status_educator_sheet.dart';
import 'package:aimshala/view/educator_registration/professional_background_detial_section/background_detail_page.dart';
import 'package:aimshala/view/profile/common/widgets/texts.dart';
import 'package:aimshala/view/profile/common/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class EducatorPersonalDetailPage extends StatelessWidget {
  EducatorPersonalDetailPage({super.key});
  final GlobalKey<FormState> formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(EducatorPersonalDetailController());
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
                    children: [
                      educatorRichText(text1: 'Personal', text2: 'Details'),
                      hLBox,
                      educatorFields(
                        item: semiBoldChoiceText(text: 'Full Name', size: 9.sp),
                        textfiled: TextFormField(
                          controller: controller.nameController,
                          validator: (value) =>
                              controller.fieldValidation(value),
                          onChanged: (value) => controller.checkAllFileds(),
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          decoration: infoFieldDecoration(
                            hintText: 'Enter Full Name',
                          ),
                          style: const TextStyle(fontSize: 13),
                        ),
                      ),
                      educatorFields(
                        item: semiBoldChoiceText(text: 'Email', size: 9.5.sp),
                        textfiled: TextFormField(
                          controller: controller.emailController,
                          validator: (value) =>
                              controller.fieldValidation(value, email: true),
                          onChanged: (value) => controller.checkAllFileds(),
                          // autovalidateMode: AutovalidateMode.onUserInteraction,
                          keyboardType: TextInputType.emailAddress,
                          decoration: infoFieldDecoration(
                              hintText: 'Enter Email Address'),
                          style: const TextStyle(fontSize: 13),
                        ),
                      ),
                      educatorFields(
                        item: semiBoldChoiceText(
                            text: 'City/Location', size: 9.5.sp),
                        textfiled: TextFormField(
                          controller: controller.locationController,
                          validator: (value) =>
                              controller.fieldValidation(value),
                          onChanged: (value) => controller.checkAllFileds(),
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          decoration: infoFieldDecoration(
                            hintText: 'Enter City/Location',
                          ),
                          style: const TextStyle(fontSize: 13),
                        ),
                      ),
                      educatorFields(
                        item: semiBoldChoiceText(
                            text: 'Mobile Number', size: 9.5.sp),
                        textfiled: TextFormField(
                          controller: controller.mobileController,
                          validator: (value) =>
                              controller.mobileValidation(value),
                          onChanged: (value) => controller.checkAllFileds(),
                          keyboardType: TextInputType.phone,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(10)
                          ],
                          decoration: infoFieldDecoration(
                            hintText: 'Enter Mobile Number',
                            prefix: phoneIcon(),
                          ),
                          style: const TextStyle(fontSize: 13),
                        ),
                      ),
                      educatorFields(
                        item: semiBoldChoiceText(
                            text: 'Date of Birth', size: 9.5.sp),
                        textfiled: TextFormField(
                          controller: controller.dobController,
                          readOnly: true,
                          validator: (value) =>
                              controller.fieldValidation(value),
                          onChanged: (value) => controller.checkAllFileds(),
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          decoration: infoFieldDecoration(
                              suffixWidget: GestureDetector(
                                onTap: () => controller.datePicker(context),
                                child: calendarIcon(),
                              ),
                              hintText: 'dd-MM-yyyy'),
                          style: const TextStyle(fontSize: 13),
                        ),
                      ),
                      educatorFields(
                        item: semiBoldChoiceText(text: 'Gender', size: 9.5.sp),
                        textfiled: DropdownButtonFormField<String>(
                          value: controller.selectedGender,
                          icon: Icon(Icons.keyboard_arrow_down,
                              size: 26, color: kblack),
                          onChanged: (newValue) {
                            controller.selectedGender = newValue;
                            controller.checkAllFileds();
                          },
                          validator: (value) =>
                              controller.genderValidation(value),
                          items: controller.genderOptions.map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(
                                value,
                                style: TextStyle(color: kblack, fontSize: 13),
                              ),
                            );
                          }).toList(),
                          decoration:
                              infoFieldDecoration(hintText: 'Please Select'),
                          style: const TextStyle(fontSize: 13),
                        ),
                      ),
                      educatorFields(
                        item: semiBoldChoiceText(
                            text: 'Your Current Status', size: 9.5.sp),
                        textfiled: GestureDetector(
                          onTap: () => showStatusSheetEducator(context),
                          child: AbsorbPointer(
                            child: TextFormField(
                              controller: controller.statusController,
                              readOnly: true,
                              validator: (value) =>
                                  controller.fieldValidation(value),
                              onChanged: (value) => controller.checkAllFileds(),
                              keyboardType: TextInputType.text,
                              decoration: infoFieldDecoration(
                                hintText: 'Please Select',
                                suffixWidget: Icon(Icons.keyboard_arrow_down,
                                    size: 26, color: kblack),
                              ),
                              style: const TextStyle(fontSize: 13),
                            ),
                          ),
                        ),
                      ),
                      hLBox,
                      GetBuilder<EducatorPersonalDetailController>(
                          id: 'edu-personalinfo',
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
                                  textColor: c.saveText.value,
                                  boxColor: c.saveBG.value,
                                  onTap: () {
                                    if (formKey.currentState!.validate()) {
                                      log('Name=>${c.nameController.text} email=>${c.emailController.text} location=>${c.locationController.text} mob=>${c.mobileController.text}',
                                          name: 'edu-personalpage');
                                      Get.to(
                                          () => EducatorBackgroundDetailPage());
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

  void showStatusSheetEducator(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) => EducatorStatusBottomsheet(),
    );
  }
}
