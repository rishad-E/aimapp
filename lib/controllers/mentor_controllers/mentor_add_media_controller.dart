import 'dart:developer';
import 'package:aimshala/controllers/mentor_controllers/mentor_additional_info_controller.dart';
import 'package:aimshala/controllers/mentor_controllers/mentor_availability_controller.dart';
import 'package:aimshala/controllers/mentor_controllers/mentor_background_detail_controller.dart';
import 'package:aimshala/controllers/mentor_controllers/mentor_experience_controller.dart';
import 'package:aimshala/controllers/mentor_controllers/mentor_personal_details_controller.dart';
import 'package:aimshala/controllers/mentor_controllers/mentor_preference_controller.dart';
import 'package:aimshala/controllers/mentor_controllers/mentor_reference_controller.dart';
import 'package:aimshala/services/mentor_reg_service/mentor_registraion_service.dart';
import 'package:aimshala/view/mentor_registration/mentor_final_submit_page/mentor_final_submit_page.dart';
import 'package:aimshala/utils/common/widgets/colors_common.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

class MentorAddMediaController extends GetxController {
  TextEditingController linkedInController = TextEditingController();
  TextEditingController mediaLinkController = TextEditingController();
  Rx<Color> nextText = Rx<Color>(textFieldColor);
  Rx<Color> nextBG = Rx<Color>(buttonColor);
  FlutterSecureStorage storage = const FlutterSecureStorage();

  RxString filePath = ''.obs;
  RxString fileName = ''.obs;
  RxString fileSize = ''.obs;
  RxString extenstion = ''.obs;
  PlatformFile? cvNew;

  RxString videofilePath = ''.obs;
  RxString videofileName = ''.obs;
  RxString videofileSize = ''.obs;
  PlatformFile? video;

  RxString errorTextLink = ''.obs;
  RxString errorTextVideo = ''.obs;
  RxString errorAgreement = ''.obs;

  RxBool agree = false.obs;
  RxBool saveDataLoading = false.obs;
  /*-------controllers--------- */
  final pController = Get.put(MentorPersonalDetailController());
  final bgController = Get.put(MentorBackgroundDetailController());
  final mExController = Get.put(MentorExperienceController());
  final mPrefController = Get.put(MentorPreferenceController());
  final mAvalController = Get.put(MentorAvailabilityController());
  final mAdditionalController = Get.put(MentorAdditionalInfoController());
  final mRefController = Get.put(MentorReferencesController());
  /*-------controllers--------- */

  Future<void> pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowMultiple: false,
      allowedExtensions: ['pdf', 'doc', 'docx'],
    );
    if (result == null) return;
    cvNew = result.files.single;
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

  void toggleAggrement() {
    agree.value = !agree.value;
    if (agree.value == true) {
      errorAgreement.value = '';
    }
    update(['update-mentorAgreement']);
  }

  String formatBytes(int bytes) {
    if (bytes == 0) return '0 B';
    final kb = bytes / 1024;
    final mb = kb / 1024;
    final filesize =
        mb >= 1 ? '${mb.toStringAsFixed(2)} MB' : '${kb.toStringAsFixed(2)} KB';
    return filesize;
  }

  String? fieldValidation(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please Enter this Field';
    }
    return null;
  }

  void fetchDataAndSubmit() async {
    try {
      saveDataLoading.value = true;
      String? token = await storage.read(key: 'token');
      String name = pController.nameController.text;
      String email = pController.emailController.text;
      String address = pController.locationController.text;
      String dob = pController.dobController.text;
      String gender = pController.selectedGender.toString();
      String status = pController.statusController.text;
      String phone = pController.mobileController.text;
      String highDegree = bgController.degreeController.text;
      String otherDegree = bgController.otherDegreecontroller.text;
      String experties = bgController.expertiesController.text;
      String experience = bgController.professionalController.text;
      String institute = bgController.affiliatedController.text;
      String earnReward = mExController.reward.value != null &&
              mExController.reward.value == true
          ? 'Yes'
          : 'No';
      String rewardDescription = mExController.experienceController.text;
      String preferMode = mPrefController.mentorMode;
      List<String> subjs = mPrefController.seletedSubject;
      List<String> topic = mPrefController.seletedTopic;
      List<String> prefDays = mAvalController.availableDays;
      List<String> prefTimes = mAvalController.availableTimes;
      List<String> questions = mAdditionalController.qustions;
      List<String> answers = mAdditionalController.answers;
      List<String> refNames = mRefController.referenceNames;
      List<String> refRelations = mRefController.referenceRelation;
      List<String> refPhones = mRefController.referencePhone;
      List<String?> refOtherRel = mRefController.otherRelation;

      // String? id;
      // final UserModel? userData = Get.put(LoginController()).userData;
      // if (userData != null) {
      //   id = userData.user?.id.toString() ?? '';
      // }

      log('''  name=>$name email=>$email phone=>$phone address=$address dob=>$dob gender=>$gender status=>$status
highD=>$highDegree otherD=>$otherDegree experties=>$experties experience=>$experience institute=>$institute
earn=>$earnReward  rewardDes=>$rewardDescription
mentorMode=>$preferMode subjects=>$subjs Topics=>$topic
prefDays=>$prefDays prefTimes=>$prefTimes
questions=>$questions answers=>$answers
refName=>$refNames refRel=>$refRelations refPhone=>$refPhones refOther=>$refOtherRel
linkedINLink=>${linkedInController.text} videoLink=>${mediaLinkController.text}
cvFileX=>$filePath
cvFileFile=>$cvNew
videoX=>$videofilePath
videoFile=>$video
''', name: 'mentor all data');

      String? res = await MentorRegistrationService().saveMentorRegistraion(
        name: name,
        email: email,
        address: address,
        dob: dob,
        gender: gender,
        status: status,
        phone: phone,
        highDegree: highDegree,
        otherDegree: otherDegree,
        experties: experties,
        experience: experience,
        institute: institute,
        earnReward: earnReward,
        earnRewardDes: rewardDescription,
        preferMode: preferMode,
        subjects: subjs,
        topics: topic,
        prefDays: prefDays,
        prefTimes: prefTimes,
        questions: questions,
        answers: answers,
        refNames: refNames,
        refRelations: refRelations,
        refPhones: refPhones,
        refOtherRelations: refOtherRel,
        linkedInLink: linkedInController.text,
        videoLink: mediaLinkController.text,
        cv: cvNew,
        video: video,
        token: token.toString(),
      );
      saveDataLoading.value = false;
      if (res == "Mentor created successfully.") {
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
        Get.to(() => MentorFinalSubmitPage(name: name));
        deleteAllMentorControllers();
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
      // await Future.delayed(const Duration(seconds: 2));
      // Get.to(() => MentorFinalSubmitPage(name: name));
      // deleteAllMentorControllers();
    } catch (e) {
      saveDataLoading.value = false;
      log(e.toString(), name: 'mentor submit error c');
    } finally {
      saveDataLoading.value = false;
    }
  }

  void deleteAllMentorControllers() {
    pController.clearAllfields();
    bgController.clearMentorBGfield();
    mExController.clearMentorExpField();
    mPrefController.clearMentorPreferenceField();
    mAvalController.clearMentorAvailabilityField();
    mAdditionalController.clearMentorAdditionalFields();
    mRefController.clearMentorReferenceFields();
    linkedInController.clear();
    mediaLinkController.clear();
    filePath.value = '';
    videofilePath.value = '';
  }
}
