import 'dart:developer';

import 'package:aimshala/controllers/profile_controller/profile_volunteer_controller.dart';
import 'package:aimshala/utils/common/colors_common.dart';
import 'package:aimshala/utils/common/text_common.dart';
import 'package:aimshala/utils/widgets/widgets_common.dart';
import 'package:aimshala/view/profile/common/widgets/widgets.dart';
import 'package:aimshala/view/profile/profile_home/profile_home.dart';
import 'package:aimshala/view/profile/profile_volunteer_info/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class ProfileAddVolunteerExperienceScreen extends StatelessWidget {
  final String uId;
  ProfileAddVolunteerExperienceScreen({super.key, required this.uId});
  final GlobalKey<FormState> formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProfileVolunteerController());
    return PopScope(
      onPopInvoked: (didPop) =>
          Future.microtask(() => Get.off(() => const ProfileHomeScreen())),
      child: Scaffold(
        appBar: profileAppBar(
            title: 'Add volunteer experience', doneWidget: shrinked),
        body: Container(
          decoration: profileMainContainer(),
          child: Center(
            child: Container(
              decoration: profileSecondaryContainer(),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
              margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
              child: SingleChildScrollView(
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      profileRichText('Add', 'volunteer experience'),
                      hLBox,
                      volunteerInfoFiled(
                        text: primarytxt3('Organization', 9.5.sp),
                        textField: TextFormField(
                          controller: controller.organizationController,
                          validator: (value) =>
                              controller.fieldValidation(value),
                          onChanged: (value) {
                            controller.allFieldSelected();
                            controller.update(['update-volunteerInfo']);
                          },
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          decoration: infoFieldDecoration(
                            hintText: 'Ex: Red Cross',
                          ),
                          style: const TextStyle(fontSize: 13),
                        ),
                      ),
                      volunteerInfoFiled(
                        text: primarytxt3('Role', 9.5.sp),
                        textField: TextFormField(
                          controller: controller.volunteerRoleController,
                          validator: (value) =>
                              controller.fieldValidation(value),
                          onChanged: (value) {
                            controller.allFieldSelected();
                            controller.update(['update-volunteerInfo']);
                          },
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          decoration: infoFieldDecoration(
                              hintText: 'Ex: Fundraising Volunteer',
                              suffixWidget:
                                  const Icon(Icons.keyboard_arrow_down)),
                          style: const TextStyle(fontSize: 13),
                        ),
                      ),
                      volunteerInfoFiled(
                        text: primarytxt3('Cause', 9.5.sp),
                        textField: TextFormField(
                          controller: controller.causeController,
                          validator: (value) =>
                              controller.fieldValidation(value),
                          onChanged: (value) {
                            controller.allFieldSelected();
                            controller.update(['update-volunteerInfo']);
                          },
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          decoration: infoFieldDecoration(
                              hintText: 'Please Select',
                              suffixWidget:
                                  const Icon(Icons.keyboard_arrow_down)),
                          style: const TextStyle(fontSize: 13),
                        ),
                      ),
                      currentlyWorkingVolunteer(),
                      volunteerInfoFiled(
                        text: primarytxt3('Start date', 9.5.sp),
                        textField: TextFormField(
                          controller: controller.startdateController,
                          validator: (value) =>
                              controller.fieldValidation(value),
                          onChanged: (value) {
                            controller.allFieldSelected();
                            controller.update(['update-volunteerInfo']);
                          },
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          readOnly: true,
                          decoration: infoFieldDecoration(
                              hintText: 'Date',
                              suffixWidget: GestureDetector(
                                onTap: () =>
                                    controller.datePicker(context, start: true),
                                child: SvgPicture.asset(
                                    'assets/images/calendar-booked.svg',
                                    colorFilter: ColorFilter.mode(
                                        kblack, BlendMode.srcIn),
                                    fit: BoxFit.scaleDown),
                              )),
                          style: const TextStyle(fontSize: 13),
                        ),
                      ),
                      volunteerInfoFiled(
                        text: primarytxt3('End date (or expected)', 9.5.sp),
                        textField: TextFormField(
                          controller: controller.endDateController,
                          validator: (value) =>
                              controller.fieldValidation(value),
                          onChanged: (value) {
                            controller.allFieldSelected();
                            controller.update(['update-volunteerInfo']);
                          },
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          readOnly: true,
                          decoration: infoFieldDecoration(
                              hintText: 'Date',
                              suffixWidget: GestureDetector(
                                onTap: () => controller.datePicker(context),
                                child: SvgPicture.asset(
                                    'assets/images/calendar-booked.svg',
                                    colorFilter: ColorFilter.mode(
                                        kblack, BlendMode.srcIn),
                                    fit: BoxFit.scaleDown),
                              )),
                          style: const TextStyle(fontSize: 13),
                        ),
                      ),
                      volunteerInfoFiled(
                        text: primarytxt3('Description', 9.5.sp),
                        textField: TextFormField(
                          controller: controller.descriptionController,
                          validator: (value) =>
                              controller.fieldValidation(value),
                          onChanged: (value) {
                            controller.allFieldSelected();
                            controller.update(['update-volunteerInfo']);
                          },
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          decoration: infoFieldDecoration(
                            hintText: 'Enter Description',
                          ),
                          maxLength: 2000,
                          minLines: 2,
                          maxLines: null,
                          style: const TextStyle(fontSize: 13),
                        ),
                      ),
                      hMBox,
                      GetBuilder<ProfileVolunteerController>(
                        id: 'update-volunteerInfo',
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
                                text: 'Save',
                                textColor: c.saveText.value,
                                boxColor: c.saveBG.value,
                                onTap: () {
                                  if (formKey.currentState!.validate()) {
                                    log('ID=>$uId organization=>${c.organizationController.text} role=>${c.volunteerRoleController.text} cause=>${c.causeController.text} startDate=>${c.startdateController.text} endDate=>${c.endDateController.text} description=>${c.descriptionController.text}',
                                        name: 'volunteer-screen');
                                    c.saveVolunteerInfoFuntion(
                                      uId: uId,
                                      organization:
                                          c.organizationController.text,
                                      volRole: c.volunteerRoleController.text,
                                      volCause: c.causeController.text,
                                      startDate: c.startdateController.text,
                                      endDate: c.endDateController.text,
                                      description: c.descriptionController.text,
                                    );
                                  }
                                },
                              ),
                            ],
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
