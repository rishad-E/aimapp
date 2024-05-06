import 'dart:io';
import 'package:aimshala/controllers/profile_controller/profile_experience_controller.dart';
import 'package:aimshala/utils/common/colors_common.dart';
import 'package:aimshala/utils/common/text_common.dart';
import 'package:aimshala/utils/widgets/widgets_common.dart';
import 'package:aimshala/view/profile/common/widgets/widgets.dart';
import 'package:aimshala/view/profile/profile_experience_section/add_media_screen.dart';
import 'package:aimshala/view/profile/profile_experience_section/add_skill_screen.dart';
import 'package:aimshala/view/profile/profile_experience_section/widgets/widgets.dart';
import 'package:aimshala/view/profile/profile_home/profile_home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class AddExperienceScreen extends StatelessWidget {
  final String uId;
  AddExperienceScreen({super.key, required this.uId});
  final GlobalKey<FormState> formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProfileExperienceController());
    return PopScope(
      onPopInvoked: (didPop) =>
          Future.microtask(() => Get.off(() => const ProfileHomeScreen())),
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
                    profileRichText('Add$uId', 'Experience'),
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
                      textField: TextFormField(
                        controller: controller.employmentController,
                        validator: (value) => controller.filedValidation(value),
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
                      textField: TextFormField(
                        controller: controller.locationTypeController,
                        validator: (value) => controller.filedValidation(value),
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
                    const Align(
                      alignment: Alignment.bottomLeft,
                      child: Text(
                        "Pick a location type (ex: remote)",
                        style: TextStyle(fontSize: 8),
                      ),
                    ),
                    hBox,
                    currentlyWorking(),
                    experienceInfoFiled(
                      text: primarytxt3('Start date', 9.5.sp),
                      textField: TextFormField(
                        readOnly: true,
                        controller: controller.startDateController,
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
                    experienceInfoFiled(
                      text: primarytxt3('End date (or expected)', 9.5.sp),
                      textField: TextFormField(
                        controller: controller.endDateController,
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
                          )),
                      selected: Obx(
                        () => controller.addedSkillEX.isEmpty
                            ? shrinked
                            : Column(
                                children: List.generate(
                                    controller.addedSkillEX.length, (index) {
                                  final data = controller.addedSkillEX;
                                  return addedskillHomeEX(data[index]);
                                }),
                              ),
                      ),
                    ),
                    experienceAdditional(
                      heading: 'Media',
                      subText:
                          'Add Documents, photos, sites, videos, and presentations.',
                      secSub: 'Learn more about media file types supported',
                      onTap: () => showMediaOptions(context, controller),
                      selected: Obx(() => controller.allMediasEX.isEmpty
                          ? const SizedBox.shrink()
                          : Column(
                              children: List.generate(
                                  controller.allMediasEX.length, (index) {
                                final data = controller.allMediasEX;
                                return addedMediaHomeEX(data[index]!, () {
                                  data.removeAt(index);
                                  // controller.updateSaveButtonEX();
                                  controller.update(['update-experienceInfo']);
                                });
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
                                  // log('title:${c.titleController.text}=> employee:${c.employmentController.text}=> company:${c.companyController.text}=> location:${c.locationController.text}=> locationtype:${c.locationTypeController.text}=> startDate:${c.startDateController.text}=> endDate:${c.endDateController.text}=> description:${c.descriptionController.text}=> profile:${c.profileController.text}=> skill:${c.addedSkillEX}=> media:${c.allMediasEX}',
                                  //     name: 'add-EX screen');
                                  List<File> imagesList = c.allMediasEX
                                      .where((file) => file != null)
                                      .cast<File>()
                                      .toList();
                                      c.saveExperienceInfoFunction(uId: uId, title: c.titleController.text, employee: c.employmentController.text, company: c.companyController.text, location: c.locationController.text, locationtype: c.locationTypeController.text, startDate: c.startDateController.text, endDate: c.endDateController.text, description: c.descriptionController.text, profile: c.profileController.text, imagesEX: imagesList, skillsEX: c.addedSkillEX);
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

  void showMediaOptions(
      BuildContext context, ProfileExperienceController controller) {
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
                onTap: () {},
              ),
              mediaListTileEX(
                title: 'Upload a Photo',
                leading: SvgPicture.asset('assets/images/gallery.svg'),
                onTap: () {
                  controller.pickImageMediaEX().then((value) {
                    return Get.to(
                        () => AddExperienceMediaScreen(image: value, uId: uId));
                  });
                  Navigator.pop(context);
                },
              ),
              mediaListTileEX(
                title: 'Take a Photo',
                leading: SvgPicture.asset('assets/images/camera.svg'),
                onTap: () {
                  controller.pickCameraMediaEX().then((value) {
                    return Get.to(
                        () => AddExperienceMediaScreen(image: value, uId: uId));
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
}
