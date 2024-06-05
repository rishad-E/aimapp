import 'package:get/get.dart';

class EducatorWorkPreferenceController extends GetxController {
  bool relocate = false;
  String workMode = '';
  String teachingMode = '';

  void toggleRelocate({required bool val}) {
    if (val == true && relocate == false) {
      relocate = true;
    }
    if (val == false && relocate == true) {
      relocate = false;
    }
    // relocate = !relocate;
    update(['update-relocate']);
    update(['edu-WorkPreference']);
  }

  void selectWorkMode(String work) {
    workMode = work;
    update(['update-workMode']);
    update(['edu-WorkPreference']);
  }

  void selectTeachingMode(String mode) {
    teachingMode = mode;
    update(['update-teachingMode']);
    update(['edu-WorkPreference']);
  }
}
