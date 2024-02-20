import 'dart:developer';

import 'package:aimshala/models/career_aim_model/career_bookingtime_model.dart';
import 'package:aimshala/models/career_aim_model/search_aim_res_model.dart';
import 'package:aimshala/models/career_aim_model/search_microaim_res_model.dart';
import 'package:aimshala/services/career_services/career_otp_service.dart';
import 'package:aimshala/services/career_services/get_aim_service.dart';
import 'package:aimshala/services/career_services/get_booking_date_time_service.dart';
import 'package:aimshala/services/career_services/slot_booking_save_service.dart';
import 'package:aimshala/utils/common/colors_common.dart';
import 'package:aimshala/view/BookCareerCounsellCall/career_home_aimScreen/widgets/career_colors.dart';
import 'package:aimshala/view/BookCareerCounsellCall/career_home_aimScreen/widgets/model/microaim_model.dart';
import 'package:aimshala/view/BookCareerCounsellCall/career_review_booking_screen/career_review_booking_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BookCareerCounsellController extends GetxController {
  TextEditingController nameController = TextEditingController();
  TextEditingController roleController = TextEditingController();
  TextEditingController aimController = TextEditingController();
  TextEditingController mobNumberController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController otpController1 = TextEditingController();
  TextEditingController otpController2 = TextEditingController();
  TextEditingController otpController3 = TextEditingController();
  TextEditingController otpController4 = TextEditingController();
  final GlobalKey<FormState> otpFormKey = GlobalKey();

  RxList<MicroModel> check = <MicroModel>[].obs;
  RxList<Aim> searchAimRes = <Aim>[].obs;
  RxList<MicroAim> searchMicorAimRes = <MicroAim>[].obs;
  RxList<Slot> times = <Slot>[].obs;
  String? selectedDate;
  String? selectedTime;
  RxBool isAllCareerHomeFieldsSelected = false.obs;
  RxBool isAllCareerAimFieldsSelected = false.obs;
  Rx<Color> careerButtontextAim = Rx<Color>(disableText);
  Rx<Color> careerButtontext = Rx<Color>(disableText);
  String careerSelectedRole = 'Select your role';
  RxString careerAimSelectedRole = 'Your aim'.obs;
  String careerMicroAimSelectedRole = 'Your Micro aim';
  String? aimId;
  RxString validationMessage = ''.obs;
  RxInt filledOtpFields = RxInt(0);
  Rx<Color> careerbuttonColor = Rx<Color>(bbColor);
  Rx<Color> careerBTextColor = Rx<Color>(Colors.black.withOpacity(0.6));

  /*------------ Get Aim option search result ---------*/
  Future<List<Aim>?> searchAimOptions({required String query}) async {
    searchAimRes.value =
        await CareerAimService().getAimSearchResult(query: query);
    log(searchAimRes.toString(), name: 'aim search');
    return searchAimRes;
  }

/*------------ Get Aim option search result ---------*/
  Future<RxList<MicroAim>> searchMicroAimOptions(
      {required String query, required String parentId}) async {
    searchMicorAimRes.value = await CareerAimService()
        .getMicroAimSearchResult(query: query, parentId: parentId);
    // log(searchMicorAimRes.toString(), name: 'micro aim search');
    return searchMicorAimRes;
  }

/*---------- Career fetch booking time ---------*/
  Future<RxList<Slot>> fetchBookingTime({required String date}) async {
    times.value = await CareerBookingService().getBookingTime(date: date);
    update();
    return times;
  }

/*---------- Career send OTP to Mobile Number ---------*/
  Future<void> careerSendOTPFunction({required String mobileNo}) async {
    CareerOtpService().careerSendOTP(mobileNo: mobileNo);
    clearotpControllers();
  }

  /*---------- Career Verify OTP ---------*/
  Future<void> careerVerifyOTPFunction(
      {required String mobileNo, required String otp}) async {
    await CareerOtpService()
        .careerValidateOTP(otp: otp, mobileNo: mobileNo)
        .then(
          (value) => {
            if (value == true)
              {Get.to(() => const CareerReviewBookingScreen())}
            else
              {validationMessage.value = 'Please enter valid code'}
          },
        );
  }

/*---------- Career Resend OTP ---------*/
  Future<void> careerResendOTPFunction({required String mobileNo}) async {
    CareerOtpService().careerResendOTP(mobileNo: mobileNo).then((value) => {
          if (value == 'retry send successfully')
            {
              Get.showSnackbar(
                const GetSnackBar(
                  margin: EdgeInsets.all(10),
                  snackStyle: SnackStyle.FLOATING,
                  message: 'OTP resent successfully',
                  backgroundColor: Colors.green,
                  duration: Duration(seconds: 2),
                ),
              )
            }
          else
            {
              Get.showSnackbar(
                GetSnackBar(
                  snackStyle: SnackStyle.FLOATING,
                  message: value,
                  margin: const EdgeInsets.all(10),
                  backgroundColor: Colors.red,
                  duration: const Duration(seconds: 2),
                ),
              )
            }
        });
  }

  /*------------ save career counsill slot ---------*/
  Future<String?> careerBokingSlotFucntion({
    required String name,
    required String email,
    required String phoneNumber,
    required String appointDate,
    required String appointTime,
    required String role,
    required String aimId,
    required List<String> microAim,
  }) async {
    String? slote = await SlotBookingService().slotBooking(
      name: name,
      email: email,
      phoneNumber: phoneNumber,
      appointDate: appointDate,
      appointTime: appointTime,
      role: role,
      aimId: aimId,
      microAim: microAim,
    );
    if (slote == "Slot Booked successfully") {
      return "True";
    } else {
      return slote;
    }
  }

  /*------------ validation ---------*/
  String? nameValidation(String? word) {
    if (word == null || word.isEmpty) {
      return 'Please enter Name';
    }
    List<String> nameWords = word.split(' ');

    // log(nameWords.toString(), name: 'words');
    if (nameWords.length < 2) {
      return 'Please enter First and Last name';
    }
    if (nameWords.length > 35) {
      return 'Name should be less than 35 characters';
    }
    return null;
  }

  String? phoneValidation(String? word) {
    if (word == null || word.isEmpty || word.length < 10) {
      return 'Please enter a Valid Mobile Number';
    }
    return null;
  }

  String? emailValidation(String? word) {
    if (word == null || word.isEmpty) {
      return 'Please enter Email';
    } else if (!word.isEmail) {
      return 'Please enter a valid Email';
    }
    return null;
  }

  String validateOtp() {
    String otp = otpController1.text +
        otpController2.text +
        otpController3.text +
        otpController4.text;
    if (otp.isEmpty || otp.length < 4) {
      validationMessage.value = 'Please enter valid code';
      return 'Please enter valid code';
    } else {
      validationMessage.value = '';
      return '';
    }
  }

  void updatebuttonCareerOTP() {
    int numberOfFilledFields = 0;

    if (otpController1.text.isNotEmpty) numberOfFilledFields++;
    if (otpController2.text.isNotEmpty) numberOfFilledFields++;
    if (otpController3.text.isNotEmpty) numberOfFilledFields++;
    if (otpController4.text.isNotEmpty) numberOfFilledFields++;

    filledOtpFields.value = numberOfFilledFields;
    careerbuttonColor.value = numberOfFilledFields == 4 ? kpurple : buttonColor;
    careerBTextColor.value =
        numberOfFilledFields == 4 ? Colors.white : disableText;
    update(['update-careerOTP']);
  }

  /*------------ button color change ---------*/
  void checkAllfieldCareerHome() {
    bool allFieldsSelectedCareer =
        nameController.text.isNotEmpty && roleController.text.isNotEmpty;

    isAllCareerHomeFieldsSelected.value = allFieldsSelectedCareer;
    careerButtontext.value = allFieldsSelectedCareer
        ? Colors.white
        : const Color.fromARGB(255, 116, 118, 119);
    update(['button-careerHome']);
  }

  clearotpControllers() {
    otpController1.clear();
    otpController2.clear();
    otpController3.clear();
    otpController4.clear();
  }
}



  // List<Category>? aimRes;
  // List<SubCategory>? microaimRes;

  /*------------ Get Aim options ---------*/
  // Future<List<Category>?> getAimOptions() async {
  //   aimRes = await CareerAimService().getAimService();
  //   // CareerAimService().getAimSearchResult(query: 'med');
  //   update();
  //   return aimRes;
  //   // return null;
  // }

  // /*------------ Get Micro Aim options ---------*/
  // Future<List<SubCategory>?> getMicroAimOptions({required String aimId}) async {
  //   microaimRes = await CareerAimService().getMicroAim(aimId: aimId);
  //   log(microaimRes![0].categoryName.toString(), name: 'controller');
  //   update();
  //   return microaimRes;
  // }