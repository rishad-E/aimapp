import 'dart:developer';
import 'dart:io';
import 'package:aimshala/controllers/profile_controller/profile_skill_info_controller.dart';
import 'package:aimshala/services/profile_section/update_profile_pic_service.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ProfileHomeController extends GetxController {
  RxString selectedImage = ''.obs;

  // @override
  // void onInit() {
  //   super.onInit();
  //   String initialImage =
  //       Get.put(ProfileSkillController()).profilePhoto.toString();
  //   selectedImage.value = "http://154.26.130.161/elearning/$initialImage";
  // }
// void get?
  Future<void> selectProfilePic(
      {required ImageSource source, required String uId}) async {
    try {
      final pickedImage = await ImagePicker().pickImage(source: source);
      if (pickedImage == null) return;
      File? image = File(pickedImage.path);
      dynamic data = await UpdateProfilePhotoService()
          .updateProfile(uId: uId, file: image);
      if (data != null) {
        String resImage = data["user"]["image"];
        final profilePic = "http://154.26.130.161/elearning/$resImage";
        log(profilePic, name: 'update profilepic co');
        selectedImage.value = profilePic;
      }
    } catch (e) {
      // log(data.toString(), name: 'update profilepic co');
    }
  }
}
