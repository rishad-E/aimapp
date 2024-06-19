import 'package:get/get.dart';

class HomeController extends GetxController {
  int currentStep = 0;

  

  void toggelNav(int index) {
    currentStep = index;
    update(['bottom-nav']);
  }
}
