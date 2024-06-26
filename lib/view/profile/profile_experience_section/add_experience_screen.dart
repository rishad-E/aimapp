import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:aimshala/controllers/profile_controller/profile_experience_controller.dart';
import 'package:aimshala/models/profile_model/add_media_model.dart';
import 'package:aimshala/models/profile_model/profile_all_data_model.dart';
import 'package:aimshala/utils/common/widgets/colors_common.dart';
import 'package:aimshala/utils/common/widgets/text_common.dart';
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
import 'package:intl/intl.dart';
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
    // String? path;
    log(experience.toString(), name: 'experience detial');
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      exID = experience?.id.toString();
      initializeFormFields(controller, experience);
      // controller.toggleCurrentlyWorking();
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
                            child: calendarIcon(),
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
                                child: calendarIcon(),
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
                        minLines: 2,
                        maxLines: null,
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
                      onTap: () => Get.to(() =>
                          AddExperienceSkillScreen(uId: uId, ex: experience)),
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
                      selected: Obx(() {
                        final data = controller.allMediasEX;
                        return data.isEmpty
                            ? const SizedBox.shrink()
                            : Column(
                                children: List.generate(data.length, (index) {
                                  String? mediaUrl;
                                  if (data[index].url != null &&
                                      experience?.imagePath != null) {
                                    mediaUrl =
                                        "http://154.26.130.161/elearning/${experience?.imagePath}/${data[index].url}";
                                  }
                                  return addedMediaHomeEX(
                                      file: data[index].file,
                                      mediaUrl: mediaUrl,
                                      onTapClose: () {
                                        data.removeAt(index);
                                        controller
                                            .update(['update-experienceInfo']);
                                      },
                                      mediaTitle: data[index].title,
                                      mediaDescription:
                                          data[index].description);
                                }),
                              );
                      }),
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
                                  log('stardate for backend=>${c.startdateBackend} end for backend=>${c.enddateBackend}');
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
                                      .where((mediaLink) => mediaLink != null)
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
                                          startDate:
                                              c.startdateBackend.toString(),
                                          endDate: c.enddateBackend.toString(),
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
                                          startDate:
                                              c.startdateBackend.toString(),
                                          endDate: c.enddateBackend.toString(),
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
                    hMBox,
                    experience == null
                        ? shrinked
                        : deleteSectionWidget(
                            onPressed: () => controller.deleteExperienceSection(
                                exID: exID.toString(),
                                uId: uId,
                                company: controller.companyController.text),
                            section: 'Experience',
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

  void initializeFormFields(
      ProfileExperienceController c, Experience? experience) {
    if (experience == null) return;
    c.titleController.text =
        c.titleController.text.isEmpty && experience.title != null
            ? experience.title as String
            : c.titleController.text;
    c.employmentController.text =
        c.employmentController.text.isEmpty && experience.employmentType != null
            ? experience.employmentType as String
            : c.employmentController.text;
    c.companyController.text =
        c.companyController.text.isEmpty && experience.companyName != null
            ? experience.companyName as String
            : c.companyController.text;
    c.locationController.text =
        c.locationController.text.isEmpty && experience.location != null
            ? experience.location as String
            : c.locationController.text;
    c.locationTypeController.text =
        c.locationTypeController.text.isEmpty && experience.locationType != null
            ? experience.locationType as String
            : c.locationTypeController.text;
    c.startDateController.text =
        c.startDateController.text.isEmpty && experience.startDate != null
            ? convertDateFormat(experience.startDate!)
            : c.startDateController.text;

    c.descriptionController.text =
        c.descriptionController.text.isEmpty && experience.description != null
            ? experience.description as String
            : c.descriptionController.text;
    c.profileController.text =
        c.profileController.text.isEmpty && experience.profile != null
            ? experience.profile as String
            : c.profileController.text;
    c.update(['update-experienceInfo']);
    if (experience.endDate == "currently_working") {
      c.currentlyWorking.value = true;
      c.endDateController.clear();
      c.update(['EX-currentlyworkingButton']);
    } else {
      c.endDateController.text =
          c.endDateController.text.isEmpty && experience.endDate != null
              ? convertDateFormat(experience.endDate!)
              : c.endDateController.text;
    }
    if (c.addedSkillEX.isEmpty &&
        experience.skills != null &&
        experience.skills != "") {
      List<String>? resSkill = experience.skills?.split(',').toList();
      if (resSkill != null) {
        for (var i in resSkill) {
          if (!c.addedSkillEX.contains(i)) {
            c.addedSkillEX.add(i);
          }
        }
      }
    }
    if (c.allMediasEX.isEmpty && experience.media != null) {
      List<AddMediaModel> mediaList = parseMediaItems(experience);
      c.allMediasEX.addAll(mediaList);
    }
    c.updateSaveButtonEX();
    c.update(['update-experienceInfo']);
  }

  String convertDateFormat(String date) {
    try {
      DateTime parsedDate = DateFormat('yyyy-MM-dd').parse(date);
      String formattedDate = DateFormat('dd-MM-yyyy').format(parsedDate);
      return formattedDate;
    } catch (e) {
      return 'Invalid date';
    }
  }

  List<AddMediaModel> parseMediaItems(Experience experience) {
    List<String> mediaList = [];
    if (experience.media != null && experience.media!.isNotEmpty) {
      try {
        mediaList = List<String>.from(jsonDecode(experience.media!));
      } catch (e) {
        log('Error decoding media: $e');
      }
    }

    // List<String> mediaList = List<String>.from(jsonDecode(experience.media!));
    List<String> mediaTitles = experience.mediaTitle?.split(',') ?? [];
    List<String> mediaDescriptions =
        experience.mediaDescription?.split(',') ?? [];
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
                      controller: controller, experience: ex, uId: uId));
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
                          ex: ex));
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
                          ex: ex));
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
