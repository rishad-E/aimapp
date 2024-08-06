import 'package:aimshala/models/mentor_check_model/mentor_model.dart';
import 'package:aimshala/utils/common/widgets/colors_common.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EducatorReferenceController extends GetxController {
  TextEditingController nameController1 = TextEditingController();
  TextEditingController relationController1 = TextEditingController();
  TextEditingController mobileController1 = TextEditingController();
  TextEditingController nameController2 = TextEditingController();
  TextEditingController relationController2 = TextEditingController();
  TextEditingController mobileController2 = TextEditingController();
  TextEditingController otherRelationController1 = TextEditingController();
  TextEditingController otherRelationController2 = TextEditingController();
  Rx<Color> nextText = Rx<Color>(textFieldColor);
  Rx<Color> nextBG = Rx<Color>(buttonColor);
  RxString otherRelation1 = ''.obs;
  RxString otherRelation2 = ''.obs;

  List<RelationData> relationList = [];

  List<String> referenceNames = [];
  List<String> referenceRelation = [];
  List<String> referencePhone = [];
  List<String?> otherRelation = [];

  void addtoLists(
      {required String refName1,
      required String refRelation1,
      required String refPhone1,
      required String refName2,
      required String refRelation2,
      required String refPhone2,
      String? otherRelation1,
      String? otherRelation2}) {
    if (!referenceNames.contains(refName1)) {
      referenceNames.add(refName1);
    }
    if (!referenceNames.contains(refName2)) {
      referenceNames.add(refName2);
    }
    if (!referenceRelation.contains(refRelation1)) {
      referenceRelation.add(refRelation1);
    }
    if (!referenceRelation.contains(refRelation2)) {
      referenceRelation.add(refRelation2);
    }
    if (!referencePhone.contains(refPhone1)) {
      referencePhone.add(refPhone1);
    }
    if (!referencePhone.contains(refPhone2)) {
      referencePhone.add(refPhone2);
    }
    if (!otherRelation.contains(otherRelation1)) {
      otherRelation.add(otherRelation1);
    }
    if (!otherRelation.contains(otherRelation2)) {
      otherRelation.add(otherRelation2);
    }
  }

  void checkAlFields() {
    bool isAllFieldSelected = nameController1.text.isNotEmpty &&
        relationController1.text.isNotEmpty &&
        mobileController1.text.isNotEmpty &&
        nameController2.text.isNotEmpty &&
        relationController2.text.isNotEmpty &&
        mobileController2.text.isNotEmpty;
    nextText.value = isAllFieldSelected ? kwhite : textFieldColor;
    nextBG.value = isAllFieldSelected ? mainPurple : buttonColor;
    update(['edu-referenceInfo']);
  }

  void clearEducatorRefFields() {
    nameController1.clear();
    relationController1.clear();
    mobileController1.clear();
    nameController2.clear();
    relationController2.clear();
    mobileController2.clear();
    otherRelationController1.clear();
    otherRelationController2.clear();
    referenceNames.clear();
    referenceRelation.clear();
    referencePhone.clear();
  }
}
