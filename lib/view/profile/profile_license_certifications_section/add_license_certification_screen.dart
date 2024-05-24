import 'dart:developer';
import 'dart:io';

import 'package:aimshala/controllers/profile_controller/profile_license_certification_controller.dart';
import 'package:aimshala/models/profile_model/profile_all_data_model.dart';
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
  final License? license;
  AddLicenseCertificationsScreen({super.key, required this.uId, this.license});
  final GlobalKey<FormState> formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProfileLicenseCertificationController());
    log(license.toString(), name: 'license data');
    String? liID;
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      controller.nameController.text =
          license?.name.toString() ?? controller.nameController.text;
      controller.organizationController.text =
          license?.organization.toString() ??
              controller.organizationController.text;
      controller.issuedateController.text =
          license?.issueDate.toString() ?? controller.issuedateController.text;
      controller.expirydateController.text = license?.expireDate.toString() ??
          controller.expirydateController.text;
      controller.credentialIDController.text =
          license?.credentialId.toString() ??
              controller.credentialIDController.text;
      controller.credentialurlController.text =
          license?.credentialUrl.toString() ??
              controller.credentialurlController.text;
      liID = license?.id.toString();
    });
    return PopScope(
      onPopInvoked: (didPop) =>
          Future.microtask(() => Get.off(() => ProfileHomeScreen(id: uId))),
      child: Scaffold(
        appBar: profileAppBar(
            title: 'Add license or certification', doneWidget: shrinked),
        body: Container(
          decoration: profileMainContainer(),
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
            margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
            decoration: profileSecondaryContainer(),
            child: SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    profileRichText('Add', 'license or certification'),
                    hLBox,
                    licenseInfoFiled(
                      text: primarytxt3('Name', 9.5.sp),
                      textField: TextFormField(
                        controller: controller.nameController,
                        validator: (value) => controller.fieldValidation(value),
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        onChanged: (value) {
                          controller.updateLicenseButton();
                          controller.update(['update-licenseButton']);
                        },
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
                        onChanged: (value) {
                          controller.updateLicenseButton();
                          controller.update(['update-licenseButton']);
                        },
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
                        onChanged: (value) {
                          controller.updateLicenseButton();
                          controller.update(['update-licenseButton']);
                        },
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
                        onChanged: (value) {
                          controller.updateLicenseButton();
                          controller.update(['update-licenseButton']);
                        },
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
                        onChanged: (value) {
                          controller.updateLicenseButton();
                          controller.update(['update-licenseButton']);
                        },
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
                        onChanged: (value) {
                          controller.updateLicenseButton();
                          controller.update(['update-licenseButton']);
                        },
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        decoration: infoFieldDecoration(
                            hintText: 'Enter Credential URL'),
                        style: const TextStyle(fontSize: 13),
                      ),
                    ),
                    licenseAdditional(
                      onTap: () => Get.to(() =>
                          AddLicenseSkillScreen(uId: uId, license: license)),
                      heading: 'Skills',
                      subText:
                          'We recommend adding your top 5 used in this experience. They’ll also appear in your Skills section.',
                      selected: Obx(() {
                        final data = controller.addedLicenseSkill;
                        return data.isEmpty
                            ? shrinked
                            : Column(
                                children: List.generate(data.length, (index) {
                                  return addedLicenseSkillHome(
                                    data[index],
                                    onTap: () => data.removeAt(index),
                                  );
                                }),
                              );
                      }),
                    ),
                    licenseAdditional(
                      onTap: () =>
                          showMediaOptions(context, controller, license),
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
                                      file: data[index].file!,
                                      onTapClose: () => data.removeAt(index),
                                      title: data[index].title,
                                      desc: data[index].description);
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
                                textColor: c.saveText.value,
                                boxColor: c.saveBG.value,
                                onTap: () {
                                  if (formKey.currentState!.validate()) {
                                    List<File> imagesList = c.allLicenseMedias
                                        .map((i) => i.file)
                                        .where((file) => file != null)
                                        .cast<File>()
                                        .toList();
                                    List<String> mediaTitles = c
                                        .allLicenseMedias
                                        .map((i) => i.title)
                                        .toList();
                                    List<String> mediaDescs = c.allLicenseMedias
                                        .map((i) => i.description)
                                        .toList();
                                    license == null
                                        ? c.saveLicenseCertificationFunction(
                                            uId: uId,
                                            name: c.nameController.text,
                                            organization:
                                                c.organizationController.text,
                                            issueDate:
                                                c.issuedateController.text,
                                            expiryDate:
                                                c.expirydateController.text,
                                            credID:
                                                c.credentialIDController.text,
                                            credURL:
                                                c.credentialurlController.text,
                                            media: imagesList,
                                            skills: c.addedLicenseSkill,
                                            mediaTitle: mediaTitles,
                                            mediaDescription: mediaDescs,
                                          )
                                        : c.updateLicenseCertificationFunction(
                                            lcID: liID.toString(),
                                            uId: uId,
                                            name: c.nameController.text,
                                            organization:
                                                c.organizationController.text,
                                            issueDate:
                                                c.issuedateController.text,
                                            expiryDate:
                                                c.expirydateController.text,
                                            credID:
                                                c.credentialIDController.text,
                                            credURL:
                                                c.credentialurlController.text,
                                            media: imagesList,
                                            skills: c.addedLicenseSkill,
                                            mediaTitle: mediaTitles,
                                            mediaDescription: mediaDescs,
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

  void showMediaOptions(BuildContext context,
      ProfileLicenseCertificationController controller, License? license) {
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
                  if (value != null) {
                    Get.to(() => AddLicenseMediaScreen(
                          image: value,
                          uId: uId,
                          controller: controller,
                          license: license,
                        ));
                  }
                }),
              ),
              mediaLicenseListTile(
                title: 'Take a Photo',
                leading: SvgPicture.asset('assets/images/camera.svg'),
                onTap: () => controller.pickCameraMedia().then((value) {
                  if (value != null) {
                    Get.to(() => AddLicenseMediaScreen(
                          image: value,
                          uId: uId,
                          controller: controller,
                          license: license,
                        ));
                  }
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
