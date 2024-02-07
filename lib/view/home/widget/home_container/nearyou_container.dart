import 'package:aimshala/utils/common/colors_common.dart';
import 'package:aimshala/utils/widgets/widgets_common.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class NearYouContainer extends StatelessWidget {
  final String image;
  const NearYouContainer({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 46.5.w,
      // height: 165,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: kwhite,
          border: Border.all(color: const Color.fromARGB(255, 236, 235, 235))),
      child: Column(
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
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 6, right: 6),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
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
                                color:
                                    const Color.fromARGB(255, 116, 118, 119)),
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
                                color:
                                    const Color.fromARGB(255, 116, 118, 119)),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Text(
                    "Regular Program: 2 Year JEE Mains",
                    style: TextStyle(
                        fontSize: 9.2.sp, fontWeight: FontWeight.w500),
                  ),
                  Text(
                    "Aakash Institute, Pusa Road",
                    style: TextStyle(fontSize: 8.5.sp),
                  ),
                  Text(
                    "Noida, Uttar Pradesh, India (On-site)",
                    style: TextStyle(fontSize: 7.sp),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
