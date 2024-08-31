import 'package:aimshala/utils/common/widgets/colors_common.dart';
import 'package:aimshala/utils/common/widgets/text_common.dart';
import 'package:aimshala/utils/widgets/widgets_common.dart';
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
          decoration: const BoxDecoration(
            color: Color.fromARGB(255, 241, 242, 246),
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(5),
                bottomRight: Radius.circular(5),
                topLeft: Radius.circular(5)),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
            child: Text(
              mssg,
              style: TextStyle(color: textFieldColor),
            ),
          ),
        ),
      ),
      Text(time, style: TextStyle(fontSize: 10, color: textFieldColor)),
      hBox,
    ],
  );
}

Widget replaycardSignup(context, String mssg, String time, bool isFirst,
    {bool? type}) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Container(
        height: 28,
        width: 28,
        decoration: isFirst == true
            ? const BoxDecoration(
                color: Color.fromARGB(255, 255, 223, 169),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(140),
                    bottomRight: Radius.circular(140),
                    topRight: Radius.circular(140)),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/images/person.png'),
                ),
              )
            : null,
      ),
      wBox,
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: type != null ? null : double.infinity,
              decoration: BoxDecoration(
                // color: Color.fromARGB(255, 241, 242, 246),
                color: mainPurple,
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(5),
                    bottomRight: Radius.circular(5),
                    topRight: Radius.circular(5)),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
                child: Text(
                  mssg,
                  style: TextStyle(color: kwhite),
                ),
              ),
            ),
            time == 'no'
                ? choiceSizedBox(height: 3)
                : Text(
                    time,
                    style: TextStyle(
                      fontSize: 10,
                      color: textFieldColor,
                    ),
                  ),
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
      hintText: "Type here...",
      hintStyle: TextStyle(
        fontSize: 13,
        color: textFieldColor,
        fontWeight: FontWeight.normal,
      ));
}

Widget amyOptionContainer({required String option, required bool multiselect}) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
    margin: const EdgeInsets.only(right: 7),
    decoration: BoxDecoration(
        color: multiselect
            ? mainPurple.withOpacity(0.04)
            : const Color.fromARGB(255, 244, 244, 244),
        borderRadius: BorderRadius.circular(8)),
    child: Text(
      option,
      style: TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w400,
          color: multiselect ? mainPurple : kblack),
    ),
  );
}

Widget skipText({void Function()? onTap}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: const Color.fromARGB(255, 251, 237, 250)),
      child: const Text(
        "I'll do it Later",
        style: TextStyle(
            color: Color.fromARGB(255, 182, 56, 175),
            fontSize: 12,
            fontWeight: FontWeight.w600),
      ),
    ),
  );
}

Widget goHomeContainer() {
  return Container(
    // height: 35,
    margin: const EdgeInsets.symmetric(vertical: 12),
    padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: mainPurple.withOpacity(0.04)),
    child: const Text(
      "Let's Explore Aimshala",
      style: TextStyle(
          color: Color.fromARGB(255, 182, 56, 175),
          fontSize: 12,
          fontWeight: FontWeight.w600),
    ),
  );
}

Widget thnksSkipText(String name) {
  return Center(
    child: Row(
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
        wBox,
        Expanded(
          child: Container(
            // padding: const EdgeInsets.all(15),
            color: const Color.fromARGB(255, 250, 250, 252),
            // padding: const EdgeInsets.all(8),
            child: regularText('''
Thank you, $name for taking the time to share your aspirations with me! It's wonderful to learn about your goals and strengths.

Remember, I am always here to assist you whenever you need guidance. Just look for me in the bottom-left corner of the Aimshala platform.

Feel free to explore the Aimshala platform and take the ACE Test to get started on your personalized career path. The ACETest will help you understand your strengths and guide you towards the best career choices for you.

also, Please confirm your email by clicking the link we've sent to your inbox.

Let's Take Charge and Explore your future with Aimshala!''', 9.sp,
                color: mainPurple),
          ),
        ),
      ],
    ),
  );
}

Widget thnksAllSubmittedText(String name) {
  return Center(
    child: Container(
      padding: const EdgeInsets.all(15),
      color: const Color.fromARGB(255, 250, 250, 252),
      // padding: const EdgeInsets.all(8),
      child: regularText('''
Thank you, $name 

Please confirm your email by clicking the link we've sent to your inbox.

Let's Take Charge and Explore your future with Aimshala!''', 9.sp,
          color: mainPurple),
    ),
  );
}
