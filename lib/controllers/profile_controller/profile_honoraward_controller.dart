import 'dart:io';
import 'package:aimshala/services/profile_section/update_honoraward_info_service.dart';
import 'package:aimshala/utils/common/colors_common.dart';
import 'package:aimshala/view/profile/profile_home/profile_home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class ProfileHonorsAwardsController extends GetxController {
  TextEditingController titileController = TextEditingController();
  TextEditingController assosiatedController = TextEditingController();
  TextEditingController issuerController = TextEditingController();
  TextEditingController startdateController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  DateTime dateTime = DateTime.now();
  File? selectedImage;
  File? selectedCamera;
  RxList<File?> allAwardMedias = <File?>[].obs;

  Rx<Color> saveText = Rx<Color>(textFieldColor);
  Rx<Color> saveBG = Rx<Color>(buttonColor);

  Future<void> saveHonorAwardFunction({
    required String uId,
    required String titile,
    required String assosiated,
    required String issuer,
    required String startdate,
    required String description,
    required List<File> media,
  }) async {
    String? res = await UpdateHonorAwardService().saveHonorAwardInfo(
        uId: uId,
        titile: titile,
        assosiated: assosiated,
        issuer: issuer,
        startdate: startdate,
        description: description,
        media: media);
    if (res == 'Award details added successfully.') {
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

  Future<void> datePicker(BuildContext context) async {
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
      final formatedDate = DateFormat('dd-MM-yyyy').format(picker);
      startdateController.text = formatedDate;
      allFieldSelect();
      update(['update-HonorAwardsbutton']);
    }
  }

  Future<File?> pickImageMedia() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile == null) return null;
    selectedImage = File(pickedFile.path);
    allAwardMedias.add(selectedImage);
    // allMediasFiles.add(pickedFile.path.split('/').last);
    // log(selectedImage.toString(), name: 'gallery');
    allFieldSelect();
    update(['update-HonorAwardsbutton']);
    return selectedImage;
  }

  Future<File?> pickCameraMedia() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.camera);
    if (pickedFile == null) return null;
    selectedCamera = File(pickedFile.path);
    allAwardMedias.add(selectedCamera);
    // log(selectedCamera.toString(), name: 'camera');
    allFieldSelect();
    update(['update-HonorAwardsbutton']);
    return selectedCamera;
  }

  String? filedValidation(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please Enter this Filed';
    }
    return null;
  }

  void allFieldSelect() {
    bool isAllFiledSelected = titileController.text.isNotEmpty &&
        assosiatedController.text.isNotEmpty &&
        issuerController.text.isNotEmpty &&
        startdateController.text.isNotEmpty &&
        descriptionController.text.isNotEmpty &&
        allAwardMedias.isNotEmpty;
    saveText.value = isAllFiledSelected ? kwhite : textFieldColor;
    saveBG.value = isAllFiledSelected ? mainPurple : buttonColor;
  }
}
