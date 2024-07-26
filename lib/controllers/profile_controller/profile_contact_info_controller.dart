import 'dart:developer';

import 'package:aimshala/models/profile_model/cities_model.dart';
import 'package:aimshala/models/profile_model/country_state_model.dart';
import 'package:aimshala/services/otp_service/otp_service.dart';
import 'package:aimshala/services/profile_section/update_contact_info_service.dart';
import 'package:aimshala/utils/common/widgets/colors_common.dart';
import 'package:aimshala/view/profile/profile_home/profile_home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UpdateContactInfo extends GetxController {
  TextEditingController mobController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController pincodeController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  TextEditingController facebookController = TextEditingController();
  TextEditingController instagramController = TextEditingController();
  TextEditingController twitterController = TextEditingController();

  TextEditingController otpController = TextEditingController();
  TextEditingController searchController = TextEditingController();

  Rx<Color> saveText = Rx<Color>(textFieldColor);
  Rx<Color> saveBG = Rx<Color>(buttonColor);

  RxList<StateData> stateData = <StateData>[].obs;
  RxList<StateData> filteredStateData = <StateData>[].obs;
  RxList<City> cityData = <City>[].obs;
  RxList<City> filteredCityData = <City>[].obs;
  RxString errorMessage = ''.obs;
  RxBool isLoading = false.obs;
  RxBool isSaving = false.obs;

  /*-----phone number changing----*/
  RxString changePhone = ''.obs;
  RxInt otpVerifiedNum = 0.obs;
  RxBool canSave = true.obs;

  /* ---phases---
    1.onScreen
    1. sendOTP
    2.validateOTP
    3.OTPverified
   */

  RxString otpError = ''.obs;
  /*-----phone number changing----*/

  Future<void> saveContactInfoFunction({
    required String uId,
    required String userName,
    required String mobNumber,
    required String email,
    required String address,
    required String pincode,
    required String city,
    required String state,
    required String country,
    required String facebook,
    required String instagram,
    required String twitter,
  }) async {
    try {
      isSaving.value = true;
      String? res = await UpdateContactInfoService().updateContactInfo(
        uId: uId,
        userName: userName,
        mobNumber: mobNumber,
        email: email,
        address: address,
        pincode: pincode,
        city: city,
        state: state,
        country: country,
        facebook: facebook,
        instagram: instagram,
        twitter: twitter,
      );
      if (res == 'Contact information updated successfully.') {
        Get.snackbar("Udated successfully", '$res',
            snackPosition: SnackPosition.BOTTOM,
            duration: const Duration(seconds: 2),
            backgroundColor: Colors.green,
            colorText: Colors.white,
            margin: const EdgeInsets.all(5));
        Get.off(() => ProfileHomeScreen(id: uId));
      } else {
        Get.snackbar("Error", '$res',
            snackPosition: SnackPosition.BOTTOM,
            duration: const Duration(seconds: 2),
            backgroundColor: kred,
            colorText: Colors.white,
            margin: const EdgeInsets.all(5));
      }
    } finally {
      isSaving.value = false;
    }
  }

  Future<void> fetchCountryStates() async {
    try {
      final res = await UpdateContactInfoService().getCountryStatesService();
      if (res != null) {
        List<dynamic> data = res["states"];
        if (data.isNotEmpty) {
          stateData.value =
              data.map((json) => StateData.fromJson(json)).toList();
          log(stateData.toString(), name: 'state data c');
        } else {
          stateData.value = [];
        }
      } else {
        stateData.value = [];
      }
    } catch (e) {
      stateData.value = [];
      errorMessage.value = 'error occurred';
      log('Error fetching states: $e', name: 'state data c');
    }
  }

  void filterStates(String query) {
    if (query.isEmpty) {
      filteredStateData.value = stateData;
    } else {
      final filterStates = stateData.where((state) {
        final stateName = state.name?.toLowerCase();
        final searchQuery = query.toLowerCase();
        return stateName!.contains(searchQuery);
      }).toList();
      filteredStateData.value = filterStates;
    }
  }

  Future<void> fetchCities({required String stateId}) async {
    try {
      isLoading.value = true;
      final res =
          await UpdateContactInfoService().getCitiesService(stateID: stateId);
      if (res != null) {
        cityData.value = res;
        filteredCityData.value = cityData;
      } else {
        cityData.value = [];
      }
    } catch (e) {
      cityData.value = [];
    } finally {
      isLoading.value = false;
    }
  }

  void filterCity(String query) {
    if (searchController.text.isEmpty) {
      filteredCityData.value = cityData;
      update(['update-citySearch']);
    } else {
      final filteredCities = cityData.where((city) {
        final cityName = city.name?.toLowerCase();
        final searchQuery = query.toLowerCase();
        return cityName!.contains(searchQuery);
      }).toList();
      filteredCityData.value = filteredCities;
      update(['update-citySearch']);
    }
  }

  /*--------OTP validation------ */
  Future<void> phoneNumberOTPverification({required String mobileNo}) async {
    canSave.value = false;
    String? res = await OtpService().sendOTP(mobileNo: mobileNo);
    if (res == 'success') {
      changePhone.value = 'sendOTP';
    }
    // log(res.toString());
  }

  Future<void> validateOTP({required String mob, required String otp}) async {
    String? res = await OtpService().validateOTP(otp: otp, mobileNo: mob);
    otpError.value = res.toString();
    if (res == 'OTP verified success') {
      changePhone.value = 'verified';
      //for send code disable function
      otpError.value = 'OTP verified success';
      otpVerifiedNum.value++;
      canSave.value = true;
    }
  }

  Future<void> validateNewNumber({required String mob}) async {
    String? res = await UpdateContactInfoService().verifyNewNumber(mob: mob);
    log(res.toString(), name: 'validate new no');

    if (res == 'This mobile number is not registered.') {
      changePhone.value = 'verified';
      otpError.value = '';
    } else {
      otpError.value = res.toString();
    }
  }

  Future<void> resendOTP({required String mob}) async {
    String? res = await OtpService().resendOTP(mobileNo: mob);
    // if (res == 'OTP verified success') {}
    log(res.toString());
  }
  /*--------OTP validation------ */

  /*--------validator------ */
  String? fieldValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'please fill this filed';
    }
    return null;
  }

  /*-------- all field selection ------ */
  void allFieldSelect() {
    bool isAllFiledSelected = mobController.text.isNotEmpty &&
        usernameController.text.isNotEmpty &&
        emailController.text.isNotEmpty &&
        addressController.text.isNotEmpty &&
        cityController.text.isNotEmpty &&
        stateController.text.isNotEmpty;
    saveText.value = isAllFiledSelected ? kwhite : textFieldColor;
    saveBG.value = isAllFiledSelected ? mainPurple : buttonColor;
    update(['update-contactInfo']);
  }
}
