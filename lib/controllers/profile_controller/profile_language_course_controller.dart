import 'package:aimshala/services/profile_section/update_course_info_service.dart';
import 'package:aimshala/services/profile_section/update_language_info_service.dart';
import 'package:aimshala/view/profile/profile_home/profile_home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

class LanguageAndCourseController extends GetxController {
  TextEditingController languageController = TextEditingController();
  TextEditingController proficiencyController = TextEditingController();
  TextEditingController courseController = TextEditingController();
  TextEditingController courseNoController = TextEditingController();
  TextEditingController courseAssosiatedController = TextEditingController();
  FlutterSecureStorage storage = const FlutterSecureStorage();

  RxList<String> associatedListdata = <String>[].obs;
  RxBool isSavingLanguage = false.obs;
  RxBool isSavingCourse = false.obs;

/*-----------save and update course---------- */
  Future<void> saveLanguageFunction({
    required String language,
    required String proficiency,
  }) async {
    try {
      isSavingLanguage.value = true;
      String? token = await storage.read(key: 'token');
      String? res = await UpdateLanguageInfoService().saveLanguageInfo(
        token: token.toString(),
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
        Get.off(() => const ProfileHomeScreen(id: ''));
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
    } finally {
      isSavingLanguage.value = false;
    }
  }

  Future<void> updateLanguageFunction({
    required String languageID,
    required String language,
    required String proficiency,
  }) async {
    try {
      isSavingLanguage.value = true;
      String? token = await storage.read(key: 'token');
      String? res = await UpdateLanguageInfoService().updateLanguageInfo(
          languageID: languageID,
          token: token.toString(),
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
        Get.off(() => const ProfileHomeScreen(id: ''));
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
    } finally {
      isSavingLanguage.value = false;
    }
  }

  Future<void> deleteLanguageFunction({required String languageID}) async {
    String? res = await UpdateLanguageInfoService()
        .deleteLanguageInfo(languageID: languageID);
    if (res == 'Language deleted successfully') {
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
      Get.off(() => const ProfileHomeScreen(id: ''));
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
      Get.off(() => const ProfileHomeScreen(id: ''));
    }
  }

/*-----------save and update course---------- */
  Future<void> saveCourseFunction({
    required String course,
    required String courseNo,
    required String courseAssosiated,
  }) async {
    try {
      isSavingCourse.value = true;
      String? token = await storage.read(key: 'token');
      String? res = await UpdateCourseInfoService().saveCourseInfo(
        token: token.toString(),
        course: course,
        courseNo: courseNo,
        courseAssosiated: courseAssosiated,
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
        Get.off(() => const ProfileHomeScreen(id: ''));
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
    } finally {
      isSavingCourse.value = false;
    }
  }

  Future<void> updateCourseInfo({
    required String courseID,
    required String course,
    required String courseNo,
    required String courseAssosiated,
  }) async {
    try {
      isSavingCourse.value = true;
      String? token = await storage.read(key: 'token');
      String? res = await UpdateCourseInfoService().updateCourseInfo(
        token: token.toString(),
        courseID: courseID,
        course: course,
        courseNo: courseNo,
        courseAssosiated: courseAssosiated,
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
        Get.off(() => const ProfileHomeScreen(id: ''));
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
    } finally {
      isSavingCourse.value = false;
    }
  }

  Future<void> deleteCourseInfo({required String courseID}) async {
    String? res =
        await UpdateCourseInfoService().deleteCourseInfo(courseID: courseID);
    if (res == 'course deleted successfully') {
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
      Get.off(() => const ProfileHomeScreen(id: ''));
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
      Get.off(() => const ProfileHomeScreen(id: ''));
    }
  }
/*-----------save and update course---------- */

  String? fieldValidation(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please Enter this Filed';
    }
    return null;
  }

  void clearLanguageControllers() {
    languageController.clear();
    proficiencyController.clear();
  }

  void clearCourseController() {
    courseController.clear();
    courseNoController.clear();
    courseAssosiatedController.clear();
  }
}
