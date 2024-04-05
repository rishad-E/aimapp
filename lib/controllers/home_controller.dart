import 'package:get/get.dart';

class HomeController extends GetxController {
  int currentStep = 0;

  

  void toggelNav(int intex) {
    currentStep = intex;
    update(['bottom-nav']);
  }
}
