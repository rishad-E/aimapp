import 'dart:developer';

import 'package:aimshala/models/career_aim_model/aim_model.dart';
import 'package:aimshala/models/career_aim_model/micro_aim_model.dart';
import 'package:aimshala/services/career_services/get_aim.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BookCareerCounsellController extends GetxController {
  TextEditingController nameController = TextEditingController();
  TextEditingController roleController = TextEditingController();
  TextEditingController aimController = TextEditingController();
  // TextEditingController microaimController = TextEditingController();
  // List<dynamic> check = [];
  RxList<String> check = <String>[].obs;
  List<Category>? aimRes;
  List<SubCategory>? microaimRes;
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

  Future<List<Category>?> getAimOptions() async {
    aimRes = await CareerAimService().getAimService();
    update();
    return aimRes;
    // return null;
  }

  Future<List<SubCategory>?> getMicroAimOptions({required String aimId}) async {
    microaimRes = await CareerAimService().getMicroAim(aimId: aimId);
    log(microaimRes![0].categoryName.toString(), name: 'controller');
    update();
    return microaimRes;
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
