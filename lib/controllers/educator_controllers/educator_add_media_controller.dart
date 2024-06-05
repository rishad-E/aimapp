import 'package:aimshala/utils/common/colors_common.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EducatorMediaAddController extends GetxController {
  TextEditingController linkedInController = TextEditingController();
  TextEditingController mediaLinkController = TextEditingController();
  Rx<Color> nextText = Rx<Color>(textFieldColor);
  Rx<Color> nextBG = Rx<Color>(buttonColor);

  RxBool agree = false.obs;
  RxString filePath = ''.obs;
  RxString fileName = ''.obs;
  RxString fileSize = ''.obs;

  RxString videofilePath = ''.obs;
  RxString videofileName = ''.obs;
  RxString videofileSize = ''.obs;

  RxString errorTextLink = ''.obs;
  RxString errorTextVideo = ''.obs;
  RxString errorAgreement = ''.obs;

  Future<void> pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf', 'doc', 'docx'],
    );
    if (result == null) return;
    PlatformFile? file = result.files.single;
    String? path = file.path;
    filePath.value = path!;
    fileName.value = file.name;
    fileSize.value = formatBytes(file.size);
    // log('fileName=>$fileName filePath=>$filePath fileSize=>$fileSize');
    errorTextLink.value = '';
  }

  String formatBytes(int bytes) {
    if (bytes == 0) return '0 B';

    final kb = bytes / 1024;
    final mb = kb / 1024;
    final filesize =
        mb >= 1 ? '${mb.toStringAsFixed(2)} MB' : '${kb.toStringAsFixed(2)} KB';
    return filesize;
  }

  Future<void> pickVideo() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['mp4', 'mov', 'avi'],
      allowCompression: false,
      withData: true,
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
    videofilePath.value = path;
    videofileName.value = selectedVideo.name;
    videofileSize.value = formatBytes(selectedVideo.size);
    errorTextVideo.value = '';
  }

  void toggleAggrement() {
    agree.value = !agree.value;
    if (agree.value == true) {
      errorAgreement.value = '';
    }
    update(['update-agreement']);
  }

  String? fieldValidation(String? value) {
    if (filePath.isEmpty && (value == null || value.isEmail)) {
      return 'Please Enter LinkedIn Profile Link';
    } else if (filePath.isEmpty && !value!.isURL) {
      return 'Please Enter a Valid LinkedIn Profile Link';
    }
    return null;
  }

  String? fieldValidationVideo(String? value) {
    if (videofilePath.isEmpty && (value == null || value.isEmail)) {
      return 'Please Enter Video Link';
    } else if (filePath.isEmpty && !value!.isURL) {
      return 'Please Enter a Valid Video Link';
    }
    return null;
  }

  void checkAllFields() {}
}
