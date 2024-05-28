import 'dart:developer';
import 'dart:io';
import 'package:aimshala/controllers/profile_controller/profile_experience_controller.dart';
import 'package:aimshala/models/profile_model/profile_all_data_model.dart';
import 'package:aimshala/utils/common/colors_common.dart';
import 'package:aimshala/utils/common/text_common.dart';
import 'package:aimshala/utils/widgets/widgets_common.dart';
import 'package:aimshala/view/profile/common/widgets/widgets.dart';
import 'package:aimshala/view/profile/profile_experience_section/add_link_screen.dart';
import 'package:aimshala/view/profile/profile_experience_section/add_media_screen.dart';
import 'package:aimshala/view/profile/profile_experience_section/add_skill_screen.dart';
import 'package:aimshala/view/profile/profile_experience_section/widgets/employment_type_bottomsheet.dart';
import 'package:aimshala/view/profile/profile_experience_section/widgets/location_type_bottomsheet.dart';
import 'package:aimshala/view/profile/profile_experience_section/widgets/widgets.dart';
import 'package:aimshala/view/profile/profile_home/profile_home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class AddExperienceScreen extends StatelessWidget {
  final String uId;
  final Experience? experience;
  AddExperienceScreen({super.key, required this.uId, this.experience});
  final GlobalKey<FormState> formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProfileExperienceController());
    String? exID;
    log(experience.toString(), name: 'experience detial');
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      controller.titleController.text =
          controller.titleController.text.isEmpty && experience?.title != null
              ? experience?.title.toString() as String
              : controller.titleController.text;
      controller.employmentController.text =
          experience?.employmentType.toString() ??
              controller.employmentController.text;
      controller.companyController.text = experience?.companyName.toString() ??
          controller.companyController.text;
      controller.locationController.text =
          experience?.location.toString() ?? controller.locationController.text;
      controller.locationTypeController.text =
          experience?.locationType.toString() ??
              controller.locationTypeController.text;
      controller.startDateController.text = experience?.startDate.toString() ??
          controller.startDateController.text;
      controller.endDateController.text = experience?.endDate.toString() ?? '';
      controller.descriptionController.text =
          experience?.description.toString() ??
              controller.descriptionController.text;
      controller.profileController.text =
          experience?.profile.toString() ?? controller.profileController.text;
      exID = experience?.id.toString();
      if (experience?.endDate == null||experience?.endDate =="currently_working") {
        controller.currentlyWorking.value = true;
        controller.update(['EX-currentlyworkingButton']);
        log(controller.currentlyWorking.toString(), name: 'currenlyworking-ex');
      }
    });
    return PopScope(
      onPopInvoked: (didPop) =>
          Future.microtask(() => Get.off(() => ProfileHomeScreen(id: uId))),
      child: Scaffold(
        appBar: profileAppBar(title: 'Add Experience', doneWidget: shrinked),
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
                    profileRichText('Add', 'Experience'),
                    hBox,
                    Text(
                      "Tell us about your Experience",
                      style: TextStyle(fontSize: 14, color: textFieldColor),
                    ),
                    hLBox,
                    experienceInfoFiled(
                      text: primarytxt3('Title', 9.5.sp),
                      textField: TextFormField(
                        controller: controller.titleController,
                        validator: (value) => controller.filedValidation(value),
                        onChanged: (value) {
                          controller.updateSaveButtonEX();
                          controller.update(['update-experienceInfo']);
                        },
                        decoration: infoFieldDecoration(
                            hintText: 'Ex: Retail Sales Managery'),
                        maxLength: 100,
                        style: const TextStyle(fontSize: 13),
                      ),
                    ),
                    experienceInfoFiled(
                      text: primarytxt3('Employment type', 9.5.sp),
                      textField: GestureDetector(
                        onTap: () => showEmploymentTypeOptions(context),
                        child: AbsorbPointer(
                          child: TextFormField(
                            readOnly: true,
                            controller: controller.employmentController,
                            validator: (value) =>
                                controller.filedValidation(value),
                            onChanged: (value) {
                              controller.updateSaveButtonEX();
                              controller.update(['update-experienceInfo']);
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
                    experienceInfoFiled(
                      text: primarytxt3('Company name', 9.5.sp),
                      textField: TextFormField(
                        controller: controller.companyController,
                        validator: (value) => controller.filedValidation(value),
                        onChanged: (value) {
                          controller.updateSaveButtonEX();
                          controller.update(['update-experienceInfo']);
                        },
                        decoration:
                            infoFieldDecoration(hintText: 'Ex: Microsoft'),
                        maxLength: 100,
                        style: const TextStyle(fontSize: 13),
                      ),
                    ),
                    experienceInfoFiled(
                      text: primarytxt3('Location', 9.5.sp),
                      textField: TextFormField(
                        controller: controller.locationController,
                        validator: (value) => controller.filedValidation(value),
                        onChanged: (value) {
                          controller.updateSaveButtonEX();
                          controller.update(['update-experienceInfo']);
                        },
                        decoration: infoFieldDecoration(
                            hintText: 'Ex: London, United Kingdom'),
                        maxLength: 100,
                        style: const TextStyle(fontSize: 13),
                      ),
                    ),
                    experienceInfoFiled(
                      text: primarytxt3('Location type', 9.5.sp),
                      textField: GestureDetector(
                        onTap: () => showLocationTypeOptions(context),
                        child: AbsorbPointer(
                          child: TextFormField(
                            readOnly: true,
                            controller: controller.locationTypeController,
                            validator: (value) =>
                                controller.filedValidation(value),
                            onChanged: (value) {
                              controller.updateSaveButtonEX();
                              controller.update(['update-experienceInfo']);
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
                    const Align(
                      alignment: Alignment.bottomLeft,
                      child: Text(
                        "Pick a location type (ex: remote)",
                        style: TextStyle(fontSize: 8),
                      ),
                    ),
                    hBox,
                    GetBuilder<ProfileExperienceController>(
                        id: 'EX-currentlyworkingButton',
                        builder: (c) {
                          return GestureDetector(
                            onTap: () => c.toggleCurrentlyWorking(),
                            child: currentlyWorking(
                                working: c.currentlyWorking.value),
                          );
                        }),
                    experienceInfoFiled(
                      text: primarytxt3('Start date', 9.5.sp),
                      textField: TextFormField(
                        readOnly: true,
                        controller: controller.startDateController,
                        validator: (value) => controller.filedValidation(value),
                        decoration: infoFieldDecoration(
                          hintText: 'Date',
                          suffixWidget: GestureDetector(
                            onTap: () =>
                                controller.datePicker(context, start: true),
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
                    Obx(
                      () => Visibility(
                        visible: controller.currentlyWorking.value == false
                            ? true
                            : false,
                        child: experienceInfoFiled(
                          text: primarytxt3('End date (or expected)', 9.5.sp),
                          textField: TextFormField(
                            controller: controller.endDateController,
                            validator: (value) =>
                                controller.filedValidation(value),
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
                              ),
                            ),
                            style: const TextStyle(fontSize: 13, height: 1.7),
                          ),
                        ),
                      ),
                    ),
                    experienceInfoFiled(
                      text: primarytxt3('Description', 9.5.sp),
                      textField: TextFormField(
                        controller: controller.descriptionController,
                        validator: (value) => controller.filedValidation(value),
                        onChanged: (value) {
                          controller.updateSaveButtonEX();
                          controller.update(['update-experienceInfo']);
                        },
                        decoration:
                            infoFieldDecoration(hintText: 'Enter Description'),
                        maxLength: 2000,
                        style: const TextStyle(fontSize: 13),
                      ),
                    ),
                    experienceInfoFiled(
                      text: primarytxt3('Profile headline', 9.5.sp),
                      textField: TextFormField(
                        controller: controller.profileController,
                        validator: (value) => controller.filedValidation(value),
                        onChanged: (value) {
                          controller.updateSaveButtonEX();
                          controller.update(['update-experienceInfo']);
                        },
                        decoration: infoFieldDecoration(
                            hintText: 'Ex: Senior Manager at Microsoft'),
                        style: const TextStyle(fontSize: 13),
                      ),
                    ),
                    const Align(
                      alignment: Alignment.bottomLeft,
                      child: Text(
                        "Appears below your name at the top of the profile",
                        style: TextStyle(fontSize: 8),
                      ),
                    ),
                    experienceAdditional(
                      heading: 'Skills',
                      subText:
                          'We recommend adding your top 5 used in this experience. They’ll also appear in your Skills section.',
                      onTap: () => Get.to(() => AddExperienceSkillScreen(
                            uId: uId,
                            ex: experience,
                          )),
                      selected: Obx(
                        () => controller.addedSkillEX.isEmpty
                            ? shrinked
                            : Column(
                                children: List.generate(
                                    controller.addedSkillEX.length, (index) {
                                  final data = controller.addedSkillEX;
                                  return addedskillHomeEX(
                                    data[index],
                                    onTap: () => data.removeAt(index),
                                  );
                                }),
                              ),
                      ),
                    ),
                    experienceAdditional(
                      heading: 'Media',
                      subText:
                          'Add Documents, photos, sites, videos, and presentations.',
                      secSub: 'Learn more about media file types supported',
                      onTap: () =>
                          showMediaOptions(context, controller, experience),
                      selected: Obx(() => controller.allMediasEX.isEmpty
                          ? const SizedBox.shrink()
                          : Column(
                              children: List.generate(
                                  controller.allMediasEX.length, (index) {
                                final data = controller.allMediasEX;
                                return addedMediaHomeEX(
                                    file: data[index].file!,
                                    onTapClose: () {
                                      data.removeAt(index);
                                      controller
                                          .update(['update-experienceInfo']);
                                    },
                                    mediaTitle: data[index].title,
                                    mediaDescription: data[index].description);
                              }),
                            )),
                    ),
                    hMBox,
                    GetBuilder<ProfileExperienceController>(
                      id: 'update-experienceInfo',
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
                                  List<File> imagesList = c.allMediasEX
                                      .map((item) => item.file)
                                      .where((file) => file != null)
                                      .cast<File>()
                                      .toList();
                                  List<String> mediaTitles = c.allMediasEX
                                      .map((i) => i.title)
                                      .toList();
                                  List<String> mediaDesc = c.allMediasEX
                                      .map((i) => i.description)
                                      .toList();
                                  List<String> mediaLinks = c.allMediasEX
                                      .map((i) => i.mediaLink)
                                      .cast<String>()
                                      .toList();
                                  String currently =
                                      c.currentlyWorking.value == true
                                          ? 'Yes'
                                          : 'No';
                                  experience == null
                                      ? c.saveExperienceInfoFunction(
                                          uId: uId,
                                          title: c.titleController.text,
                                          employee: c.employmentController.text,
                                          company: c.companyController.text,
                                          location: c.locationController.text,
                                          locationtype:
                                              c.locationTypeController.text,
                                          currentlyWorking: currently,
                                          startDate: c.startDateController.text,
                                          endDate: c.endDateController.text,
                                          description:
                                              c.descriptionController.text,
                                          profile: c.profileController.text,
                                          mediaTitle: mediaTitles,
                                          mediaDescription: mediaDesc,
                                          mediaLink: mediaLinks,
                                          imagesEX: imagesList,
                                          skillsEX: c.addedSkillEX,
                                        )
                                      : c.updateExperienceFunction(
                                          exID: exID.toString(),
                                          uId: uId,
                                          title: c.titleController.text,
                                          employee: c.employmentController.text,
                                          company: c.companyController.text,
                                          location: c.locationController.text,
                                          locationtype:
                                              c.locationTypeController.text,
                                          currentlyWorking: currently,
                                          startDate: c.startDateController.text,
                                          endDate: c.endDateController.text,
                                          description:
                                              c.descriptionController.text,
                                          profile: c.profileController.text,
                                          mediaTitle: mediaTitles,
                                          mediaDescription: mediaDesc,
                                          mediaLink: mediaLinks,
                                          imagesEX: imagesList,
                                          skillsEX: c.addedSkillEX,
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

  void showMediaOptions(BuildContext context,
      ProfileExperienceController controller, Experience? ex) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              mediaListTileEX(
                title: 'Add a Link',
                leading: Transform.rotate(
                  angle: -0.7,
                  child: const Icon(Icons.link),
                ),
                onTap: () {
                  controller.mediaLinkController.clear();
                  Get.to(() => AddExperienceLinkScreen(
                        controller: controller,
                        experience: ex,
                        uId: uId,
                      ));
                },
              ),
              mediaListTileEX(
                title: 'Upload a Photo',
                leading: SvgPicture.asset('assets/images/gallery.svg'),
                onTap: () {
                  controller.pickImageMediaEX().then((value) {
                    if (value != null) {
                      controller.mediaTitleController.clear();
                      controller.mediaDescriptionController.clear();
                      Get.to(() => AddExperienceMediaScreen(
                            image: value,
                            uId: uId,
                            controller: controller,
                            ex: ex,
                          ));
                    }
                  });
                  Navigator.pop(context);
                },
              ),
              mediaListTileEX(
                title: 'Take a Photo',
                leading: SvgPicture.asset('assets/images/camera.svg'),
                onTap: () {
                  controller.pickCameraMediaEX().then((value) {
                    if (value != null) {
                      controller.mediaTitleController.clear();
                      controller.mediaDescriptionController.clear();
                      Get.to(() => AddExperienceMediaScreen(
                            image: value,
                            uId: uId,
                            controller: controller,
                            ex: ex,
                          ));
                    }
                  });
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void showEmploymentTypeOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) => const EmploymentTypeBottomSheet(),
    );
  }

  void showLocationTypeOptions(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (context) => const LocationTypeBottomSheet());
  }
}
