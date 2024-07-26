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
}
