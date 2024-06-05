import 'dart:developer';

import 'package:aimshala/controllers/educator_controllers/educator_personal_detail_controller.dart';
import 'package:aimshala/utils/common/colors_common.dart';
import 'package:aimshala/utils/widgets/widgets_common.dart';
import 'package:aimshala/view/educator_registration/common/widgets/text_widgets.dart';
import 'package:aimshala/view/educator_registration/common/widgets/widgets.dart';
import 'package:aimshala/view/educator_registration/professional_background_detial_section/background_detail_section.dart';
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
      appBar: educatorAppBar(title: 'Educator Registration'),
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
                        item: semiBoldChoiceText(text:  'Full Name',size:  9.sp),
                        textfiled: TextFormField(
                          controller: controller.nameController,
                          validator: (value) =>
                              controller.fieldValidation(value),
                          onChanged: (value) =>
                              controller.update(['edu-personalinfo']),
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          decoration: infoFieldDecoration(
                            hintText: 'Enter Full Name',
                          ),
                          style: const TextStyle(fontSize: 13),
                        ),
                      ),
                      educatorFields(
                        item: semiBoldChoiceText(text: 'Email',size:  9.5.sp),
                        textfiled: TextFormField(
                          controller: controller.emailController,
                          validator: (value) =>
                              controller.fieldValidation(value,email: true),
                          onChanged: (value) =>
                              controller.update(['edu-personalinfo']),
                          // autovalidateMode: AutovalidateMode.onUserInteraction,
                          keyboardType: TextInputType.emailAddress,
                          decoration: infoFieldDecoration(
                              hintText: 'Enter Email Address'),
                          style: const TextStyle(fontSize: 13),
                        ),
                      ),
                      educatorFields(
                        item: semiBoldChoiceText(text: 'City/Location',size:  9.5.sp),
                        textfiled: TextFormField(
                          controller: controller.locationController,
                          validator: (value) =>
                              controller.fieldValidation(value),
                          onChanged: (value) =>
                              controller.update(['edu-personalinfo']),
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          decoration: infoFieldDecoration(
                            hintText: 'Enter City/Location',
                          ),
                          style: const TextStyle(fontSize: 13),
                        ),
                      ),
                      educatorFields(
                        item: semiBoldChoiceText(text: 'Mobile Number',size:  9.5.sp),
                        textfiled: TextFormField(
                          controller: controller.mobileController,
                          validator: (value) =>
                              controller.fieldValidation(value,phone: true),
                          onChanged: (value) =>
                              controller.update(['edu-personalinfo']),
                          keyboardType: TextInputType.phone,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(10)
                          ],
                          decoration: infoFieldDecoration(
                            hintText: 'Enter Mobile Number',
                            prefix: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const SizedBox(width: 8),
                                Text(
                                  '+91',
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: kblack.withOpacity(0.4)),
                                ),
                                Icon(
                                  Icons.keyboard_arrow_down,
                                  size: 26,
                                  color: kblack.withOpacity(0.4),
                                ),
                                wBox
                              ],
                            ),
                          ),
                          style: const TextStyle(fontSize: 13),
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
                                  textColor: c.nameController.text.isNotEmpty &&
                                          c.emailController.text.isNotEmpty &&
                                          c.locationController.text
                                              .isNotEmpty &&
                                          c.mobileController.text.isNotEmpty
                                      ? kwhite
                                      : textFieldColor,
                                  boxColor: c.nameController.text.isNotEmpty &&
                                          c.emailController.text.isNotEmpty &&
                                          c.locationController.text
                                              .isNotEmpty &&
                                          c.mobileController.text.isNotEmpty
                                      ? mainPurple
                                      : buttonColor,
                                  onTap: () {
                                    if (formKey.currentState!.validate()) {
                                      log('Name=>${c.nameController.text} email=>${c.emailController.text} location=>${c.locationController.text} mob=>${c.mobileController.text}',
                                          name: 'edu-personalpage');
                                        Get.to(()=>EducatorBackgroundDetailPage());
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
