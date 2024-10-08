import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:aimshala/controllers/profile_controller/profile_education_controller.dart';
import 'package:aimshala/models/profile_model/add_media_model.dart';
import 'package:aimshala/models/profile_model/profile_section_data_model.dart';
import 'package:aimshala/utils/common/widgets/colors_common.dart';
import 'package:aimshala/utils/common/widgets/text_common.dart';
import 'package:aimshala/utils/widgets/widgets_common.dart';
import 'package:aimshala/view/profile/common/widgets/widgets.dart';
import 'package:aimshala/view/profile/profile_education_section/add_link_screen.dart';
import 'package:aimshala/view/profile/profile_education_section/add_media_screen.dart';
import 'package:aimshala/view/profile/profile_education_section/add_skills_screen.dart';
import 'package:aimshala/view/profile/profile_education_section/widgets/widgets.dart';
import 'package:aimshala/view/profile/profile_home/profile_home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';

class AddEducationScreen extends StatelessWidget {
  // final String uId;
  final Education? edu;
  AddEducationScreen({super.key, this.edu});
  final GlobalKey<FormState> formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProfileEducationController());
    String? eduID;
    // log(edu.toString(), name: 'educational data');
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      eduID = edu?.id.toString();
      initializeFormFields(controller, edu);
    });
    return PopScope(
      onPopInvoked: (didPop) => Future.microtask(
          () => Get.off(() => const ProfileHomeScreen())),
      child: Scaffold(
        appBar: profileAppBar(title: 'Add Education', doneWidget: shrinked),
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
                    profileRichText('Add', 'Education'),
                    hBox,
                    Text(
                      "Tell us about your Education",
                      style: TextStyle(fontSize: 14, color: textFieldColor),
                    ),
                    hLBox,
                    educationInfoFiled(
                      text: primarytxt3('School', 9.5.sp),
                      textField: TextFormField(
                        controller: controller.schoolController,
                        validator: (value) => controller.filedValidation(value),
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        onChanged: (value) {
                          controller.updateSaveButton();
                          controller.update(['update-educationInfo']);
                        },
                        decoration: infoFieldDecoration(
                          hintText: 'Ex: Boston University',
                        ),
                        maxLength: 150,
                        style: const TextStyle(fontSize: 13),
                      ),
                    ),
                    educationInfoFiled(
                      text: primarytxt3('Degree', 9.5.sp),
                      textField: TextFormField(
                        controller: controller.degreeController,
                        validator: (value) => controller.filedValidation(value),
                        onChanged: (value) {
                          controller.updateSaveButton();
                          controller.update(['update-educationInfo']);
                        },
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        decoration:
                            infoFieldDecoration(hintText: 'Ex: Bachelor’s'),
                        maxLength: 150,
                        style: const TextStyle(fontSize: 13),
                      ),
                    ),
                    educationInfoFiled(
                      text: primarytxt3('Field of study', 9.5.sp),
                      textField: TextFormField(
                        controller: controller.studyFiledController,
                        validator: (value) => controller.filedValidation(value),
                        onChanged: (value) {
                          controller.updateSaveButton();
                          controller.update(['update-educationInfo']);
                        },
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        decoration:
                            infoFieldDecoration(hintText: 'Ex: Business'),
                        maxLength: 150,
                        style: const TextStyle(fontSize: 13),
                      ),
                    ),
                    educationInfoFiled(
                      text: primarytxt3('Start date', 9.5.sp),
                      textField: TextFormField(
                        readOnly: true,
                        controller: controller.startdateController,
                        validator: (value) => controller.filedValidation(value),
                        autovalidateMode: AutovalidateMode.onUserInteraction,
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
                    educationInfoFiled(
                      text: primarytxt3('End date (or expected)', 9.5.sp),
                      textField: TextFormField(
                        controller: controller.endDateController,
                        validator: (value) => controller.filedValidation(value),
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        readOnly: true,
                        decoration: infoFieldDecoration(
                          hintText: 'Date',
                          suffixWidget: GestureDetector(
                            onTap: () => controller.datePicker(context),
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
                    educationInfoFiled(
                      text: primarytxt3('Grade', 9.5.sp),
                      textField: TextFormField(
                        controller: controller.gradeController,
                        validator: (value) => controller.filedValidation(value),
                        onChanged: (value) {
                          controller.updateSaveButton();
                          controller.update(['update-educationInfo']);
                        },
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        decoration:
                            infoFieldDecoration(hintText: 'Enter Grade'),
                        maxLength: 80,
                        style: const TextStyle(fontSize: 13),
                      ),
                    ),
                    educationInfoFiled(
                      text: primarytxt3('Activities and societies', 9.5.sp),
                      textField: TextFormField(
                        controller: controller.activitiesController,
                        validator: (value) => controller.filedValidation(value),
                        onChanged: (value) {
                          controller.updateSaveButton();
                          controller.update(['update-educationInfo']);
                        },
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        decoration: infoFieldDecoration(
                            hintText: 'Enter Activities and societies'),
                        maxLength: 500,
                        style: const TextStyle(fontSize: 13),
                      ),
                    ),
                    educationInfoFiled(
                      text: primarytxt3('Description', 9.5.sp),
                      textField: TextFormField(
                        controller: controller.descriptionController,
                        validator: (value) => controller.filedValidation(value),
                        onChanged: (value) {
                          controller.updateSaveButton();
                          controller.update(['update-educationInfo']);
                        },
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        decoration:
                            infoFieldDecoration(hintText: 'Enter Description'),
                        maxLength: 1000,
                        minLines: 3,
                        maxLines: null,
                        style: const TextStyle(fontSize: 13),
                      ),
                    ),
                    educationAdditional(
                      onTap: () {
                        controller.getSuggestedSkills();
                        Get.to(
                          () => AddProfileSkillsScreen(edu: edu),
                        );
                      },
                      heading: 'Skills',
                      subText:
                          'We recommend adding your top 5 used in this experience. They’ll also appear in your Skills section.',
                      selected: Obx(() {
                        final data = controller.addedSkill;
                        return data.isEmpty
                            ? shrinked
                            : Column(
                                children: List.generate(data.length, (index) {
                                  return addedskillHome(
                                    data[index],
                                    onTap: () => data.removeAt(index),
                                  );
                                }),
                              );
                      }),
                    ),
                    educationAdditional(
                      onTap: () => showMediaOptions(context, controller, edu),
                      heading: 'Media',
                      subText:
                          'Add Documents, photos, sites, videos, and presentations.',
                      secSub: 'Learn more about media file types supported',
                      selected: Obx(() {
                        final data = controller.allMediasModel;
                        log('${edu?.imagePath}', name: 'edu-imagepath');
                        return data.isEmpty
                            ? shrinked
                            : Column(
                                children: List.generate(data.length, (index) {
                                  String? mediaUrl;
                                  if (data[index].url != null &&
                                      edu?.imagePath != null) {
                                    mediaUrl =
                                        "http://154.26.130.161/elearning/${edu?.imagePath}/${data[index].url}";
                                  }
                                  return addedMediaHome(
                                    file: data[index].file,
                                    mediaUrl: mediaUrl,
                                    mediaTitle: data[index].title,
                                    mediaDescription: data[index].description,
                                    onTapClose: () {
                                      data.removeAt(index);
                                      controller.updateSaveButton();
                                    },
                                  );
                                }),
                              );
                      }),
                    ),
                    hMBox,
                    GetBuilder<ProfileEducationController>(
                        id: 'update-educationInfo',
                        builder: (c) {
                          return Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              saveContainer(
                                boxColor: kwhite,
                                borderColor: mainPurple,
                                child: saveContainerText(
                                    text: 'Cancel', textColor: mainPurple),
                                onTap: () => Get.back(),
                              ),
                              wMBox,
                              saveContainer(
                                boxColor: c.saveBG.value,
                                child: Obx(
                                  () => c.isSaving.value
                                      ? CircularProgressIndicator(
                                          valueColor:
                                              AlwaysStoppedAnimation(kwhite),
                                          strokeWidth: 1,
                                        )
                                      : saveContainerText(
                                          text: 'Save',
                                          textColor: c.saveText.value,
                                        ),
                                ),
                                onTap: () {
                                  if (formKey.currentState!.validate()) {
                                    List<File> imagesList = c.allMediasModel
                                        .map((media) => media.file)
                                        .where((image) => image != null)
                                        .cast<File>()
                                        .toList();
                                    List<String> mediaUrl = c.allMediasModel
                                        .map((i) => i.url)
                                        .where((image) => image != null)
                                        .cast<String>()
                                        .toList();
                                    List<String> mediaTitles = c.allMediasModel
                                        .map((i) => i.title)
                                        .toList();
                                    List<String> mediaDesc = c.allMediasModel
                                        .map((i) => i.description)
                                        .toList();
                                    List<String> mediaLinks = c.allMediasModel
                                        .map((i) => i.mediaLink)
                                        .where((mediaLink) => mediaLink != null)
                                        .cast<String>()
                                        .toList();
                                    edu == null
                                        ? c.saveEducationInfo(
                                            school: c.schoolController.text,
                                            degree: c.degreeController.text,
                                            studyfield:
                                                c.studyFiledController.text,
                                            startDate:
                                                c.startdateBackend.toString(),
                                            endDate:
                                                c.enddateBackend.toString(),
                                            grade: c.gradeController.text,
                                            activities:
                                                c.activitiesController.text,
                                            description:
                                                c.descriptionController.text,
                                            mediaTitle: mediaTitles,
                                            mediaDescription: mediaDesc,
                                            mediaLinks: mediaLinks,
                                            images: imagesList,
                                            skills: c.addedSkill,
                                          )
                                        : c.updateEducationInfo(
                                            edID: eduID.toString(),
                                            school: c.schoolController.text,
                                            degree: c.degreeController.text,
                                            studyfield:
                                                c.studyFiledController.text,
                                            startDate:
                                                c.startdateBackend.toString(),
                                            endDate:
                                                c.enddateBackend.toString(),
                                            grade: c.gradeController.text,
                                            activities:
                                                c.activitiesController.text,
                                            description:
                                                c.descriptionController.text,
                                            mediaTitle: mediaTitles,
                                            mediaDescription: mediaDesc,
                                            mediaLinks: mediaLinks,
                                            images: imagesList,
                                            skills: c.addedSkill,
                                            mediaUrl: mediaUrl);
                                  }
                                },
                              )
                            ],
                          );
                        }),
                    hMBox,
                    edu == null
                        ? shrinked
                        : deleteSectionWidget(
                            onPressed: () => controller.deleteEducationFunction(
                              school: controller.schoolController.text,
                              eduID: eduID.toString(),
                            ),
                            section: 'Education',
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

  void initializeFormFields(ProfileEducationController c, Education? edu) {
    if (edu == null) return;

    c.schoolController.text =
        c.schoolController.text.isEmpty && edu.school != null
            ? edu.school as String
            : c.schoolController.text;
    c.degreeController.text =
        c.degreeController.text.isEmpty && edu.degree != null
            ? edu.degree as String
            : c.degreeController.text;
    c.studyFiledController.text =
        c.studyFiledController.text.isEmpty && edu.studyField != null
            ? edu.studyField as String
            : c.studyFiledController.text;
    c.startdateController.text =
        c.startdateController.text.isEmpty && edu.startDate != null
            ? convertDateFormat(edu.startDate!)
            : c.startdateController.text;
    c.endDateController.text =
        c.endDateController.text.isEmpty && edu.endDate != null
            ? convertDateFormat(edu.endDate!)
            : c.endDateController.text;
    c.gradeController.text = c.gradeController.text.isEmpty && edu.grade != null
        ? edu.grade as String
        : c.gradeController.text;
    c.activitiesController.text =
        c.activitiesController.text.isEmpty && edu.activities != null
            ? edu.activities as String
            : c.activitiesController.text;
    c.descriptionController.text =
        c.descriptionController.text.isEmpty && edu.description != null
            ? edu.description as String
            : c.descriptionController.text;
    c.startdateBackend = edu.startDate!;
    c.enddateBackend = edu.endDate!;
    if (c.addedSkill.isEmpty && edu.skills != null && edu.skills != "") {
      List<String>? resList = edu.skills?.split(',');
      if (resList != null) {
        for (String skill in resList) {
          if (!c.addedSkill.contains(skill)) {
            c.addedSkill.add(skill);
          }
        }
      }
    }
    if (c.allMediasModel.isEmpty && edu.media != null) {
      List<AddMediaModel> mediaList = parseMediaItems(edu);
      c.allMediasModel.addAll(mediaList);
    }
    c.updateSaveButton();
    c.update(['update-educationInfo']);
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

  List<AddMediaModel> parseMediaItems(Education edu) {
    List<String> mediaList = [];
    if (edu.media != null && edu.media!.isNotEmpty) {
      try {
        mediaList = List<String>.from(jsonDecode(edu.media!));
      } catch (e) {
        log('Error decoding media: $e');
        // Handle the error (e.g., log it, set mediaList to an empty list, etc.)
      }
    }

    List<String> mediaTitles = edu.mediaTitle?.split(',') ?? [];
    List<String> mediaDescriptions = edu.mediaDescription?.split(',') ?? [];
    List<AddMediaModel> mediaItems = [];

    for (int i = 0; i < mediaList.length; i++) {
      String filename = mediaList[i];
      log(filename);
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
      ProfileEducationController controller, Education? edu) {
    showModalBottomSheet(
      context: context,
      builder: (_) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              mediaListTile(
                title: 'Add a Link',
                leading: Transform.rotate(
                  angle: -0.7,
                  child: const Icon(Icons.link),
                ),
                onTap: () {
                  controller.mediaLinkController.clear();
                  Get.to(() => AddEducationLinkScreen(
                        controller: controller,
                        edu: edu,
                      ));
                },
              ),
              mediaListTile(
                title: 'Upload a Photo',
                leading: SvgPicture.asset('assets/images/gallery.svg'),
                onTap: () {
                  controller.pickImageMedia().then((value) {
                    if (value != null) {
                      controller.mediaTitleController.clear();
                      controller.mediaDescriptionController.clear();
                      return Get.to(() => AddProfileMediaScreen(
                          image: value, controller: controller, edu: edu));
                    }
                  });
                },
              ),
              mediaListTile(
                title: 'Take a Photo',
                leading: SvgPicture.asset('assets/images/camera.svg'),
                onTap: () {
                  controller.pickCameraMedia().then((value) {
                    if (value != null) {
                      controller.mediaTitleController.clear();
                      controller.mediaDescriptionController.clear();
                      return Get.to(() => AddProfileMediaScreen(
                          image: value, controller: controller, edu: edu));
                    }
                  });
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
