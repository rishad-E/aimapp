import 'dart:io';
import 'package:aimshala/models/profile_model/add_media_model.dart';
import 'package:aimshala/services/profile_section/update_project_info_service.dart';
import 'package:aimshala/utils/common/colors_common.dart';
import 'package:aimshala/view/profile/profile_home/profile_home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class ProfileProjectController extends GetxController {
  TextEditingController projectnameController = TextEditingController();
  TextEditingController projectDescriptionController = TextEditingController();
  TextEditingController startdateController = TextEditingController();
  TextEditingController endDateController = TextEditingController();
  TextEditingController projectAssosiatedController = TextEditingController();
  TextEditingController mediaTitleController = TextEditingController();
  TextEditingController mediaDescriptionController = TextEditingController();

  DateTime dateTime = DateTime.now();
  RxList<String> addedProjectSkill = <String>[].obs;
  File? selectedImage;
  File? selectedCamera;
  RxList<AddMediaModel> allProjectMedias = <AddMediaModel>[].obs;

  RxBool currentlyWorking = false.obs;
  Rx<Color> saveText = Rx<Color>(textFieldColor);
  Rx<Color> saveBG = Rx<Color>(buttonColor);

  Future<void> saveProjectFunction({
    required String uId,
    required String proName,
    required String startDate,
    required String endDate,
    required String description,
    required String assosiated,
     required String currentlyWorking,
    required List<String> skills,
    required List<File> medias,
    required List<String> mediaTitle,
    required List<String> mediaDescription,
  }) async {
    String? res = await UpdateProjectInfoService().saveProjectInfo(
        uId: uId,
        proName: proName,
        startDate: startDate,
        endDate: endDate,
        description: description,
        assosiated: assosiated,
        currentlyWorking: currentlyWorking,
        skills: skills,
        medias: medias,
        mediaTitle: mediaTitle,
        mediaDescription: mediaDescription);
    if (res == 'Project details added successfully.') {
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

  Future<void> updateProjectFunction({
    required prID,
    required String uId,
    required String proName,
    required String startDate,
    required String endDate,
    required String description,
    required String assosiated,
     required String currentlyWorking,
    required List<String> skills,
    required List<File> medias,
    required List<String> mediaTitle,
    required List<String> mediaDescription,
  }) async {
    String? res = await UpdateProjectInfoService().updateProjectInfo(
      prID: prID,
      uId: uId,
      proName: proName,
      startDate: startDate,
      endDate: endDate,
      description: description,
      assosiated: assosiated,
      currentlyWorking: currentlyWorking,
      skills: skills,
      medias: medias,
      mediaTitle: mediaTitle,
      mediaDescription: mediaDescription,
    );
    if (res == 'Project details updated successfully.') {
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
    final DateTime? picked = await showDatePicker(
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
    if (picked != null && picked != dateTime) {
      final formatedDate = DateFormat('dd-MM-yyyy').format(picked);
      if (start == true) {
        startdateController.text = formatedDate;
        allFiledSelected();
        update(['update-projectInfo']);
      } else {
        endDateController.text = formatedDate;
        allFiledSelected();
        update(['update-projectInfo']);
      }
    }
  }

  Future<File?> pickImageMedia() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile == null) return null;
    selectedImage = File(pickedFile.path);
    // allProjectMedias.add(selectedImage);
    // allFiledSelected();
    // update(['update-projectInfo']);
    // log(selectedImage.toString(), name: 'gallery');
    return selectedImage;
  }

  Future<File?> pickCameraMedia() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.camera);
    if (pickedFile == null) return null;
    selectedCamera = File(pickedFile.path);
    // update(['update-media']);
    // allProjectMedias.add(selectedCamera);
    // allFiledSelected();
    // update(['update-projectInfo']);
    // log(selectedImage.toString(), name: 'camera');
    return selectedCamera;
  }

  void addProjectMedia(
      {required String title, required String desc, File? file}) {
    AddMediaModel model =
        AddMediaModel(file: file, title: title, description: desc);
    allProjectMedias.add(model);
    allFiledSelected();
    update(['update-projectInfo']);
  }

  void toggleCurrentlyWorking() {
    currentlyWorking.value = !currentlyWorking.value;
    if (currentlyWorking.value == true) {
      endDateController.clear();
    }
    update(['currentlyWorking-project']);
  }

  String? filedValidation(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please Enter this Field';
    }
    return null;
  }

  void allFiledSelected() {
    bool isAllFiledSelected = projectnameController.text.isNotEmpty &&
        projectDescriptionController.text.isNotEmpty &&
        startdateController.text.isNotEmpty &&
        projectAssosiatedController.text.isNotEmpty &&
        addedProjectSkill.isNotEmpty &&
        allProjectMedias.isNotEmpty;
    saveText.value = isAllFiledSelected ? kwhite : textFieldColor;
    saveBG.value = isAllFiledSelected ? mainPurple : buttonColor;
  }

  void clearallFieldController() {
    projectnameController.clear();
    projectDescriptionController.clear();
    startdateController.clear();
    endDateController.clear();
    projectAssosiatedController.clear();
    addedProjectSkill.clear();
    allProjectMedias.clear();
    update(['update-projectInfo']);
  }
}
