import 'dart:developer';

import 'package:aimshala/controllers/profile_controller/profile_personal_info_controller.dart';
import 'package:aimshala/models/UserModel/user_model.dart';
import 'package:aimshala/services/profile_section/update_personal_info_service.dart';
import 'package:aimshala/utils/common/widgets/colors_common.dart';
import 'package:aimshala/utils/common/widgets/text_common.dart';
import 'package:aimshala/utils/widgets/widgets_common.dart';
import 'package:aimshala/view/profile/common/widgets/widgets.dart';
import 'package:aimshala/view/profile/profile_personal_section/widgets/select_gender_bottomsheet.dart';
import 'package:aimshala/view/profile/profile_personal_section/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class ProfilePersonalInfoScreen extends StatelessWidget {
  final String id;
  final User? user;
  ProfilePersonalInfoScreen({super.key, required this.id, this.user});
  final GlobalKey<FormState> formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(PerosnalInfoController());
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      initializeFormFields(controller, user);
    });
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: profileAppBar(title: 'Profile', doneWidget: shrinked),
      body: Container(
        decoration: profileMainContainer(),
        child: Center(
          child: SingleChildScrollView(
            child: Container(
              width: double.infinity,
              // height: 50,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
              margin: const EdgeInsets.symmetric(horizontal: 24),
              decoration: profileSecondaryContainer(),
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    profileRichText('Personal', 'Info'),
                    hBox,
                    Text(
                      "Tell us about your Personal Info",
                      style: TextStyle(fontSize: 14, color: textFieldColor),
                    ),
                    hLBox,
                    perosnalInfoFiled(
                      text: primarytxt3('Name', 9.5.sp),
                      textField: TextFormField(
                        controller: controller.nameController,
                        onChanged: (value) =>
                            controller.update(['update-personalinfo']),
                        validator: (value) => controller.fieldValidator(value),
                        style: const TextStyle(fontSize: 12),
                        decoration:
                            infoFieldDecoration(hintText: 'Enter Full Name'),
                      ),
                    ),
                    perosnalInfoFiled(
                      text: primarytxt3('Username', 9.5.sp),
                      textField: TextFormField(
                        controller: controller.userNameController,
                        onChanged: (value) =>
                            controller.update(['update-personalinfo']),
                        validator: (value) => controller.fieldValidator(value),
                        style: const TextStyle(fontSize: 12),
                        decoration: infoFieldDecoration(
                            hintText: 'User Name',
                            fill: user?.username != null ? true : false),
                      ),
                    ),
                    perosnalInfoFiled(
                      text: primarytxt3('Date of Birth', 9.5.sp),
                      textField: TextFormField(
                        readOnly: true,
                        controller: controller.dateController,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) => controller.fieldValidator(value),
                        style: const TextStyle(fontSize: 12),
                        decoration: infoFieldDecoration(
                          hintText: 'Date',
                          suffixWidget: GestureDetector(
                            onTap: () => controller.datePicker(context),
                            child: SvgPicture.asset(
                              'assets/images/calendar-booked.svg',
                              colorFilter:
                                  ColorFilter.mode(kblack, BlendMode.srcIn),
                              fit: BoxFit.scaleDown,
                            ),
                          ),
                        ),
                      ),
                    ),
                    perosnalInfoFiled(
                      text: primarytxt3('Gender', 9.5.sp),
                      textField: GestureDetector(
                        onTap: () => showGenderOptions(context),
                        child: AbsorbPointer(
                          child: TextFormField(
                            controller: controller.genderController,
                            onChanged: (value) =>
                                controller.update(['update-personalinfo']),
                            validator: (value) =>
                                controller.fieldValidator(value),
                            style: const TextStyle(fontSize: 12),
                            decoration: infoFieldDecoration(
                                hintText: 'Please Select',
                                suffixWidget:
                                    const Icon(Icons.keyboard_arrow_down)),
                          ),
                        ),
                      ),
                    ),
                    perosnalInfoFiled(
                      text: primarytxt3('Personal Statement', 9.5.sp),
                      textField: TextFormField(
                        controller: controller.aboutController,
                        onChanged: (value) =>
                            controller.update(['update-personalinfo']),
                        validator: (value) => controller.fieldValidator(value),
                        style: const TextStyle(fontSize: 12),
                        maxLength: 1000,
                        minLines: 3,
                        maxLines: null,
                        decoration: infoFieldDecoration(
                            hintText: 'Write Personal Statement'),
                      ),
                    ),
                    hLBox,
                    GetBuilder<PerosnalInfoController>(
                      id: 'update-personalinfo',
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
                              textColor: c.nameController.text.isNotEmpty &&
                                      c.userNameController.text.isNotEmpty &&
                                      c.dateController.text.isNotEmpty &&
                                      c.genderController.text.isNotEmpty &&
                                      c.aboutController.text.isNotEmpty
                                  ? kwhite
                                  : textFieldColor,
                              boxColor: c.nameController.text.isNotEmpty &&
                                      c.userNameController.text.isNotEmpty &&
                                      c.genderController.text.isNotEmpty &&
                                      c.aboutController.text.isNotEmpty &&
                                      c.dateController.text.isNotEmpty
                                  ? mainPurple
                                  : buttonColor,
                              onTap: () {
                                if (formKey.currentState!.validate()) {
                                  log('name: ${c.nameController.text} username:${c.userNameController.text}date: ${c.dateController.text} UID: $id gender=>${c.genderController.text} about=>${c.aboutController.text}');
                                  c.savepersonalInfoFunction(
                                    uId: id,
                                    fullName: c.nameController.text,
                                    userName: c.userNameController.text,
                                    dOB: c.dateController.text,
                                    gender: c.genderController.text,
                                    statement: c.aboutController.text,
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
    );
  }

  void initializeFormFields(PerosnalInfoController c, User? user) {
    if (user == null) return;
    c.nameController.text = user.name ?? c.nameController.text;
    c.userNameController.text = user.username ?? c.userNameController.text;
    c.dateController.text = user.dob ?? c.dateController.text;
    c.genderController.text = user.gender ?? c.genderController.text;
    c.aboutController.text = user.about ?? c.aboutController.text;
    c.update(['update-personalinfo']);
  }

  void showGenderOptions(BuildContext context) {
    showModalBottomSheet(
        context: context, builder: (context) => const GenderTypeBottomSheet());
  }
}
