import 'dart:developer';

import 'package:aimshala/controllers/educator_controllers/educator_add_media_controller.dart';
import 'package:aimshala/utils/common/colors_common.dart';
import 'package:aimshala/utils/common/text_common.dart';
import 'package:aimshala/utils/widgets/widgets_common.dart';
import 'package:aimshala/view/educator_registration/common/widgets/widgets.dart';
import 'package:aimshala/view/educator_registration/final_media_section/widgets/widgets.dart';
import 'package:aimshala/view/profile/common/widgets/texts.dart';
import 'package:aimshala/view/profile/common/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class EducatorMediaAddPage extends StatelessWidget {
  const EducatorMediaAddPage({super.key});
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(EducatorMediaAddController());
    return Scaffold(
      appBar: educatorAppBar(title: 'Educator Registration'),
      body: educatorBGContainer(
        child: SingleChildScrollView(
          child: Form(
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
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          controller: controller.linkedInController,
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
                                onTap: () {
                                  log('UPLOAD a file', name: 'file-picker');
                                  controller.pickFile();
                                },
                              )
                            : mediaContainWidget(
                                fileName: controller.filePath.isNotEmpty
                                    ? controller.fileName.value
                                    : 'Resume.pdf',
                                fileSize: controller.filePath.isNotEmpty
                                    ? controller.fileSize.value
                                    : '2MB',
                                onTapDelete: () =>
                                    controller.filePath.value = '',
                              ),
                      ),
                      hLBox,
                      boldText(
                          text: 'Upload a Short Teaching Video (3-5 minutes)',
                          size: 11.sp),
                      educatorFields(
                        item: primarytxt3('Video Link', 9.5.sp),
                        textfiled: TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          controller: controller.mediaLinkController,
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
                                onTap: () {
                                  log('UPLOAD a file', name: 'file-picker');
                                  controller.pickVideo();
                                },
                              )
                            : mediaContainWidget(
                                fileName: controller.videofilePath.isNotEmpty
                                    ? controller.videofileName.value
                                    : 'Resume.pdf',
                                fileSize: controller.videofilePath.isNotEmpty
                                    ? controller.videofileSize.value
                                    : '2MB',
                                onTapDelete: () =>
                                    controller.videofilePath.value = '',
                              ),
                      ),
                      hLBox,
                      GetBuilder<EducatorMediaAddController>(
                          id: 'edu-addFileMedia',
                          builder: (c) {
                            return Row(
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
                                actionContainer(
                                    text: 'Next',
                                    textColor: textFieldColor,
                                    boxColor: buttonColor,
                                    onTap: () {}),
                              ],
                            );
                          })
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
