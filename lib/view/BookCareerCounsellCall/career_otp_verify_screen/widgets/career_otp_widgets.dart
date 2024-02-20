import 'package:aimshala/controllers/career_booking_controller.dart';
import 'package:aimshala/utils/common/colors_common.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class CareerOTPField extends StatelessWidget {
  final TextEditingController controller;
  final Function(String)? onChanged;
  CareerOTPField({
    super.key,
    required this.controller,
    this.onChanged,
  });

  final login = Get.put(BookCareerCounsellController());

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 5.8.h,
      width: 10.6.w,
      child: AspectRatio(
        aspectRatio: 1.0,
        child: Obx(
          () => TextFormField(
            controller: controller,
            autofocus: true,
            onChanged: onChanged,
            showCursor: false,
            readOnly: false,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: kblack,
            ),
            keyboardType: TextInputType.number,
            maxLength: 1,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.fromLTRB(2, 0, 0, 0),
              counter: const Offstage(),
              enabledBorder: OutlineInputBorder(
                borderSide:
                    login.validationMessage.value == 'Please enter valid code'
                        ? BorderSide(width: 1, color: kred)
                        : BorderSide(
                            width: 1,
                            color: kblack.withOpacity(0.2),
                          ),
                borderRadius: BorderRadius.circular(10),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 1, color: kred),
                borderRadius: BorderRadius.circular(10),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 1, color: kred),
                borderRadius: BorderRadius.circular(10),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 1, color: mainPurple),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
