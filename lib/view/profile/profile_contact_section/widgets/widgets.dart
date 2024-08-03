import 'package:aimshala/utils/common/widgets/colors_common.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

Widget contactInfoFiled({required Widget text, required Widget textField}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 3),
    child: Column(
      children: [
        Align(alignment: Alignment.centerLeft, child: text),
        textField
      ],
    ),
  );
}

Widget changePhoneWidget(
    {required void Function()? onPressed, required String text}) {
  return TextButton(
    onPressed: onPressed,
    child: Text(
      text,
      style: TextStyle(color: mainPurple, fontSize: 9.sp),
    ),
  );
}

Widget buildBottomsheetTop({
  required String item,
}) {
  return Container(
    color: kwhite,
    padding: const EdgeInsets.only(left: 0, right: 10),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ListTile(
          contentPadding: const EdgeInsets.only(right: 7),
          trailing: GestureDetector(
            onTap: () => Get.back(),
            child: SizedBox(
                height: 30,
                width: 30,
                child:
                    Image.asset('assets/images/close.png', fit: BoxFit.cover)),
          ),
        ),
        ListTile(
          contentPadding: EdgeInsets.zero,
          leading: Text(
            'Select your $item',
            style: TextStyle(
              color: kblack,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    ),
  );
}

Widget otpValidateBox({required void Function()? onPressed}) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 7),
    child: TextButton(
      style: ButtonStyle(
        side: MaterialStateProperty.all(BorderSide(color: mainPurple)),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
      onPressed: onPressed,
      child: Text(
        'validate',
        style: TextStyle(color: mainPurple, fontSize: 11.sp),
      ),
    ),
  );
}

Widget otpErrorText(String error) {
  return Text(error,
      style: TextStyle(
        color: Colors.red,
        fontSize: 8.sp,
        fontWeight: FontWeight.w400,
      ));
}
