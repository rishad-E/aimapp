import 'dart:developer';

import 'package:aimshala/models/profile_model/profile_all_data_model.dart';
import 'package:aimshala/services/profile_section/profile_get_all_data.dart';
import 'package:aimshala/services/profile_section/update_skill_info_service.dart';
import 'package:aimshala/view/profile/profile_add_skill_section/model/skill_models.dart';
import 'package:aimshala/view/profile/profile_home/profile_home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileSkillController extends GetxController {
  TextEditingController skillController = TextEditingController();
  RxList<String> suggestedSkills = <String>[].obs;
  ProfileAlldataModel? alldataModel;
  RxBool loading = true.obs;
  RxString? error;
  /*------- model class lists------*/
  List<Education> education = [];
  List<Experience> experience = [];
  List<License> license = [];
  List<Project> project = [];
  List<Course> course = [];
  List<Award> award = [];
  /*------- model class lists------*/

  /*------- lists to show in add skill screen ------*/
  List<ExperienceModel> exSkillsList = [];
  List<EducationModel> edSchoolList = [];
  List<LicenseModel> licenseNameList = [];
  List<ProjectModel> projectTitleList = [];
  List<CourseModel> courseNameList = [];
  List<AwardModel> awardNameList = [];
  /*------- lists to show in add skill screen ------*/

  /*------- final selected lists to pass ------*/
  List<String> exSkillIdList = [];
  List<String> edSchoolIdList = [];
  List<String> liscenseidList = [];
  List<String> projectIdList = [];
  List<String> courseIdList = [];
  List<String> awardIdList = [];
  /*------- final selected lists to pass ------*/
  bool permission = false;

  /*------- funtion to save skill info ------*/
  Future<void> saveSkillInfoFunction({
    required String uId,
    required String skill,
    required List<String> exIDs,
    required List<String> edIDs,
    required List<String> liIDs,
    required List<String> prIDs,
    required List<String> crsIds,
    required List<String> awIDs,
    required String permission,
  }) async {
    String? res = await UpdateSkillInfoService().saveAddSkillService(
      uId: uId,
      skill: skill,
      exIDs: exIDs,
      edIDs: edIDs,
      liIDs: liIDs,
      prIDs: prIDs,
      crsIds: crsIds,
      awIDs: awIDs,
      permission: permission,
    );
    if (res == 'Skill added successfully.') {
      Get.showSnackbar(
        GetSnackBar(
          snackStyle: SnackStyle.FLOATING,
          message: res,
          borderRadius: 4,
          margin: const EdgeInsets.all(10),
          backgroundColor: Colors.green,
          duration: const Duration(seconds: 2),
        ),
      );
      Get.off(() => const ProfileHomeScreen());
    } else {
      Get.showSnackbar(
        GetSnackBar(
          snackStyle: SnackStyle.FLOATING,
          message: res,
          borderRadius: 4,
          margin: const EdgeInsets.all(10),
          backgroundColor: Colors.red,
          duration: const Duration(seconds: 2),
        ),
      );
    }
  }
  /*------- funtion to save skill info ------*/

  /*------- functions to extract items needed to pass with skill section ------*/
  Future<void> getProfileAlldataFunction({required String uId}) async {
    try {
      dynamic alldata = await GetProfileAllData().fetchProfileAlldata(uId: uId);
      if (alldata != null) {
        /* -------extracting experience---------- */
        List<dynamic> experiencedata = alldata["experiences"];
        if (experiencedata.isNotEmpty) {
          experience =
              experiencedata.map((json) => Experience.fromJson(json)).toList();
          // log(experience.toString(), name: 'all data');
          if (experience.isNotEmpty) {
            for (var i = 0; i < experience.length; i++) {
              String company = experience[i].companyName.toString();
              String id = experience[i].id.toString();
              ExperienceModel model =
                  ExperienceModel(companyName: company, experienceID: id);
              if (!exSkillsList
                  .any((item) => item.companyName == model.companyName)) {
                exSkillsList.add(model);
                log('added', name: 'add to EXskill list');
              } else {
                log('contais', name: 'add to EXskill list');
              }

              log(exSkillsList.toString(), name: 'newskills c');
            }
          }
        }

        /* -------extracting education---------- */
        List<dynamic> educationdata = alldata["educations"];
        if (educationdata.isNotEmpty) {
          education =
              educationdata.map((json) => Education.fromJson(json)).toList();
          if (education.isNotEmpty) {
            for (var i = 0; i < education.length; i++) {
              String school = education[i].school.toString();
              String id = education[i].id.toString();
              EducationModel model =
                  EducationModel(school: school, educationID: id);
              if (!edSchoolList.any((item) => item.school == model.school)) {
                edSchoolList.add(model);
                log('added', name: 'add to edSchool list');
              } else {
                log('contais', name: 'add to edSchool list');
              }
              log(edSchoolList.toString(), name: 'newEducationList c');
            }
          }
          log(edSchoolList.toString(), name: 'newEducationList data');
        }

        /* -------extracting license---------- */
        List<dynamic> licensedata = alldata["licenses"];
        if (licensedata.isNotEmpty) {
          license = licensedata.map((json) => License.fromJson(json)).toList();
          if (license.isNotEmpty) {
            for (var i = 0; i < license.length; i++) {
              String name = license[i].name.toString();
              String id = license[i].id.toString();
              LicenseModel model = LicenseModel(name: name, licenseID: id);
              if (!licenseNameList.any((item) => item.name == model.name)) {
                licenseNameList.add(model);
                log('added', name: 'add to licenseNameList list');
              } else {
                log('contais', name: 'licenseNameList list');
              }
            }
          }
          log(licenseNameList.toString(), name: 'New licenseNameList c');
        }

        /* -------extracting projects---------- */
        List<dynamic> projectdata = alldata["projects"];
        if (projectdata.isNotEmpty) {
          project = projectdata.map((json) => Project.fromJson(json)).toList();
          if (project.isNotEmpty) {
            for (var i = 0; i < project.length; i++) {
              String title = project[i].title.toString();
              String id = project[i].id.toString();
              ProjectModel model = ProjectModel(title: title, projectID: id);
              if (!projectTitleList.any((item) => item.title == model.title)) {
                projectTitleList.add(model);
                log('added', name: 'add to projectTitleList list');
              } else {
                log('contais', name: ' projectTitleList list');
              }
            }
          }
          log(projectTitleList.toString(), name: 'New projectTitleList c');
        }
        /* -------extracting courses---------- */
        List<dynamic> coursedata = alldata["courses"];
        if (coursedata.isNotEmpty) {
          course = coursedata.map((e) => Course.fromJson(e)).toList();
          if (course.isNotEmpty) {
            for (var i = 0; i < course.length; i++) {
              String name = course[i].courseName.toString();
              String id = course[i].id.toString();
              CourseModel model = CourseModel(name: name, courseID: id);
              if (!courseNameList.any((i) => i.name == model.name)) {
                courseNameList.add(model);
                log('added', name: 'add to courseNameList list');
              } else {
                log('contais', name: ' courseNameList list');
              }
            }
          }
          log(courseNameList.toString(), name: 'New courseNameList c');
        }

        /* -------extracting award---------- */
        List<dynamic> awardData = alldata["awards"];
        if (awardData.isNotEmpty) {
          award = awardData.map((e) => Award.fromJson(e)).toList();
          if (award.isNotEmpty) {
            for (var i = 0; i < award.length; i++) {
              String title = award[i].title.toString();
              String id = award[i].id.toString();
              AwardModel model = AwardModel(title: title, awardID: id);
              if (!awardNameList.any((i) => i.title == model.title)) {
                awardNameList.add(model);
                log('added', name: 'add to awardNameList list');
              } else {
                log('contais', name: ' awardNameList list');
              }
            }
          }
          log(awardNameList.toString(), name: 'New awardNameList c');
        }
      }
    } catch (e) {
      log('Error fetching profile data: $e');
    }
  }

  /*------- fuction to get suggested skills ------*/
  Future<void> getSuggestedSkillsFunction() async {
    List<String> suggested =
        await UpdateSkillInfoService().getSuggestedSkills();
    suggestedSkills.assignAll(suggested);
    log(suggestedSkills.toString(), name: 'suggested skill-c');
    log(exSkillsList.toString(), name: 'newskills c');

    try {
      loading.value = true;
      List<String> skills = await UpdateSkillInfoService().getSuggestedSkills();
      suggestedSkills.assignAll(skills);
      loading.value = false;
    } catch (e) {
      // Handle error
      loading.value = false;
      error?.value = e.toString();
      log('Error fetching suggested skills: $e');
    }
  }

  /*-------functions for selecting final lists to pass ------*/
  void selectExperienceIDs(String exId) {
    if (!exSkillIdList.contains(exId)) {
      exSkillIdList.add(exId);
    } else {
      exSkillIdList.remove(exId);
    }
    update(['update-ExID']);
  }

  void selectEducationIDs(String edID) {
    if (!edSchoolIdList.contains(edID)) {
      edSchoolIdList.add(edID);
    } else {
      edSchoolIdList.remove(edID);
    }
    update(['update-EdID']);
  }

  void selectLicenseIDs(String liID) {
    if (!liscenseidList.contains(liID)) {
      liscenseidList.add(liID);
    } else {
      liscenseidList.remove(liID);
    }
    update(['update-LiID']);
  }

  void selectProjectIDs(String prID) {
    if (!projectIdList.contains(prID)) {
      projectIdList.add(prID);
    } else {
      projectIdList.remove(prID);
    }
    update(['update-PrID']);
  }

  void selectCourseIDs(String courseID) {
    if (!courseIdList.contains(courseID)) {
      courseIdList.add(courseID);
    } else {
      courseIdList.remove(courseID);
    }
    update(['update-courseID']);
  }

  void selectAwardIDs(String awardID) {
    if (!awardIdList.contains(awardID)) {
      awardIdList.add(awardID);
    } else {
      awardIdList.remove(awardID);
    }
    update(['update-awardIDs']);
  }
  /*-------functions for selecting final lists to pass ------*/

  void togglePermission() {
    permission = !permission;
    update(['update-permission']);
  }

  String? fieldValidation(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please Enter this Field';
    }
    return null;
  }
}




//  /* -------extracting experience---------- */
//         List<dynamic> experiencedata = alldata["experiences"];
//         if (experiencedata.isNotEmpty) {
//           experience =
//               experiencedata.map((json) => Experience.fromJson(json)).toList();
//           // log(experience.toString(), name: 'all data');
//           if (experience.isNotEmpty) {
//             for (var i = 0; i < experience.length; i++) {
//               String skill = experience[i].skills.toString();
//               List<String> skillsSplit = skill.split(',');
//               // skillsList.addAll(skillsSplit);
//               for (var split in skillsSplit) {
//                 if (!exSkillsList.contains(split)) {
//                   exSkillsList.add(split);
//                   log('added', name: 'add to EXskill list');
//                 } else {
//                   log('contais', name: 'add to EXskill list');
//                 }
//               }
//               log(exSkillsList.toString(), name: 'newskills c');
//             }
//           }
//         }