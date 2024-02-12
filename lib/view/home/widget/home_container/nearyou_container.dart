import 'package:aimshala/utils/common/colors_common.dart';
import 'package:aimshala/utils/widgets/widgets_common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';

class NearYouContainer extends StatelessWidget {
  final String image;
  const NearYouContainer({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 47.w,
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
            width: 46.5.w,
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
            padding: const EdgeInsets.only(left: 10, top: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                      "12+ Courses",
                      style: TextStyle(
                          fontSize: 7.7.sp,
                          color: const Color.fromARGB(255, 116, 118, 119)),
                    ),
                  ),
                ),
                wBox,
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                  ),
                  height: 2.3.h,
                  width: 15.5.w,
                  child: Center(
                    child: Text(
                      "⭐ 8.6/10",
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
            padding: const EdgeInsets.symmetric(horizontal: 11, vertical: 5),
            child: Text(
              "Regular Program: 2 Year JEE Mains",
              style: TextStyle(fontSize: 9.2.sp, fontWeight: FontWeight.w500),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 11),
            child: Text(
              "Aakash Institute, Pusa Road",
              style: TextStyle(fontSize: 8.5.sp, color: const Color.fromARGB(255, 133, 131, 131)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, top: 2, bottom: 8),
            child: Row(
              children: [
                SizedBox(
                  // color: Colors.yellow,
                  height: 13,
                  width: 13,
                  child: SvgPicture.asset('assets/images/location.svg'),
                ),
                Text(
                  "Noida, Uttar Pradesh, India (On-site)",
                  style: TextStyle(fontSize: 7.sp),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
