import 'dart:io';
import 'package:aimshala/models/profile_model/add_media_model.dart';
import 'package:aimshala/services/profile_section/update_experience_info_service.dart';
import 'package:aimshala/utils/common/colors_common.dart';
import 'package:aimshala/view/profile/profile_home/profile_home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class ProfileExperienceController extends GetxController {
  TextEditingController titleController = TextEditingController();
  TextEditingController employmentController = TextEditingController();
  TextEditingController companyController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController locationTypeController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController profileController = TextEditingController();
  TextEditingController startDateController = TextEditingController();
  TextEditingController endDateController = TextEditingController();
  TextEditingController mediaTitleController = TextEditingController();
  TextEditingController mediaDescriptionController = TextEditingController();

  RxBool currentlyWorking = false.obs;

  DateTime dateTime = DateTime.now();
  RxList<String> addedSkillEX = <String>[].obs;
  File? selectedImageEX;
  File? selectedCameraEX;
  RxList<AddMediaModel> allMediasEX = <AddMediaModel>[].obs;

  Rx<Color> saveText = Rx<Color>(textFieldColor);
  Rx<Color> saveBG = Rx<Color>(buttonColor);

  Future<void> saveExperienceInfoFunction({
    required String uId,
    required String title,
    required String employee,
    required String company,
    required String location,
    required String locationtype,
    required String currentlyWorking,
    required String startDate,
    required String endDate,
    required String description,
    required String profile,
    required List<String> mediaTitle,
    required List<String> mediaDescription,
    required List<File> imagesEX,
    required List<String> skillsEX,
  }) async {
    String? res = await UpdateExperienceInfoService().saveExperienceInfo(
      uId: uId,
      title: title,
      employee: employee,
      company: company,
      location: location,
      locationtype: locationtype,
      currentlyWorking: currentlyWorking,
      startDate: startDate,
      endDate: endDate,
      description: description,
      profile: profile,
      mediaTitle: mediaTitle,
      mediaDescription: mediaDescription,
      imagesEX: imagesEX,
      skillsEX: skillsEX,
    );
    if (res == 'Experience details added successfully.') {
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

  Future<void> updateExperienceFunction({
    required String exID,
    required String uId,
    required String title,
    required String employee,
    required String company,
    required String location,
    required String locationtype,
    required String currentlyWorking,
    required String startDate,
    required String endDate,
    required String description,
    required String profile,
    required List<String> mediaTitle,
    required List<String> mediaDescription,
    required List<File> imagesEX,
    required List<String> skillsEX,
  }) async {
    String? res = await UpdateExperienceInfoService().updateExperienceInfo(
      exID: exID,
      uId: uId,
      title: title,
      employee: employee,
      company: company,
      location: location,
      locationtype: locationtype,
      currentlyWorking: currentlyWorking,
      startDate: startDate,
      endDate: endDate,
      description: description,
      profile: profile,
      mediaTitle: mediaTitle,
      mediaDescription: mediaDescription,
      imagesEX: imagesEX,
      skillsEX: skillsEX,
    );
    if (res == 'Experience details updated successfully.') {
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
        startDateController.text = formatedDate;
        updateSaveButtonEX();
      } else {
        final formatedDate = DateFormat('dd-MM-yyyy').format(picker);
        endDateController.text = formatedDate;
        updateSaveButtonEX();
      }
    }
  }

  Future<File?> pickImageMediaEX() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile == null) return null;
    selectedImageEX = File(pickedFile.path);
    // allMediasEX.add(selectedImageEX);
    // updateSaveButtonEX();
    return selectedImageEX;
  }

  Future<File?> pickCameraMediaEX() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.camera);
    if (pickedFile == null) return null;
    selectedCameraEX = File(pickedFile.path);
    // allMediasEX.add(selectedCameraEX);
    // updateSaveButtonEX();
    return selectedCameraEX;
  }

  String? filedValidation(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please fill this filed';
    }
    return null;
  }

  void addMediaModelEx({
    required String title,
    required String description,
    File? file,
  }) {
    AddMediaModel model =
        AddMediaModel(file: file, title: title, description: description);
    allMediasEX.add(model);
    updateSaveButtonEX();
    update(['update-experienceInfo']);
  }

  void updateSaveButtonEX() {
    bool isAllFiledSelected = titleController.text.isNotEmpty &&
        employmentController.text.isNotEmpty &&
        companyController.text.isNotEmpty &&
        locationController.text.isNotEmpty &&
        locationTypeController.text.isNotEmpty &&
        startDateController.text.isNotEmpty &&
        descriptionController.text.isNotEmpty &&
        profileController.text.isNotEmpty &&
        addedSkillEX.isNotEmpty &&
        allMediasEX.isNotEmpty;
    saveText.value = isAllFiledSelected ? kwhite : textFieldColor;
    saveBG.value = isAllFiledSelected ? mainPurple : buttonColor;
  }

  void toggleCurrentlyWorking() {
    currentlyWorking.value = !currentlyWorking.value;
    if (currentlyWorking.value == true) {
      endDateController.clear();
    }
    update(['EX-currentlyworkingButton']);
  }

  void clearallFieldController() {
    titleController.clear();
    employmentController.clear();
    companyController.clear();
    locationController.clear();
    locationTypeController.clear();
    startDateController.clear();
    endDateController.clear();
    descriptionController.clear();
    profileController.clear();
    addedSkillEX.clear();
    allMediasEX.clear();
  }
}
