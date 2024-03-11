import 'package:aimshala/controllers/login_controller.dart';
import 'package:aimshala/utils/common/colors_common.dart';
import 'package:aimshala/utils/widgets/widgets_common.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

Widget loginContainer({
  required BuildContext context,
  required Widget textfield,
  // required void Function() onPressed,
  required Widget twoText,
  required Widget fieldText,
  required Widget otpWidget,
  Widget? button,
}) {
  return Container(
    padding: const EdgeInsets.only(top: 8, bottom: 8),
    decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(15), topRight: Radius.circular(15)),
        color: kwhite),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        twoText,
        fieldText,
        textfield,
        otpWidget,
        Container(
          width: 79.w,
          height: 4.5.h,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(15)),
          ),
          child: button,
        )
      ],
    ),
  );
}

Widget twoStyleTexts({required String text1, required String text2}) {
  return RichText(
    text: TextSpan(
      children: [
        TextSpan(
            text: text1,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 16.sp,
              color: const Color.fromARGB(255, 30, 35, 44),
            )),
        WidgetSpan(child: wBox),
        TextSpan(
            text: text2,
            style: TextStyle(
              color: const Color.fromARGB(255, 147, 38, 143),
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
            )),
      ],
    ),
  );
}

class OTPTextField extends StatelessWidget {
  final TextEditingController controller;
  final Function(String)? onChanged;
  OTPTextField({
    super.key,
    required this.controller,
    this.onChanged,
  });

  final login = Get.put(LoginController());

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
                        : BorderSide(width: 1, color: kblack.withOpacity(0.2)),
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
