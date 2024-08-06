import 'package:get/get.dart';

class EducatorWorkPreferenceController extends GetxController {
  Rxn<bool> relocate = Rxn<bool>();
  String workMode = '';
  String teachingMode = '';

  void toggleRelocate({required bool val}) {
    relocate.value = val;
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

  void clearEducatorWorkPrefFields() {
    relocate.value = null;
    workMode = '';
    teachingMode = '';
  }
}
