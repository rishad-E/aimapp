import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class CounserlorEduBGController extends GetxController {
  TextEditingController degreeController = TextEditingController();
  TextEditingController certificationController = TextEditingController();
  TextEditingController specializationController = TextEditingController();
  TextEditingController otherDegreeController = TextEditingController();
  RxString otherDegree = ''.obs;

  String? fieldValidation(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter this field';
    }
    return null;
  }

  void clearCounselroBgFields() {
    degreeController.clear();
    certificationController.clear();
    specializationController.clear();
    otherDegreeController.clear();
    otherDegree.value = '';
  }
}
