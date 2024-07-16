import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:aimshala/controllers/profile_controller/profile_honoraward_controller.dart';
import 'package:aimshala/models/profile_model/add_media_model.dart';
import 'package:aimshala/models/profile_model/profile_section_data_model.dart';
import 'package:aimshala/utils/common/widgets/colors_common.dart';
import 'package:aimshala/utils/common/widgets/text_common.dart';
import 'package:aimshala/utils/widgets/widgets_common.dart';
import 'package:aimshala/view/profile/common/widgets/widgets.dart';
import 'package:aimshala/view/profile/profile_home/profile_home.dart';
import 'package:aimshala/view/profile/profile_honorsawards_section/add_link_screen.dart';
import 'package:aimshala/view/profile/profile_honorsawards_section/add_media_screen.dart';
import 'package:aimshala/view/profile/profile_honorsawards_section/widgets/assosiated_bottomsheet.dart';
import 'package:aimshala/view/profile/profile_honorsawards_section/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';

class ProfileAddHonorsandAwardsScreen extends StatelessWidget {
  final String uId;
  final Award? award;
  ProfileAddHonorsandAwardsScreen({super.key, required this.uId, this.award});
  final GlobalKey<FormState> formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProfileHonorsAwardsController());
    log(award.toString(), name: 'award data');
    String? awardID;
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      initializeFormFields(controller, award);
      awardID = award?.id.toString();
    });
    return PopScope(
      onPopInvoked: (didPop) =>
          Future.microtask(() => Get.off(() => ProfileHomeScreen(id: uId))),
      child: Scaffold(
        appBar:
            profileAppBar(title: 'Add honors & awards', doneWidget: shrinked),
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
                    profileRichText('Add', 'Honors & awards'),
                    hBox,
                    Text(
                      "Tell us about your Honors & awards",
                      style: TextStyle(fontSize: 14, color: textFieldColor),
                    ),
                    hLBox,
                    honorsawardsInfoFiled(
                      text: primarytxt3('Title', 9.5.sp),
                      textField: TextFormField(
                        controller: controller.titileController,
                        validator: (value) => controller.filedValidation(value),
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        onChanged: (value) {
                          controller.allFieldSelect();
                          controller.update(['update-HonorAwardsbutton']);
                        },
                        decoration: infoFieldDecoration(
                          hintText: 'Ex: Retail Sales Manager',
                        ),
                        maxLength: 255,
                        style: const TextStyle(fontSize: 13),
                      ),
                    ),
                    honorsawardsInfoFiled(
                      text: primarytxt3('Associated with', 9.5.sp),
                      textField: GestureDetector(
                        onTap: () => showAssosiatedOptions(context),
                        child: AbsorbPointer(
                          child: TextFormField(
                            readOnly: true,
                            minLines: 1,
                            maxLines: null,
                            controller: controller.assosiatedController,
                            // validator: (value) =>
                            //     controller.filedValidation(value),
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            onChanged: (value) {
                              controller.allFieldSelect();
                              controller.update(['update-HonorAwardsbutton']);
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
                    honorsawardsInfoFiled(
                      text: primarytxt3('Issuer', 9.5.sp),
                      textField: TextFormField(
                        controller: controller.issuerController,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) => controller.filedValidation(value),
                        onChanged: (value) {
                          controller.allFieldSelect();
                          controller.update(['update-HonorAwardsbutton']);
                        },
                        decoration: infoFieldDecoration(
                          hintText: 'Ex: Microsoft',
                        ),
                        style: const TextStyle(fontSize: 13),
                      ),
                    ),
                    honorsawardsInfoFiled(
                      text: primarytxt3('Start Date', 9.5.sp),
                      textField: TextFormField(
                        controller: controller.startdateController,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) => controller.filedValidation(value),
                        readOnly: true,
                        decoration: infoFieldDecoration(
                            hintText: 'Date',
                            suffixWidget: GestureDetector(
                              onTap: () => controller.datePicker(context),
                              child: calendarIcon(),
                            )),
                        style: const TextStyle(fontSize: 13),
                      ),
                    ),
                    honorsawardsInfoFiled(
                      text: primarytxt3('Description', 9.5.sp),
                      textField: TextFormField(
                        controller: controller.descriptionController,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) => controller.filedValidation(value),
                        onChanged: (value) {
                          controller.allFieldSelect();
                          controller.update(['update-HonorAwardsbutton']);
                        },
                        decoration: infoFieldDecoration(
                          hintText: 'Enter Description',
                        ),
                        maxLength: 2000,
                        minLines: 2,
                        maxLines: null,
                        style: const TextStyle(fontSize: 13),
                      ),
                    ),
                    honorsawardsAdditional(
                        onTap: () =>
                            showMediaOptions(context, controller, award),
                        heading: 'Media',
                        subText:
                            'Add Documents, photos, sites, videos, and presentations.',
                        secSub: 'Learn more about media file types supported',
                        selected: Obx(() {
                          final data = controller.allAwardMedias;
                          return data.isEmpty
                              ? shrinked
                              : Column(
                                  children: List.generate(data.length, (index) {
                                    String? mediaUrl;
                                    if (data[index].url != null &&
                                        award?.imagePath != null) {
                                      mediaUrl =
                                          "http://154.26.130.161/elearning/${award?.imagePath}/${data[index].url}";
                                    }
                                    return addedMediaHomeHonorAward(
                                      file: data[index].file,
                                      mediaUrl: mediaUrl,
                                      onTap: () {
                                        data.removeAt(index);
                                        controller.update(
                                            ['update-HonorAwardsbutton']);
                                        controller.allFieldSelect();
                                      },
                                      title: data[index].title,
                                      desc: data[index].description,
                                    );
                                  }),
                                );
                        })),
                    hMBox,
                    GetBuilder<ProfileHonorsAwardsController>(
                      id: 'update-HonorAwardsbutton',
                      builder: (c) {
                        return Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            saveContainer(
                              boxColor: kwhite,
                              borderColor: mainPurple,
                              onTap: () => Get.back(),
                              child: saveContainerText(
                                  text: 'Cancel', textColor: mainPurple),
                            ),
                            wMBox,
                            saveContainer(
                              boxColor: c.saveBG.value,
                              child: Obx(
                                () => c.isSaving.value
                                    ? CircularProgressIndicator(
                                        color: kwhite,
                                        strokeWidth: 1,
                                      )
                                    : saveContainerText(
                                        text: 'Save',
                                        textColor: c.saveText.value),
                              ),
                              onTap: () {
                                if (formKey.currentState!.validate()) {
                                  List<File> imagesList = c.allAwardMedias
                                      .map((i) => i.file)
                                      .where((file) => file != null)
                                      .cast<File>()
                                      .toList();
                                  List<String> mediaUrl = c.allAwardMedias
                                      .map((i) => i.url)
                                      .where((image) => image != null)
                                      .cast<String>()
                                      .toList();
                                  List<String> mediaLinks = c.allAwardMedias
                                      .map((i) => i.mediaLink)
                                      .where((mediaLink) => mediaLink != null)
                                      .cast<String>()
                                      .toList();
                                  List<String> mediaTitles = c.allAwardMedias
                                      .map((i) => i.title)
                                      .toList();
                                  List<String> mediaDescs = c.allAwardMedias
                                      .map((i) => i.description)
                                      .toList();
                                  award == null
                                      ? c.saveHonorAwardFunction(
                                          uId: uId,
                                          title: c.titileController.text,
                                          assosiated:
                                              c.assosiatedController.text,
                                          issuer: c.issuerController.text,
                                          startdate:
                                              c.startdateBackend.toString(),
                                          description:
                                              c.descriptionController.text,
                                          media: imagesList,
                                          mediaTitle: mediaTitles,
                                          mediaDescription: mediaDescs,
                                          mediaLink: mediaLinks)
                                      : c.updateHonorAwardFunction(
                                          awardID: awardID.toString(),
                                          uId: uId,
                                          title: c.titileController.text,
                                          assosiated:
                                              c.assosiatedController.text,
                                          issuer: c.issuerController.text,
                                          startdate:
                                              c.startdateBackend.toString(),
                                          description:
                                              c.descriptionController.text,
                                          media: imagesList,
                                          mediaTitle: mediaTitles,
                                          mediaDescription: mediaDescs,
                                          mediaLink: mediaLinks,
                                          mediaUrl: mediaUrl,
                                        );
                                }
                              },
                            ),
                          ],
                        );
                      },
                    ),
                    hBox,
                    award == null
                        ? shrinked
                        : deleteSectionWidget(
                            onPressed: () => controller.deleteAwardFunction(
                                awardID: awardID.toString(), uId: uId),
                            section: 'Award',
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

  void initializeFormFields(ProfileHonorsAwardsController c, Award? award) {
    if (award == null) return;
    c.titileController.text =
        c.titileController.text.isEmpty && award.title != null
            ? award.title as String
            : c.titileController.text;
    c.assosiatedController.text =
        c.assosiatedController.text.isEmpty && award.associated != null
            ? award.associated as String
            : c.assosiatedController.text;
    c.issuerController.text =
        c.issuerController.text.isEmpty && award.issuer != null
            ? award.issuer as String
            : c.issuerController.text;
    c.startdateController.text =
        c.startdateController.text.isEmpty && award.startDate != null
            ? convertDateFormat(award.startDate!)
            : c.startdateController.text;
    c.descriptionController.text =
        c.descriptionController.text.isEmpty && award.description != null
            ? award.description as String
            : c.descriptionController.text;
    c.startdateBackend = award.startDate!;
    if (c.allAwardMedias.isEmpty && award.media != null) {
      List<AddMediaModel> mediaList = parseMediaItems(award);
      c.allAwardMedias.addAll(mediaList);
    }
    c.allFieldSelect();
    c.update(['update-HonorAwardsbutton']);
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

  List<AddMediaModel> parseMediaItems(Award award) {
    List<String> mediaList = [];
    if (award.media != null && award.media!.isNotEmpty) {
      try {
        mediaList = List<String>.from(jsonDecode(award.media!));
      } catch (e) {
        log('Error decoding media: $e');
      }
    }
    // List<String> mediaList =
    List<String> mediaTitles = award.mediaTitle?.split(',') ?? [];
    List<String> mediaDescriptions = award.mediaDescription?.split(',') ?? [];
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
      ProfileHonorsAwardsController controller, Award? award) {
    showModalBottomSheet(
      context: context,
      builder: (_) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              honorMediaListTile(
                title: 'Add a Link',
                leading: Transform.rotate(
                  angle: -0.7,
                  child: const Icon(Icons.link),
                ),
                onTap: () {
                  controller.mediaLinkController.clear();
                  Get.to(() => AddAwardLinkScreen(
                        uId: uId,
                        controller: controller,
                        award: award,
                      ));
                },
              ),
              honorMediaListTile(
                title: 'Upload a Photo',
                leading: SvgPicture.asset('assets/images/gallery.svg'),
                onTap: () {
                  controller.pickImageMedia().then((value) {
                    if (value != null) {
                      controller.mediaTitleController.clear();
                      controller.mediaDescriptionController.clear();
                      return Get.to(() => AddHonorAwardsMediaScreen(
                          image: value,
                          uId: uId,
                          controller: controller,
                          award: award));
                    }
                  });
                },
              ),
              honorMediaListTile(
                title: 'Take a Photo',
                leading: SvgPicture.asset('assets/images/camera.svg'),
                onTap: () {
                  controller.pickCameraMedia().then((value) {
                    if (value != null) {
                      controller.mediaTitleController.clear();
                      controller.mediaDescriptionController.clear();
                      return Get.to(() => AddHonorAwardsMediaScreen(
                          image: value,
                          uId: uId,
                          controller: controller,
                          award: award));
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

  void showAssosiatedOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return const AwardAssosiatedBottomsheet();
      },
    );
  }
}
