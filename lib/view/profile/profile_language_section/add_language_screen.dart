import 'dart:developer';
import 'package:aimshala/controllers/profile_controller/profile_language_course_controller.dart';
import 'package:aimshala/models/profile_model/profile_all_data_model.dart';
import 'package:aimshala/utils/common/widgets/colors_common.dart';
import 'package:aimshala/utils/common/widgets/text_common.dart';
import 'package:aimshala/utils/widgets/widgets_common.dart';
import 'package:aimshala/view/profile/common/widgets/widgets.dart';
import 'package:aimshala/view/profile/profile_home/profile_home.dart';
import 'package:aimshala/view/profile/profile_language_section/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class ProfileAddLanguageScreen extends StatelessWidget {
  final String uId;
  final Language? language;
  ProfileAddLanguageScreen({super.key, required this.uId, this.language});
  final GlobalKey<FormState> formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    String? languageID;
    log(language.toString(), name: 'langugae data');
    final controller = Get.put(LanguageAndCourseController());
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      controller.languageController.text =
          language?.language.toString() ?? controller.languageController.text;
      controller.proficiencyController.text =
          language?.proficiency.toString() ??
              controller.proficiencyController.text;
      languageID = language?.id.toString();
      controller.update(['update-LanguageInfo']);
    });
    return PopScope(
      onPopInvoked: (didPop) =>
          Future.microtask(() => Get.off(() => ProfileHomeScreen(id: uId))),
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
                        textField: GestureDetector(
                          onTap: () =>
                              showProficiencyOptions(context, controller),
                          child: AbsorbPointer(
                            child: TextFormField(
                              controller: controller.proficiencyController,
                              readOnly: true,
                              validator: (value) =>
                                  controller.fieldValidation(value),
                              onChanged: (value) =>
                                  controller.update(['update-LanguageInfo']),
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              decoration: infoFieldDecoration(
                                  hintText: 'Please Select',
                                  suffixWidget:
                                      const Icon(Icons.keyboard_arrow_down)),
                              style: const TextStyle(fontSize: 13),
                            ),
                          ),
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
                                      log('ID=>$uId language=>${c.languageController.text} proficiency=>${c.proficiencyController.text}',
                                          name: 'language-screen');
                                      language == null
                                          ? c.saveLanguageFunction(
                                              uId: uId,
                                              language:
                                                  c.languageController.text,
                                              proficiency:
                                                  c.proficiencyController.text,
                                            )
                                          : c.updateLanguageFunction(
                                              languageID: languageID.toString(),
                                              uId: uId,
                                              language:
                                                  c.languageController.text,
                                              proficiency:
                                                  c.proficiencyController.text,
                                            );
                                    }
                                  },
                                ),
                              ],
                            );
                          }),
                      hBox,
                      language == null
                          ? shrinked
                          : deleteSectionWidget(
                              onPressed: () {
                                controller.deleteLanguageFunction(
                                    languageID: languageID.toString(),
                                    uId: uId);
                              },
                              section: 'Language',
                            )
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

  void showProficiencyOptions(
      BuildContext context, LanguageAndCourseController controller) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        List<String> proficiencyList = ['Beginner', 'Intermediate', 'Advanced'];
        return Padding(
          padding: const EdgeInsets.fromLTRB(20, 20, 10, 40),
          child: SingleChildScrollView(
            child: Column(
              children: [
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  trailing: GestureDetector(
                    onTap: () => Get.back(),
                    child: SizedBox(
                        height: 30,
                        width: 30,
                        child: Image.asset(
                          'assets/images/close.png',
                          fit: BoxFit.cover,
                        )),
                  ),
                ),
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: Text(
                    'Select your Country',
                    style: TextStyle(
                      color: kblack,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Column(
                  children: List.generate(
                    proficiencyList.length,
                    (index) {
                      return ListTile(
                        shape: const Border(
                            bottom: BorderSide(
                                color: Color.fromARGB(255, 202, 201, 201))),
                        contentPadding: EdgeInsets.zero,
                        title: Text(
                          proficiencyList[index],
                          style: TextStyle(
                            color: kblack,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        trailing: Checkbox(
                          side: BorderSide.none,
                          activeColor: mainPurple,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5)),
                          value: controller.proficiencyController.text ==
                              proficiencyList[index],
                          onChanged: (value) {
                            if (value != null && value) {
                              controller.proficiencyController.text =
                                  proficiencyList[index];
                              controller.update(['update-LanguageInfo']);
                              Get.back();
                            }
                          },
                        ),
                        onTap: () {
                          controller.proficiencyController.text =
                              proficiencyList[index];
                          controller.update(['update-LanguageInfo']);
                          Get.back();
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
