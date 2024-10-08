import 'dart:developer';
import 'dart:io';
import 'package:aimshala/models/profile_model/add_media_model.dart';
import 'package:aimshala/services/profile_section/update_license_certification_service.dart';
import 'package:aimshala/services/profile_section/update_skill_info_service.dart';
import 'package:aimshala/utils/common/widgets/colors_common.dart';
import 'package:aimshala/view/profile/profile_home/profile_home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class ProfileLicenseCertificationController extends GetxController {
  TextEditingController nameController = TextEditingController();
  TextEditingController organizationController = TextEditingController();
  TextEditingController issuedateController = TextEditingController();
  TextEditingController expirydateController = TextEditingController();
  TextEditingController credentialIDController = TextEditingController();
  TextEditingController credentialurlController = TextEditingController();
  TextEditingController mediaTitleController = TextEditingController();
  TextEditingController mediaDescriptionController = TextEditingController();
  TextEditingController mediaLinkController = TextEditingController();
  FlutterSecureStorage storage = const FlutterSecureStorage();

  DateTime dateTime = DateTime.now();
  RxList<String> addedLicenseSkill = <String>[].obs;
  File? selectedImage;
  File? selectedCamera;
  RxList<AddMediaModel> allLicenseMedias = <AddMediaModel>[].obs;

  Rx<Color> saveText = Rx<Color>(textFieldColor);
  Rx<Color> saveBG = Rx<Color>(buttonColor);

  String? startdateBackend;
  String? enddateBackend;
  List<String> suggestedSkill = [];
  RxBool isSaving = false.obs;

  Future<void> saveLicenseCertificationFunction({
    required String name,
    required String organization,
    required String issueDate,
    required String expiryDate,
    required String credID,
    required String credURL,
    required List<File> media,
    required List<String> skills,
    required List<String> mediaTitle,
    required List<String> mediaDescription,
    required List<String> mediaLink,
  }) async {
    try {
      isSaving.value = true;
      String? token = await storage.read(key: 'token');
      String? res = await UpdateLicenseCertificationService()
          .saveLicenseCertificationInfo(
        token: token.toString(),
        name: name,
        organization: organization,
        issueDate: issueDate,
        expiryDate: expiryDate,
        credID: credID,
        credURL: credURL,
        media: media,
        mediaTitle: mediaTitle,
        mediaDescription: mediaDescription,
        skills: skills,
        mediaLink: mediaLink,
      );
      if (res == 'License & Certificate details added successfully.') {
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

  Future<void> updateLicenseCertificationFunction({
    required String lcID,
    required String name,
    required String organization,
    required String issueDate,
    required String expiryDate,
    required String credID,
    required String credURL,
    required List<File> media,
    required List<String> skills,
    required List<String> mediaTitle,
    required List<String> mediaDescription,
    required List<String> mediaLink,
    required List<String> mediaUrl,
  }) async {
    try {
      isSaving.value = true;
      String? token = await storage.read(key: 'token');
      String? res = await UpdateLicenseCertificationService()
          .updateLicenseCertificationInfo(
        lcID: lcID,
        token: token.toString(),
        name: name,
        organization: organization,
        issueDate: issueDate,
        expiryDate: expiryDate,
        credID: credID,
        credURL: credURL,
        media: media,
        skills: skills,
        mediaTitle: mediaTitle,
        mediaDescription: mediaDescription,
        mediaLink: mediaLink,
        mediaUrl: mediaUrl,
      );
      if (res == 'License & Certificate details updated successfully.') {
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

  Future<void> deleteLicenseFunction({required String licenseID}) async {
    String? res = await UpdateLicenseCertificationService()
        .deleteLicenseInfo(licenseId: licenseID);
    if (res == 'License deleted successfully') {
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
      Get.off(() => const ProfileHomeScreen());
    }
  }

  Future<void> getSuggestedSkills() async {
    try {
      List<String> skills = await UpdateSkillInfoService().getSuggestedSkills();
      suggestedSkill.assignAll(skills);
      update(['add-licenseSkill']);
    } catch (e) {
      log('Error fetching suggested skills: $e');
    }
  }

  Future<void> datePicker(BuildContext context, {bool? expiry}) async {
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
      if (expiry == true) {
        final formatedDate = DateFormat('dd-MM-yyyy').format(picker);
        enddateBackend = DateFormat('yyyy-MM-dd').format(picker);
        expirydateController.text = formatedDate;
      } else {
        final formatedDate = DateFormat('dd-MM-yyyy').format(picker);
        startdateBackend = DateFormat('yyyy-MM-dd').format(picker);
        issuedateController.text = formatedDate;
      }
    }
  }

  Future<File?> pickImageMedia() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile == null) return null;
    selectedImage = File(pickedFile.path);
    return selectedImage;
  }

  Future<File?> pickCameraMedia() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.camera);
    if (pickedFile == null) return null;
    selectedCamera = File(pickedFile.path);
    return selectedCamera;
  }

  void addLicenseMedia(
      {required String title, required String desc, File? file, String? link}) {
    AddMediaModel model = AddMediaModel(
        file: file, title: title, description: desc, mediaLink: link);
    allLicenseMedias.add(model);
  }

  String? fieldValidation(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please Fill this Field';
    }
    return null;
  }

  String? mediaLinkValidation(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please Fill this Field';
    }
    if (!value.isURL) {
      return 'Please Enter a Valid URL';
    }
    return null;
  }

  void updateLicenseButton() {
    bool isAllFiledSelected = nameController.text.isNotEmpty &&
        organizationController.text.isNotEmpty &&
        issuedateController.text.isNotEmpty &&
        expirydateController.text.isNotEmpty &&
        credentialIDController.text.isNotEmpty &&
        credentialurlController.text.isNotEmpty;
    saveText.value = isAllFiledSelected ? kwhite : textFieldColor;
    saveBG.value = isAllFiledSelected ? mainPurple : buttonColor;
  }

  void clearallFieldController() {
    nameController.clear();
    organizationController.clear();
    issuedateController.clear();
    expirydateController.clear();
    credentialIDController.clear();
    credentialurlController.clear();
    allLicenseMedias.clear();
    addedLicenseSkill.clear();
    updateLicenseButton();
    update(['update-licenseButton']);
  }
}
