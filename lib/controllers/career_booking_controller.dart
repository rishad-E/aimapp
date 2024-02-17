import 'dart:developer';

import 'package:aimshala/models/career_aim_model/career_bookingtime_model.dart';
import 'package:aimshala/models/career_aim_model/search_aim_res_model.dart';
import 'package:aimshala/models/career_aim_model/search_microaim_res_model.dart';
import 'package:aimshala/services/career_services/get_aim_service.dart';
import 'package:aimshala/services/career_services/get_booking_date_time_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BookCareerCounsellController extends GetxController {
  TextEditingController nameController = TextEditingController();
  TextEditingController roleController = TextEditingController();
  TextEditingController aimController = TextEditingController();
  RxList<String> check = <String>[].obs;
  RxList<Aim> searchAimRes = <Aim>[].obs;
  RxList<MicroAim> searchMicorAimRes = <MicroAim>[].obs;
  RxList<Slot> times = <Slot>[].obs;
  String? selectedDate;
  String? selectedTime;
  // List<Category>? aimRes;
  // List<SubCategory>? microaimRes;
  RxBool isAllCareerHomeFieldsSelected = false.obs;
  RxBool isAllCareerAimFieldsSelected = false.obs;
  Rx<Color> careerButtontextAim =
      Rx<Color>(const Color.fromARGB(255, 116, 118, 119));
  Rx<Color> careerButtontext =
      Rx<Color>(const Color.fromARGB(255, 116, 118, 119));
  String careerSelectedRole = 'Select your role';
  RxString careerAimSelectedRole = 'Your aim'.obs;
  String careerMicroAimSelectedRole = 'Your Micro aim';
  String? aimId;

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

  Future<RxList<Slot>> fetchBookingTime({required String date}) async {
    times.value = await CareerBookingService().getBookingTime(date: date);
    update();
    return times;
  }

  /*------------validation---------*/

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

  void checkAllfieldCareerHome() {
    bool allFieldsSelectedCareer =
        nameController.text.isNotEmpty && roleController.text.isNotEmpty;

    isAllCareerHomeFieldsSelected.value = allFieldsSelectedCareer;
    careerButtontext.value = allFieldsSelectedCareer
        ? Colors.white
        : const Color.fromARGB(255, 116, 118, 119);
    update(['button-careerHome']);
  }

  // void checkAllfieldCareerAim() {
  //   bool allFieldsSelectedCareerAim =
  //       aimController.text.isNotEmpty && check.isNotEmpty;

  //   isAllCareerAimFieldsSelected.value = allFieldsSelectedCareerAim;
  //   careerButtontextAim.value = allFieldsSelectedCareerAim
  //       ? Colors.white
  //       : const Color.fromARGB(255, 116, 118, 119);
  //   update(['button-careerAim']);
  // }
}
