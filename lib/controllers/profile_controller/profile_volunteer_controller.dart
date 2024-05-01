import 'package:aimshala/services/profile_section/update_volunteer_info_service.dart';
import 'package:aimshala/utils/common/colors_common.dart';
import 'package:aimshala/view/profile/profile_home/profile_home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ProfileVolunteerController extends GetxController {
  TextEditingController organizationController = TextEditingController();
  TextEditingController volunteerRoleController = TextEditingController();
  TextEditingController causeController = TextEditingController();
  TextEditingController startdateController = TextEditingController();
  TextEditingController endDateController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  DateTime dateTime = DateTime.now();
  Rx<Color> saveText = Rx<Color>(textFieldColor);
  Rx<Color> saveBG = Rx<Color>(buttonColor);

  Future<void> saveVolunteerInfoFuntion({
    required String uId,
    required String organization,
    required String volRole,
    required String volCause,
    required String startDate,
    required String endDate,
    required String description,
  }) async {
    String? res = await UpdateVolunteerInfoService().saveVolunteerInfo(
        uId: uId,
        organization: organization,
        volRole: volRole,
        volCause: volCause,
        startDate: startDate,
        endDate: endDate,
        description: description);
    if (res == 'Volunteer experience added successfully.') {
      Get.showSnackbar(
        GetSnackBar(
          snackStyle: SnackStyle.FLOATING,
          message: res,
          borderRadius: 4,
          margin: const EdgeInsets.all(10),
          backgroundColor: Colors.green,
          duration: const Duration(seconds: 2),
        ),
      );
      Get.off(() => const ProfileHomeScreen());
    } else {
      Get.showSnackbar(
        GetSnackBar(
          snackStyle: SnackStyle.FLOATING,
          message: res,
          borderRadius: 4,
          margin: const EdgeInsets.all(10),
          backgroundColor: Colors.red,
          duration: const Duration(seconds: 2),
        ),
      );
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
      if (start == true) {
        startdateController.text = formatedDate;
        allFieldSelected();
        update(['update-volunteerInfo']);
      } else {
        endDateController.text = formatedDate;
        allFieldSelected();
        update(['update-volunteerInfo']);
      }
    }
  }

  void allFieldSelected() {
    bool isAllfieldSelected = organizationController.text.isNotEmpty &&
        volunteerRoleController.text.isNotEmpty &&
        causeController.text.isNotEmpty &&
        startdateController.text.isNotEmpty &&
        endDateController.text.isNotEmpty &&
        descriptionController.text.isNotEmpty;
    saveText.value = isAllfieldSelected ? kwhite : textFieldColor;
    saveBG.value = isAllfieldSelected ? mainPurple : buttonColor;
  }

  String? fieldValidation(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please Enter this Filed';
    }
    return null;
  }
}
