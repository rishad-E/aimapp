import 'package:aimshala/utils/common/widgets/colors_common.dart';
import 'package:aimshala/utils/common/widgets/text_common.dart';
import 'package:aimshala/utils/widgets/widgets_common.dart';
import 'package:aimshala/view/profile/common/widgets/texts.dart';
import 'package:aimshala/view/profile/profile_home/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';

Widget languageWidget(
    {required String section,
    void Function()? onTapEdit,
    void Function()? onTapAdd,
    required List<Widget> languageData,
    required Widget viewAll}) {
  return infoContainer(
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            infoHeading(section),
            Row(
              children: [
                GestureDetector(
                  onTap: onTapEdit,
                  child: Icon(
                    Icons.edit,
                    size: 14.sp,
                    color: mainPurple,
                  ),
                ),
                wBox,
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
          ],
        ),
        hBox,
        ...languageData,
        viewAll
      ],
    ),
  );
}

Widget languageDataWidget({required String language, required String level}) {
  return Row(
    children: [
      semiBoldChoiceText(text: language, size: 10.5.sp),
      wBox,
      regularText(level, 10.5.sp),
    ],
  );
}

Widget courseWidget({
  required String course,
  required String courseNo,
  required String associated,
  required String image,
  required bool end,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      semiBoldChoiceText(text: course, size: 10.5.sp),
      regularText(courseNo, 8.sp),
      hBox,
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
          const SizedBox(width: 8),
          Expanded(
              child: Text(
            associated,
            style: TextStyle(fontSize: 8.sp, color: kblack),
          ))
        ],
      ),
      end ? shrinked : const Divider(thickness: 0.2)
    ],
  );
}

Widget skillWidget(
    {required bool end,
    required String company,
    required String image,
    required String position}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      semiBoldChoiceText(text: company, size: 14),
      Row(
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
          regularText(position, 12, color: kblack)
        ],
      ),
      end ? shrinked : const Divider(thickness: 0.2)
    ],
  );
}

Widget honorWidget(
    {required String title,
    required String date,
    required String image,
    required String assosiated,
    required String skills,
    required String description,
    required bool end}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      semiBoldChoiceText(text: title, size: 10.5.sp),
      regularText(date, 8.2.sp),
      hBox,
      Row(
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
              child: regularText(assosiated, 8.2.sp,
                  color: kblack, maxLines: 2, overflow: TextOverflow.ellipsis))
        ],
      ),
      hBox,
      skills == 'no'
          ? shrinked
          : regularText(
              skills,
              11,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
      regularText(
        description,
        8,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
      end ? shrinked : const Divider(thickness: 0.2)
    ],
  );
}

int yearFormatter(String data) {
  List<String> parts = data.split('-');
  int year = int.tryParse(parts[2]) ?? 0; // Assuming the year is the third part
  return year;
}

String parseDateMonthYear(String dateString) {
  DateTime date = DateFormat("yyyy-MM-dd").parse(dateString);
  String formattedDate = DateFormat("MMM yyyy").format(date);
  return formattedDate;
}
