import 'package:aimshala/utils/common/colors_common.dart';
import 'package:aimshala/utils/common/text_common.dart';
import 'package:aimshala/utils/widgets/widgets_common.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

Widget skillInfoFiled({required Widget text, required Widget textField}) {
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

Widget suggestedSkills(String skill) {
  return Container(
    decoration: BoxDecoration(
        color: Colors.grey.shade200, borderRadius: BorderRadius.circular(400)),
    padding: const EdgeInsets.all(5),
    child:
        Text(skill, style: TextStyle(color: textFieldColor, fontSize: 8.5.sp)),
  );
}

BoxDecoration suggestedBoxDec() {
  return BoxDecoration(
    border: Border.all(color: kblack.withOpacity(0.3)),
    borderRadius: BorderRadius.circular(12),
  );
}

Widget skillSelectBox({
  required String skill,
  required bool? cbValue,
  required void Function(bool?)? cbOnChanged,
  void Function()? onTapBox,
}) {
  return GestureDetector(
    onTap: onTapBox,
    child: Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            width: 5.w,
            height: 2.5.h,
            child: Checkbox(
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              visualDensity: VisualDensity.compact,
              activeColor: mainPurple,
              side: const BorderSide(color: Colors.grey),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6)),
              value: cbValue,
              onChanged: cbOnChanged,
            ),
          ),
          wBox,
          Flexible(
            child: regularText(
              skill,
              9.sp,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    ),
  );
}

Widget selectExtraSkill({required String text, required List<Widget> list}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      regularText(text, 6.sp),
      ...list,
    ],
  );
}









// Widget skillListTile(
//     {required String title,
//     required bool? cbValue,
//     required void Function(bool?)? cbOnChanged,
//     void Function()? ltOnTap}) {
//   return ListTile(
//     horizontalTitleGap: 8,
//     dense: true,
//     visualDensity: VisualDensity.compact,
//     minVerticalPadding: 0,
//     contentPadding: EdgeInsets.zero,
//     title: regularText(title, 9.sp),
//     leading: SizedBox(
//       width: 5.w,
//       // height: 10,
//       child: Checkbox(
//         materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
//         visualDensity: VisualDensity.compact,
//         side: const BorderSide(color: Colors.grey),
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
//         value: cbValue,
//         onChanged: cbOnChanged,
//       ),
//     ),
//     onTap: ltOnTap,
//   );
// }
