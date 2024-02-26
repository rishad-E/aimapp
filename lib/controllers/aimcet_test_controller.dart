import 'package:aimshala/models/AIMCET_TEST/AIMCET_qualification/qualification_model.dart';
import 'package:aimshala/services/AIMCET_TEST/aimcet_qualification_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AIMCETController extends GetxController {
  TextEditingController qualificationController = TextEditingController();
  RxList<Qualification> qualificationList = <Qualification>[].obs;
  RxString qualify = 'Your qualification'.obs;
  String? qualifyId;
  bool guideSelect = false;
  RxBool guidebutton = false.obs;


  /* --------- get all qualifications-------*/
  Future<void> getQualifications() async {
    qualificationList.value = await AIMCETQualificationService().fetchQualification();
    update();
  }

  void toggleSelection(){
    guideSelect = !guideSelect;
    // guidebutton.value = !guidebutton.value;
    guidebutton.value = guideSelect;
    update(['button-proceed']);
  }
}
