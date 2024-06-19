import 'dart:io';
import 'package:aimshala/models/profile_model/add_media_model.dart';
import 'package:aimshala/services/profile_section/update_honoraward_info_service.dart';
import 'package:aimshala/utils/common/widgets/colors_common.dart';
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
  TextEditingController mediaTitleController = TextEditingController();
  TextEditingController mediaDescriptionController = TextEditingController();
  TextEditingController mediaLinkController = TextEditingController();

  DateTime dateTime = DateTime.now();
  File? selectedImage;
  File? selectedCamera;
  RxList<AddMediaModel> allAwardMedias = <AddMediaModel>[].obs;
  RxList<String> assosiatedListdata = <String>[].obs;


  Rx<Color> saveText = Rx<Color>(textFieldColor);
  Rx<Color> saveBG = Rx<Color>(buttonColor);

  Future<void> saveHonorAwardFunction({
    required String uId,
    required String title,
    required String assosiated,
    required String issuer,
    required String startdate,
    required String description,
    required List<String> mediaTitle,
    required List<String> mediaDescription,
    required List<String> mediaLink,
    required List<File> media,
  }) async {
    String? res = await UpdateHonorAwardService().saveHonorAwardInfo(
      uId: uId,
      title: title,
      assosiated: assosiated,
      issuer: issuer,
      startdate: startdate,
      description: description,
      media: media,
      mediaTitle: mediaTitle,
      mediaDescription: mediaDescription,
      mediaLink: mediaLink,
    );
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

  Future<void> updateHonorAwardFunction({
    required String awardID,
    required String uId,
    required String title,
    required String assosiated,
    required String issuer,
    required String startdate,
    required String description,
    required List<String> mediaTitle,
    required List<String> mediaDescription,
    required List<String> mediaLink,
    required List<File> media,
  }) async {
    String? res = await UpdateHonorAwardService().updateHonorAwardInfo(
      awardID: awardID,
      uId: uId,
      title: title,
      assosiated: assosiated,
      issuer: issuer,
      startdate: startdate,
      description: description,
      mediaTitle: mediaTitle,
      mediaDescription: mediaDescription,
      mediaLink: mediaLink,
      media: media,
    );
    if (res == 'Award details updated successfully.') {
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

  Future<void> deleteAwardFunction(
      {required String awardID, required String uId}) async {
    String? res =
        await UpdateHonorAwardService().deleteAwardInfo(awardID: awardID);
    if (res == 'Award deleted successfully') {
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
      Get.off(() => ProfileHomeScreen(id: uId));
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
    return selectedImage;
  }

  Future<File?> pickCameraMedia() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.camera);
    if (pickedFile == null) return null;
    selectedCamera = File(pickedFile.path);
    return selectedCamera;
  }

  void addAwardMedia(
      {required String title, required String desc, File? file, String? link}) {
    AddMediaModel model = AddMediaModel(
        file: file, title: title, description: desc, mediaLink: link);
    allAwardMedias.add(model);
    allFieldSelect();
    update(['update-HonorAwardsbutton']);
  }

  String? filedValidation(String? value) {
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

  void allFieldSelect() {
    bool isAllFiledSelected = titileController.text.isNotEmpty &&
        assosiatedController.text.isNotEmpty &&
        issuerController.text.isNotEmpty &&
        startdateController.text.isNotEmpty &&
        descriptionController.text.isNotEmpty;
    saveText.value = isAllFiledSelected ? kwhite : textFieldColor;
    saveBG.value = isAllFiledSelected ? mainPurple : buttonColor;
  }

  void clearallFieldController() {
    titileController.clear();
    assosiatedController.clear();
    issuerController.clear();
    startdateController.clear();
    descriptionController.clear();
    allAwardMedias.clear();
  }
}
