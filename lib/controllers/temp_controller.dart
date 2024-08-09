import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TempController extends GetxController {
  final contoller1 = TextEditingController();
  final contoller2 = TextEditingController();
  final contoller3 = TextEditingController();
  final contoller4 = TextEditingController();
  final contoller5 = TextEditingController();

  void clear() async {
    contoller1.clear();
    contoller2.clear();
    contoller3.clear();
    contoller4.clear();
    contoller5.clear();
  }
}
