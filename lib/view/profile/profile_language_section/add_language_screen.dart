import 'dart:developer';

import 'package:aimshala/controllers/profile_controller/profile_language_course_controller.dart';
import 'package:aimshala/utils/common/colors_common.dart';
import 'package:aimshala/utils/common/text_common.dart';
import 'package:aimshala/utils/widgets/widgets_common.dart';
import 'package:aimshala/view/profile/common/widgets/widgets.dart';
import 'package:aimshala/view/profile/profile_home/profile_home.dart';
import 'package:aimshala/view/profile/profile_language_section/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class ProfileAddLanguageScreen extends StatelessWidget {
  final String uId;
   ProfileAddLanguageScreen({super.key, required this.uId});
 final GlobalKey<FormState> formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LanguageAndCourseController());
    return PopScope(
      onPopInvoked: (didPop) =>
          Future.microtask(() => Get.off(() => const ProfileHomeScreen())),
      child: Scaffold(
        appBar: profileAppBar(title: 'Add Language', doneWidget: shrinked),
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
                      profileRichText('Add', 'Language'),
                      hLBox,
                      languageInfoFiled(
                        text: primarytxt3('Language', 9.5.sp),
                        textField: TextFormField(
                          controller: controller.languageController,
                          validator: (value) =>
                              controller.fieldValidation(value),
                          onChanged: (value) =>
                              controller.update(['update-LanguageInfo']),
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          decoration: infoFieldDecoration(
                            hintText: 'Ex: Retail Sales Manager',
                          ),
                          style: const TextStyle(fontSize: 13),
                        ),
                      ),
                      languageInfoFiled(
                        text: primarytxt3('Proficiency', 9.5.sp),
                        textField: TextFormField(
                          controller: controller.proficiencyController,
                          validator: (value) =>
                              controller.fieldValidation(value),
                          onChanged: (value) =>
                              controller.update(['update-LanguageInfo']),
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          decoration: infoFieldDecoration(
                              hintText: 'Please Select',
                              suffixWidget:
                                  const Icon(Icons.keyboard_arrow_down)),
                          style: const TextStyle(fontSize: 13),
                        ),
                      ),
                      hMBox,
                      GetBuilder<LanguageAndCourseController>(
                          id: 'update-LanguageInfo',
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
                                  textColor:
                                      c.languageController.text.isNotEmpty &&
                                              c.proficiencyController.text
                                                  .isNotEmpty
                                          ? kwhite
                                          : textFieldColor,
                                  boxColor:
                                      c.languageController.text.isNotEmpty &&
                                              c.proficiencyController.text
                                                  .isNotEmpty
                                          ? mainPurple
                                          : buttonColor,
                                  onTap: () {
                                    if (formKey.currentState!.validate()) {
                                      log('ID=>$uId language=>${c.languageController.text} proficiency=>${c.proficiencyController.text}',name: 'language-screen');
                                      c.saveLanguageFunction(uId: uId, language: c.languageController.text, proficiency: c.proficiencyController.text);
                                    }
                                  },
                                ),
                              ],
                            );
                          })
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
}
