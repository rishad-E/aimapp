import 'dart:developer';
import 'package:aimshala/controllers/profile_controller/profile_skill_info_controller.dart';
import 'package:aimshala/utils/common/colors_common.dart';
import 'package:aimshala/utils/common/text_common.dart';
import 'package:aimshala/utils/widgets/widgets_common.dart';
import 'package:aimshala/view/profile/common/widgets/texts.dart';
import 'package:aimshala/view/profile/common/widgets/widgets.dart';
import 'package:aimshala/view/profile/profile_add_skill_section/widgets/widgets_skill.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class ProfileAddSkillScreen extends StatelessWidget {
  final String uId;
  ProfileAddSkillScreen({super.key, required this.uId});
  final GlobalKey<FormState> formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProfileSkillController());
    return Scaffold(
      // extendBodyBehindAppBar: true,
      appBar: profileAppBar(title: 'Add Skill', doneWidget: shrinked),
      body: Container(
        decoration: profileMainContainer(),
        child: Center(
          child: Container(
            width: double.infinity,
            // height: 50,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
            margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
            decoration: profileSecondaryContainer(),
            child: SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: profileRichText('Add$uId', 'Skill'),
                    ),
                    hLBox,
                    skillInfoFiled(
                      text: primarytxt3('Skill', 9.5.sp),
                      textField: TextFormField(
                        controller: controller.skillController,
                        validator: (value) => controller.fieldValidation(value),
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        onChanged: (value) => controller.update(['update-skilladdButton']),
                        decoration: infoFieldDecoration(
                            hintText: 'Ex: Retail Sales Manager'),
                        style: const TextStyle(fontSize: 13),
                      ),
                    ),
                    hBox,
                    Container(
                      decoration: suggestedBoxDec(),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 10),
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          semiBoldText(text: 'Suggested based on your profile'),
                          const SizedBox(height: 8),
                          Obx(() {
                            final data = controller.suggestedSkills;
                            if (controller.loading.value) {
                              return Center(
                                  child: SizedBox(
                                width: 6.w,
                                height: 2.8.h,
                                child: CircularProgressIndicator(
                                    strokeWidth: 1.2,
                                    color: Colors.grey.shade400),
                              ));
                            } else if (data.isEmpty) {
                              return Align(
                                alignment: Alignment.center,
                                child: Text("No Suggested skills",
                                    style: TextStyle(
                                        color: textFieldColor,
                                        fontSize: 8.5.sp)),
                              );
                            } else if (controller.error?.value != null) {
                              return Align(
                                alignment: Alignment.center,
                                child: Text("Error in fetching skills",
                                    style: TextStyle(
                                        color: textFieldColor,
                                        fontSize: 8.5.sp)),
                              );
                            } else {
                              return Wrap(
                                spacing: 4,
                                //  spacing: 6,
                                runSpacing: 8,
                                children: List.generate(data.length,
                                    (index) => suggestedSkills(data[index])),
                              );
                            }
                          }),
                        ],
                      ),
                    ),
                    hMBox,
                    semiBoldText(text: 'Show us where you used this skill'),
                    regularText(
                        '75% of hirers value skill context. Select at least one item to show where you used this skill.',
                        8.5.sp),
                    hBox,
                    GetBuilder<ProfileSkillController>(
                        id: 'update-ExID',
                        builder: (c) {
                          return selectExtraSkill(
                            text: 'Experience',
                            list: List.generate(
                              c.exSkillsList.length,
                              (index) {
                                final data = c.exSkillsList[index];
                                return skillSelectBox(
                                  skill: data.companyName,
                                  cbValue: c.exSkillIdList
                                      .any((item) => item == data.experienceID),
                                  cbOnChanged: (value) {
                                    log('ID=>${data.experienceID}',
                                        name: 'exID');
                                    c.selectExperienceIDs(data.experienceID);
                                    c.update(['update-ExID']);
                                  },
                                  onTapBox: () {
                                    log('ID=>${data.experienceID}',
                                        name: 'exID');
                                    c.selectExperienceIDs(data.experienceID);
                                    c.update(['update-ExID']);
                                    log('List=>${c.exSkillIdList}',
                                        name: 'exList IDS');
                                  },
                                );
                              },
                            ),
                          );
                        }),
                    hBox,
                    GetBuilder<ProfileSkillController>(
                        id: 'update-EdID',
                        builder: (c) {
                          return selectExtraSkill(
                            text: 'Education',
                            list: List.generate(
                              controller.edSchoolList.length,
                              (index) {
                                final data = c.edSchoolList[index];
                                return skillSelectBox(
                                  skill: data.school,
                                  cbValue: c.edSchoolIdList
                                      .any((item) => item == data.educationID),
                                  cbOnChanged: (value) {
                                    log('ID=>${data.educationID}',
                                        name: 'edID');
                                    c.selectEducationIDs(data.educationID);
                                    c.update(['update-EdID']);
                                    log('List=>${c.edSchoolIdList}',
                                        name: 'education IDS');
                                  },
                                  onTapBox: () {
                                    log('ID=>${data.educationID}',
                                        name: 'edID');
                                    c.selectEducationIDs(data.educationID);
                                    c.update(['update-EdID']);
                                    log('List=>${c.edSchoolIdList}',
                                        name: 'education IDS');
                                  },
                                );
                              },
                            ),
                          );
                        }),
                    hBox,
                    GetBuilder<ProfileSkillController>(
                        id: 'update-LiID',
                        builder: (c) {
                          return selectExtraSkill(
                            text: 'Licenses & certifications',
                            list: List.generate(
                              controller.licenseNameList.length,
                              (index) {
                                final data = c.licenseNameList[index];
                                return skillSelectBox(
                                  skill: data.name,
                                  cbValue: c.liscenseidList
                                      .any((item) => item == data.licenseID),
                                  cbOnChanged: (value) {
                                    log('ID=>${data.licenseID}', name: 'lcID');
                                    c.selectLicenseIDs(data.licenseID);
                                    c.update(['update-LiID']);
                                    log('List=>${c.liscenseidList}',
                                        name: 'License list');
                                  },
                                  onTapBox: () {
                                    log('ID=>${data.licenseID}', name: 'lcID');
                                    c.selectLicenseIDs(data.licenseID);
                                    c.update(['update-LiID']);
                                    log('List=>${c.liscenseidList}',
                                        name: 'License list');
                                  },
                                );
                              },
                            ),
                          );
                        }),
                    hBox,
                    GetBuilder<ProfileSkillController>(
                        id: 'update-PrID',
                        builder: (c) {
                          return selectExtraSkill(
                            text: 'Projects',
                            list: List.generate(
                              controller.projectTitleList.length,
                              (index) {
                                final data = c.projectTitleList[index];
                                return skillSelectBox(
                                  skill: data.title,
                                  cbValue: c.projectIdList
                                      .any((item) => item == data.projectID),
                                  cbOnChanged: (value) {
                                    log('ID=>${data.projectID}', name: 'prID');
                                    c.selectProjectIDs(data.projectID);
                                    c.update(['update-PrID']);
                                    log('List=>${c.projectIdList}',
                                        name: 'project ids');
                                  },
                                  onTapBox: () {
                                    log('ID=>${data.projectID}', name: 'prID');
                                    c.selectProjectIDs(data.projectID);
                                    c.update(['update-PrID']);
                                    log('List=>${c.projectIdList}',
                                        name: 'project ids');
                                  },
                                );
                              },
                            ),
                          );
                        }),
                    hBox,
                    GetBuilder<ProfileSkillController>(
                        id: 'update-courseID',
                        builder: (c) {
                          return selectExtraSkill(
                            text: 'Courses',
                            list: List.generate(
                              controller.courseNameList.length,
                              (index) {
                                final data = c.courseNameList[index];
                                return skillSelectBox(
                                  skill: data.name,
                                  cbValue: c.courseIdList
                                      .any((i) => i == data.courseID),
                                  cbOnChanged: (value) {
                                    log('ID=>${data.courseID}', name: 'crID');
                                    c.selectCourseIDs(data.courseID);
                                    c.update(['update-courseID']);
                                    log('crList=>${c.courseIdList}',
                                        name: 'CourseIds');
                                  },
                                  onTapBox: () {
                                    log('ID=>${data.courseID}', name: 'crID');
                                    c.selectCourseIDs(data.courseID);
                                    c.update(['update-courseID']);
                                    log('crList=>${c.courseIdList}',
                                        name: 'CourseIds');
                                  },
                                );
                              },
                            ),
                          );
                        }),
                    hBox,
                    GetBuilder<ProfileSkillController>(
                        id: 'update-awardIDs',
                        builder: (c) {
                          return selectExtraSkill(
                            text: 'Honors & awards',
                            list: List.generate(
                              controller.awardNameList.length,
                              (index) {
                                final data = c.awardNameList[index];
                                return skillSelectBox(
                                  skill: data.title,
                                  cbValue: c.awardIdList
                                      .any((item) => item == data.awardID),
                                  cbOnChanged: (value) {
                                    log('ID=>${data.awardID}', name: 'awID');
                                    c.selectAwardIDs(data.awardID);
                                    c.update(['update-awardIDs']);
                                    log('awList=>${c.awardIdList}',
                                        name: 'award List');
                                  },
                                  onTapBox: () {
                                    log('ID=>${data.awardID}', name: 'awID');
                                    c.selectAwardIDs(data.awardID);
                                    c.update(['update-awardIDs']);
                                    log('awList=>${c.awardIdList}',
                                        name: 'award List');
                                  },
                                );
                              },
                            ),
                          );
                        }),
                    hMBox,
                    GetBuilder<ProfileSkillController>(
                        id: 'update-permission',
                        builder: (c) {
                          return skillSelectBox(
                            skill:
                                'Follow this skill to keep up with relevant content.',
                            cbValue: c.permission,
                            cbOnChanged: (value) {
                              c.togglePermission();
                              c.update(['update-permission']);
                            },
                            onTapBox: () {
                              c.togglePermission();
                              c.update(['update-permission']);
                            },
                          );
                        }),
                    hLBox,
                    GetBuilder<ProfileSkillController>(
                        id: 'update-skilladdButton',
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
                                textColor: c.skillController.text.isNotEmpty
                                    ? kwhite
                                    : textFieldColor,
                                boxColor: c.skillController.text.isNotEmpty
                                    ? mainPurple
                                    : buttonColor,
                                onTap: () {
                                  if (formKey.currentState!.validate()) {
                                    String newPermission;
                                    c.permission
                                        ? newPermission = 'yes'
                                        : newPermission = 'no';
                                    log(newPermission);
                                    log('Skill=>${c.skillController.text} ExperienceList=>${c.exSkillIdList} educationList=>${c.edSchoolIdList} LicenseList=>${c.liscenseidList} projectList=>${c.projectIdList} CourseList=>${c.courseIdList} awardList=>${c.awardIdList}',
                                        name: 'all Ids-screen');
                                      c.saveSkillInfoFunction(uId: uId, skill: c.skillController.text, exIDs:c.exSkillIdList, edIDs: c.edSchoolIdList, liIDs: c.liscenseidList, prIDs: c.projectIdList, crsIds: c.courseIdList, awIDs: c.awardIdList, permission: newPermission);
                                  }
                                },
                              ),
                            ],
                          );
                        }),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
