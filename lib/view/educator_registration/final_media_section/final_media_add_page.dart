import 'dart:developer';
import 'package:aimshala/controllers/educator_controllers/educator_add_media_controller.dart';
import 'package:aimshala/utils/common/colors_common.dart';
import 'package:aimshala/utils/common/text_common.dart';
import 'package:aimshala/utils/widgets/widgets_common.dart';
import 'package:aimshala/view/educator_registration/common/widgets/widgets.dart';
import 'package:aimshala/view/educator_registration/final_media_section/widgets/widgets.dart';
import 'package:aimshala/view/educator_registration/submitted_section/submitted_final_page.dart';
import 'package:aimshala/view/profile/common/widgets/texts.dart';
import 'package:aimshala/view/profile/common/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class EducatorMediaAddPage extends StatelessWidget {
  EducatorMediaAddPage({super.key});
  final GlobalKey<FormState> formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(EducatorMediaAddController());
    return Scaffold(
      appBar: educatorAppBar(title: 'Educator Registration'),
      body: educatorBGContainer(
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              children: [
                educatorSectionContainer(
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
                      educatorFields(
                        item: primarytxt3('LinkedIn Profile Link', 9.5.sp),
                        textfiled: TextFormField(
                          // autovalidateMode: AutovalidateMode.onUserInteraction,
                          controller: controller.linkedInController,
                          validator: (value) =>
                              controller.fieldValidation(value),
                          onChanged: (value) =>
                              controller.errorTextLink.value = '',
                          decoration: infoFieldDecoration(
                              hintText: 'Enter LinkedIn Profile Link'),
                          style: const TextStyle(fontSize: 13),
                        ),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: semiBoldChoiceText(text: 'Or', size: 11),
                      ),
                      hBox,
                      Obx(
                        () => controller.filePath.isEmpty
                            ? uploadMediaWidget(
                                item: 'Resume',
                                onTap: () => controller.pickFile(),
                              )
                            : mediaContainWidget(
                                fileName: controller.fileName.value,
                                fileSize: controller.fileSize.value,
                                onTapDelete: () =>
                                    controller.filePath.value = '',
                              ),
                      ),
                      Obx(
                        () => controller.errorTextLink.value == 'no data'
                            ? Align(
                                alignment: Alignment.center,
                                child: Column(
                                  children: [
                                    hBox,
                                    semiBoldChoiceText(
                                        text: "Please Provide a Link or a File",
                                        size: 11,
                                        color: kred),
                                  ],
                                ),
                              )
                            : shrinked,
                      ),
                      hLBox,
                      boldText(
                          text: 'Upload a Short Teaching Video (3-5 minutes)',
                          size: 11.sp),
                      educatorFields(
                        item: primarytxt3('Video Link', 9.5.sp),
                        textfiled: TextFormField(
                          controller: controller.mediaLinkController,
                          validator: (value) =>
                              controller.fieldValidationVideo(value),
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
                      hBox,
                      Obx(
                        () => controller.videofilePath.isEmpty
                            ? uploadMediaWidget(
                                item: 'Video',
                                onTap: () => controller.pickVideo(),
                              )
                            : mediaContainWidget(
                                fileName: controller.videofileName.value,
                                fileSize: controller.videofileSize.value,
                                onTapDelete: () =>
                                    controller.videofilePath.value = '',
                              ),
                      ),
                      Obx(
                        () => controller.errorTextVideo.value == 'no data'
                            ? Align(
                                alignment: Alignment.center,
                                child: Column(
                                  children: [
                                    hBox,
                                    semiBoldChoiceText(
                                        text:
                                            "Please Provide a Link or a Video",
                                        size: 11,
                                        color: kred),
                                  ],
                                ),
                              )
                            : shrinked,
                      ),
                      hLBox,
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          GetBuilder<EducatorMediaAddController>(
                              id: 'update-agreement',
                              builder: (c) {
                                return GestureDetector(
                                  onTap: () => c.toggleAggrement(),
                                  child:
                                      finalAgreeContainer(agree: c.agree.value),
                                );
                              }),
                          wBox,
                          wBox,
                          Expanded(
                              child: finalAgreementText(
                            onTapTerms: () {
                              log('Terms and Conditions', name: 'ontap-terms');
                            },
                            onTapPrivacy: () {
                              log('Privacy policy', name: 'ontap-privacy');
                            },
                          ))
                        ],
                      ),
                      Obx(
                        () => controller.errorAgreement.value == 'not'
                            ? Align(
                                alignment: Alignment.center,
                                child: Column(
                                  children: [
                                    hBox,
                                    semiBoldChoiceText(
                                        text:
                                            "Please Agree to the Terms and Conditions",
                                        size: 11,
                                        color: kred),
                                  ],
                                ),
                              )
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
                            () => actionContainer(
                              text: 'Submit',
                              textColor: controller.agree.value
                                  ? kwhite
                                  : textFieldColor,
                              boxColor: controller.agree.value
                                  ? mainPurple
                                  : buttonColor,
                              onTap: () {
                                // if (formKey.currentState!.validate()) {}

                                if (controller
                                        .linkedInController.text.isEmpty &&
                                    controller.filePath.value.isEmpty) {
                                  controller.errorTextLink.value = 'no data';
                                }
                                if (controller
                                        .mediaLinkController.text.isEmpty &&
                                    controller.videofilePath.value.isEmpty) {
                                  controller.errorTextVideo.value = 'no data';
                                }
                                if (controller.agree.value == false) {
                                  controller.errorAgreement.value = 'not';
                                }
                                if (controller.agree.value &&
                                    (controller.linkedInController.text
                                            .isNotEmpty ||
                                        controller.filePath.value.isNotEmpty) &&
                                    (controller.mediaLinkController.text
                                            .isNotEmpty ||
                                        controller
                                            .videofilePath.value.isNotEmpty)) {
                                  Get.to(() => const EducatorSubmitFinalPage());
                                }
                              },
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
