import 'package:get/get.dart';

class MentorAvailabilityController extends GetxController {
  List<String> availableDays = [];
  List<String> availableTimes = [];

  void selectDays(String day) {
    if (!availableDays.contains(day)) {
      availableDays.add(day);
    } else {
      availableDays.remove(day);
    }
    update(['mentor-availableDay']);
    update(['mentor-availability']);
  }

  void selectTimes(String time) {
    if (!availableTimes.contains(time)) {
      availableTimes.add(time);
    } else {
      availableTimes.remove(time);
    }
    update(['mentor-availableTime']);
    update(['mentor-availability']);
  }
}
