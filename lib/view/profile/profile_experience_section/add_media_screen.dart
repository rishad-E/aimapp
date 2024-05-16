import 'dart:io';

import 'package:aimshala/controllers/profile_controller/profile_experience_controller.dart';
import 'package:aimshala/models/profile_model/profile_all_data_model.dart';
import 'package:aimshala/utils/common/colors_common.dart';
import 'package:aimshala/utils/common/text_common.dart';
import 'package:aimshala/utils/widgets/widgets_common.dart';
import 'package:aimshala/view/profile/common/widgets/widgets.dart';
import 'package:aimshala/view/profile/profile_experience_section/add_experience_screen.dart';
import 'package:aimshala/view/profile/profile_experience_section/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class AddExperienceMediaScreen extends StatelessWidget {
  final File? image;
  final String uId;
  final Experience? ex;
  final ProfileExperienceController controller;
  AddExperienceMediaScreen(
      {super.key,
      required this.image,
      required this.uId,
      required this.controller, this.ex});
  final GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: PopScope(
        onPopInvoked: (didPop) {
          if (formKey.currentState!.validate()) {
            Future.microtask(
                () => Get.off(() => AddExperienceScreen(uId: uId)));
          }
          // Future.microtask(() {
          //   if (formKey.currentState!.validate()) {
          //     Get.off(() => AddExperienceScreen(uId: uId));
          //   }
          // });
        },
        child: Scaffold(
          appBar: profileAppBar(
            title: 'Add Media',
            doneWidget: TextButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    Get.off(() => AddExperienceScreen(uId: uId));
                  }
                },
                child: const Text(
                  'Apply',
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
                )),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  experienceInfoFiled(
                    text: primarytxt3('Title', 9.5.sp),
                    textField: TextFormField(
                      controller: controller.mediaTitleController,
                      validator: (value) => controller.filedValidation(value),
                      decoration:
                          infoFieldDecoration(hintText: 'Ex: Certificate'),
                      style: const TextStyle(fontSize: 13),
                    ),
                  ),
                  experienceInfoFiled(
                    text: primarytxt3('Description', 9.5.sp),
                    textField: TextFormField(
                      controller: controller.mediaDescriptionController,
                      validator: (value) => controller.filedValidation(value),
                      decoration:
                          infoFieldDecoration(hintText: 'Enter Description'),
                      style: const TextStyle(fontSize: 13),
                      minLines: 3,
                      maxLines: null,
                    ),
                  ),
                  hMBox,
                  SizedBox(
                    height: 17.h,
                    width: double.infinity,
                    // color: Colors.yellow,
                    child: image != null
                        ? Image.file(image!, fit: BoxFit.contain)
                        : Center(
                            child: Text(
                              "Please select an image",
                              style: TextStyle(color: textFieldColor),
                              textAlign: TextAlign.center,
                            ),
                          ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
