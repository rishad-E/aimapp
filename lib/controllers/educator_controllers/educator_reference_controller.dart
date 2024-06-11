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

  String? filedValidation(String? value) {
    if (value == null || value.isEmpty) {
      return "Please Enter This Field";
    }

    return null;
  }

  String? mobileValidation(String? value) {
    if (value == null ||
        value.isEmpty ||
        value.length < 10 ||
        !value.isNumericOnly) {
      return 'Enter a 10 digit Valid Number';
    }
    return null;
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
}
