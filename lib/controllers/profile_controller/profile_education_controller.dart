import 'dart:developer';
import 'dart:io';
import 'package:aimshala/controllers/profile_controller/profile_honoraward_controller.dart';
import 'package:aimshala/models/profile_model/add_media_model.dart';
import 'package:aimshala/services/profile_section/update_education_info_service.dart';
import 'package:aimshala/utils/common/widgets/colors_common.dart';
import 'package:aimshala/view/profile/profile_home/profile_home.dart';
import 'package:flutter/material.dart';
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

  DateTime dateTime = DateTime.now();
  RxList<String> addedSkill = <String>[].obs;
  File? selectedImage;
  File? selectedCamera;
  RxList<AddMediaModel> allMediasModel = <AddMediaModel>[].obs;
  Rx<Color> saveText = Rx<Color>(textFieldColor);
  Rx<Color> saveBG = Rx<Color>(buttonColor);

  Future<void> saveEducationInfo({
    required String uId,
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
    String? res = await UpdateEducationInfoService().saveEducationInfo(
      uId: uId,
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
      Get.off(() => ProfileHomeScreen(id: uId));
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

  Future<void> updateEducationInfo({
    required String edID,
    required String uId,
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
    String? res = await UpdateEducationInfoService().updateEducationInfo(
      edID: edID,
      uId: uId,
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
      Get.off(() => ProfileHomeScreen(id: uId));
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

  Future<void> deleteEducationFunction(
      {required String eduID, required String uId,required String school}) async {
    String? res =
        await UpdateEducationInfoService().deleteEducationInfo(eduID: eduID);
    final awardC = Get.put(ProfileHonorsAwardsController());
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
      Get.off(() => ProfileHomeScreen(id: uId));
      awardC.assosiatedListdata.remove(school);
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
      Get.off(() => ProfileHomeScreen(id: uId));
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
        startdateController.text = formatedDate;
        update(['update-educationInfo']);
      } else {
        final formatedDate = DateFormat('dd-MM-yyyy').format(picker);
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
        descriptionController.text.isNotEmpty &&
        addedSkill.isNotEmpty &&
        allMediasModel.isNotEmpty;
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
