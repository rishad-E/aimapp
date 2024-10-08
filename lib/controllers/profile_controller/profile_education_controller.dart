import 'dart:developer';
import 'dart:io';
import 'package:aimshala/controllers/profile_controller/profile_honoraward_controller.dart';
import 'package:aimshala/controllers/profile_controller/profile_language_course_controller.dart';
import 'package:aimshala/controllers/profile_controller/profile_project_controller.dart';
import 'package:aimshala/models/profile_model/add_media_model.dart';
import 'package:aimshala/services/profile_section/update_education_info_service.dart';
import 'package:aimshala/services/profile_section/update_skill_info_service.dart';
import 'package:aimshala/utils/common/widgets/colors_common.dart';
import 'package:aimshala/view/profile/profile_home/profile_home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class ProfileEducationController extends GetxController {
  TextEditingController schoolController = TextEditingController();
  TextEditingController degreeController = TextEditingController();
  TextEditingController studyFiledController = TextEditingController();
  TextEditingController startdateController = TextEditingController();
  TextEditingController endDateController = TextEditingController();
  TextEditingController gradeController = TextEditingController();
  TextEditingController activitiesController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController mediaTitleController = TextEditingController();
  TextEditingController mediaDescriptionController = TextEditingController();
  TextEditingController mediaLinkController = TextEditingController();
  FlutterSecureStorage storage = const FlutterSecureStorage();

  DateTime dateTime = DateTime.now();
  RxList<String> addedSkill = <String>[].obs;
  File? selectedImage;
  File? selectedCamera;
  RxList<AddMediaModel> allMediasModel = <AddMediaModel>[].obs;
  Rx<Color> saveText = Rx<Color>(textFieldColor);
  Rx<Color> saveBG = Rx<Color>(buttonColor);

  String? startdateBackend;
  String? enddateBackend;
  List<String> suggestedSkill = [];
  RxBool isSaving = false.obs;

  Future<void> saveEducationInfo({
    required String school,
    required String degree,
    required String studyfield,
    required String startDate,
    required String endDate,
    required String grade,
    required String activities,
    required String description,
    required List<String> mediaTitle,
    required List<String> mediaDescription,
    required List<String> mediaLinks,
    required List<File> images,
    required List<String> skills,
  }) async {
    try {
      isSaving.value = true;
      String? token = await storage.read(key: 'token');
      String? res = await UpdateEducationInfoService().saveEducationInfo(
        token: token.toString(),
        school: school,
        degree: degree,
        studyfield: studyfield,
        startDate: startDate,
        endDate: endDate,
        grade: grade,
        activities: activities,
        description: description,
        mediaTitle: mediaTitle,
        mediaDescription: mediaDescription,
        mediaLinks: mediaLinks,
        images: images,
        skills: skills,
      );
      if (res == 'Education details added successfully.') {
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
    } finally {
      isSaving.value = false;
    }
    update(['update-educationInfo']);
  }

  Future<void> updateEducationInfo(
      {required String edID,
      required String school,
      required String degree,
      required String studyfield,
      required String startDate,
      required String endDate,
      required String grade,
      required String activities,
      required String description,
      required List<String> mediaTitle,
      required List<String> mediaDescription,
      required List<String> mediaLinks,
      required List<File> images,
      required List<String> skills,
      required List<String> mediaUrl}) async {
    try {
      isSaving.value = true;
      String? token = await storage.read(key: 'token');
      String? res = await UpdateEducationInfoService().updateEducationInfo(
          edID: edID,
          token: token.toString(),
          school: school,
          degree: degree,
          studyfield: studyfield,
          startDate: startDate,
          endDate: endDate,
          grade: grade,
          activities: activities,
          description: description,
          mediaTitle: mediaTitle,
          mediaDescription: mediaDescription,
          mediaLinks: mediaLinks,
          images: images,
          skills: skills,
          mediaUrl: mediaUrl);
      if (res == "Education details updated successfully.") {
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
    } finally {
      isSaving.value = false;
    }
  }

  Future<void> deleteEducationFunction(
      {required String eduID, required String school}) async {
    String? res =
        await UpdateEducationInfoService().deleteEducationInfo(eduID: eduID);
    final awardC = Get.put(ProfileHonorsAwardsController());
    final projectC = Get.put(ProfileProjectController());
    final courseC = Get.put(LanguageAndCourseController());

    if (res == "Education deleted successfully") {
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
      awardC.assosiatedListdata.removeWhere((i) => i.contains(school));
      projectC.associatedListdata.removeWhere((i) => i.contains(school));
      courseC.associatedListdata.removeWhere((i) => i.contains(school));
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
      Get.off(() => const ProfileHomeScreen());
    }
  }

  Future<void> datePicker(BuildContext context, {bool? start}) async {
    final DateTime? picker = await showDatePicker(
      context: context,
      initialDate: dateTime,
      firstDate: DateTime(2000),
      lastDate: DateTime(2050),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.dark().copyWith(
            colorScheme: const ColorScheme.dark(
              primary: Colors.purple, // Header background color
              onPrimary: Colors.white, // Header text color
              //   surface: Colors.grey.shade300, // Calendar background color
              //   onSurface: Colors.black, // Calendar text color
            ),

            dialogBackgroundColor: Colors.white, // Dialog background color
          ),
          child: child!,
        );
      },
    );
    if (picker != null && picker != dateTime) {
      if (start == true) {
        final formatedDate = DateFormat('dd-MM-yyyy').format(picker);
        startdateBackend = DateFormat('yyyy-MM-dd').format(picker);
        startdateController.text = formatedDate;
        update(['update-educationInfo']);
      } else {
        final formatedDate = DateFormat('dd-MM-yyyy').format(picker);
        enddateBackend = DateFormat('yyyy-MM-dd').format(picker);
        endDateController.text = formatedDate;
        update(['update-educationInfo']);
      }
    }
  }

  Future<File?> pickImageMedia() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile == null) return null;
    selectedImage = File(pickedFile.path);
    log(selectedImage.toString(), name: 'cheeeeeeeeeecccccccccccck');
    return selectedImage;
  }

  Future<File?> pickCameraMedia() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.camera);
    if (pickedFile == null) return null;
    selectedCamera = File(pickedFile.path);
    return selectedCamera;
  }

  Future<void> getSuggestedSkills() async {
    try {
      // loading.value = true;
      List<String> skills = await UpdateSkillInfoService().getSuggestedSkills();
      suggestedSkill.assignAll(skills);
      update(['add-skill']);
      // loading.value = false;
    } catch (e) {
      // Handle error
      // loading.value = false;
      // error?.value = e.toString();
      log('Error fetching suggested skills: $e');
    }
  }

  void addMediaFields({
    required File? file,
    required String title,
    required String description,
    String? link,
  }) {
    AddMediaModel model = AddMediaModel(
        file: file, title: title, description: description, mediaLink: link);
    allMediasModel.add(model);
    updateSaveButton();
    update(['update-educationInfo']);
  }

  String? filedValidation(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please Fill this filed';
    }
    return null;
  }

  String? mediaLinkValidation(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please Fill this filed';
    }
    if (!value.isURL) {
      return 'Please Enter a Valid URL';
    }
    return null;
  }

  void updateSaveButton() {
    bool isAllFiledSelected = schoolController.text.isNotEmpty &&
        degreeController.text.isNotEmpty &&
        studyFiledController.text.isNotEmpty &&
        startdateController.text.isNotEmpty &&
        endDateController.text.isNotEmpty &&
        gradeController.text.isNotEmpty &&
        activitiesController.text.isNotEmpty &&
        descriptionController.text.isNotEmpty;
    saveText.value = isAllFiledSelected ? kwhite : textFieldColor;
    saveBG.value = isAllFiledSelected ? mainPurple : buttonColor;
    update(['update-educationInfo']);
  }

  void clearallFields() {
    schoolController.clear();
    degreeController.clear();
    studyFiledController.clear();
    startdateController.clear();
    endDateController.clear();
    gradeController.clear();
    activitiesController.clear();
    descriptionController.clear();
    addedSkill.clear();
    allMediasModel.clear();
    updateSaveButton();
  }
}
