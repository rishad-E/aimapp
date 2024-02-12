import 'package:aimshala/utils/common/colors_common.dart';
import 'package:aimshala/utils/widgets/widgets_common.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class BestCourseContainer extends StatelessWidget {
  const BestCourseContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 8),
      width: 63.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: kwhite,
        border: Border.all(color: const Color.fromARGB(255, 221, 220, 220)),
      ),
      // child: Text("afdafdddddddddddddddddddddd"),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            // width: 63.w,
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(12), topRight: Radius.circular(12)),
              child: Image.asset(
                'assets/images/BestCourse.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
          hBox,
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: const Color.fromARGB(255, 247, 247, 247),
                  ),
                  height: 2.4.h,
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
                Text(
                  "⭐ 4.5",
                  style: TextStyle(
                      fontSize: 7.7.sp,
                      fontWeight: FontWeight.w600,
                      color: const Color.fromARGB(255, 116, 118, 119)),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 10, right: 5, bottom: 8),
            // color: Colors.amber,
            // height: 10.h,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    "Dynamic World education community",
                    style: TextStyle(
                      fontSize: 10.8.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  hBox,
                  Text(
                    "Skills you'll gain: Organizational Culture, Career Development, Strategic Thinking,Charming ",
                    maxLines: 2,
                    style: TextStyle(
                        fontSize: 8.3.sp, overflow: TextOverflow.ellipsis),
                  ),
                ]),
          )
        ],
      ),
    );
  }
}
