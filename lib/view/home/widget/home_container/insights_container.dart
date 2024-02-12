import 'package:aimshala/utils/common/colors_common.dart';
import 'package:aimshala/utils/widgets/widgets_common.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class InsightsContainer extends StatelessWidget {
  final String image;
  const InsightsContainer({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 46.5.w,
      margin: const EdgeInsets.only(right: 8),
      // height: 165,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: kwhite,
        border: Border.all(color: const Color.fromARGB(255, 221, 220, 220)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            // color: Colors.amber,
            height: 10.5.h,
            width: double.infinity,
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(12), topRight: Radius.circular(12)),
              child: Image.asset(
                image,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: const Color.fromARGB(255, 247, 247, 247),
                  ),
                  height: 2.3.h,
                  width: 18.w,
                  child: Center(
                    child: Text(
                      "SEP 13, 2023",
                      style: TextStyle(
                          fontSize: 7.7.sp,
                          color: const Color.fromARGB(255, 116, 118, 119)),
                    ),
                  ),
                ),
                wBox,
                Container(
                  // padding: EdgeInsets.symmetric(vertical: 5,horizontal: 5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    border: Border.all(
                        color: const Color.fromARGB(255, 236, 235, 235)),
                  ),
                  height: 2.3.h,
                  width: 15.5.w,
                  child: Center(
                    child: Text(
                      "Language",
                      style: TextStyle(
                          fontSize: 7.7.sp,
                          color: const Color.fromARGB(255, 116, 118, 119)),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
            child: Text(
              "New Scholarship  Program  for STEM students  announced",
              style: TextStyle(
                fontSize: 9.2.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          )
        ],
      ),
    );
  }
}
