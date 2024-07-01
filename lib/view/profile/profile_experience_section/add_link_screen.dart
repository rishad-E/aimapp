import 'dart:developer';

import 'package:aimshala/controllers/profile_controller/profile_experience_controller.dart';
import 'package:aimshala/models/profile_model/profile_section_data_model.dart';
import 'package:aimshala/utils/common/widgets/colors_common.dart';
import 'package:aimshala/utils/common/widgets/text_common.dart';
import 'package:aimshala/utils/widgets/widgets_common.dart';
import 'package:aimshala/view/profile/common/widgets/widgets.dart';
import 'package:aimshala/view/profile/profile_experience_section/add_media_screen.dart';
import 'package:aimshala/view/profile/profile_experience_section/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class AddExperienceLinkScreen extends StatelessWidget {
  final String uId;
  final Experience? experience;
  final ProfileExperienceController controller;
  AddExperienceLinkScreen(
      {super.key,
      required this.uId,
      this.experience,
      required this.controller});
  final GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Scaffold(
        appBar: profileAppBar(title: 'Add Link', doneWidget: shrinked),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
          child: SingleChildScrollView(
            child: Column(
              children: [
                experienceInfoFiled(
                  text: regularText(
                      'Paste or type a link to an article, file or video.',
                      9.5.sp,
                      color: kblack),
                  textField: TextFormField(
                    validator: (value) => controller.mediaLinkValidation(value),
                    controller: controller.mediaLinkController,
                    decoration: infoFieldDecoration(
                      suffixWidget: TextButton(
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            log('message');
                            controller.pickImageMediaEX().then((value) {
                              if (value != null) {
                                controller.mediaTitleController.clear();
                                controller.mediaDescriptionController.clear();
                                Get.to(() => AddExperienceMediaScreen(
                                      image: value,
                                      uId: uId,
                                      controller: controller,
                                      ex: experience,
                                    ));
                              }
                            });
                          }
                        },
                        child: const Text(
                          'Apply',
                          style: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                    style: const TextStyle(fontSize: 13),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                  ),
                ),
                // hMBox,
                // educationInfoFiled(
                //   text: primarytxt3('Title', 9.5.sp),
                //   textField: TextFormField(
                //     decoration:
                //         infoFieldDecoration(hintText: 'Ex: Certificate'),
                //     style: const TextStyle(fontSize: 13),
                //     autovalidateMode: AutovalidateMode.onUserInteraction,
                //   ),
                // ),
                // educationInfoFiled(
                //   text: primarytxt3('Description', 9.5.sp),
                //   textField: TextFormField(
                //     decoration:
                //         infoFieldDecoration(hintText: 'Enter Description'),
                //     style: const TextStyle(fontSize: 13),
                //     minLines: 3,
                //     maxLines: null,
                //     autovalidateMode: AutovalidateMode.onUserInteraction,
                //   ),
                // ),
                // hMBox,
                // SizedBox(
                //   height: 17.h,
                //   width: double.infinity,
                //   // color: Colors.yellow,
                //   child:
                //       //  image != null
                //       // ? Image.file(image!, fit: BoxFit.contain)
                //       // :
                //       Center(
                //     child: Text(
                //       "Please select an image",
                //       style: TextStyle(color: textFieldColor),
                //       textAlign: TextAlign.center,
                //     ),
                //   ),
                // )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
