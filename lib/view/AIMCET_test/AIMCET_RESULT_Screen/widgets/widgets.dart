import 'package:aimshala/utils/common/widgets/colors_common.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

Widget notReadyContainer({required String text}) {
  return Center(
    child: Text(
      text,
      style: TextStyle(color: textFieldColor, fontSize: 12),
    ),
  );
}

Widget reportButtonContainer({Widget? child}) {
  return Container(
    color: const Color.fromARGB(255, 243, 242, 248),
    child: Container(
      margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
      height: 36,
      // color: Colors.yellow,
      decoration: BoxDecoration(
        color: kwhite,
        border: Border.all(width: 1, color: textFieldColor.withOpacity(0.3)),
        borderRadius: BorderRadius.circular(6),
      ),
      child: child,
    ),
  );
}

Widget personalityReportButton(
    {Color? boxColor, Color? textColor, void Function()? onTap}) {
  return Expanded(
    child: GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: boxColor,
          borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(6), topLeft: Radius.circular(6)),
        ),
        height: 4.h,
        child: Center(
            child: Text(
          'Personality report',
          style: TextStyle(
              color: textColor, fontWeight: FontWeight.w600, fontSize: 14),
        )),
      ),
    ),
  );
}

Widget traitReportButton(
    {Color? boxColor, Color? textColor, void Function()? onTap}) {
  return Expanded(
    child: GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: boxColor,
          borderRadius: const BorderRadius.only(
              bottomRight: Radius.circular(6), topRight: Radius.circular(6)),
        ),
        height: 4.h,
        child: Center(
            child: Text(
          "Trait report",
          style: TextStyle(
              color: textColor, fontWeight: FontWeight.w600, fontSize: 14),
        )),
      ),
    ),
  );
}

Widget fetchErrorText({required String text}) {
  return Align(
    alignment: Alignment.center,
    child: Text(
      text,
      style: TextStyle(
          color: mainPurple, fontWeight: FontWeight.w600, fontSize: 16),
    ),
  );
}

Widget horizontalTabMain({Widget? child}) {
  return Container(
    margin: const EdgeInsets.only(left: 16, bottom: 12, top: 12),
    decoration: BoxDecoration(
      border: Border.all(color: const Color.fromARGB(255, 222, 219, 219)),
      borderRadius: const BorderRadius.only(
        bottomLeft: Radius.circular(8),
        topLeft: Radius.circular(8),
      ),
    ),
    child: child,
  );
}

Widget tabItems({void Function()? onTap, required bool selected}) {
  return InkWell(
    onTap: onTap,
    child: Container(
      width: 96,
      padding: const EdgeInsets.symmetric(vertical: 3, horizontal: .8),
      decoration: const BoxDecoration(
          border: Border(
              right: BorderSide(color: Color.fromARGB(255, 222, 219, 219)))),
      child: Column(
        children: [
          Icon(Icons.done, color: selected ? mainPurple : kblack),
          Text(
            "Traits Report",
            style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.w500,
                color: selected ? mainPurple : kblack),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    ),
  );
}
