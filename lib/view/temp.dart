import 'dart:developer';

import 'package:aimshala/utils/common/colors_common.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:sizer/sizer.dart';

class TempScreen extends StatelessWidget {
  const TempScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          title: const Text("Temp Screen"),
          centerTitle: true,
        ),
        body: Padding(padding: const EdgeInsets.all(8.0), child: SampleOTP()));
  }
}

class SampleOTP extends StatelessWidget {
  // final TextEditingController controller;
  // final Function(String)? onChanged;

  SampleOTP({
    Key? key,
    // required this.controller,
    // this.onChanged,
  }) : super(key: key);

  // final login = Get.put(LoginController());
  // TextEditingController otpController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // height: 5.8.h,
      // width: 10.6.w,
      child: AspectRatio(
        aspectRatio: 1.0,
        child: Pinput(
          length: 4,
          onChanged: (value) {
           
          },
          // controller: controller,
          // onChanged: onChanged,
          defaultPinTheme: defaultpin,
          focusedPinTheme: defaultpin.copyWith(
            decoration: defaultpin.decoration!.copyWith(
              border: Border.all(color: kpurple),
            ),
          ),
          onCompleted: (value) => log(value),
        ),
      ),
    );
  }

  final defaultpin = PinTheme(
    height: 5.2.h,
    width: 11.2.w,
    textStyle: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      color: kblack,
    ),
    decoration: BoxDecoration(
        // color: kblack.withOpacity(0.2),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: kblack.withOpacity(0.2))),
  );
}
