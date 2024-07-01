import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:aimshala/controllers/profile_controller/profile_volunteer_controller.dart';
import 'package:aimshala/models/profile_model/add_media_model.dart';
import 'package:aimshala/models/profile_model/profile_section_data_model.dart';
import 'package:aimshala/utils/common/widgets/colors_common.dart';
import 'package:aimshala/utils/common/widgets/text_common.dart';
import 'package:aimshala/utils/widgets/widgets_common.dart';
import 'package:aimshala/view/profile/common/widgets/widgets.dart';
import 'package:aimshala/view/profile/profile_home/profile_home.dart';
import 'package:aimshala/view/profile/profile_volunteer_section/volunteer_link_screen.dart';
import 'package:aimshala/view/profile/profile_volunteer_section/volunteer_media_screen.dart';
import 'package:aimshala/view/profile/profile_volunteer_section/widgets/role_bottomsheet.dart';
import 'package:aimshala/view/profile/profile_volunteer_section/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';

class ProfileAddVolunteerExperienceScreen extends StatelessWidget {
  final String uId;
  final VolunteerExperience? volunteer;
  ProfileAddVolunteerExperienceScreen(
      {super.key, required this.uId, this.volunteer});
  final GlobalKey<FormState> formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    String? vtID;
    final controller = Get.put(ProfileVolunteerController());
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      vtID = volunteer?.id.toString();
      initializeFormFields(controller, volunteer);
    });
    return PopScope(
      onPopInvoked: (didPop) =>
          Future.microtask(() => Get.off(() => ProfileHomeScreen(id: uId))),
      child: Scaffold(
        appBar: profileAppBar(
            title: 'Add volunteer experience', doneWidget: shrinked),
        body: Container(
          decoration: profileMainContainer(),
          child: Center(
            child: Container(
              decoration: profileSecondaryContainer(),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
              margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
              child: SingleChildScrollView(
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      profileRichText('Add', 'volunteer experience'),
                      hLBox,
                      volunteerInfoFiled(
                        text: primarytxt3('Organization', 9.5.sp),
                        textField: TextFormField(
                          controller: controller.organizationController,
                          validator: (value) =>
                              controller.fieldValidation(value),
                          onChanged: (value) {
                            controller.allFieldSelected();
                            controller.update(['update-volunteerInfo']);
                          },
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          decoration: infoFieldDecoration(
                            hintText: 'Ex: Red Cross',
                          ),
                          style: const TextStyle(fontSize: 13),
                        ),
                      ),
                      volunteerInfoFiled(
                        text: primarytxt3('Role', 9.5.sp),
                        textField: GestureDetector(
                          onTap: () => showRoleOptions(context),
                          child: AbsorbPointer(
                            child: TextFormField(
                              readOnly: true,
                              controller: controller.volunteerRoleController,
                              validator: (value) =>
                                  controller.fieldValidation(value),
                              onChanged: (value) {
                                controller.allFieldSelected();
                                controller.update(['update-volunteerInfo']);
                              },
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              decoration: infoFieldDecoration(
                                  hintText: 'Ex: Fundraising Volunteer',
                                  suffixWidget:
                                      const Icon(Icons.keyboard_arrow_down)),
                              style: const TextStyle(fontSize: 13),
                            ),
                          ),
                        ),
                      ),
                      volunteerInfoFiled(
                        text: primarytxt3('Cause', 9.5.sp),
                        textField: TextFormField(
                          controller: controller.causeController,
                          validator: (value) =>
                              controller.fieldValidation(value),
                          onChanged: (value) {
                            controller.allFieldSelected();
                            controller.update(['update-volunteerInfo']);
                          },
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          decoration: infoFieldDecoration(
                            hintText: 'Ex: Microsoft',
                            // suffixWidget:
                            //     const Icon(Icons.keyboard_arrow_down)
                          ),
                          style: const TextStyle(fontSize: 13),
                        ),
                      ),
                      hBox,
                      GetBuilder<ProfileVolunteerController>(
                          id: 'currentlyWorking-volunteer',
                          builder: (c) {
                            return GestureDetector(
                              onTap: () => c.toggleCurrentlyWorking(),
                              child: currentlyWorkingVolunteer(
                                  working: c.currentlyWorking.value),
                            );
                          }),
                      volunteerInfoFiled(
                        text: primarytxt3('Start date', 9.5.sp),
                        textField: TextFormField(
                          controller: controller.startdateController,
                          validator: (value) =>
                              controller.fieldValidation(value),
                          onChanged: (value) {
                            controller.allFieldSelected();
                            controller.update(['update-volunteerInfo']);
                          },
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          readOnly: true,
                          decoration: infoFieldDecoration(
                              hintText: 'Date',
                              suffixWidget: GestureDetector(
                                onTap: () =>
                                    controller.datePicker(context, start: true),
                                child: calendarIcon(),
                              )),
                          style: const TextStyle(fontSize: 13),
                        ),
                      ),
                      Obx(
                        () => Visibility(
                          visible: controller.currentlyWorking.value == false
                              ? true
                              : false,
                          child: volunteerInfoFiled(
                            text: primarytxt3('End date (or expected)', 9.5.sp),
                            textField: TextFormField(
                              controller: controller.endDateController,
                              validator: (value) =>
                                  controller.fieldValidation(value),
                              onChanged: (value) {
                                controller.allFieldSelected();
                                controller.update(['update-volunteerInfo']);
                              },
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              readOnly: true,
                              decoration: infoFieldDecoration(
                                  hintText: 'Date',
                                  suffixWidget: GestureDetector(
                                    onTap: () => controller.datePicker(context),
                                    child:calendarIcon(),
                                  )),
                              style: const TextStyle(fontSize: 13),
                            ),
                          ),
                        ),
                      ),
                      volunteerInfoFiled(
                        text: primarytxt3('Description', 9.5.sp),
                        textField: TextFormField(
                          controller: controller.descriptionController,
                          validator: (value) =>
                              controller.fieldValidation(value),
                          onChanged: (value) {
                            controller.allFieldSelected();
                            controller.update(['update-volunteerInfo']);
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
                      volunteerAdditional(
                        heading: 'Media',
                        subText:
                            'Add Documents, photos, sites, videos, and presentations.',
                        secSub: 'Learn more about media file types supported',
                        onTap: () =>
                            showMediaOptions(context, controller, volunteer),
                        selected: Obx(() {
                          final data = controller.volunteerMedia;
                          return data.isEmpty
                              ? shrinked
                              : Column(
                                  children: List.generate(data.length, (index) {
                                    String? mediaUrl;
                                    if (data[index].url != null &&
                                        volunteer?.imagePath != null) {
                                      mediaUrl =
                                          "http://154.26.130.161/elearning/${volunteer?.imagePath}/${data[index].url}";
                                    }
                                    return addedMediaHomeVolunteer(
                                        onTapClose: () => data.removeAt(index),
                                        file: data[index].file,
                                        mediaUrl: mediaUrl,
                                        mediaTitle: data[index].title,
                                        mediaDescription:
                                            data[index].description);
                                  }),
                                );
                        }),
                      ),
                      hMBox,
                      GetBuilder<ProfileVolunteerController>(
                        id: 'update-volunteerInfo',
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
                                    String currenly =
                                        c.currentlyWorking.value == true
                                            ? "Yes"
                                            : "No";
                                    List<File> images = c.volunteerMedia
                                        .map((i) => i.file)
                                        .where((file) => file != null)
                                        .cast<File>()
                                        .toList();
                                    List<String> mediaTitles = c.volunteerMedia
                                        .map((i) => i.title)
                                        .toList();
                                    List<String> mediaDesc = c.volunteerMedia
                                        .map((i) => i.description)
                                        .toList();
                                    List<String> mediaLinks = c.volunteerMedia
                                        .map((i) => i.mediaLink)
                                        .where((mediaLink) => mediaLink != null)
                                        .cast<String>()
                                        .toList();
                                    volunteer == null
                                        ? c.saveVolunteerInfoFuntion(
                                            uId: uId,
                                            organization:
                                                c.organizationController.text,
                                            volRole:
                                                c.volunteerRoleController.text,
                                            volCause: c.causeController.text,
                                            startDate:
                                                c.startdateBackend.toString(),
                                            endDate: c.enddateBackend.toString(),
                                            currentlyWorking: currenly,
                                            description:
                                                c.descriptionController.text,
                                            media: images,
                                            mediaTitle: mediaTitles,
                                            mediaDesc: mediaDesc,
                                            mediaLink: mediaLinks,
                                          )
                                        : c.updateVolunteerFunction(
                                            vtID: vtID.toString(),
                                            uId: uId,
                                            organization:
                                                c.organizationController.text,
                                            volRole:
                                                c.volunteerRoleController.text,
                                            volCause: c.causeController.text,
                                            startDate:
                                                c.startdateBackend.toString(),
                                            endDate: c.enddateBackend.toString(),
                                            currentlyWorking: currenly,
                                            description:
                                                c.descriptionController.text,
                                            media: images,
                                            mediaTitle: mediaTitles,
                                            mediaDesc: mediaDesc,
                                            mediaLink: mediaLinks,
                                          );
                                  }
                                },
                              ),
                            ],
                          );
                        },
                      ),
                      hBox,
                      volunteer == null
                          ? shrinked
                          : deleteSectionWidget(
                              onPressed: () =>
                                  controller.deleteVolunteerFunction(
                                      vtID: vtID.toString(), uId: uId),
                              section: 'Volunteer',
                            )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void showRoleOptions(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (context) => const RoleBottomSheetVolunteer());
  }

  void showMediaOptions(BuildContext context,
      ProfileVolunteerController controller, VolunteerExperience? volunteer) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              mediaListTileVol(
                title: 'Add a Link',
                leading: Transform.rotate(
                  angle: -0.7,
                  child: const Icon(Icons.link),
                ),
                onTap: () {
                  controller.mediaLinkController.clear();
                  Get.to(() => AddVolunteerLinkScreen(
                        uId: uId,
                        controller: controller,
                        volunteer: volunteer,
                      ));
                },
              ),
              mediaListTileVol(
                title: 'Upload a Photo',
                leading: SvgPicture.asset('assets/images/gallery.svg'),
                onTap: () {
                  controller.pickImageMediaVl().then((value) {
                    if (value != null) {
                      controller.mediaTitleController.clear();
                      controller.mediaDescriptionController.clear();
                      Get.to(() => VolunteerMediaScreen(
                            image: value,
                            uId: uId,
                            controller: controller,
                            vol: volunteer,
                          ));
                    }
                  });
                  Navigator.pop(context);
                },
              ),
              mediaListTileVol(
                title: 'Take a Photo',
                leading: SvgPicture.asset('assets/images/camera.svg'),
                onTap: () {
                  controller.pickCameraMediaVl().then((value) {
                    if (value != null) {
                      controller.mediaTitleController.clear();
                      controller.mediaDescriptionController.clear();
                      Get.to(() => VolunteerMediaScreen(
                            image: value,
                            uId: uId,
                            controller: controller,
                            vol: volunteer,
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

  void initializeFormFields(
      ProfileVolunteerController controller, VolunteerExperience? volunteer) {
    if (volunteer == null) return;

    controller.organizationController.text =
        controller.organizationController.text.isEmpty &&
                volunteer.organization != null
            ? volunteer.organization as String
            : controller.organizationController.text;
    controller.volunteerRoleController.text =
        controller.volunteerRoleController.text.isEmpty &&
                volunteer.role != null
            ? volunteer.role as String
            : controller.volunteerRoleController.text;
    controller.causeController.text =
        controller.causeController.text.isEmpty && volunteer.cause != null
            ? volunteer.cause as String
            : controller.causeController.text;
    controller.startdateController.text =
        controller.startdateController.text.isEmpty &&
                volunteer.startDate != null
            ? convertDateFormat(volunteer.startDate!)
            : controller.startdateController.text;
    controller.descriptionController.text =
        controller.descriptionController.text.isEmpty &&
                volunteer.description != null
            ? volunteer.description as String
            : controller.descriptionController.text;

    if (volunteer.media != null && controller.volunteerMedia.isEmpty) {
      List<AddMediaModel> mediaItems = _parseMediaItems(volunteer);
      controller.volunteerMedia.addAll(mediaItems);
    }

    if (volunteer.endDate == 'currently_working') {
      controller.currentlyWorking.value = true;
    } else {
      controller.endDateController.text =
          controller.endDateController.text.isEmpty && volunteer.endDate != null
              ? convertDateFormat(volunteer.endDate!)
              : controller.endDateController.text;
    }

    controller.allFieldSelected();
    controller.update(['update-volunteerInfo']);
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

  List<AddMediaModel> _parseMediaItems(VolunteerExperience volunteer) {
    List<String> mediaList = [];
    if (volunteer.media != null && volunteer.media!.isNotEmpty) {
      try {
        mediaList = List<String>.from(jsonDecode(volunteer.media!));
      } catch (e) {
        log('Error decoding media: $e');
      }
    }
    // List<String> mediaList = List<String>.from(jsonDecode(volunteer.media!));
    List<String> mediaTitles = volunteer.mediaTitle?.split(',') ?? [];
    List<String> mediaDescriptions =
        volunteer.mediaDescription?.split(',') ?? [];
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
