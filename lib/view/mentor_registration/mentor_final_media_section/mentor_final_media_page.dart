import 'dart:developer';
import 'package:aimshala/controllers/mentor_controllers/mentor_add_media_controller.dart';
import 'package:aimshala/utils/common/widgets/colors_common.dart';
import 'package:aimshala/utils/common/widgets/text_common.dart';
import 'package:aimshala/utils/widgets/widgets_common.dart';
import 'package:aimshala/view/mentor_registration/common/widgets/widgets.dart';
import 'package:aimshala/view/mentor_registration/mentor_final_media_section/widgets/widget.dart';
import 'package:aimshala/view/profile/common/widgets/texts.dart';
import 'package:aimshala/view/profile/common/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class MentorMediaPage extends StatelessWidget {
  const MentorMediaPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(MentorAddMediaController());
    return Scaffold(
      appBar: mentorAppbar(title: 'Mentor Registration', backArrow: true),
      body: mentorBGContainer(
          child: SingleChildScrollView(
        child: Column(
          children: [
            mentorSectionContainer(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: boldText(text: 'Final Steps', size: 15.sp),
                  ),
                  hLBox,
                  boldText(
                      text: 'Resume/CV/LinkedIn Profile Link', size: 11.sp),
                  mentorFields(
                    item: primarytxt3('LinkedIn Profile Link', 9.5.sp),
                    textfiled: TextFormField(
                      controller: controller.linkedInController,
                      validator: (value) => controller.fieldValidation(value),
                      onChanged: (value) => controller.errorTextLink.value = '',
                      decoration: infoFieldDecoration(
                          hintText: 'Enter LinkedIn Profile Link'),
                      style: const TextStyle(fontSize: 13),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: semiBoldChoiceText(text: 'Or', size: 11),
                  ),
                  Obx(
                    () => controller.filePath.isEmpty
                        ? uploadMediaMentor(
                            media: 'Resume',
                            onTap: () => controller.pickFile(),
                          )
                        : mentorMediaContainWidget(
                            media: 'Resume',
                            fileName: controller.fileName.value,
                            fileSize: controller.fileSize.value,
                            onTapDelete: () => controller.filePath.value = '',
                          ),
                  ),
                  Obx(
                    () => controller.errorTextLink.value == 'no data'
                        ? errorTextFile()
                        : shrinked,
                  ),
                  hMBox,
                  boldText(
                    text: 'Upload a Short Teaching Video (3-5 minutes)',
                    size: 11.sp,
                  ),
                  mentorFields(
                    item: primarytxt3('Video Link', 9.5.sp),
                    textfiled: TextFormField(
                      controller: controller.mediaLinkController,
                      validator: (value) => controller.fieldValidation(value),
                      onChanged: (value) =>
                          controller.errorTextVideo.value = '',
                      decoration:
                          infoFieldDecoration(hintText: 'Enter Video Link'),
                      style: const TextStyle(fontSize: 13),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: semiBoldChoiceText(text: 'Or', size: 11),
                  ),
                  Obx(
                    () => controller.videofilePath.isEmpty
                        ? uploadMediaMentor(
                            media: 'Video',
                            onTap: () => controller.pickVideo(),
                          )
                        : mentorMediaContainWidget(
                            media: 'Video',
                            fileName: controller.videofileName.value,
                            fileSize: controller.videofileSize.value,
                            onTapDelete: () =>
                                controller.videofilePath.value = '',
                          ),
                  ),
                  Obx(
                    () => controller.errorTextVideo.value == 'no data'
                        ? errorTextVideoFile()
                        : shrinked,
                  ),
                  hLBox,
                  Row(
                    children: [
                      GetBuilder<MentorAddMediaController>(
                          id: 'update-mentorAgreement',
                          builder: (c) {
                            return GestureDetector(
                              onTap: () => c.toggleAggrement(),
                              child: agreeContainerMentor(agree: c.agree.value),
                            );
                          }),
                      wBox,
                      wBox,
                      Expanded(
                          child: agreeTextMentor(
                        onTapTerms: () =>
                            log('Terms and Conditions', name: 'ontap-terms'),
                        onTapPrivacy: () =>
                            log('Privacy policy', name: 'ontap-privacy'),
                      ))
                    ],
                  ),
                  Obx(
                    () => controller.errorAgreement.value == 'not'
                        ? errorAgreementText()
                        : shrinked,
                  ),
                  hLBox,
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      actionContainer(
                        text: 'Previous',
                        textColor: mainPurple,
                        boxColor: kwhite,
                        borderColor: mainPurple,
                        onTap: () => Get.back(),
                      ),
                      wMBox,
                      Obx(
                        () => mentorSubmit(
                          child: controller.saveDataLoading.value &&
                                  controller.agree.value
                              ? submitLoadingMentor()
                              : submitTextMentor(
                                  color: controller.agree.value
                                      ? kwhite
                                      : textFieldColor,
                                ),
                          boxColor:
                              controller.agree.value ? mainPurple : buttonColor,
                          onTap: () {
                            if (controller.linkedInController.text.isEmpty &&
                                controller.filePath.isEmpty) {
                              controller.errorTextLink.value = 'no data';
                            }
                            if (controller.mediaLinkController.text.isEmpty &&
                                controller.videofilePath.isEmpty) {
                              controller.errorTextVideo.value = 'no data';
                            }
                            if (controller.agree.value == false) {
                              controller.errorAgreement.value = 'not';
                            }
                            if (controller.agree.value &&
                                (controller
                                        .linkedInController.text.isNotEmpty ||
                                    controller.filePath.isNotEmpty) &&
                                (controller
                                        .mediaLinkController.text.isNotEmpty ||
                                    controller.videofilePath.isNotEmpty)) {
                              controller.fetchDataAndSubmit();
                            }
                          },
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }
}
