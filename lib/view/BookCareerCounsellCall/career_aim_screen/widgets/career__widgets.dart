import 'package:aimshala/utils/common/widgets/colors_common.dart';
import 'package:aimshala/utils/widgets/widgets_common.dart';
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
    // backgroundColor: Colors.transparent,
    // surfaceTintColor: Colors.transparent,
    surfaceTintColor: Colors.white,
    elevation: 7,
    iconTheme: IconThemeData(color: mainPurple),
    shadowColor: Colors.black.withOpacity(0.5),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10)),
    ),
    title: const Text(
      "Book Career Counselling Call",
      style: TextStyle(fontWeight: FontWeight.w600, fontSize: 12),
    ),
    centerTitle: true,
    // leading: IconButton(onPressed: ()=>isSaving ? null : Get.back(), icon: Icon(Icons.arrow_back,color: kpurple)),
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
    prefixIconConstraints: const BoxConstraints(minHeight: 25, minWidth: 25),
    suffixIcon: suffixWidget,
    // prefix:prefixWidget ,
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

Widget careerSearchIcon({required double leftP, required double rightP}) {
  return Container(
    padding: EdgeInsets.only(left: leftP, right: rightP),
    child: ColorFiltered(
      colorFilter: ColorFilter.mode(
        kblack,
        BlendMode.srcIn,
      ),
      child: SvgPicture.asset(
        "assets/images/search.svg",
        semanticsLabel: 'Search',
        fit: BoxFit.contain,
      ),
    ),
  );
}

Widget aimInitialWidget({Widget? textField}) {
  return Container(
    // width: double.infinity,
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
          leading:
              bottomHeading('Select your Aim', 17, FontWeight.w700, kblack),
        ),
        Container(child: textField),
      ],
    ),
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
        // fit: BoxFit.scaleDown,
      ),
      wBox,
      Text(
        "You can Choose more than one Micro aim",
        style: TextStyle(color: textFieldColor, fontSize: 12),
      ),
    ],
  );
}

Widget selectedAimContainer({required String microAim, required Function()? onTap}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: textFieldColor.withOpacity(0.1),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Flexible(
            child: Text(
              microAim,
              style:  TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w500,
                color: kblack.withOpacity(.8)
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          wBox,
          Icon(
            Icons.close_rounded,
            size: 16,
            color: textFieldColor,
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

BoxDecoration bottomSheetDecoration() {
  return BoxDecoration(
    color: kwhite,
    borderRadius: const BorderRadius.only(
      topLeft: Radius.circular(27),
      topRight: Radius.circular(27),
    ),
  );
}

TextStyle optionText() {
  return TextStyle(
    color: kblack,
    fontSize: 13,
    fontWeight: FontWeight.w400,
  );
}

Text bottomHeading(
    String text, double size, FontWeight? fontWeight, Color? color) {
  return Text(
    text,
    style: TextStyle(
      color: color,
      fontSize: size,
      fontWeight: FontWeight.w700,
    ),
  );
}

Widget careerAimContainer({Widget? child}) {
  return Container(
    width: double.infinity,
    padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 10),
    decoration: BoxDecoration(
      border: Border.all(color: const Color.fromARGB(255, 173, 174, 175)),
      borderRadius: BorderRadius.circular(8),
    ),
    child: child,
  );
}
