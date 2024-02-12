import 'package:aimshala/utils/common/colors_common.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class UpcomingEventContainer extends StatelessWidget {
  final String image;
  const UpcomingEventContainer({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 8),
      width: 46.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: kwhite,
        border: Border.all(color: const Color.fromARGB(255, 221, 220, 220)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
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
            padding: const EdgeInsets.fromLTRB(10, 5, 10, 0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: const Color.fromARGB(255, 247, 247, 247),
              ),
              height: 2.4.h,
              width: 17.5.w,
              child: Center(
                child: Text(
                  "SEP 13, 2023",
                  style: TextStyle(
                      fontSize: 7.7.sp,
                      color: const Color.fromARGB(255, 116, 118, 119)),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: Text(
              "Virtual College Admissions Workshop",
              style: TextStyle(
                fontSize: 9.2.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
          )
        ],
      ),
    );
  }
}
