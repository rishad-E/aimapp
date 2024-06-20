import 'package:aimshala/utils/common/widgets/colors_common.dart';
import 'package:aimshala/utils/widgets/widgets_common.dart';
import 'package:aimshala/view/signup/widget/custom_textfiled.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';

PreferredSizeWidget signupAmyAppbar() {
  return AppBar(
    surfaceTintColor: Colors.white,
    elevation: 7,
    // iconTheme: IconThemeData(color: mainPurple),
    shadowColor: Colors.black.withOpacity(0.5),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10)),
    ),
    title: const Text(
      "Talk to Amy",
      style: TextStyle(fontWeight: FontWeight.w600, fontSize: 12),
    ),
    centerTitle: true,
  );
}

Widget sendcardSignup(context, String mssg, String time) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.end,
    children: [
      ConstrainedBox(
        constraints:
            BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.7),
        child: Container(
          decoration: BoxDecoration(
            color: mainPurple,
            borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(5),
                bottomRight: Radius.circular(5),
                topLeft: Radius.circular(5)),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
            child: Text(
              mssg,
              style: TextStyle(color: kwhite),
            ),
          ),
        ),
      ),
      Text(time, style: TextStyle(fontSize: 10, color: textFieldColor)),
      hBox,
    ],
  );
}

Widget replaycardSignup(context, String mssg, String time, {bool? type}) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Container(
        height: 28,
        width: 28,
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 255, 223, 169),
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(140),
              bottomRight: Radius.circular(140),
              topRight: Radius.circular(140)),
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage('assets/images/person.png'),
          ),
        ),
      ),
      wBox,
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: type != null ? null : double.infinity,
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 241, 242, 246),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(5),
                    bottomRight: Radius.circular(5),
                    topRight: Radius.circular(5)),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
                child: Text(
                  mssg,
                  style: TextStyle(color: textFieldColor),
                ),
              ),
            ),
            Text(time, style: TextStyle(fontSize: 10, color: textFieldColor)),
            // hBox,
          ],
        ),
      ),
    ],
  );
}

Widget amySignupTextfield({required Widget child}) {
  return Padding(
    padding: const EdgeInsets.all(7.0),
    child: Container(
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(
            color: const Color.fromARGB(255, 229, 226, 226), width: 1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8), child: child),
    ),
  );
}

Widget sendMsgContainer() {
  return Container(
    height: 4.7.h,
    width: 10.w,
    decoration: BoxDecoration(
      color: mainPurple,
      borderRadius: BorderRadius.circular(8),
    ),
    child: SvgPicture.asset(
      'assets/images/sent.svg',
      fit: BoxFit.scaleDown,
      allowDrawingOutsideViewBox: true,
    ),
  );
}

InputDecoration amyTextfieldDecor({bool isAskingDOB = false}) {
  return InputDecoration(
      border: InputBorder.none,
      hintText: isAskingDOB ? "Enter DOB in DD/MM/YYYY" : "Type here...",
      hintStyle: TextStyle(
        fontSize: 13,
        color: textFieldColor,
        fontWeight: FontWeight.normal,
      ));
}
