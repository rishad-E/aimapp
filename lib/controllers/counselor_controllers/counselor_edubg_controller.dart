import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class CounserlorEduBGController extends GetxController {
  TextEditingController degreeController = TextEditingController();
  TextEditingController certificationController = TextEditingController();
  TextEditingController specializationController = TextEditingController();

  String? fieldValidation(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter this field';
    }
    return null;
  }
}
