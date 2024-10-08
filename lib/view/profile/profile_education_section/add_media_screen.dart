import 'dart:developer';
import 'dart:io';
import 'package:aimshala/controllers/profile_controller/profile_education_controller.dart';
import 'package:aimshala/models/profile_model/profile_section_data_model.dart';
import 'package:aimshala/utils/common/widgets/colors_common.dart';
import 'package:aimshala/utils/common/widgets/text_common.dart';
import 'package:aimshala/utils/widgets/widgets_common.dart';
import 'package:aimshala/view/profile/common/widgets/widgets.dart';
import 'package:aimshala/view/profile/profile_education_section/add_education_screen.dart';
import 'package:aimshala/view/profile/profile_education_section/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class AddProfileMediaScreen extends StatelessWidget {
  final File? image;

  final Education? edu;
  final ProfileEducationController controller;
  AddProfileMediaScreen(
      {super.key, this.image, required this.controller, this.edu});
  final GlobalKey<FormState> formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Scaffold(
        appBar: profileAppBar(
          title: 'Add Media',
          doneWidget: TextButton(
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  controller.addMediaFields(
                      file: image,
                      title: controller.mediaTitleController.text,
                      description: controller.mediaDescriptionController.text,
                      link: controller.mediaLinkController.text);
                  Get.off(() => AddEducationScreen(edu: edu));
                  log(controller.allMediasModel.toString());
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
                educationInfoFiled(
                  text: primarytxt3('Title', 9.5.sp),
                  textField: TextFormField(
                    decoration: infoFieldDecoration(hintText: 'Enter Title'),
                    style: const TextStyle(fontSize: 13),
                    controller: controller.mediaTitleController,
                    validator: (value) => controller.filedValidation(value),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                  ),
                ),
                educationInfoFiled(
                  text: primarytxt3('Description', 9.5.sp),
                  textField: TextFormField(
                    decoration:
                        infoFieldDecoration(hintText: 'Enter Description'),
                    style: const TextStyle(fontSize: 13),
                    minLines: 3,
                    maxLines: null,
                    controller: controller.mediaDescriptionController,
                    validator: (value) => controller.filedValidation(value),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
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
    );
  }
}
