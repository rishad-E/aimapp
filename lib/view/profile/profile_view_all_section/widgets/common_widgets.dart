import 'package:aimshala/utils/common/widgets/colors_common.dart';
import 'package:aimshala/utils/common/widgets/text_common.dart';
import 'package:aimshala/utils/widgets/widgets_common.dart';
import 'package:aimshala/view/profile/common/widgets/texts.dart';
import 'package:aimshala/view/profile/common/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

Widget sectionMainContainer({
  required String section,
  void Function()? onTapAdd,
  required List<Widget> child,
}) {
  return Container(
    // width: double.infinity,
    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
    margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
    decoration: profileSecondaryContainer(),
    child: IntrinsicHeight(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              semiBoldChoiceText(
                  text: section, size: 12.5.sp, color: mainPurple),
              GestureDetector(
                onTap: onTapAdd,
                child: Icon(
                  Icons.add,
                  size: 17.sp,
                  color: mainPurple,
                ),
              ),
            ],
          ),
          hBox,
          hBox,
          ...child,
        ],
      ),
    ),
  );
}

Widget edexlipbSectionWidget({
  required String image,
  required String school,
  required String degree,
  required String year,
  required String grade,
  required String skill,
  required String description,
  required bool end,
  void Function()? onTap
}) {
  return Column(
    children: [
      Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 3.7.h,
            width: 8.w,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                    image: AssetImage(image), fit: BoxFit.cover)),
          ),
          wBox,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                semiBoldChoiceText(
                  text: school,
                  size: 11.sp,
                ),
                regularText(degree, 9.sp, color: kblack),
                regularText(year, 8.sp),
                regularText(grade, 8.sp),
                regularText(skill, 8.sp),
                regularText(description, 8),
              ],
            ),
          ),
          GestureDetector(
            onTap: onTap,
            child: Icon(
              Icons.edit,
              size: 14.sp,
              color: mainPurple,
            ),
          ),
        ],
      ),
      end ? shrinked : const Divider(thickness: 0.2)
    ],
  );
}
