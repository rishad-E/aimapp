import 'dart:developer';
import 'package:aimshala/controllers/profile_controller/profile_skill_info_controller.dart';
import 'package:aimshala/models/profile_model/profile_section_data_model.dart';
import 'package:aimshala/utils/common/widgets/colors_common.dart';
import 'package:aimshala/utils/common/widgets/text_common.dart';
import 'package:aimshala/utils/widgets/widgets_common.dart';
import 'package:aimshala/view/profile/common/widgets/texts.dart';
import 'package:aimshala/view/profile/common/widgets/widgets.dart';
import 'package:aimshala/view/profile/profile_add_skill_section/widgets/widgets_skill.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class ProfileAddSkillScreen extends StatelessWidget {
  final Skill? skill;
  ProfileAddSkillScreen({super.key, this.skill});
  final GlobalKey<FormState> formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProfileSkillController());
    String? skID;
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      skID = skill?.id.toString();
      initializeFields(controller, skill);
    });
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
                      child: profileRichText('Add', 'Skill'),
                    ),
                    hLBox,
                    skillInfoFiled(
                      text: primarytxt3('Skill', 9.5.sp),
                      textField: TextFormField(
                        controller: controller.skillController,
                        validator: (value) => controller.fieldValidation(value),
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        onChanged: (value) =>
                            controller.update(['update-skilladdButton']),
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
                                children: List.generate(
                                    data.length,
                                    (index) => GestureDetector(
                                          onTap: () {
                                            log('Ontap suggested skill=>${data[index]}');
                                            controller.skillController.text =
                                                data[index];
                                            controller.update(
                                                ['update-skilladdButton']);
                                          },
                                          child: suggestedSkills(data[index]),
                                        )),
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
                          return c.exSkillsList.isEmpty
                              ? shrinked
                              : selectExtraSkill(
                                  text: 'Experience',
                                  list: List.generate(
                                    c.exSkillsList.length,
                                    (index) {
                                      final data = c.exSkillsList[index];
                                      return skillSelectBox(
                                        skill: data.companyName,
                                        cbValue: c.exSkillIdList.any((item) =>
                                            item == data.experienceID),
                                        cbOnChanged: (value) {
                                          c.selectExperienceIDs(
                                              data.experienceID);
                                          c.update(['update-ExID']);
                                        },
                                        onTapBox: () {
                                          c.selectExperienceIDs(
                                              data.experienceID);
                                          c.update(['update-ExID']);
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
                          return c.edSchoolList.isEmpty
                              ? shrinked
                              : selectExtraSkill(
                                  text: 'Education',
                                  list: List.generate(
                                    c.edSchoolList.length,
                                    (index) {
                                      final data = c.edSchoolList[index];
                                      return skillSelectBox(
                                        skill: data.school,
                                        cbValue: c.edSchoolIdList.any(
                                            (item) => item == data.educationID),
                                        cbOnChanged: (value) {
                                          c.selectEducationIDs(
                                              data.educationID);
                                          c.update(['update-EdID']);
                                        },
                                        onTapBox: () {
                                          c.selectEducationIDs(
                                              data.educationID);
                                          c.update(['update-EdID']);
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
                          return c.licenseNameList.isEmpty
                              ? shrinked
                              : selectExtraSkill(
                                  text: 'Licenses & certifications',
                                  list: List.generate(
                                    c.licenseNameList.length,
                                    (index) {
                                      final data = c.licenseNameList[index];
                                      return skillSelectBox(
                                        skill: data.name,
                                        cbValue: c.liscenseidList.any(
                                            (item) => item == data.licenseID),
                                        cbOnChanged: (value) {
                                          c.selectLicenseIDs(data.licenseID);
                                          c.update(['update-LiID']);
                                        },
                                        onTapBox: () {
                                          c.selectLicenseIDs(data.licenseID);
                                          c.update(['update-LiID']);
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
                          return c.projectTitleList.isEmpty
                              ? shrinked
                              : selectExtraSkill(
                                  text: 'Projects',
                                  list: List.generate(
                                    c.projectTitleList.length,
                                    (index) {
                                      final data = c.projectTitleList[index];
                                      return skillSelectBox(
                                        skill: data.title,
                                        cbValue: c.projectIdList.any(
                                            (item) => item == data.projectID),
                                        cbOnChanged: (value) {
                                          c.selectProjectIDs(data.projectID);
                                          c.update(['update-PrID']);
                                        },
                                        onTapBox: () {
                                          c.selectProjectIDs(data.projectID);
                                          c.update(['update-PrID']);
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
                          return c.courseNameList.isEmpty
                              ? shrinked
                              : selectExtraSkill(
                                  text: 'Courses',
                                  list: List.generate(
                                    c.courseNameList.length,
                                    (index) {
                                      final data = c.courseNameList[index];
                                      return skillSelectBox(
                                        skill: data.name,
                                        cbValue: c.courseIdList
                                            .any((i) => i == data.courseID),
                                        cbOnChanged: (value) {
                                          c.selectCourseIDs(data.courseID);
                                          c.update(['update-courseID']);
                                        },
                                        onTapBox: () {
                                          c.selectCourseIDs(data.courseID);
                                          c.update(['update-courseID']);
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
                          return c.awardNameList.isEmpty
                              ? shrinked
                              : selectExtraSkill(
                                  text: 'Honors & awards',
                                  list: List.generate(
                                    c.awardNameList.length,
                                    (index) {
                                      final data = c.awardNameList[index];
                                      return skillSelectBox(
                                        skill: data.title,
                                        cbValue: c.awardIdList.any(
                                            (item) => item == data.awardID),
                                        cbOnChanged: (value) {
                                          c.selectAwardIDs(data.awardID);
                                          c.update(['update-awardIDs']);
                                        },
                                        onTapBox: () {
                                          c.selectAwardIDs(data.awardID);
                                          c.update(['update-awardIDs']);
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
                              saveContainer(
                                boxColor: kwhite,
                                borderColor: mainPurple,
                                onTap: () => Get.back(),
                                child: saveContainerText(
                                    text: 'Cancel', textColor: mainPurple),
                              ),
                              wMBox,
                              saveContainer(
                                boxColor: c.skillController.text.isNotEmpty
                                    ? mainPurple
                                    : buttonColor,
                                child: Obx(
                                  () => c.isSaving.value
                                      ? CircularProgressIndicator(
                                          color: kwhite,
                                          strokeWidth: 1,
                                        )
                                      : saveContainerText(
                                          text: 'Save',
                                          textColor:
                                              c.skillController.text.isNotEmpty
                                                  ? kwhite
                                                  : textFieldColor),
                                ),
                                onTap: () {
                                  if (formKey.currentState!.validate()) {
                                    String newPermission;
                                    c.permission
                                        ? newPermission = 'yes'
                                        : newPermission = 'no';
                                    log(newPermission);
                                    log('Skill=>${c.skillController.text} ExperienceList=>${c.exSkillIdList} educationList=>${c.edSchoolIdList} LicenseList=>${c.liscenseidList} projectList=>${c.projectIdList} CourseList=>${c.courseIdList} awardList=>${c.awardIdList}',
                                        name: 'all Ids-screen');
                                    skill == null
                                        ? c.saveSkillInfoFunction(
                                            skill: c.skillController.text,
                                            exIDs: c.exSkillIdList,
                                            edIDs: c.edSchoolIdList,
                                            liIDs: c.liscenseidList,
                                            prIDs: c.projectIdList,
                                            crsIds: c.courseIdList,
                                            awIDs: c.awardIdList,
                                            permission: newPermission,
                                          )
                                        : c.updateSkillFunction(
                                            skID: skID.toString(),
                                            skill: c.skillController.text,
                                            exIDs: c.exSkillIdList,
                                            edIDs: c.edSchoolIdList,
                                            liIDs: c.liscenseidList,
                                            prIDs: c.projectIdList,
                                            crsIds: c.courseIdList,
                                            awIDs: c.awardIdList,
                                            permission: newPermission,
                                          );
                                  }
                                },
                              ),
                            ],
                          );
                        }),
                    hBox,
                    skill == null
                        ? shrinked
                        : Align(
                            alignment: Alignment.center,
                            child: deleteSectionWidget(
                                onPressed: () => controller.deleteSkillFuntion(
                                    skID: skID.toString()),
                                section: 'Skill'),
                          )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void initializeFields(ProfileSkillController c, Skill? skill) {
    if (skill == null) return;

    c.skillController.text = skill.skillName.toString();
    List<String>? experience = skill.experiencesId;
    if (experience != null && experience.isNotEmpty) {
      for (var item in experience) {
        if (!c.exSkillIdList.contains(item)) {
          c.exSkillIdList.add(item);
          c.update(['update-ExID']);
        }
      }
    }
    List<String>? education = skill.educationsId;
    if (education != null && education.isNotEmpty) {
      for (var item in education) {
        if (!c.edSchoolIdList.contains(item)) {
          c.edSchoolIdList.add(item);
          c.update(['update-EdID']);
        }
      }
    }
    List<String>? license = skill.licensesId;
    if (license != null && license.isNotEmpty) {
      for (var item in license) {
        if (!c.liscenseidList.contains(item)) {
          c.liscenseidList.add(item);
          c.update(['update-LiID']);
        }
      }
    }
    List<String>? project = skill.projectsId;
    if (project != null && project.isNotEmpty) {
      for (var item in project) {
        if (!c.projectIdList.contains(item)) {
          c.projectIdList.add(item);
          c.update(['update-PrID']);
        }
      }
    }
    List<String>? course = skill.coursesId;
    if (course != null && course.isNotEmpty) {
      for (var item in course) {
        if (!c.courseIdList.contains(item)) {
          c.courseIdList.add(item);
          c.update(['update-courseID']);
        }
      }
    }
    List<String>? award = skill.awardsId;
    if (award != null && award.isNotEmpty) {
      for (var item in award) {
        if (!c.awardIdList.contains(item)) {
          c.awardIdList.add(item);
          c.update(['update-awardIDs']);
        }
      }
    }
    if (skill.followupPermission == "yes") {
      c.permission = true;
      c.update(['update-permission']);
    }
    c.update(['update-skilladdButton']);
  }
}
