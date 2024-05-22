import 'package:aimshala/services/profile_section/update_course_info_service.dart';
import 'package:aimshala/services/profile_section/update_language_info_service.dart';
import 'package:aimshala/view/profile/profile_home/profile_home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LanguageAndCourseController extends GetxController {
  TextEditingController languageController = TextEditingController();
  TextEditingController proficiencyController = TextEditingController();
  TextEditingController courseController = TextEditingController();
  TextEditingController courseNoController = TextEditingController();
  TextEditingController courseAssosiatedController = TextEditingController();

  bool currentlyWorking = false;

/*-----------save and update course---------- */
  Future<void> saveLanguageFunction({
    required String uId,
    required String language,
    required String proficiency,
  }) async {
    String? res = await UpdateLanguageInfoService().saveLanguageInfo(
      uId: uId,
      language: language,
      proficiency: proficiency,
    );
    if (res == 'Language added successfully.') {
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

  Future<void> updateLanguageFunction({
    required String languageID,
    required String uId,
    required String language,
    required String proficiency,
  }) async {
    String? res = await UpdateLanguageInfoService().updateLanguageInfo(
        languageID: languageID,
        uId: uId,
        language: language,
        proficiency: proficiency);
    if (res == 'Language updated successfully.') {
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

/*-----------save and update course---------- */
  Future<void> saveCourseFunction({
    required String uId,
    required String course,
    required String courseNo,
    required String courseAssosiated,
    required String working,
  }) async {
    String? res = await UpdateCourseInfoService().saveCourseInfo(
      uId: uId,
      course: course,
      courseNo: courseNo,
      courseAssosiated: courseAssosiated,
      working: working,
    );
    if (res == 'Course added successfully.') {
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

  Future<void> updateCourseInfo({
    required String uId,
    required String courseID,
    required String course,
    required String courseNo,
    required String courseAssosiated,
    required String working,
  }) async {
    String? res = await UpdateCourseInfoService().updateCourseInfo(
      uId: uId,
      courseID: courseID,
      course: course,
      courseNo: courseNo,
      courseAssosiated: courseAssosiated,
      working: working,
    );
     if (res == 'Course updated successfully.') {
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

  void toggleCurrentlyWorking() {
    currentlyWorking = !currentlyWorking;
    update(['update-workingButton']);
  }

  String? fieldValidation(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please Enter this Filed';
    }
    return null;
  }
}
