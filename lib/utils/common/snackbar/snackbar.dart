import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SnackbarPopUps {
  static Future<void> popUpB(String text) async {
    // ScaffoldMessenger.of(context).showSnackBar(
    //   SnackBar(
    //     content: Text(
    //       text,
    //       style:const TextStyle(color: Colors.red),
    //     ),
    //     backgroundColor: Colors.black,
    //     behavior: SnackBarBehavior.floating,
    //   ),
    // );
    Get.showSnackbar(
      GetSnackBar(
        snackStyle: SnackStyle.FLOATING,
        message: text,
        margin: const EdgeInsets.all(10),
        backgroundColor: Colors.red,
        duration: const Duration(seconds: 2),
      ),
    );
  }

  static Future<void> popUpG(String text, BuildContext context) async {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          text,
          style: const TextStyle(color: Colors.green),
        ),
        backgroundColor: Colors.black,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }
}
