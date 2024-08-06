import 'package:get/get.dart';

class EducatorAvailabilityController extends GetxController {
  // String selectedTime = '';
  List<String> selectedDays = [];
  List<String> selectedTimes = [];

  void selectPreferedDay(String day) {
    if (!selectedDays.contains(day)) {
      selectedDays.add(day);
    } else {
      selectedDays.remove(day);
    }
    update(['update-selectedDay']);
    update(['edu-WorkPreference']);
  }

  void selectPreferedTime(String time) {
    if (!selectedTimes.contains(time)) {
      selectedTimes.add(time);
    } else {
      selectedTimes.remove(time);
    }
    update(['update-selectedTime']);
    update(['edu-WorkPreference']);
  }

  void clearEducatorAvailableFields(){
    selectedDays.clear();
    selectedTimes.clear();
    
  }
}
