import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ProfileExperienceController extends GetxController {
  TextEditingController startDateController = TextEditingController();
  TextEditingController endDateController = TextEditingController();
  DateTime dateTime = DateTime.now();
  RxList<String> addedSkillEX = <String>[].obs;
  File? selectedImageEX;
  File? selectedCameraEX;
  RxList<File?> allMediasEX = <File?>[].obs;

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
        startDateController.text = picker.toString().split(" ")[0];
      } else {
        endDateController.text = picker.toString().split(" ")[0];
      }
    }
  }

  Future<File?> pickImageMediaEX() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile == null) return null;
    selectedImageEX = File(pickedFile.path);
    allMediasEX.add(selectedImageEX);
    return selectedImageEX;
  }

  Future<File?>pickCameraMediaEX()async{
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.camera);
    if (pickedFile == null) return null;
    selectedCameraEX = File(pickedFile.path);
    allMediasEX.add(selectedCameraEX);
    return selectedCameraEX;
  }
}
