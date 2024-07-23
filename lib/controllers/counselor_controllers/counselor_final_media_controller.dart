import 'package:aimshala/utils/common/widgets/colors_common.dart';
import 'package:aimshala/view/counselor_registration/c_final_thanks_section/c_final_thanks_page.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CounselorMediaController extends GetxController {
  TextEditingController linkController = TextEditingController();
  TextEditingController videoController = TextEditingController();
  Rx<Color> nextText = Rx<Color>(textFieldColor);
  Rx<Color> nextBG = Rx<Color>(buttonColor);

  RxString filePath = ''.obs;
  RxString fileName = ''.obs;
  RxString fileSize = ''.obs;
  RxString extenstion = ''.obs;
  PlatformFile? cv;
  RxString errorTextLink = ''.obs;

  RxString videofilePath = ''.obs;
  RxString videofileName = ''.obs;
  RxString videofileSize = ''.obs;
  PlatformFile? video;
  RxString errorTextVideo = ''.obs;

  RxBool agree = false.obs;
  RxString errorAgreement = ''.obs;
  RxBool isSaving = false.obs;

  Future<void> pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowMultiple: false,
      allowedExtensions: ['pdf', 'doc', 'docx'],
    );
    if (result == null) return;
    cv = result.files.single;
    PlatformFile? file = result.files.single;
    String? path = file.path;
    filePath.value = path!;
    extenstion.value = file.extension.toString();
    fileName.value = file.name;
    fileSize.value = formatBytes(file.size);
    errorTextLink.value = '';
  }

  Future<void> pickVideo() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['mp4', 'mov', 'avi'],
      allowCompression: false,
      // withData: true,
      // allowedMimeType: ['video/*'],
    );

    if (result == null) return;
    List<PlatformFile> videoFiles = result.files.where((file) {
      // Filter only video files
      String extension = file.extension!.toLowerCase();
      return ['mp4', 'mov', 'avi', 'mkv'].contains(extension);
    }).toList();
    if (videoFiles.isEmpty) return;
    PlatformFile selectedVideo = videoFiles.first;
    String path = selectedVideo.path!;
    video = selectedVideo;
    videofilePath.value = path;
    videofileName.value = selectedVideo.name;
    videofileSize.value = formatBytes(selectedVideo.size);
    errorTextVideo.value = '';
  }

  String formatBytes(int bytes) {
    if (bytes == 0) return '0 B';
    final kb = bytes / 1024;
    final mb = kb / 1024;
    final filesize =
        mb >= 1 ? '${mb.toStringAsFixed(2)} MB' : '${kb.toStringAsFixed(2)} KB';
    return filesize;
  }

  void toggleAggrement() {
    agree.value = !agree.value;
    if (agree.value == true) {
      errorAgreement.value = '';
    }
    update(['agree-Terms']);
  }

  void clearFileSelection() {
    filePath.value = '';
    fileName.value = '';
    fileSize.value = '';
    cv = null;
  }

  void clearVideoSelection() {
    videofilePath.value = '';
    videofileName.value = '';
    videofileSize.value = '';
    video = null;
  }

  String? fieldValidation(String? value) {
    if (value == null || value.isEmpty) {
      return null;
    }
    if (!value.isURL) {
      return 'Please enter a valid URL';
    }
    return null;
  }

  void fetchDataSubmit() async {
    try {
      isSaving.value = true;
      await Future.delayed(const Duration(seconds: 2));
      Get.to(() => const CounselorThanksPage());
    } finally {
      isSaving.value = false;
    }
  }
}
