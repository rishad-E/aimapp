import 'dart:developer';
import 'package:aimshala/controllers/mentor_controllers/mentor_personal_details_controller.dart';
import 'package:aimshala/utils/common/colors_common.dart';
import 'package:aimshala/utils/widgets/widgets_common.dart';
import 'package:aimshala/view/mentor_registration/common/widgets/text_widgets.dart';
import 'package:aimshala/view/mentor_registration/common/widgets/widgets.dart';
import 'package:aimshala/view/mentor_registration/mentor_background_detail_section/mentor_background_details_page.dart';
import 'package:aimshala/view/profile/common/widgets/texts.dart';
import 'package:aimshala/view/profile/common/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class MentorPersonalDetailPage extends StatelessWidget {
  MentorPersonalDetailPage({super.key});
  final GlobalKey<FormState> formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(MentorPersonalDetailController());
    return Scaffold(
      appBar: mentorAppbar(title: 'Mentor Registration'),
      body: mentorBGContainer(
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              children: [
                mentorSectionContainer(
                  child: Column(
                    children: [
                      mentorRichText(text1: 'Personal', text2: 'Details'),
                      hLBox,
                      mentorFields(
                        item: semiBoldChoiceText(text: 'Full Name', size: 9.sp),
                        textfiled: TextFormField(
                          controller: controller.nameController,
                          validator: (value) =>
                              controller.fieldValidation(value),
                          onChanged: (value) =>
                              controller.update(['mentor-personalinfo']),
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          decoration: infoFieldDecoration(
                            hintText: 'Enter Full Name',
                          ),
                          style: const TextStyle(fontSize: 13),
                        ),
                      ),
                      mentorFields(
                        item: semiBoldChoiceText(text: 'Email', size: 9.5.sp),
                        textfiled: TextFormField(
                          controller: controller.emailController,
                          validator: (value) =>
                              controller.fieldValidation(value, email: true),
                          onChanged: (value) =>
                              controller.update(['mentor-personalinfo']),
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          keyboardType: TextInputType.emailAddress,
                          decoration: infoFieldDecoration(
                              hintText: 'Enter Email Address'),
                          style: const TextStyle(fontSize: 13),
                        ),
                      ),
                      mentorFields(
                        item: semiBoldChoiceText(
                            text: 'City/Location', size: 9.5.sp),
                        textfiled: TextFormField(
                          controller: controller.locationController,
                          validator: (value) =>
                              controller.fieldValidation(value),
                          onChanged: (value) =>
                              controller.update(['mentor-personalinfo']),
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          decoration: infoFieldDecoration(
                            hintText: 'Enter City/Location',
                          ),
                          style: const TextStyle(fontSize: 13),
                        ),
                      ),
                      mentorFields(
                        item: semiBoldChoiceText(
                            text: 'Mobile Number', size: 9.5.sp),
                        textfiled: TextFormField(
                          controller: controller.mobileController,
                          validator: (value) =>
                              controller.fieldValidation(value, phone: true),
                          onChanged: (value) =>
                              controller.update(['mentor-personalinfo']),
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
                      GetBuilder<MentorPersonalDetailController>(
                          id: 'mentor-personalinfo',
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
                                          Get.to(()=>MentorBackgroundDetailPage());
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
