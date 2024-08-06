import 'package:aimshala/models/mentor_check_model/mentor_model.dart';
import 'package:aimshala/utils/common/widgets/colors_common.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CounselorReferenceController extends GetxController {
  TextEditingController name1Controller = TextEditingController();
  TextEditingController relation1Controller = TextEditingController();
  TextEditingController mob1Controller = TextEditingController();
  TextEditingController name2Controller = TextEditingController();
  TextEditingController relation2Controller = TextEditingController();
  TextEditingController mob2Controller = TextEditingController();
  TextEditingController otherRela1Controller = TextEditingController();
  TextEditingController otherRela2Controller = TextEditingController();

  List<RelationData> relationList = [];
  RxString otherRela1 = ''.obs;
  RxString otherRela2 = ''.obs;

  Rx<Color> saveText = Rx<Color>(textFieldColor);
  Rx<Color> saveBG = Rx<Color>(buttonColor);

  List<String> referenceNames = [];
  List<String> referenceRelation = [];
  List<String> referencePhone = [];
  List<String?> refOtherRelation = [];

  void addReferenceFields(
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
    if (!refOtherRelation.contains(otherRelation1)) {
      refOtherRelation.add(otherRelation1);
    }
    if (!refOtherRelation.contains(otherRelation2)) {
      refOtherRelation.add(otherRelation2);
    }
  }

  String? mobValiation(String? value) {
    if (value == null || value.isEmpty) {
      return null; // No validation if the field is empty
    }
    if (!value.isNumericOnly) {
      return "Please enter a valid Mobile Number";
    }
    if (value.length < 10) {
      return "Please enter a valid 10 digit Number";
    }
    return null;
  }

  void checkAllFileds() {
    bool isAllFiledSelected = name1Controller.text.isNotEmpty &&
        relation1Controller.text.isNotEmpty &&
        mob1Controller.text.isNotEmpty &&
        name2Controller.text.isNotEmpty &&
        relation2Controller.text.isNotEmpty &&
        mob2Controller.text.isNotEmpty;

    saveText.value = isAllFiledSelected ? kwhite : textFieldColor;
    saveBG.value = isAllFiledSelected ? mainPurple : buttonColor;
    update(['update-counsReference']);
  }

  void clearCounselorRefFields() {
    name1Controller.clear();
    relation1Controller.clear();
    mob1Controller.clear();
    name2Controller.clear();
    relation2Controller.clear();
    mob2Controller.clear();
    otherRela1Controller.clear();
    otherRela2Controller.clear();
    otherRela1.value = '';
    otherRela2.value = '';
    referenceNames.clear();
    referenceRelation.clear();
    referencePhone.clear();
    refOtherRelation.clear();
  }
}
