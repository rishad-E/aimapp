import 'dart:developer';
import 'package:aimshala/controllers/educator_controllers/educator_additional_info_controller.dart';
import 'package:aimshala/controllers/educator_controllers/educator_availability_preference_controller.dart';
import 'package:aimshala/controllers/educator_controllers/educator_background_detail_controller.dart';
import 'package:aimshala/controllers/educator_controllers/educator_personal_detail_controller.dart';
import 'package:aimshala/controllers/educator_controllers/educator_reference_controller.dart';
import 'package:aimshala/controllers/educator_controllers/educator_subject_course_select_controller.dart';
import 'package:aimshala/controllers/educator_controllers/educator_work_preferences_controller.dart';
import 'package:aimshala/services/educator_reg_service/educator_registration_service.dart';
import 'package:aimshala/utils/common/widgets/colors_common.dart';
import 'package:aimshala/view/educator_registration/submitted_section/submitted_final_page.dart';
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
  PlatformFile? cv;

  RxString videofilePath = ''.obs;
  RxString videofileName = ''.obs;
  RxString videofileSize = ''.obs;
  PlatformFile? videoFile;

  RxString errorTextLink = ''.obs;
  RxString errorTextVideo = ''.obs;
  RxString errorAgreement = ''.obs;

  RxBool saveDataLoading = false.obs;

  Future<void> pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf', 'doc', 'docx'],
    );
    if (result == null) return;
    cv = result.files.single;
    PlatformFile? file = result.files.single;
    String? path = file.path;
    // cv = File(file.path!);
    filePath.value = path!;
    fileName.value = file.name;
    fileSize.value = formatBytes(file.size);
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
      // withData: true,
      // allowedMimeType: ['video/*'],
    );

    if (result == null) return;
    List<PlatformFile> videoFiles = result.files.where((file) {
      String extension = file.extension!.toLowerCase();
      return ['mp4', 'mov', 'avi', 'mkv'].contains(extension);
    }).toList();
    if (videoFiles.isEmpty) return;
    PlatformFile selectedVideo = videoFiles.first;
    String path = selectedVideo.path!;
    videoFile = selectedVideo;
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

  void fetchAlldatas() async {
    try {
      saveDataLoading.value = true;
      final pController = Get.put(EducatorPersonalDetailController());
      final bgController = Get.put(EducatorBackgroundDetailController());
      final subjController = Get.put(EducatorSubjectCourseController());
      final workController = Get.put(EducatorWorkPreferenceController());
      final availableController = Get.put(EducatorAvailabilityController());
      final additionaleController = Get.put(EducatorAdditionalInfoController());
      final referenceController = Get.put(EducatorReferenceController());
      String name = pController.nameController.text;
      String email = pController.emailController.text;
      String phone = pController.mobileController.text;
      String address = pController.locationController.text;
      String highDegree = bgController.degreeController.text;
      String otherDegree = bgController.otherDegreeController.text;
      String experties = bgController.expertiesController.text;
      String experience = bgController.professionalController.text;
      String institute = bgController.affiliatedController.text;
      List<String> subjects = subjController.seletedSubject;
      List<String> topics = subjController.seletedTopic;
      String relocate = workController.relocate ? 'Yes' : 'No';
      String workMode = workController.workMode;
      String teachPrefers = workController.teachingMode;
      List<String> prefereDays = availableController.selectedDays;
      List<String> prefereTimes = availableController.selectedTimes;
      List<String> questions = additionaleController.questions;
      List<String> answers = additionaleController.answers;
      List<String> refNames = referenceController.referenceNames;
      List<String> refRelations = referenceController.referenceRelation;
      List<String> refPhones = referenceController.referencePhone;
      List<String?> otherRelations = referenceController.otherRelation;

      log('''name=>$name email=>$email location=>$address phone=>$phone highDegree=>$highDegree experties=>$experties otherDegree=>$otherDegree
         experience=>$experience insittute=>$institute subs=>$subjects topics=>$topics relocate=$relocate workMode=>$workMode
         teachPrefer=>$teachPrefers prefDays=>$prefereDays prefTimes=>$prefereTimes  ques=>$questions ansrs=>$answers
         refnames=>$refNames refRel=>$refRelations refPhones=>$refPhones refOther=>$otherRelations 
         linkedIn=>${linkedInController.text}  resume=>$cv 
         videoLink=>${mediaLinkController.text} videoFile=>$videoFile ''',
          name: 'all-fields');
      String? res =
          await EducatorRegistrationService().saveEducatorRegistration(
        name: name,
        email: email,
        phone: phone,
        address: address,
        highDegree: highDegree,
        otherDegree: otherDegree,
        experties: experties,
        experience: experience,
        institute: institute,
        subjects: subjects,
        topics: topics,
        relocate: relocate,
        workMode: workMode,
        teachPrefer: teachPrefers,
        prefereDays: prefereDays,
        prefereTimes: prefereTimes,
        questions: questions,
        answers: answers,
        refnames: refNames,
        refRelations: refRelations,
        refPhones: refPhones,
        otherRelations: otherRelations,
        linkedInLink: linkedInController.text,
        videoLink: mediaLinkController.text,
        cv: cv,
        videoFile: videoFile,
      );
      saveDataLoading.value = false;
      if (res == "Educator created successfully.") {
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
        Get.to(() => const EducatorSubmitFinalPage());
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
    } catch (e) {
      saveDataLoading.value = false;
      log(e.toString(), name: 'educator submit data error');
    }
  }
}
