import 'dart:developer';
import 'dart:io';

import 'package:aimshala/controllers/profile_controller/profile_license_certification_controller.dart';
import 'package:aimshala/utils/common/colors_common.dart';
import 'package:aimshala/utils/common/text_common.dart';
import 'package:aimshala/utils/widgets/widgets_common.dart';
import 'package:aimshala/view/profile/common/widgets/widgets.dart';
import 'package:aimshala/view/profile/profile_home/profile_home.dart';
import 'package:aimshala/view/profile/profile_license_certifications_section/add_media_secreen.dart';
import 'package:aimshala/view/profile/profile_license_certifications_section/add_skill_screen.dart';
import 'package:aimshala/view/profile/profile_license_certifications_section/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class AddLicenseCertificationsScreen extends StatelessWidget {
  final String uId;
  AddLicenseCertificationsScreen({super.key, required this.uId});
  final GlobalKey<FormState> formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProfileLicenseCertificationController());
    return PopScope(
      onPopInvoked: (didPop) =>
          Future.microtask(() => Get.off(() => const ProfileHomeScreen())),
      child: Scaffold(
        appBar: profileAppBar(
            title: 'Add license or certification', doneWidget: shrinked),
        body: Container(
          decoration: profileMainContainer(),
          child: Container(
            width: double.infinity,
            // height: 50,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
            margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
            decoration: profileSecondaryContainer(),
            child: SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    profileRichText('Add$uId', 'license or certification'),
                    hLBox,
                    licenseInfoFiled(
                      text: primarytxt3('Name', 9.5.sp),
                      textField: TextFormField(
                        controller: controller.nameController,
                        validator: (value) => controller.fieldValidation(value),
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        decoration: infoFieldDecoration(
                          hintText: 'Ex: Certified Network Security Associate',
                        ),
                        style: const TextStyle(fontSize: 13),
                      ),
                    ),
                    licenseInfoFiled(
                      text: primarytxt3('Issuing organization', 9.5.sp),
                      textField: TextFormField(
                        controller: controller.organizationController,
                        validator: (value) => controller.fieldValidation(value),
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        decoration:
                            infoFieldDecoration(hintText: 'Ex: Microsoft'),
                        style: const TextStyle(fontSize: 13),
                      ),
                    ),
                    licenseInfoFiled(
                      text: primarytxt3('Issue', 9.5.sp),
                      textField: TextFormField(
                        readOnly: true,
                        controller: controller.issuedateController,
                        validator: (value) => controller.fieldValidation(value),
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        decoration: infoFieldDecoration(
                          hintText: 'Date',
                          suffixWidget: GestureDetector(
                            onTap: () =>
                                controller.datePicker(context, expiry: false),
                            child: SvgPicture.asset(
                                'assets/images/calendar-booked.svg',
                                colorFilter:
                                    ColorFilter.mode(kblack, BlendMode.srcIn),
                                fit: BoxFit.scaleDown),
                          ),
                        ),
                        style: const TextStyle(fontSize: 13, height: 1.7),
                      ),
                    ),
                    licenseInfoFiled(
                      text: primarytxt3('Expiration date', 9.5.sp),
                      textField: TextFormField(
                        controller: controller.expirydateController,
                        validator: (value) => controller.fieldValidation(value),
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        readOnly: true,
                        decoration: infoFieldDecoration(
                          hintText: 'Date',
                          suffixWidget: GestureDetector(
                            onTap: () =>
                                controller.datePicker(context, expiry: true),
                            child: SvgPicture.asset(
                                'assets/images/calendar-booked.svg',
                                colorFilter:
                                    ColorFilter.mode(kblack, BlendMode.srcIn),
                                fit: BoxFit.scaleDown),
                          ),
                        ),
                        style: const TextStyle(fontSize: 13, height: 1.7),
                      ),
                    ),
                    licenseInfoFiled(
                      text: primarytxt3('Credential ID', 9.5.sp),
                      textField: TextFormField(
                        controller: controller.credentialIDController,
                        validator: (value) => controller.fieldValidation(value),
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        decoration: infoFieldDecoration(
                            hintText: 'Enter Credential ID'),
                        style: const TextStyle(fontSize: 13),
                      ),
                    ),
                    licenseInfoFiled(
                      text: primarytxt3('Credential URL', 9.5.sp),
                      textField: TextFormField(
                        controller: controller.credentialurlController,
                        validator: (value) => controller.fieldValidation(value),
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        decoration: infoFieldDecoration(
                            hintText: 'Enter Credential URL'),
                        style: const TextStyle(fontSize: 13),
                      ),
                    ),
                    licenseAdditional(
                      onTap: () =>
                          Get.to(() => AddLicenseSkillScreen(uId: uId)),
                      heading: 'Skills',
                      subText:
                          'We recommend adding your top 5 used in this experience. They’ll also appear in your Skills section.',
                      selected: Obx(() {
                        final data = controller.addedLicenseSkill;
                        return data.isEmpty
                            ? shrinked
                            : Column(
                                children: List.generate(data.length, (index) {
                                  return addedLicenseSkillHome(data[index]);
                                }),
                              );
                      }),
                    ),
                    licenseAdditional(
                      onTap: () => showMediaOptions(context, controller),
                      heading: 'Media',
                      subText:
                          'Add Documents, photos, sites, videos, and presentations.',
                      secSub: 'Learn more about media file types supported',
                      selected: Obx(() {
                        final data = controller.allLicenseMedias;
                        return data.isEmpty
                            ? shrinked
                            : Column(
                                children: List.generate(data.length, (index) {
                                  return addedLicenseMediaHome(
                                    data[index]!,
                                    () => data.removeAt(index),
                                  );
                                }),
                              );
                      }),
                    ),
                    hMBox,
                    GetBuilder<ProfileLicenseCertificationController>(
                        id: 'update-licenseButton',
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
                                textColor: textFieldColor,
                                boxColor: buttonColor,
                                onTap: () {
                                  if (formKey.currentState!.validate()) {
                                    log('name=>${c.nameController.text} organization=>${c.organizationController.text} issueDate=>${c.issuedateController.text} expiryDate=>${c.expirydateController.text} credID=>${c.credentialIDController.text} credURL=>${c.credentialurlController.text} skills=>${c.addedLicenseSkill} media=>${c.allLicenseMedias}',
                                        name: 'license-screen');
                                    List<File> imagesList = c.allLicenseMedias
                                        .where((file) => file != null)
                                        .cast<File>()
                                        .toList();
                                    c.saveLicenseCertificationFunction(
                                      uId: uId,
                                      name: c.nameController.text,
                                      organization:
                                          c.organizationController.text,
                                      issueDate: c.issuedateController.text,
                                      expiryDate: c.expirydateController.text,
                                      credID: c.credentialIDController.text,
                                      credURL: c.credentialurlController.text,
                                      media: imagesList,
                                      skills: c.addedLicenseSkill,
                                    );
                                  }
                                },
                              ),
                            ],
                          );
                        })
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void showMediaOptions(
      BuildContext context, ProfileLicenseCertificationController controller) {
    showModalBottomSheet(
      context: context,
      builder: (_) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              mediaLicenseListTile(
                title: 'Add a Link',
                leading: Transform.rotate(
                  angle: -0.7,
                  child: const Icon(Icons.link),
                ),
                onTap: () {},
              ),
              mediaLicenseListTile(
                title: 'Upload a Photo',
                leading: SvgPicture.asset('assets/images/gallery.svg'),
                onTap: () => controller.pickImageMedia().then((value) {
                  return Get.to(
                      () => AddLicenseMediaScreen(image: value, uId: uId));
                }),
              ),
              mediaLicenseListTile(
                title: 'Take a Photo',
                leading: SvgPicture.asset('assets/images/camera.svg'),
                onTap: () => controller.pickCameraMedia().then((value) {
                  return Get.to(
                      () => AddLicenseMediaScreen(image: value, uId: uId));
                }),
                // onTap: () {
                //   // controller.pickCameraMedia().then((value) {
                //   //   return Get.to(() => AddProfileMediaScreen(
                //   //         image: value,
                //   //         uId: uId,
                //   //       ));
                //   // });
                // },
              ),
            ],
          ),
        );
      },
    );
  }
}
