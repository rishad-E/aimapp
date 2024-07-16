import 'package:aimshala/utils/common/widgets/colors_common.dart';
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
