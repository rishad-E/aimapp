import 'dart:developer';
import 'package:aimshala/controllers/counselor_controllers/counselor_additional_info_controller.dart';
import 'package:aimshala/controllers/counselor_controllers/counselor_availability_controller.dart';
import 'package:aimshala/controllers/counselor_controllers/counselor_edubg_controller.dart';
import 'package:aimshala/controllers/counselor_controllers/counselor_experties_controller.dart';
import 'package:aimshala/controllers/counselor_controllers/counselor_personal_controller.dart';
import 'package:aimshala/controllers/counselor_controllers/counselor_profbg_controller.dart';
import 'package:aimshala/controllers/counselor_controllers/counselor_reference_controller.dart';
import 'package:aimshala/controllers/login_controller.dart';
import 'package:aimshala/models/UserModel/user_model.dart';
import 'package:aimshala/services/counselor_reg_service/save_counselor_service.dart';
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
      final pController = Get.put(CounselorPersonalController());
      final eduBGController = Get.put(CounserlorEduBGController());
      final profBGController = Get.put(CounserlorProfBGController());
      final availabilityController = Get.put(CounselorAvailabilityController());
      final expertiesControler = Get.put(CounselorExpertiesController());
      final additionalinfoC = Get.put(CounselorAdditionalinfoController());
      final refController = Get.put(CounselorReferenceController());

      String name = pController.nameController.text;
      String email = pController.emailController.text;
      String address = pController.locationController.text;
      String dob = pController.dobController.text;
      String gender = pController.selectedGender.value;
      String status = pController.statusController.text;
      String phone = pController.mobileController.text;
      String highDegree = eduBGController.degreeController.text;
      String otherDegree = eduBGController.otherDegreeController.text;
      String certification = eduBGController.certificationController.text;
      String specialization = eduBGController.specializationController.text;
      String jobTitle = profBGController.jobTitleController.text;
      String experties = profBGController.expertiesController.text;
      String experience = profBGController.experienceController.text;
      String company = profBGController.currentController.text;
      List<String> days = availabilityController.availableDays;
      List<String> times = availabilityController.availableTimes;
      String additionalNote =
          availabilityController.additionalnoteController.text;
      List<String> primaryExp = expertiesControler.primaryAreaList;
      List<String> secondaryExp = expertiesControler.secondaryAreaList;
      String otherPrimary = expertiesControler.primaryController.text;
      String otherSecondary = expertiesControler.secondaryController.text;
      String counselPhilosophyQus =
          'Briefly Describe Your Counseling Philosophy';
      String counselPhilosophyAns = additionalinfoC.describeController.text;
      String whyCounselQus = 'Why do you want to be a counselor with Aimshala';
      String whyCounselAns = additionalinfoC.whyCounselor.text;
      List<String> refNames = refController.referenceNames;
      List<String> refRelations = refController.referenceRelation;
      List<String> refPhones = refController.referencePhone;
      List<String?> refOtherRel = refController.refOtherRelation;
      String linkedInLink = linkController.text;
      String videoLink = videoController.text;
      String termsAgree = agree.value ? 'on' : 'off';

      String? id;
      final UserModel? userData = Get.put(LoginController()).userData;
      if (userData != null) {
        id = userData.user?.id.toString() ?? '';
      }

      String logEntry = '''
      id: $id
      Name: $name
      Email: $email
      Address: $address
      DOB: $dob
      Gender: $gender
      Status: $status
      Phone: $phone
      Highest Degree: $highDegree
      Other Degree: $otherDegree
      Certification: $certification
      Specialization: $specialization
      Job Title: $jobTitle
      Experties: $experties
      Experience: $experience
      Company: $company
      Available Days: $days
      Available Times: $times
      Additional Note: $additionalNote
      Primary Expertise: $primaryExp
      Secondary Expertise: $secondaryExp
      Other Primary: $otherPrimary
      Other Secondary: $otherSecondary
      Counsel Philosophy Qus: $counselPhilosophyQus
      Counsel Philosophy Ans: $counselPhilosophyAns
      Why Counsel Qus: $whyCounselQus
      Why Counsel Ans: $whyCounselAns
      Reference Names: $refNames
      Reference Relations: $refRelations
      Reference Phones: $refPhones
      Reference Other Relations: $refOtherRel
      lnkedLink: $linkedInLink
      videoLink: $videoLink
      cv: $cv
      video: $video
      temsAgree: $termsAgree
    ''';

      log(logEntry);
      String? res = await SaveCounselorRegService().saveCounselorRegistraion(
        uId: id.toString(),
        name: name,
        email: email,
        phone: phone,
        dob: dob,
        gender: gender,
        status: status,
        address: address,
        highDegree: highDegree,
        otherDegree: otherDegree,
        specialization: specialization,
        certification: certification,
        jobTitle: jobTitle,
        experties: experties,
        currentOrganization: company,
        experience: experience,
        prefereDays: days,
        prefereTimes: times,
        additionalNote: additionalNote,
        primaryExp: primaryExp,
        otherPrimary: otherPrimary,
        secondaryExp: secondaryExp,
        otherSecondary: otherSecondary,
        counselPhilosophyQus: counselPhilosophyQus,
        counselPhilosophyAns: counselPhilosophyAns,
        whyCounselQus: whyCounselQus,
        whyCounselAns: whyCounselAns,
        refnames: refNames,
        refRelations: refRelations,
        refPhones: refPhones,
        otherRelations: refOtherRel,
        linkedInLink: linkedInLink,
        videoLink: videoLink,
        temsAgree: termsAgree,
        cv: cv,
        videoFile: video,
      );
      if (res == 'Counsellor data saved successfully.') {
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
        Get.to(() => CounselorThanksPage(name: name));
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
      // Get.to(() => const CounselorThanksPage());
    } finally {
      isSaving.value = false;
    }
  }
}
