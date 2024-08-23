import 'package:aimshala/utils/common/widgets/colors_common.dart';
import 'package:aimshala/utils/common/widgets/text_common.dart';
import 'package:aimshala/utils/widgets/widgets_common.dart';
import 'package:aimshala/view/profile/common/widgets/texts.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

Widget signUPContainer({required Widget child}) {
  return Container(
    width: double.infinity,
    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
    decoration: BoxDecoration(
      borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(15), topRight: Radius.circular(15)),
      color: kwhite,
    ),
    child: child,
  );
}

InputDecoration roleContainer({String? hintText, Widget? suffixWidget}) {
  return InputDecoration(
    hintText: hintText,
    suffixIcon: suffixWidget,
    contentPadding: const EdgeInsets.symmetric(vertical: 2, horizontal: 10),
    hintStyle: TextStyle(
        color: kblack.withOpacity(0.4),
        fontWeight: FontWeight.normal,
        fontSize: 13),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: Colors.red),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: Colors.red),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: Colors.purple),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(color: kblack.withOpacity(0.3)),
    ),
  );
}

Widget signupBox({required Widget text, required Widget textField}) {
  return Column(
    children: [Align(alignment: Alignment.centerLeft, child: text), textField],
  );
}

Widget aimshalaContainerSignUp() {
  return Container(
    // color: kwhite,
    padding: const EdgeInsets.symmetric(horizontal: 5),
    // height: 20.h,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        SizedBox(
          width: 61.w,
          height: 7.h,
          child: Image.asset('assets/images/aimshala-logo.png'),
        ),
        const SizedBox(height: 12),
        primarytxt2(
            'We envision a world where individuals are equipped to Take charge of their lives, realise their aspirations, and make meaningful contributions to society, fostering a future of limitless possibilities.',
            9.sp),
        const SizedBox(height: 12)
      ],
    ),
  );
}

Widget signUpButton(
    {MaterialStateProperty<Color?>? backgroundColor,
    required Widget child,
    required void Function()? onPressed}) {
  return TextButton(
      style: ButtonStyle(
        backgroundColor: backgroundColor,
        shape: buttonShape(round: 10),
      ),
      onPressed: onPressed,
      child: child);
}

Widget signUpText({Color? textColor}) {
  return Text(
    'Complete Onboarding',
    style:
        TextStyle(color: textColor, fontWeight: FontWeight.w600, fontSize: 14),
  );
}

Widget signUpRoleBox({Widget? child}) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
    width: double.infinity,
    // height: 50,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: kblack.withOpacity(0.3),
        )),
    child: child,
  );
}

Widget signUpRoleItems(
    {String? image, required String role, required bool selected,void Function()? onTap}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          border: Border.all(
              color: selected ? mainPurple : textFieldColor.withOpacity(0.3),
              width: 1.5)),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          image == null
              ? shrinked
              : SizedBox(
                  height: 24,
                  child: Image.asset(
                    'assets/images/student-signup.png',
                    filterQuality: FilterQuality.high,
                  ),
                ),
          image == null ? shrinked : wBox,
          selected
              ? semiBoldChoiceText(
                  text: role,
                  size: 14,
                  color: mainPurple,
                )
              : regularText(role, 14, color: textFieldColor)
        ],
      ),
    ),
  );
}
