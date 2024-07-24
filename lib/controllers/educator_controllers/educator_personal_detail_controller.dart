import 'package:aimshala/controllers/educator_controllers/educator_background_detail_controller.dart';
import 'package:aimshala/controllers/educator_controllers/educator_reference_controller.dart';
import 'package:aimshala/models/mentor_check_model/mentor_model.dart';
import 'package:aimshala/services/educator_reg_service/check_educator_reg_service.dart';
import 'package:aimshala/utils/common/widgets/colors_common.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class EducatorPersonalDetailController extends GetxController {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController dobController = TextEditingController();
  TextEditingController statusController = TextEditingController();

  final bgEduController = Get.put(EducatorBackgroundDetailController());
  final refEduController = Get.put(EducatorReferenceController());

  DateTime dateTime = DateTime.now();
  RxString selectedGender = ''.obs;
  final List<String> genderOptions = ['Male', 'Female', 'Other',''];
  List<QualificationData> statusList = [];

  Rx<Color> saveText = Rx<Color>(textFieldColor);
  Rx<Color> saveBG = Rx<Color>(buttonColor);

  String isEducator = 'no';

  Future<void> checkEducatorRegTakenFunction({required String uId}) async {
    Map<String, dynamic>? res =
        await CheckEducatorRegTakenService().checkEducatorRegTaken(uId: uId);
    if (res != null) {
      if (res.containsKey('error')) {
        isEducator = 'error';
        String errorMessage = res['error'];
        Get.showSnackbar(
          GetSnackBar(
            snackStyle: SnackStyle.FLOATING,
            message: errorMessage,
            margin: const EdgeInsets.all(10),
            backgroundColor: Colors.red,
            duration: const Duration(seconds: 2),
          ),
        );
      } else {
        if (res.containsKey('existEducator')) {
          if (res['existEducator'] == null) {
            isEducator = 'no';
          } else {
            isEducator = 'yes';
          }
        }
        if (res.containsKey('qualifications')) {
          List<dynamic> data = res['qualifications'];
          List<QualificationData> list =
              data.map((e) => QualificationData.fromJson(e)).toList();
          statusList.addAll(list);
        }
        if (res.containsKey('degreeData')) {
          List<dynamic> data = res['degreeData'];
          List<DegreeData> list =
              data.map((e) => DegreeData.fromJson(e)).toList();
          // degreeList.addAll(list);
          bgEduController.degreeList.addAll(list);
        }
        if (res.containsKey('relationData')) {
          List<dynamic> data = res['relationData'];
          List<RelationData> list =
              data.map((e) => RelationData.fromJson(e)).toList();
          refEduController.relationList.addAll(list);
        }
      }
    }
  }

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

  String? nameValidation(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter this field';
    }
    if (value.length < 3) {
      return 'Name should contain atleast 3 characters';
    }
    return null;
  }

  String? fieldValidation(String? value, {bool? email}) {
    if (value == null || value.isEmpty) {
      return 'Please Enter This Field';
    }

    if (value.isNotEmpty && !value.isEmail && email == true) {
      return 'Please Enter a Valid Email';
    }
    return null;
  }

  String? genderValidation(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please select your gender';
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

  void checkAllFileds() {
    bool isAllFiledSelected = nameController.text.isNotEmpty &&
        emailController.text.isNotEmpty &&
        locationController.text.isNotEmpty &&
        mobileController.text.isNotEmpty &&
        dobController.text.isNotEmpty &&
        selectedGender.isNotEmpty &&
        statusController.text.isNotEmpty;
    saveText.value = isAllFiledSelected ? kwhite : textFieldColor;
    saveBG.value = isAllFiledSelected ? mainPurple : buttonColor;
    update(['edu-personalinfo']);
  }

  void clearAllfields() {
    nameController.clear();
    emailController.clear();
    locationController.clear();
    mobileController.clear();
  }
}
