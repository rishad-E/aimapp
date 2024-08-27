import 'package:aimshala/services/profile_section/update_personal_info_service.dart';
import 'package:aimshala/utils/common/widgets/colors_common.dart';
import 'package:aimshala/view/profile/profile_home/profile_home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class PerosnalInfoController extends GetxController {
  final dateController = TextEditingController();
  final nameController = TextEditingController();
  final userNameController = TextEditingController();
  final genderController = TextEditingController();
  final aboutController = TextEditingController();
  final DateTime dateTime = DateTime.now();
  FlutterSecureStorage storage = const FlutterSecureStorage();

  var selectedGender = ''.obs;

  Rx<Color> saveText = Rx<Color>(textFieldColor);
  Rx<Color> saveBG = Rx<Color>(buttonColor);
  RxBool isSaving = false.obs;

  /* ------ save personal info function ------ */
  Future<void> savepersonalInfoFunction({
    required String fullName,
    required String userName,
    required String dOB,
    required String gender,
    required String statement,
  }) async {
    try {
      isSaving.value = true;
      String? token = await storage.read(key: 'token');
      bool? res = await UpdatePersonalInfoService().updatePersonalInfo(
          token: token.toString(),
          fullName: fullName,
          userName: userName,
          dOB: dOB,
          gender: gender,
          statement: statement);
      if (res == true) {
        Get.off(() => const ProfileHomeScreen(id:''));
      } else {
        Get.showSnackbar(
          const GetSnackBar(
            snackStyle: SnackStyle.FLOATING,
            message: 'personal info update failed',
            margin: EdgeInsets.all(10),
            backgroundColor: Colors.red,
            duration: Duration(seconds: 2),
          ),
        );
      }
    } finally {
      isSaving.value = false;
    }
  }

  /* ------ date picker for personal info------ */
  Future<void> datePicker(BuildContext context) async {
    final DateTime? picker = await showDatePicker(
      context: context,
      initialDate: dateTime,
      firstDate: DateTime(2000),
      lastDate: DateTime(2050),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.dark().copyWith(
            colorScheme: const ColorScheme.dark(
              primary: Colors.purple,
              onPrimary: Colors.white,
            ),
            dialogBackgroundColor: Colors.white,
          ),
          child: child!,
        );
      },
    );
    if (picker != null && picker != dateTime) {
      final formatedDate = DateFormat('dd-MM-yyyy').format(picker);
      dateController.text = formatedDate;
      // allFieldSelect();
      update(['update-personalinfo']);
    }
  }
  /* ------ date picker for personal info------ */

  String? fieldValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'please select a date';
    }
    return null;
  }
}
