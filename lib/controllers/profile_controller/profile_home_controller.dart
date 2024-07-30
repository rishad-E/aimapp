import 'dart:developer';
import 'dart:io';
import 'package:aimshala/models/UserModel/user_model.dart';
import 'package:aimshala/services/profile_section/profile_get_all_data.dart';
import 'package:aimshala/services/profile_section/update_profile_pic_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ProfileHomeController extends GetxController {
  RxString selectedImage = ''.obs;
  RxString userRole = ''.obs;
  RxString userDOB = ''.obs;
  RxString userGender = ''.obs;
  Rx<User?> userData = Rx<User?>(null);
  RxBool isLoading = false.obs;

  Future<void> fetchAlluserData({required String uId}) async {
    try {
      dynamic alldata = await GetProfileAllData().fetchProfileAlldata(uId: uId);
      if (alldata != null) {
        /* ------- extracting user data ---------- */
        Map<String, dynamic> userDeatails = alldata["user"];
        userData.value = User.fromJson(userDeatails);
        userRole.value = alldata["user_role"];
        userDOB.value = alldata["DOB"];
        userGender.value = alldata["gender"];
        String img = alldata["user"]["image"];
        selectedImage.value = "http://154.26.130.161/elearning/$img";
        log(userRole.toString(), name: 'homecontroller name');
      }
    } catch (e) {
      log('Error fetching profile data: $e', name: 'profile-alldata');
      userData.value = null;
    }
  }

  Future<void> selectProfilePic(
      {required ImageSource source, required String uId}) async {
    try {
      final pickedImage = await ImagePicker().pickImage(source: source);
      if (pickedImage == null) {
        isLoading.value = false;
        return;
      }
      isLoading.value = true;
      File image = File(pickedImage.path);
      Map<String, dynamic>? data = await UpdateProfilePhotoService()
          .updateProfile(uId: uId, file: image);
      if (data == null) {
        isLoading.value = false;
        return;
      }

      if (data.containsKey("message")) {
        String resImage = data["user"]["image"];
        final profilePic = "http://154.26.130.161/elearning/$resImage";
        log(profilePic, name: 'update profilepic co');
        selectedImage.value = profilePic;
      } else if (data.containsKey("error")) {
        Map<String, dynamic> errors = data['error'];
        String first = errors.keys.first;
        if (errors[first] is List && (errors[first] as List).isNotEmpty) {
          String errorMessage = errors[first][0].toString();
          log(errorMessage, name: 'update pro pic error co');

          if (errorMessage ==
              "The user_profile may not be greater than 2048 kilobytes.") {
            errorMessage = "Image should not be greater than 2MB";
          }

          Get.showSnackbar(
            GetSnackBar(
              snackStyle: SnackStyle.FLOATING,
              message: errorMessage,
              borderRadius: 4,
              margin: const EdgeInsets.all(10),
              backgroundColor: Colors.red,
              duration: const Duration(seconds: 2),
            ),
          );
        }
      }

      isLoading.value = false;
    } catch (e) {
      isLoading.value = false;
      log('Error updating profile picture: $e', name: 'update profilepic co');
    }
  }

  Future<void> deleteProfilePic({required String uId}) async {
    try {
      dynamic data =
          await UpdateProfilePhotoService().deleteProfilePicService(uId: uId);
      if (data != null) {
        String msg = data["message"];
        String resImage = data["user"]["image"];
        log(msg, name: 'delete msg');
        if (msg == "Profile image removed successfully") {
          Get.showSnackbar(
            GetSnackBar(
              snackStyle: SnackStyle.FLOATING,
              message: msg,
              borderRadius: 4,
              margin: const EdgeInsets.all(10),
              backgroundColor: Colors.green,
              duration: const Duration(seconds: 2),
            ),
          );
          selectedImage.value = "http://154.26.130.161/elearning/$resImage";
       
        } else {
          Get.showSnackbar(
            const GetSnackBar(
              snackStyle: SnackStyle.FLOATING,
              message: "Failed to remove Profile image",
              borderRadius: 4,
              margin: EdgeInsets.all(10),
              backgroundColor: Colors.red,
              duration: Duration(seconds: 2),
            ),
          );
        }
      }
    } catch (e) {
      // log(data.toString(), name: 'update profilepic co');
    }
  }
}
