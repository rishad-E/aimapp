import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:aimshala/controllers/profile_controller/profile_license_certification_controller.dart';
import 'package:aimshala/models/profile_model/add_media_model.dart';
import 'package:aimshala/models/profile_model/profile_all_data_model.dart';
import 'package:aimshala/utils/common/colors_common.dart';
import 'package:aimshala/utils/common/text_common.dart';
import 'package:aimshala/utils/widgets/widgets_common.dart';
import 'package:aimshala/view/profile/common/widgets/widgets.dart';
import 'package:aimshala/view/profile/profile_home/profile_home.dart';
import 'package:aimshala/view/profile/profile_license_certifications_section/add_link_screen.dart';
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
      liID = license?.id.toString();
      initializeFormFields(controller, license);
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
                                  String? mediaUrl;
                                  if (data[index].url != null && license?.imagePath != null) {
                                    mediaUrl =
                                        "http://154.26.130.161/elearning/${license?.imagePath}/${data[index].url}";
                                  }
                                  return addedLicenseMediaHome(
                                      file: data[index].file,
                                      mediaUrl: mediaUrl,
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
                                  List<String> mediaLinks = c.allLicenseMedias
                                      .map((i) => i.mediaLink)
                                      .cast<String>()
                                      .toList();
                                  List<String> mediaTitles = c.allLicenseMedias
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
                                          issueDate: c.issuedateController.text,
                                          expiryDate:
                                              c.expirydateController.text,
                                          credID: c.credentialIDController.text,
                                          credURL:
                                              c.credentialurlController.text,
                                          media: imagesList,
                                          skills: c.addedLicenseSkill,
                                          mediaTitle: mediaTitles,
                                          mediaDescription: mediaDescs,
                                          mediaLink: mediaLinks)
                                      : c.updateLicenseCertificationFunction(
                                          lcID: liID.toString(),
                                          uId: uId,
                                          name: c.nameController.text,
                                          organization:
                                              c.organizationController.text,
                                          issueDate: c.issuedateController.text,
                                          expiryDate:
                                              c.expirydateController.text,
                                          credID: c.credentialIDController.text,
                                          credURL:
                                              c.credentialurlController.text,
                                          media: imagesList,
                                          skills: c.addedLicenseSkill,
                                          mediaTitle: mediaTitles,
                                          mediaDescription: mediaDescs,
                                          mediaLink: mediaLinks);
                                }
                              },
                            ),
                          ],
                        );
                      },
                    ),
                    hBox,
                    license == null
                        ? shrinked
                        : deleteSectionWidget(
                            onPressed: () => controller.deleteLicenseFunction(
                                licenseID: liID.toString(), uId: uId),
                            section: 'License',
                          )
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
                onTap: () {
                  controller.mediaLinkController.clear();
                  Get.to(() => AddLicenseLinkScreen(
                        uId: uId,
                        controller: controller,
                        license: license,
                      ));
                },
              ),
              mediaLicenseListTile(
                title: 'Upload a Photo',
                leading: SvgPicture.asset('assets/images/gallery.svg'),
                onTap: () => controller.pickImageMedia().then((value) {
                  if (value != null) {
                    controller.mediaTitleController.clear();
                    controller.mediaDescriptionController.clear();
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
                    controller.mediaTitleController.clear();
                    controller.mediaDescriptionController.clear();
                    Get.to(() => AddLicenseMediaScreen(
                          image: value,
                          uId: uId,
                          controller: controller,
                          license: license,
                        ));
                  }
                }),
              ),
            ],
          ),
        );
      },
    );
  }

  void initializeFormFields(
      ProfileLicenseCertificationController c, License? license) {
    if (license == null) return;
    c.nameController.text =
        c.nameController.text.isEmpty && license.name != null
            ? license.name as String
            : c.nameController.text;
    c.organizationController.text =
        c.organizationController.text.isEmpty && license.organization != null
            ? license.organization as String
            : c.organizationController.text;
    c.issuedateController.text =
        c.issuedateController.text.isEmpty && license.issueDate != null
            ? license.issueDate as String
            : c.issuedateController.text;
    c.expirydateController.text =
        c.expirydateController.text.isEmpty && license.expireDate != null
            ? license.expireDate as String
            : c.expirydateController.text;
    c.credentialIDController.text =
        c.credentialIDController.text.isEmpty && license.credentialId != null
            ? license.credentialId as String
            : c.credentialIDController.text;
    c.credentialurlController.text =
        c.credentialurlController.text.isEmpty && license.credentialUrl != null
            ? license.credentialUrl as String
            : c.credentialurlController.text;
    if (c.addedLicenseSkill.isEmpty && license.skills != null) {
      List<String>? resSkill = license.skills?.split(',');
      if (resSkill != null) {
        for (var i in resSkill) {
          if (!c.addedLicenseSkill.contains(i)) {
            c.addedLicenseSkill.add(i);
          }
        }
      }
    }
    if (c.allLicenseMedias.isEmpty && license.media != null) {
      List<AddMediaModel> mediaList = parseMediaItems(license);
      c.allLicenseMedias.addAll(mediaList);
    }
    c.updateLicenseButton();
    c.update(['update-licenseButton']);
  }

  List<AddMediaModel> parseMediaItems(License license) {
    List<String> mediaList = List<String>.from(jsonDecode(license.media!));
    List<String> mediaTitles = license.mediaTitle?.split(',') ?? [];
    List<String> mediaDescriptions = license.mediaDescription?.split(',') ?? [];
    List<AddMediaModel> mediaItems = [];
    for (int i = 0; i < mediaList.length; i++) {
      String filename = mediaList[i];
      String title =
          i < mediaTitles.length ? mediaTitles[i] : "Title for $filename";
      String description = i < mediaDescriptions.length
          ? mediaDescriptions[i]
          : "Description for $filename";
      if (!mediaItems.any((i) => i.title == title)) {
        mediaItems.add(AddMediaModel(
            title: title, description: description, url: filename));
      }
    }
    return mediaItems;
  }
}
