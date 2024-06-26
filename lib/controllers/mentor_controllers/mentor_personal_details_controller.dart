import 'package:aimshala/controllers/mentor_controllers/mentor_background_detail_controller.dart';
import 'package:aimshala/controllers/mentor_controllers/mentor_reference_controller.dart';
import 'package:aimshala/models/mentor_check_model/mentor_model.dart';
import 'package:aimshala/services/mentor_reg_service/check_mentor_taken_service.dart';
import 'package:aimshala/utils/common/widgets/colors_common.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class MentorPersonalDetailController extends GetxController {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController dobController = TextEditingController();
  TextEditingController statusController = TextEditingController();

  final bgControllerMentor = Get.put(MentorBackgroundDetailController());
  final refmentroController = Get.put(MentorReferencesController());

  DateTime dateTime = DateTime.now();
  String? selectedGender;
  final List<String> genderOptions = ['Male', 'Female', 'Other'];
  List<QualificationData> statusList = [];
  // List<DegreeData> degreeList = [];
  // List<RelationData> relationList = [];

  Rx<Color> saveText = Rx<Color>(textFieldColor);
  Rx<Color> saveBG = Rx<Color>(buttonColor);

  Future<void> checkMentorRegtakenFunction({required String uId}) async {
    Map<String, dynamic>? resData =
        await CheckMentorRegTakenService().checkMentorRegtaken(uId: uId);
    if (resData != null) {
      if (resData.containsKey('error')) {
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
        if (resData.containsKey('qualifications')) {
          List<dynamic> data = resData['qualifications'];
          List<QualificationData> list =
              data.map((e) => QualificationData.fromJson(e)).toList();
          statusList.addAll(list);
        }
        if (resData.containsKey('degreeData')) {
          List<dynamic> data = resData['degreeData'];
          List<DegreeData> list =
              data.map((e) => DegreeData.fromJson(e)).toList();
          // degreeList.addAll(list);
          bgControllerMentor.degreeList.addAll(list);
        }
        if (resData.containsKey('relationData')) {
          List<dynamic> data = resData['relationData'];
          List<RelationData> list =
              data.map((e) => RelationData.fromJson(e)).toList();
          refmentroController.relationList.addAll(list);
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
      update(['mentor-personalinfo']);
    }
  }

  String? fieldValidation(String? value, {bool? phone, bool? email}) {
    if (value == null || value.isEmpty) {
      return 'Please Enter This Field';
    }
    if (value.isNotEmpty && value.length < 10 && phone == true) {
      return 'Please Enter 10 digit Valid Number';
    }
    if (value.isNotEmpty && !value.isEmail && email == true) {
      return 'Please Enter a Valid Email';
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

  String? genderValidation(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please select your gender';
    }
    return null;
  }

  void checkAllFileds() {
    bool isAllFiledSelected = nameController.text.isNotEmpty &&
        emailController.text.isNotEmpty &&
        locationController.text.isNotEmpty &&
        mobileController.text.isNotEmpty &&
        dobController.text.isNotEmpty &&
        (selectedGender != null) &&
        statusController.text.isNotEmpty;
    saveText.value = isAllFiledSelected ? kwhite : textFieldColor;
    saveBG.value = isAllFiledSelected ? mainPurple : buttonColor;
    update(['mentor-personalinfo']);
  }

  void clearAllfields() {
    nameController.clear();
    emailController.clear();
    locationController.clear();
    mobileController.clear();
  }
}
