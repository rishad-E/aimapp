import 'dart:developer';
import 'dart:io';

import 'package:aimshala/controllers/profile_controller/profile_project_controller.dart';
import 'package:aimshala/models/profile_model/profile_all_data_model.dart';
import 'package:aimshala/utils/common/widgets/colors_common.dart';
import 'package:aimshala/utils/common/widgets/text_common.dart';
import 'package:aimshala/utils/widgets/widgets_common.dart';
import 'package:aimshala/view/profile/common/widgets/widgets.dart';
import 'package:aimshala/view/profile/profile_project_section/add_project_screen.dart';
import 'package:aimshala/view/profile/profile_project_section/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class AddProjectMediaScreen extends StatelessWidget {
  final File? image;
  final String uId;
  final Project? project;
  final ProfileProjectController controller;
  AddProjectMediaScreen(
      {super.key,
      this.image,
      required this.uId,
      this.project,
      required this.controller});
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
                  controller.addProjectMedia(
                      title: controller.mediaTitleController.text,
                      desc: controller.mediaDescriptionController.text,
                      link: controller.mediaLinkController.text,
                      file: image);
                  Get.off(() =>
                      ProfileAddProjectScreen(uId: uId, project: project));
                  log(controller.allProjectMedias.toString(),
                      name: 'project Media');
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
                projectMediaInfoFiled(
                  text: primarytxt3('Title', 9.5.sp),
                  textField: TextFormField(
                    controller: controller.mediaTitleController,
                    validator: (value) => controller.filedValidation(value),
                    decoration:
                        infoFieldDecoration(hintText: 'Ex: Certificate'),
                    style: const TextStyle(fontSize: 13),
                  ),
                ),
                projectMediaInfoFiled(
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
    );
  }
}
