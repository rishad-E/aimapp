import 'package:aimshala/utils/common/widgets/colors_common.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class CounselorPersonalController extends GetxController {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController dobController = TextEditingController();
  TextEditingController statusController = TextEditingController();

  Rx<Color> saveText = Rx<Color>(textFieldColor);
  Rx<Color> saveBG = Rx<Color>(buttonColor);
  DateTime dateTime = DateTime.now();
  String? selectedGender;
  final List<String> genderOptions = ['Male', 'Female', 'Other'];
  Future<void> datePicker(BuildContext context, {bool? start}) async {
    final DateTime? picker = await showDatePicker(
      context: context,
      initialDate: dateTime,
      firstDate: DateTime(2000),
      lastDate: DateTime(2050),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.dark().copyWith(
            colorScheme: const ColorScheme.dark(
              primary: Colors.purple, // Header background color
              onPrimary: Colors.white, // Header text color
              //   surface: Colors.grey.shade300, // Calendar background color
              //   onSurface: Colors.black, // Calendar text color
            ),

            dialogBackgroundColor: Colors.white, // Dialog background color
          ),
          child: child!,
        );
      },
    );
    if (picker != null && picker != dateTime) {
      final formatedDate = DateFormat('dd-MM-yyyy').format(picker);
      dobController.text = formatedDate;
      checkAllFileds();
    }
  }

  String? fieldValidation(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter this Fields';
    }
    return null;
  }

  String? namedValidation(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter this fields';
    }
    if (value.length < 3) {
      return 'Name should contain atleast 3 characters';
    }
    return null;
  }

  String? emailValidation(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter this fields';
    }
    if (!value.isEmail) {
      return 'Please enter a valid email';
    }
    return null;
  }

  String? mobileValidation(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter this fields';
    }
    if (!value.isNumericOnly) {
      return 'Please enter a valid mobile number';
    }
    if (value.length < 10) {
      return 'Please enter a 10digit valid mobile number';
    }
    return null;
  }

  void checkAllFileds() {
    bool isAllFiledSelected = nameController.text.isNotEmpty &&
        emailController.text.isNotEmpty &&
        locationController.text.isNotEmpty &&
        mobileController.text.isNotEmpty &&
        dobController.text.isNotEmpty &&
        statusController.text.isNotEmpty;
    saveText.value = isAllFiledSelected ? kwhite : textFieldColor;
    saveBG.value = isAllFiledSelected ? mainPurple : buttonColor;
    update(['couns-Personal details']);
  }
}
