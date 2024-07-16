import 'package:aimshala/services/profile_section/update_publication_info.dart';
import 'package:aimshala/view/profile/profile_home/profile_home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ProfilePublicationController extends GetxController {
  TextEditingController titleController = TextEditingController();
  TextEditingController publicationController = TextEditingController();
  TextEditingController publicationDateController = TextEditingController();
  TextEditingController publicationURLController = TextEditingController();
  TextEditingController publicationDescriptionController =
      TextEditingController();

  DateTime dateTime = DateTime.now();
  String? publishDate;
  RxBool isSaving = false.obs;
  Future<void> savePublicationFuntion({
    required String uId,
    required String title,
    required String publication,
    required String pubDate,
    required String pubURL,
    required String pubDescription,
  }) async {
    try {
      isSaving.value = true;
      String? res = await UpdatePublicationService().savePublicationService(
        uId: uId,
        title: title,
        publication: publication,
        pubDate: pubDate,
        pubURL: pubURL,
        pubDescription: pubDescription,
      );
      if (res == 'Publication added successfully.') {
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
    } finally {
      isSaving.value = false;
    }
  }

  Future<void> updatePublicationFuntion({
    required String pbID,
    required String uId,
    required String title,
    required String publication,
    required String pubDate,
    required String pubURL,
    required String pubDescription,
  }) async {
    try {
      isSaving.value = true;
      String? res = await UpdatePublicationService().updatePublicationInfo(
        pbID: pbID,
        uId: uId,
        title: title,
        publication: publication,
        pubDate: pubDate,
        pubURL: pubURL,
        pubDescription: pubDescription,
      );
      if (res == 'Publication updated successfully.') {
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
    } finally {
      isSaving.value = false;
    }
  }

  Future<void> deletePublicationFuntion(
      {required String pbID, required String uId}) async {
    String? res =
        await UpdatePublicationService().deletePublicationInfo(pbID: pbID);
    if (res == 'Publication deleted successfully') {
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
    final DateTime? pickedDate = await showDatePicker(
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
    if (pickedDate != null && pickedDate != dateTime) {
      final dateformate = DateFormat('dd-MM-yyyy').format(pickedDate);
      publishDate = DateFormat('yyyy-MM-dd').format(pickedDate);
      publicationDateController.text = dateformate;
      update(['update-publication']);
    }
  }

  String? filedValidation(String? value, {bool? url}) {
    if (value == null || value.isEmpty) {
      return 'Please Enter this Filed';
    }
    if (url == true && !value.isURL) {
      return 'URL is not valid';
    }
    return null;
  }

  void clearControllers() {
    titleController.clear();
    publicationController.clear();
    publicationDateController.clear();
    publicationURLController.clear();
    publicationDescriptionController.clear();
  }
}
