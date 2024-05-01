import 'dart:developer';
import 'dart:io';

import 'package:aimshala/controllers/profile_controller/profile_project_controller.dart';
import 'package:aimshala/utils/common/colors_common.dart';
import 'package:aimshala/utils/common/text_common.dart';
import 'package:aimshala/utils/widgets/widgets_common.dart';
import 'package:aimshala/view/profile/common/widgets/widgets.dart';
import 'package:aimshala/view/profile/profile_home/profile_home.dart';
import 'package:aimshala/view/profile/profile_project_section/add_media.dart';
import 'package:aimshala/view/profile/profile_project_section/add_skill.dart';
import 'package:aimshala/view/profile/profile_project_section/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class ProfileAddProjectScreen extends StatelessWidget {
  final String uId;
  ProfileAddProjectScreen({super.key, required this.uId});
  final GlobalKey<FormState> formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProfileProjectController());
    return PopScope(
      onPopInvoked: (didPop) =>
          Future.microtask(() => Get.off(() => const ProfileHomeScreen())),
      child: Scaffold(
        appBar: profileAppBar(title: 'Add Project', doneWidget: shrinked),
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
                    profileRichText('Add$uId', 'Project'),
                    hBox,
                    Text(
                      "Tell us about your Project",
                      style: TextStyle(fontSize: 14, color: textFieldColor),
                    ),
                    hLBox,
                    projectInfoFiled(
                      text: primarytxt3('Project Name', 9.5.sp),
                      textField: TextFormField(
                        controller: controller.projectnameController,
                        validator: (value) => controller.filedValidation(value),
                        onChanged: (value) {
                          controller.allFiledSelected();
                          controller.update(['update-projectInfo']);
                        },
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        decoration: infoFieldDecoration(
                          hintText: 'Ex: World History',
                        ),
                        maxLength: 255,
                        style: const TextStyle(fontSize: 13),
                      ),
                    ),
                    projectInfoFiled(
                      text: primarytxt3('Description', 9.5.sp),
                      textField: TextFormField(
                        controller: controller.projectDescriptionController,
                        validator: (value) => controller.filedValidation(value),
                        onChanged: (value) {
                          controller.allFiledSelected();
                          controller.update(['update-projectInfo']);
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
                    projectAdditional(
                        onTap: () =>
                            Get.to(() => AddProjectSkillScreen(uId: uId)),
                        heading: 'Skills',
                        subText:
                            'We recommend adding your top 5 used in this experience. They’ll also appear in your Skills section.',
                        selected: Obx(() {
                          final data = controller.addedProjectSkill;
                          return data.isEmpty
                              ? shrinked
                              : Column(
                                  children: List.generate(data.length, (index) {
                                    return addedskillHomeProject(data[index]);
                                  }),
                                );
                        })),
                    projectAdditional(
                        onTap: () => showMediaOptions(context, controller),
                        heading: 'Media',
                        subText:
                            'Add Documents, photos, sites, videos, and presentations.',
                        secSub: 'Learn more about media file types supported',
                        selected: Obx(() {
                          final data = controller.allProjectMedias;
                          return data.isEmpty
                              ? shrinked
                              : Column(
                                  children: List.generate(data.length, (index) {
                                    return addedMediaHomeProject(data[index]!,
                                        () {
                                      data.removeAt(index);
                                      controller.allFiledSelected();
                                    });
                                  }),
                                );
                        })),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text("Additiional Details",
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 14)),
                    ),
                    currentlyWorkingProject(),
                    projectInfoFiled(
                      text: primarytxt3('Start date', 9.5.sp),
                      textField: TextFormField(
                        controller: controller.startdateController,
                        validator: (value) => controller.filedValidation(value),
                        onChanged: (value) {
                          controller.allFiledSelected();
                          controller.update(['update-projectInfo']);
                        },
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
                            )),
                        style: const TextStyle(fontSize: 13),
                        readOnly: true,
                      ),
                    ),
                    projectInfoFiled(
                      text: primarytxt3('End date', 9.5.sp),
                      textField: TextFormField(
                        controller: controller.endDateController,
                        validator: (value) => controller.filedValidation(value),
                        onChanged: (value) {
                          controller.allFiledSelected();
                          controller.update(['update-projectInfo']);
                        },
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        decoration: infoFieldDecoration(
                            hintText: 'Date',
                            suffixWidget: GestureDetector(
                              onTap: () => controller.datePicker(context),
                              child: SvgPicture.asset(
                                  'assets/images/calendar-booked.svg',
                                  colorFilter:
                                      ColorFilter.mode(kblack, BlendMode.srcIn),
                                  fit: BoxFit.scaleDown),
                            )),
                        style: const TextStyle(fontSize: 13),
                        readOnly: true,
                      ),
                    ),
                    projectInfoFiled(
                      text: primarytxt3('Associated with', 9.5.sp),
                      textField: TextFormField(
                        controller: controller.projectAssosiatedController,
                        validator: (value) => controller.filedValidation(value),
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        decoration: infoFieldDecoration(
                            hintText: 'Please Select',
                            suffixWidget:
                                const Icon(Icons.keyboard_arrow_down)),
                        style: const TextStyle(fontSize: 13),
                      ),
                    ),
                    hMBox,
                    GetBuilder<ProfileProjectController>(
                        id: 'update-projectInfo',
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
                                    log('uid=>$uId projectName=>${c.projectnameController.text} startdate=>${c.startdateController.text} endDate=>${c.endDateController.text} description=>${c.projectDescriptionController.text} assosiated=>${c.projectAssosiatedController.text} skills=>${c.addedProjectSkill} media=>${c.allProjectMedias}',
                                        name: 'project-screen');
                                    List<File> imagesList = c.allProjectMedias
                                        .where((file) => file != null)
                                        .cast<File>()
                                        .toList();
                                    c.saveProjectFunction(
                                        uId: uId,
                                        proName: c.projectnameController.text,
                                        startDate: c.startdateController.text,
                                        endDate: c.endDateController.text,
                                        description:
                                            c.projectDescriptionController.text,
                                        assosiated:
                                            c.projectAssosiatedController.text,
                                        skills: c.addedProjectSkill,
                                        medias: imagesList);
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
      BuildContext context, ProfileProjectController controller) {
    showModalBottomSheet(
      context: context,
      builder: (_) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              projectMediaListTile(
                title: 'Add a Link',
                leading: Transform.rotate(
                  angle: -0.7,
                  child: const Icon(Icons.link),
                ),
                onTap: () {},
              ),
              projectMediaListTile(
                title: 'Upload a Photo',
                leading: SvgPicture.asset('assets/images/gallery.svg'),
                onTap: () {
                  controller.pickImageMedia().then((value) {
                    return Get.to(
                        () => AddProjectMediaScreen(image: value, uId: uId));
                  });
                },
              ),
              projectMediaListTile(
                title: 'Take a Photo',
                leading: SvgPicture.asset('assets/images/camera.svg'),
                onTap: () {
                  controller.pickCameraMedia().then((value) {
                    return Get.to(
                        () => AddProjectMediaScreen(image: value, uId: uId));
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
