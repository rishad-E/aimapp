import 'dart:developer';
import 'package:aimshala/controllers/mentor_controllers/mentor_personal_details_controller.dart';
import 'package:aimshala/models/UserModel/user_details_model.dart';
import 'package:aimshala/utils/common/widgets/colors_common.dart';
import 'package:aimshala/utils/widgets/widgets_common.dart';
import 'package:aimshala/view/mentor_registration/common/widgets/text_widgets.dart';
import 'package:aimshala/view/mentor_registration/common/widgets/widgets.dart';
import 'package:aimshala/view/mentor_registration/mentor_background_detail_section/mentor_background_details_page.dart';
import 'package:aimshala/view/mentor_registration/mentor_personal_detail_section/widget/current_status_bottomsheet.dart';
import 'package:aimshala/view/profile/common/widgets/texts.dart';
import 'package:aimshala/view/profile/common/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class MentorPersonalDetailPage extends StatelessWidget {
  final UserData? user;
  final UserDataModel? userDetails;
  MentorPersonalDetailPage({super.key, this.user, this.userDetails});
  final GlobalKey<FormState> formKey = GlobalKey();
  final controller = Get.put(MentorPersonalDetailController());
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      initializeFields(userDetails, user, controller);
    });
    return Scaffold(
      appBar: mentorAppbar(title: 'Mentor Registration', backArrow: true),
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
                          readOnly: user?.name != null ? true : false,
                          validator: (value) =>
                              controller.nameValidation(value),
                          onChanged: (value) => controller.checkAllFileds(),
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
                          readOnly: user?.email != null ? true : false,
                          validator: (value) =>
                              controller.fieldValidation(value, email: true),
                          onChanged: (value) => controller.checkAllFileds(),
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
                          onChanged: (value) => controller.checkAllFileds(),
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          decoration: infoFieldDecoration(
                            hintText: 'Enter City/Location',
                          ),
                          style: const TextStyle(fontSize: 13),
                        ),
                      ),
                      mentorFields(
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
                                onTap: userDetails?.dob == null
                                    ? () => controller.datePicker(context)
                                    : null,
                                child: calendarIcon(),
                              ),
                              hintText: 'dd-MM-yyyy'),
                          style: const TextStyle(fontSize: 13),
                        ),
                      ),
                      Obx(
                        () => mentorFields(
                          item:
                              semiBoldChoiceText(text: 'Gender', size: 9.5.sp),
                          textfiled: DropdownButtonFormField<String>(
                            value: controller.selectedGender.value,
                            icon: Icon(Icons.keyboard_arrow_down,
                                size: 26, color: kblack),
                            onChanged: userDetails?.gender == null ||
                                    userDetails?.gender == ''
                                ? (newValue) {
                                    if (userDetails?.gender == null) {
                                      controller.selectedGender.value =
                                          newValue!;
                                      controller.checkAllFileds();
                                    }
                                  }
                                : null,
                            validator: (value) =>
                                controller.genderValidation(value),
                            items: controller.genderOptions.map((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                // enabled:
                                //     userDetails?.gender == null ? true : false,
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
                      ),
                      mentorFields(
                        item: semiBoldChoiceText(
                            text: 'Your Current Status', size: 9.5.sp),
                        textfiled: GestureDetector(
                          onTap: userDetails?.userRole == null
                              ? () => showStatusSheet(context)
                              : null,
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
                      mentorFields(
                        item: semiBoldChoiceText(
                            text: 'Mobile Number', size: 9.5.sp),
                        textfiled: TextFormField(
                          controller: controller.mobileController,
                          readOnly: user?.phone != null ? true : false,
                          validator: (value) =>
                              controller.mobileValidation(value),
                          onChanged: (value) => controller.checkAllFileds(),
                          keyboardType: TextInputType.phone,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(10)
                          ],
                          decoration: infoFieldDecoration(
                              hintText: 'Enter Mobile Number',
                              prefix: phoneIcon()),
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
                                  textColor: c.saveText.value,
                                  boxColor: c.saveBG.value,
                                  onTap: () {
                                    if (formKey.currentState!.validate()) {
                                      log('Name=>${c.nameController.text} email=>${c.emailController.text} location=>${c.locationController.text} mob=>${c.mobileController.text} gender=>${c.selectedGender} dob=>${c.dobController.text} status=>${c.statusController.text}',
                                          name: 'edu-personalpage');
                                      Get.to(
                                          () => MentorBackgroundDetailPage());
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

  void initializeFields(UserDataModel? details, UserData? user,
      MentorPersonalDetailController c) {
    if (user == null) return;
    if (details == null) return;

    c.nameController.text = user.name ?? c.nameController.text;
    c.emailController.text = user.email ?? c.emailController.text;
    c.mobileController.text = user.phone ?? c.mobileController.text;
    c.dobController.text = details.dob ?? c.dobController.text;
    if (details.gender == null || details.gender!.isEmpty) {
      c.selectedGender.value = 'Please Select';
    } else {
      if (!c.genderOptions.contains(details.gender)) {
        c.genderOptions.add(details.gender!);
      }
      c.selectedGender.value = details.gender!;
    }
    // if (details.gender != null && !c.genderOptions.contains(details.gender)) {
    //   c.genderOptions.add(details.gender!);
    // }
    // c.selectedGender.value = details.gender ?? c.selectedGender.value;
    c.statusController.text = details.userRole ?? c.statusController.text;
    c.checkAllFileds();
    c.update(['mentor-personalinfo']);
  }

  void showStatusSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return const StatusBottomSheet();
      },
    );
  }
}
