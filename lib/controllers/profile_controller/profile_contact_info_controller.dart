import 'dart:developer';

import 'package:aimshala/models/profile_model/cities_model.dart';
import 'package:aimshala/models/profile_model/country_state_model.dart';
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

  Rx<Color> saveText = Rx<Color>(textFieldColor);
  Rx<Color> saveBG = Rx<Color>(buttonColor);

  RxList<StateData> stateData = <StateData>[].obs;
  RxList<City> cityData = <City>[].obs;
  RxString errorMessage = ''.obs;
  RxBool isLoading = false.obs;

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
    bool? res = await UpdateContactInfoService().updateContactInfo(
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
    if (res == true) {
     Get.off(() => ProfileHomeScreen(id: uId));
    } else {
      Get.showSnackbar(
        const GetSnackBar(
          snackStyle: SnackStyle.FLOATING,
          message: 'Contact info update failed',
          margin: EdgeInsets.all(10),
          backgroundColor: Colors.red,
          duration: Duration(seconds: 2),
        ),
      );
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

  Future<void> fetchCities({required String stateId}) async {
    try {
      isLoading.value = true;
      final res =
          await UpdateContactInfoService().getCitiesService(stateID: stateId);
      if (res != null) {
        cityData.value = res;
      } else {
        cityData.value = [];
      }
    } catch (e) {
      cityData.value = [];
    } finally {
      isLoading.value = false;
    }
  }

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
        stateController.text.isNotEmpty &&
        facebookController.text.isNotEmpty &&
        instagramController.text.isNotEmpty &&
        twitterController.text.isNotEmpty;
    saveText.value = isAllFiledSelected ? kwhite : textFieldColor;
    saveBG.value = isAllFiledSelected ? mainPurple : buttonColor;
    update(['update-contactInfo']);
  }
}
