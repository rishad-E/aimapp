import 'package:aimshala/controllers/counselor_controllers/counselor_reference_controller.dart';
import 'package:aimshala/models/mentor_check_model/mentor_model.dart';
import 'package:aimshala/services/counselor_reg_service/check_counselor_taken_service.dart';
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
  RxString selectedGender = ''.obs;
  final List<String> genderOptions = ['Male', 'Female', 'Other', ''];
  List<QualificationData> statusList = [];
  String isCounselor = 'no';
  final refCounsController = Get.put(CounselorReferenceController());

  Future<void> checkCounselorRegtakenFunction({required String uId}) async {
    Map<String, dynamic>? resData =
        await CheckCounselorRegTakenService().checkCounselorRegtaken(uId: uId);
    if (resData != null) {
      if (resData.containsKey('error')) {
        isCounselor = 'error';
        String errorMessage = resData['error'];
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
        // isCounselor = 'yes';
        if (resData.containsKey('existCounsellor')) {
          if (resData['existCounsellor'] == null) {
            isCounselor = 'no';
          } else {
            isCounselor = 'yes';
          }
        }
        if (resData.containsKey('qualifications')) {
          List<dynamic> data = resData['qualifications'];
          List<QualificationData> list =
              data.map((e) => QualificationData.fromJson(e)).toList();
          statusList.addAll(list);
        }
        if (resData.containsKey('degreeData')) {}
        if (resData.containsKey('relationData')) {
          List<dynamic> data = resData['relationData'];
          List<RelationData> list =
              data.map((e) => RelationData.fromJson(e)).toList();
          refCounsController.relationList.addAll(list);
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

  void clearAllfields() {
    nameController.clear();
    emailController.clear();
    locationController.clear();
    mobileController.clear();
    dobController.clear();
    statusController.clear();
  }
}
