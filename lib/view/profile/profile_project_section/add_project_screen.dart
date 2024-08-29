import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:aimshala/controllers/profile_controller/profile_project_controller.dart';
import 'package:aimshala/models/profile_model/add_media_model.dart';
import 'package:aimshala/models/profile_model/profile_section_data_model.dart';
import 'package:aimshala/utils/common/widgets/colors_common.dart';
import 'package:aimshala/utils/common/widgets/text_common.dart';
import 'package:aimshala/utils/widgets/widgets_common.dart';
import 'package:aimshala/view/profile/common/widgets/widgets.dart';
import 'package:aimshala/view/profile/profile_home/profile_home.dart';
import 'package:aimshala/view/profile/profile_project_section/add_link_screen.dart';
import 'package:aimshala/view/profile/profile_project_section/add_media.dart';
import 'package:aimshala/view/profile/profile_project_section/add_skill.dart';
import 'package:aimshala/view/profile/profile_project_section/widgets/assosiated_bottosheet.dart';
import 'package:aimshala/view/profile/profile_project_section/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';

class ProfileAddProjectScreen extends StatelessWidget {
  final Project? project;
  ProfileAddProjectScreen({super.key,  this.project});
  final GlobalKey<FormState> formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProfileProjectController());
    log(project.toString(), name: 'project data');
    String? prID;
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      prID = project?.id.toString();
      initializeFormFields(controller, project);
    });
    return PopScope(
      onPopInvoked: (didPop) =>
          Future.microtask(() => Get.off(() => const ProfileHomeScreen())),
      child: Scaffold(
        appBar: profileAppBar(title: 'Add Project', doneWidget: shrinked),
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
                    profileRichText('Add', 'Project'),
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
                        onTap: () {
                          controller.getSuggestedSkills();
                          Get.to(() => AddProjectSkillScreen(project: project));
                        },
                        heading: 'Skills',
                        subText:
                            'We recommend adding your top 5 used in this experience. They’ll also appear in your Skills section.',
                        selected: Obx(() {
                          final data = controller.addedProjectSkill;
                          return data.isEmpty
                              ? shrinked
                              : Column(
                                  children: List.generate(data.length, (index) {
                                    return addedskillHomeProject(
                                      data[index],
                                      onTap: () => data.removeAt(index),
                                    );
                                  }),
                                );
                        })),
                    projectAdditional(
                        onTap: () =>
                            showMediaOptions(context, controller, project),
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
                                    String? mediaUrl;
                                    if (data[index].url != null &&
                                        project?.imagePath != null) {
                                      mediaUrl =
                                          "http://154.26.130.161/elearning/${project?.imagePath}/${data[index].url}";
                                    }
                                    return addedMediaHomeProject(
                                        file: data[index].file,
                                        mediaUrl: mediaUrl,
                                        title: data[index].title,
                                        desc: data[index].description,
                                        onTap: () {
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
                    GetBuilder<ProfileProjectController>(
                        id: 'currentlyWorking-project',
                        builder: (c) {
                          return GestureDetector(
                            onTap: () => c.toggleCurrentlyWorking(),
                            child: currentlyWorkingProject(
                                working: c.currentlyWorking.value),
                          );
                        }),
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
                                child: calendarIcon())),
                        style: const TextStyle(fontSize: 13),
                        readOnly: true,
                      ),
                    ),
                    Obx(() => Visibility(
                        visible: controller.currentlyWorking.value == false
                            ? true
                            : false,
                        child: projectInfoFiled(
                            text: primarytxt3('End date', 9.5.sp),
                            textField: TextFormField(
                              controller: controller.endDateController,
                              validator: (value) =>
                                  controller.filedValidation(value),
                              onChanged: (value) {
                                controller.allFiledSelected();
                                controller.update(['update-projectInfo']);
                              },
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              decoration: infoFieldDecoration(
                                  hintText: 'Date',
                                  suffixWidget: GestureDetector(
                                    onTap: () => controller.datePicker(context),
                                    child: calendarIcon(),
                                  )),
                              style: const TextStyle(fontSize: 13),
                              readOnly: true,
                            )))),
                    projectInfoFiled(
                      text: primarytxt3('Associated with', 9.5.sp),
                      textField: GestureDetector(
                        onTap: () => showAssosiatedWithOptions(context),
                        child: AbsorbPointer(
                          child: TextFormField(
                            readOnly: true,
                            minLines: 1,
                            maxLines: null,
                            controller: controller.projectAssosiatedController,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            decoration: infoFieldDecoration(
                                hintText: 'Please Select',
                                suffixWidget:
                                    const Icon(Icons.keyboard_arrow_down)),
                            style: const TextStyle(fontSize: 13),
                          ),
                        ),
                      ),
                    ),
                    hMBox,
                    GetBuilder<ProfileProjectController>(
                        id: 'update-projectInfo',
                        builder: (c) {
                          return Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              saveContainer(
                                boxColor: kwhite,
                                borderColor: mainPurple,
                                child: saveContainerText(
                                  text: 'Cancel',
                                  textColor: mainPurple,
                                ),
                                onTap: () => Get.back(),
                              ),
                              wMBox,
                              saveContainer(
                                boxColor: c.saveBG.value,
                                child: Obx(
                                  () => c.isSaving.value
                                      ? CircularProgressIndicator(
                                          strokeWidth: 1,
                                          color: kwhite,
                                        )
                                      : saveContainerText(
                                          text: 'Save',
                                          textColor: c.saveText.value,
                                        ),
                                ),
                                onTap: () {
                                  if (formKey.currentState!.validate()) {
                                    List<File> imagesList = c.allProjectMedias
                                        .map((i) => i.file)
                                        .where((file) => file != null)
                                        .cast<File>()
                                        .toList();
                                    List<String> mediaUrl = c.allProjectMedias
                                        .map((i) => i.url)
                                        .where((image) => image != null)
                                        .cast<String>()
                                        .toList();
                                    List<String> mediaTitles = c
                                        .allProjectMedias
                                        .map((i) => i.title)
                                        .toList();
                                    List<String> mediaDescs = c.allProjectMedias
                                        .map((i) => i.description)
                                        .toList();
                                    List<String> mediaLink = c.allProjectMedias
                                        .map((i) => i.mediaLink)
                                        .where((mediaLink) => mediaLink != null)
                                        .cast<String>()
                                        .toList();
                                    String currenly =
                                        c.currentlyWorking.value == true
                                            ? 'Yes'
                                            : 'No';
                                    project == null
                                        ? c.saveProjectFunction(
                                            proName:
                                                c.projectnameController.text,
                                            startDate:
                                                c.startdateBackend.toString(),
                                            endDate:
                                                c.enddateBackend.toString(),
                                            description: c
                                                .projectDescriptionController
                                                .text,
                                            assosiated: c
                                                .projectAssosiatedController
                                                .text,
                                            currentlyWorking: currenly,
                                            skills: c.addedProjectSkill,
                                            medias: imagesList,
                                            mediaTitle: mediaTitles,
                                            mediaDescription: mediaDescs,
                                            mediaLink: mediaLink)
                                        : c.updateProjectFunction(
                                            prID: prID,
                                            proName:
                                                c.projectnameController.text,
                                            startDate:
                                                c.startdateBackend.toString(),
                                            endDate:
                                                c.enddateBackend.toString(),
                                            description: c
                                                .projectDescriptionController
                                                .text,
                                            assosiated: c
                                                .projectAssosiatedController
                                                .text,
                                            currentlyWorking: currenly,
                                            skills: c.addedProjectSkill,
                                            medias: imagesList,
                                            mediaTitle: mediaTitles,
                                            mediaDescription: mediaDescs,
                                            mediaLink: mediaLink,
                                            mediaUrl: mediaUrl,
                                          );
                                  }
                                },
                              ),
                            ],
                          );
                        }),
                    hBox,
                    project == null
                        ? shrinked
                        : deleteSectionWidget(
                            onPressed: () => controller.deleteProjectFunction(
                                prID: prID.toString()),
                            section: 'Project')
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void showAssosiatedWithOptions(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (context) => const AssociatedBottomSheetProject());
  }

  void showMediaOptions(BuildContext context,
      ProfileProjectController controller, Project? project) {
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
                onTap: () {
                  controller.mediaLinkController.clear();
                  Get.to(() => AddProjectLinkScreen(
                        controller: controller,
                        project: project,
                      ));
                },
              ),
              projectMediaListTile(
                title: 'Upload a Photo',
                leading: SvgPicture.asset('assets/images/gallery.svg'),
                onTap: () {
                  controller.pickImageMedia().then((value) {
                    if (value != null) {
                      controller.mediaTitleController.clear();
                      controller.mediaDescriptionController.clear();
                      Get.to(() => AddProjectMediaScreen(
                          image: value,
                          controller: controller,
                          project: project));
                    }
                  });
                },
              ),
              projectMediaListTile(
                title: 'Take a Photo',
                leading: SvgPicture.asset('assets/images/camera.svg'),
                onTap: () {
                  controller.pickCameraMedia().then((value) {
                    if (value != null) {
                      controller.mediaTitleController.clear();
                      controller.mediaDescriptionController.clear();
                      return Get.to(() => AddProjectMediaScreen(
                          image: value,
                          controller: controller,
                          project: project));
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

  void initializeFormFields(ProfileProjectController c, Project? project) {
    if (project == null) {
      if (c.projectnameController.text.isEmpty) {
        c.currentlyWorking.value = false;
        c.update(['currentlyWorking-project']);
      }
      return;
    }
    c.projectnameController.text =
        c.projectnameController.text.isEmpty && project.title != null
            ? project.title as String
            : c.projectnameController.text;
    c.projectDescriptionController.text =
        c.projectDescriptionController.text.isEmpty &&
                project.description != null
            ? project.description as String
            : c.projectDescriptionController.text;
    c.startdateController.text =
        c.startdateController.text.isEmpty && project.startDate != null
            ? convertDateFormat(project.startDate!)
            : c.startdateController.text;
    c.projectAssosiatedController.text =
        c.projectAssosiatedController.text.isEmpty && project.associated != null
            ? project.associated as String
            : c.projectAssosiatedController.text;
    c.startdateBackend = project.startDate!;
    c.enddateBackend =
        project.endDate == 'currently_working' ? '' : project.endDate;

    if (project.media != null && c.allProjectMedias.isEmpty) {
      List<AddMediaModel> mediaItems = parseMediaItems(project);
      c.allProjectMedias.addAll(mediaItems);
    }
    if (c.addedProjectSkill.isEmpty &&
        project.skills != null &&
        project.skills != "") {
      List<String>? resSkill = project.skills?.split(',');
      if (resSkill != null) {
        for (var i in resSkill) {
          if (!c.addedProjectSkill.contains(i)) {
            c.addedProjectSkill.add(i);
          }
        }
      }
    }
    if (project.endDate == 'currently_working') {
      c.currentlyWorking.value = true;
      c.update(['currentlyWorking-project']);
    } else {
      c.currentlyWorking.value = false;
      c.endDateController.text =
          c.endDateController.text.isEmpty && project.endDate != null
              ? convertDateFormat(project.endDate!)
              : c.endDateController.text;
      c.update(['currentlyWorking-project']);
    }
    c.allFiledSelected();
    c.update(['update-projectInfo']);
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

  List<AddMediaModel> parseMediaItems(Project project) {
    List<String> mediaList = [];
    if (project.media != null && project.media!.isNotEmpty) {
      try {
        mediaList = List<String>.from(jsonDecode(project.media as String));
      } catch (e) {
        log('Error decoding media: $e');
      }
    }
    // List<String> mediaList =
    List<String> mediaTitles = project.mediaTitle?.split(',') ?? [];
    List<String> mediaDescriptions = project.mediaDescription?.split(',') ?? [];
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
