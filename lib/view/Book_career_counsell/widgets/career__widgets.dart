import 'package:aimshala/utils/common/colors_common.dart';
import 'package:aimshala/utils/widgets/widgets_common.dart';
import 'package:aimshala/view/Book_career_counsell/widgets/career_colors.dart';
import 'package:aimshala/view/Book_career_counsell/widgets/bottom_sheets/career_home_bottomsheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

Decoration boxdecoration(double radius) {
  return BoxDecoration(
    borderRadius: BorderRadius.all(
      Radius.circular(radius),
    ),
  );
}

PreferredSizeWidget careerAppBar() {
  return AppBar(
    backgroundColor: Colors.transparent,
    surfaceTintColor: Colors.transparent,
    title: const Text(
      "Book Career Counselling Call",
      style: TextStyle(fontWeight: FontWeight.w600, fontSize: 12),
    ),
    centerTitle: true,
  );
}

Widget careerHomeField({required Widget text, required Widget textField}) {
  return Column(
    children: [Align(alignment: Alignment.centerLeft, child: text), textField],
  );
}

InputDecoration careerTextFiled(
    {String? hintText, Widget? suffixWidget, Widget? prefixWidget}) {
  return InputDecoration(
    hintText: hintText,
    suffixIcon: suffixWidget,
    prefixIcon: prefixWidget,
    contentPadding: const EdgeInsets.symmetric(vertical: 2, horizontal: 10),
    hintStyle: TextStyle(
      color: kblack.withOpacity(0.4),
      fontSize: 14,
      fontWeight: FontWeight.w400,
    ),
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

Widget aimInitialWidget({Widget? textField}) {
  return Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      ListTile(
        contentPadding: EdgeInsets.zero,
        leading: GestureDetector(
          onTap: () => Get.back(),
          child: SizedBox(
              height: 30,
              width: 30,
              child: Image.asset('assets/images/close.png', fit: BoxFit.cover)),
        ),
        trailing: Padding(
          padding: const EdgeInsets.only(right: 5),
          child: TextButton(
            onPressed: () {},
            style: ButtonStyle(
              overlayColor: MaterialStateProperty.resolveWith<Color?>(
                (Set<MaterialState> states) {
                  if (states.contains(MaterialState.pressed)) {
                    return Colors.transparent;
                  }
                  return null;
                },
              ),
            ),
            child:
                bottomHeading('Resend Code', 14, FontWeight.w600, mainPurple),
          ),
        ),
      ),
      ListTile(
        contentPadding: EdgeInsets.zero,
        leading: bottomHeading('Select your Aim', 18, FontWeight.w700, kblack),
      ),
      Container(child: textField),
    ],
  );
}

Widget microaimListdata({required String microItem}) {
  return Container(
    padding: const EdgeInsets.symmetric(vertical: 9, horizontal: 8),
    decoration: BoxDecoration(
      color: Colors.grey.withOpacity(0.2),
      borderRadius: BorderRadius.circular(16),
    ),
    child: Text(
      microItem,
      style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
    ),
  );
}

Widget remindWidget() {
  return Row(
    children: [
      SvgPicture.asset(
        "assets/images/aimicon.svg",
        // color: Colors.purple,
      ),
      Text(
        " You can Choose more than one Micro aim",
        style: TextStyle(color: textFieldColor),
      ),
    ],
  );
}

Widget checking({required String microAim, required Function()? onTap}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: textFieldColor.withOpacity(0.2),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            microAim,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
          ),
          wBox,
          const Icon(
            Icons.close_rounded,
            size: 16,
          )
        ],
      ),
    ),
  );
}

BoxDecoration careerMainContainerdecoration() {
  return const BoxDecoration(
    image: DecorationImage(
        image: AssetImage('assets/images/careerbgimage.png'),
        fit: BoxFit.cover),
  );
}

Widget careerSecContainer({required Widget child}) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 24),
    width: double.infinity,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      color: kwhite,
    ),
    child: child,
  );
}

EdgeInsets careerContainerP = const EdgeInsets.only(
  left: 17,
  right: 17,
  top: 15,
);
