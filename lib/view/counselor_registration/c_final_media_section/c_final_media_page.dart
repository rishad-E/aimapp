import 'dart:developer';
import 'package:aimshala/controllers/counselor_controllers/counselor_final_media_controller.dart';
import 'package:aimshala/utils/common/widgets/colors_common.dart';
import 'package:aimshala/utils/common/widgets/text_common.dart';
import 'package:aimshala/utils/widgets/widgets_common.dart';
import 'package:aimshala/view/counselor_registration/c_final_media_section/widget/widget.dart';
import 'package:aimshala/view/counselor_registration/common/widgets/counselor_widgets.dart';
import 'package:aimshala/view/profile/common/widgets/texts.dart';
import 'package:aimshala/view/profile/common/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class CounselorMediaPage extends StatelessWidget {
  CounselorMediaPage({super.key});
  final GlobalKey<FormState> formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    final c = Get.put(CounselorMediaController());
    return Scaffold(
      appBar: counselorAppBar(backArrow: true),
      body: counselorContainer(
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.center,
                child: counselorRichText(text1: 'Final Steps', text2: ''),
              ),
              hLBox,
              boldText(text: 'Resume/CV/LinkedIn Profile Link', size: 11.sp),
              counselorFields(
                fieldItem: 'LinkedIn Profile Link',
                textfiled: TextFormField(
                  controller: c.linkController,
                  validator: (value) => c.fieldValidation(value),
                  onChanged: (value) => c.errorTextLink.value = '',
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
                () => c.filePath.isEmpty
                    ? uploadMediaCounselor(
                        item: 'Resume',
                        onTap: () => c.pickFile(),
                      )
                    : mediaContainCounselor(
                        item: 'Resume',
                        fileName: c.fileName.value,
                        fileSize: c.fileSize.value,
                        onTapDelete: () => c.clearFileSelection(),
                      ),
              ),
              Obx(
                () => c.errorTextLink.value == 'nodata'
                    ? Align(
                        alignment: Alignment.center,
                        child: Column(
                          children: [
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
                size: 11.sp,
              ),
              counselorFields(
                fieldItem: 'Video Link',
                textfiled: TextFormField(
                  controller: c.videoController,
                  validator: (value) => c.fieldValidation(value),
                  onChanged: (value) => c.errorTextVideo.value = '',
                  decoration: infoFieldDecoration(hintText: 'Enter Video Link'),
                  style: const TextStyle(fontSize: 13),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: semiBoldChoiceText(text: 'Or', size: 11),
              ),
              Obx(
                () => c.videofilePath.isEmpty
                    ? uploadMediaCounselor(
                        item: 'Video',
                        onTap: () => c.pickVideo(),
                      )
                    : mediaContainCounselor(
                        item: 'Video',
                        fileName: c.videofileName.value,
                        fileSize: c.videofileSize.value,
                        onTapDelete: () => c.clearVideoSelection(),
                      ),
              ),
              Obx(
                () => c.errorTextVideo.value == 'nodata'
                    ? Align(
                        alignment: Alignment.center,
                        child: Column(
                          children: [
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
              GetBuilder<CounselorMediaController>(
                id: 'agree-Terms',
                builder: (c) {
                  return counselorAgreeSection(
                    agree: c.agree.value,
                    onTapAgree: () => c.toggleAggrement(),
                  );
                },
              ),
              Obx(
                () => c.errorAgreement.value == 'notAgreed'
                    ? agreeNotText()
                    : shrinked,
              ),
              hLBox,
              Row(
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
                  Obx(
                    () => saveContainer(
                      boxColor: c.agree.value ? mainPurple : buttonColor,
                      child: c.isSaving.value
                          ? CircularProgressIndicator(strokeWidth: 1,color: kwhite)
                          : saveContainerText(
                              text: 'Save',
                              textColor:
                                  c.agree.value ? kwhite : textFieldColor,
                            ),
                      onTap: () {
                        if (formKey.currentState!.validate()) {
                          if (c.agree.value == false) {
                            c.errorAgreement.value = 'notAgreed';
                          }
                          if (c.linkController.text.isEmpty &&
                              c.filePath.isEmpty) {
                            c.errorTextLink.value = 'nodata';
                          }
                          if (c.videoController.text.isEmpty &&
                              c.videofilePath.isEmpty) {
                            c.errorTextVideo.value = 'nodata';
                          }
                          if (c.agree.value &&
                              (c.linkController.text.isNotEmpty ||
                                  c.filePath.isNotEmpty) &&
                              (c.videoController.text.isNotEmpty ||
                                  c.videofilePath.isNotEmpty)) {
                            log('cvLink=>${c.linkController.text}  videoLink=>${c.videoController.text}   cvFile=>${c.cv?.path}  videoFile=>${c.video?.path}');
                            c.fetchDataSubmit();
                          }
                        }
                      },
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
