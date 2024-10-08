import 'dart:io';
import 'package:aimshala/models/profile_model/add_media_model.dart';
import 'package:aimshala/services/profile_section/update_volunteer_info_service.dart';
import 'package:aimshala/utils/common/widgets/colors_common.dart';
import 'package:aimshala/view/profile/profile_home/profile_home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class ProfileVolunteerController extends GetxController {
  TextEditingController organizationController = TextEditingController();
  TextEditingController volunteerRoleController = TextEditingController();
  TextEditingController causeController = TextEditingController();
  TextEditingController startdateController = TextEditingController();
  TextEditingController endDateController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController mediaTitleController = TextEditingController();
  TextEditingController mediaDescriptionController = TextEditingController();
  TextEditingController mediaLinkController = TextEditingController();
  FlutterSecureStorage storage = const FlutterSecureStorage();

  RxList<AddMediaModel> volunteerMedia = <AddMediaModel>[].obs;
  File? selectedImageVl;
  File? selectedCameraVl;
  DateTime dateTime = DateTime.now();
  Rx<Color> saveText = Rx<Color>(textFieldColor);
  Rx<Color> saveBG = Rx<Color>(buttonColor);
  RxBool currentlyWorking = false.obs;

  String? startdateBackend;
  String? enddateBackend;
  RxBool isSaving = false.obs;

  Future<void> saveVolunteerInfoFuntion({
    required String organization,
    required String volRole,
    required String volCause,
    required String startDate,
    required String endDate,
    required String currentlyWorking,
    required String description,
    required List<File> media,
    required List<String> mediaDesc,
    required List<String> mediaTitle,
    required List<String> mediaLink,
  }) async {
    try {
      isSaving.value = true;
      String? token = await storage.read(key: 'token');
      String? res = await UpdateVolunteerInfoService().saveVolunteerInfo(
        token: token.toString(),
        organization: organization,
        volRole: volRole,
        volCause: volCause,
        startDate: startDate,
        endDate: endDate,
        currentlyWorking: currentlyWorking,
        description: description,
        media: media,
        mediaTitle: mediaTitle,
        mediaLink: mediaLink,
        mediaDesc: mediaDesc,
      );
      if (res == 'Volunteer experience added successfully.') {
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

  Future<void> updateVolunteerFunction({
    required String vtID,
    required String organization,
    required String volRole,
    required String volCause,
    required String startDate,
    required String endDate,
    required String currentlyWorking,
    required String description,
    required List<File> media,
    required List<String> mediaDesc,
    required List<String> mediaTitle,
    required List<String> mediaLink,
    required List<String> mediaUrl,
  }) async {
    try {
      isSaving.value = true;
      String? token = await storage.read(key: 'token');
      String? res = await UpdateVolunteerInfoService().updateVolunteerInfo(
        vtID: vtID,
        token: token.toString(),
        organization: organization,
        volRole: volRole,
        volCause: volCause,
        startDate: startDate,
        endDate: endDate,
        currentlyWorking: currentlyWorking,
        description: description,
        media: media,
        mediaDesc: mediaDesc,
        mediaTitle: mediaTitle,
        mediaLink: mediaLink,
        mediaUrl: mediaUrl,
      );
      if (res == 'Volunteer experience updated successfully.') {
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

  Future<void> deleteVolunteerFunction({required String vtID}) async {
    String? res = await UpdateVolunteerInfoService()
        .deleteVolunteerExperienceInfo(volunteerID: vtID);
    if (res == 'Volunteer Experience deleted successfully') {
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
              primary: Colors.purple,
              onPrimary: Colors.white,
            ),
            dialogBackgroundColor: Colors.white,
          ),
          child: child!,
        );
      },
    );
    if (picker != null && picker != dateTime) {
      final formatedDate = DateFormat('dd-MM-yyyy').format(picker);
      if (start == true) {
        startdateController.text = formatedDate;
        startdateBackend = DateFormat('yyyy-MM-dd').format(picker);
        allFieldSelected();
        update(['update-volunteerInfo']);
      } else {
        endDateController.text = formatedDate;
        enddateBackend = DateFormat('yyyy-MM-dd').format(picker);
        allFieldSelected();
        update(['update-volunteerInfo']);
      }
    }
  }

  Future<File?> pickImageMediaVl() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile == null) return null;
    selectedImageVl = File(pickedFile.path);
    return selectedImageVl;
  }

  Future<File?> pickCameraMediaVl() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.camera);
    if (pickedFile == null) return null;
    selectedCameraVl = File(pickedFile.path);
    return selectedCameraVl;
  }

  void addVolunteerMedia(
      {required String title, required String desc, File? file, String? link}) {
    AddMediaModel model = AddMediaModel(
        file: file, title: title, description: desc, mediaLink: link);
    volunteerMedia.add(model);
    allFieldSelected();
    update(['update-volunteerInfo']);
  }

  void toggleCurrentlyWorking() {
    currentlyWorking.value = !currentlyWorking.value;
    if (currentlyWorking.value == true) {
      endDateController.clear();
      enddateBackend = endDateController.text;
    }
    update(['currentlyWorking-volunteer']);
  }

  void allFieldSelected() {
    bool isAllfieldSelected = organizationController.text.isNotEmpty &&
        volunteerRoleController.text.isNotEmpty &&
        causeController.text.isNotEmpty &&
        startdateController.text.isNotEmpty &&
        descriptionController.text.isNotEmpty;
    saveText.value = isAllfieldSelected ? kwhite : textFieldColor;
    saveBG.value = isAllfieldSelected ? mainPurple : buttonColor;
  }

  String? fieldValidation(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please Enter this Filed';
    }
    return null;
  }

  String? mediaLinkValidation(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please Enter this Filed';
    }
    if (!value.isURL) {
      return 'Please Enter a Valid URL';
    }
    return null;
  }

  void clearControllers() {
    organizationController.clear();
    volunteerRoleController.clear();
    causeController.clear();
    startdateController.clear();
    endDateController.clear();
    descriptionController.clear();
    volunteerMedia.clear();
    allFieldSelected();
    update(['update-volunteerInfo']);
  }
}
