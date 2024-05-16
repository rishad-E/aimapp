import 'dart:developer';
import 'dart:io';
import 'package:aimshala/controllers/profile_controller/profile_education_controller.dart';
import 'package:aimshala/models/profile_model/profile_all_data_model.dart';
import 'package:aimshala/utils/common/colors_common.dart';
import 'package:aimshala/utils/common/text_common.dart';
import 'package:aimshala/utils/widgets/widgets_common.dart';
import 'package:aimshala/view/profile/common/widgets/widgets.dart';
import 'package:aimshala/view/profile/profile_education_section/add_media_screen.dart';
import 'package:aimshala/view/profile/profile_education_section/add_skills_screen.dart';
import 'package:aimshala/view/profile/profile_education_section/widgets/widgets.dart';
import 'package:aimshala/view/profile/profile_home/profile_home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class AddEducationScreen extends StatelessWidget {
  final String uId;
  final Education? edu;
  AddEducationScreen({super.key, required this.uId, this.edu});
  final GlobalKey<FormState> formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProfileEducationController());
    String? eduID;
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      controller.schoolController.text =
          edu?.school.toString() ?? controller.schoolController.text;
      controller.degreeController.text =
          edu?.degree.toString() ?? controller.degreeController.text;
      controller.studyFiledController.text =
          edu?.studyField.toString() ?? controller.studyFiledController.text;
      controller.startdateController.text =
          edu?.startDate.toString() ?? controller.startdateController.text;
      controller.endDateController.text =
          edu?.endDate.toString() ?? controller.endDateController.text;
      controller.gradeController.text =
          edu?.grade.toString() ?? controller.gradeController.text;
      controller.activitiesController.text =
          edu?.activities.toString() ?? controller.activitiesController.text;
      controller.descriptionController.text =
          edu?.description.toString() ?? controller.descriptionController.text;
      eduID = edu?.id.toString();
      // List<String>? resList = edu?.skills?.split(',');
      // if (resList != null) {
      //   for (String skill in resList) {
      //     if (!controller.addedSkill.contains(skill)) {
      //       controller.addedSkill.addAll(resList);
      //     }
      //   }
      // }
    });
    return PopScope(
      onPopInvoked: (didPop) =>
          Future.microtask(() => Get.off(() => const ProfileHomeScreen())),
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
                        log("add skill on tap");
                        Get.to(
                            () => AddProfileSkillsScreen(uId: uId, edu: edu));
                      },
                      heading: 'Skills',
                      subText:
                          'We recommend adding your top 5 used in this experience. They’ll also appear in your Skills section.',
                      selected: Obx(() {
                        return controller.addedSkill.isEmpty
                            ? const SizedBox.shrink()
                            : Column(
                                children: List.generate(
                                    controller.addedSkill.length, (index) {
                                  final data = controller.addedSkill;
                                  return addedskillHome(data[index]);
                                }),
                              );
                      }),
                    ),
                    educationAdditional(
                      onTap: () {
                        log("add Media on tap");
                        showMediaOptions(context, controller);
                      },
                      heading: 'Media',
                      subText:
                          'Add Documents, photos, sites, videos, and presentations.',
                      secSub: 'Learn more about media file types supported',
                      selected: Obx(() {
                        final data = controller.allMedias;
                        return data.isEmpty
                            ? const SizedBox.shrink()
                            : Column(
                                children: List.generate(data.length, (index) {
                                  return addedMediaHome(
                                    file: data[index]!,
                                    mediaTitle:
                                        controller.mediaTitleController.text,
                                    mediaDescription: controller
                                        .mediaDescriptionController.text,
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
                                    // log('school: ${c.schoolController.text} degree:${c.degreeController.text} studyfiled: ${c.studyFiledController.text} start: ${c.startdateController.text} end: ${c.endDateController.text} grade: ${c.gradeController.text} activities: ${c.activitiesController.text} description: ${c.descriptionController.text} skills:${c.addedSkill} media:${c.allMedias}',
                                    //     name: 'add-education');
                                    log("edID=>${edu?.id}  media tile:=>${c.mediaTitleController.text} media desc:=>${c.mediaDescriptionController.text}");
                                    List<File> imagesList = c.allMedias
                                        .where((file) => file != null)
                                        .cast<File>()
                                        .toList();
                                    edu == null
                                        ? c.saveEducationInfo(
                                            uId: uId,
                                            school: c.schoolController.text,
                                            degree: c.degreeController.text,
                                            studyfield:
                                                c.studyFiledController.text,
                                            startDate:
                                                c.startdateController.text,
                                            endDate: c.endDateController.text,
                                            grade: c.gradeController.text,
                                            activities:
                                                c.activitiesController.text,
                                            description:
                                                c.descriptionController.text,
                                            mediaTitle:
                                                c.mediaTitleController.text,
                                            mediaDescription: c
                                                .mediaDescriptionController
                                                .text,
                                            images: imagesList,
                                            skills: c.addedSkill)
                                        : c.updateEducationInfo(
                                            edID: eduID.toString(),
                                            uId: uId,
                                            school: c.schoolController.text,
                                            degree: c.degreeController.text,
                                            studyfield:
                                                c.studyFiledController.text,
                                            startDate:
                                                c.startdateController.text,
                                            endDate: c.endDateController.text,
                                            grade: c.gradeController.text,
                                            activities:
                                                c.activitiesController.text,
                                            description:
                                                c.descriptionController.text,
                                            mediaTitle:
                                                c.mediaTitleController.text,
                                            mediaDescription: c
                                                .mediaDescriptionController
                                                .text,
                                            images: imagesList,
                                            skills: c.addedSkill);
                                  }
                                },
                              ),
                            ],
                          );
                        }),
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
      BuildContext context, ProfileEducationController controller) {
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
                onTap: () {},
              ),
              mediaListTile(
                title: 'Upload a Photo',
                leading: SvgPicture.asset('assets/images/gallery.svg'),
                onTap: () {
                  controller.pickImageMedia().then((value) {
                    return Get.to(
                      () => AddProfileMediaScreen(
                          image: value,
                          uId: uId,
                          controller: controller,
                          edu: edu),
                    );
                  });
                },
              ),
              mediaListTile(
                title: 'Take a Photo',
                leading: SvgPicture.asset('assets/images/camera.svg'),
                onTap: () {
                  controller.pickCameraMedia().then((value) {
                    return Get.to(() => AddProfileMediaScreen(
                        image: value,
                        uId: uId,
                        controller: controller,
                        edu: edu));
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
