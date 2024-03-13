import 'package:aimshala/utils/common/colors_common.dart';
import 'package:aimshala/utils/widgets/widgets_common.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

Widget traitReportImageContainer(
    {required String userName, required String image}) {
  return Container(
    padding: const EdgeInsets.symmetric(vertical: 35),
    decoration: BoxDecoration(
      image: DecorationImage(image: AssetImage(image), fit: BoxFit.cover),
    ),
    // height: 100,
    width: double.infinity,
    child: Column(
      children: [
        Text(
          "$userName's",
          style: const TextStyle(
              fontSize: 18, color: Color.fromARGB(255, 244, 63, 238)),
        ),
        Text(
          "Trait Report",
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 20,
            color: kwhite,
          ),
        ),
      ],
    ),
  );
}

Widget traitTwoText({required String text1, required String text2}) {
  return RichText(
    text: TextSpan(
      children: [
        TextSpan(
            text: text1,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 15.4.sp,
              color: const Color.fromARGB(255, 30, 35, 44),
            )),
        WidgetSpan(child: wBox),
        TextSpan(
            text: text2,
            style: TextStyle(
              color: const Color.fromARGB(255, 147, 38, 143),
              fontSize: 15.4.sp,
              fontWeight: FontWeight.w600,
            )),
      ],
    ),
  );
}

Text traitPlainText(
    {required String text, required double size, TextAlign? textAlign}) {
  return Text(
    text,
    style: TextStyle(
      color: textFieldColor,
      fontSize: size,
      fontWeight: FontWeight.w400,
    ),
    // overflow: TextOverflow.visible,
    textAlign: textAlign,
  );
}

Widget piechartTexts(
    {required Color color1,
    required String text1,
    required Color color2,
    required String text2}) {
  return Row(
    children: [
      Expanded(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: const Color.fromARGB(76, 216, 216, 216),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            children: [
              CircleAvatar(
                radius: 10,
                backgroundColor: color1,
              ),
              wBox,
              Text(
                text1,
                style:
                    const TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
              )
            ],
          ),
        ),
      ),
      wBox,
      Expanded(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: const Color.fromARGB(76, 216, 216, 216),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            children: [
              CircleAvatar(
                radius: 10,
                backgroundColor: color2,
              ),
              wBox,
              Text(
                text2,
                style:
                    const TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
              )
            ],
          ),
        ),
      )
    ],
  );
}

Text traitHeadingText(
    {required String text, required double size, TextAlign? textAlign}) {
  return Text(
    text,
    style: TextStyle(
      color: kblack,
      fontSize: size,
      fontWeight: FontWeight.w600,
    ),
    textAlign: textAlign,
  );
}

Widget traitListMainContainer(
    {required String title, required List<Widget> list}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        title,
        style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 12),
      ),
      hBox,
      Wrap(
        spacing: 6,
        runSpacing: 6,
        // crossAxisAlignment: WrapCrossAlignment.start,
        // alignment: WrapAlignment.start,
        children: list,
      ),
    ],
  );
}

Widget traitListContainer(
    {required String data, required Color bgColor, required Color textColor}) {
  return Container(
    padding: const EdgeInsets.symmetric(
      vertical: 4,
      horizontal: 10,
    ),
    decoration: BoxDecoration(
        border: Border.all(color: textColor),
        borderRadius: BorderRadius.circular(16),
        color: bgColor),
    child: Text(
      data,
      style: TextStyle(
          fontSize: 12, fontWeight: FontWeight.w600, color: textColor),
    ),
  );
}

Widget traitDivider() {
  return const Divider(
    height: 0,
    color: Color.fromARGB(255, 238, 236, 236),
  );
}

BoxDecoration reportDecoration() {
  return BoxDecoration(
    color: kwhite,
    border: Border.all(
      width: 1,
      color: const Color.fromARGB(255, 238, 236, 236),
    ),
    borderRadius: BorderRadius.circular(8),
  );
}

Widget dataContainer({required String data}) {
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(2),
      color: const Color.fromARGB(76, 216, 216, 216),
    ),
    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
    child: Text(
      data,
      style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
    ),
  );
}