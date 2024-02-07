import 'package:aimshala/utils/common/colors_common.dart';
import 'package:aimshala/utils/widgets/widgets_common.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class UpcomingSessionContainer extends StatelessWidget {
  final String mainImage;
  final String circleImage;
  const UpcomingSessionContainer(
      {super.key, required this.mainImage, required this.circleImage});

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 190,
      width: 48.w,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: kwhite,
          border: Border.all(color: const Color.fromARGB(255, 221, 220, 220))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.topCenter,
            children: [
              SizedBox(
                height: 10.9.h,
                width: 47.5.w,
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(12),
                      topRight: Radius.circular(12)),
                  child: Image.asset(
                    mainImage,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                top: 80, // Adjust this value to position the CircleAvatar
                left: 3,
                child: CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.white,
                  backgroundImage: AssetImage(circleImage),
                ),
              ),
              Positioned(
                top: 100, // Adjust this value to position the Row widget
                right: 2,
                // left: 10,
                child: Row(
                  // mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: const Color.fromARGB(255, 247, 247, 247),
                      ),
                      height: 2.3.h,
                      width: 17.w,
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
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: const Color.fromARGB(255, 247, 247, 247),
                      ),
                      height: 2.3.h,
                      width: 15.0.w,
                      child: Center(
                        child: Text(
                          "12:00 PM",
                          style: TextStyle(
                              fontSize: 7.7.sp,
                              color: const Color.fromARGB(255, 116, 118, 119)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Container(
            padding: const EdgeInsets.only(left: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Connect with Jane Smith",
                  style: TextStyle(
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                hBox,
                Text(
                  "Career Strategist for Tech Industries",
                  style: TextStyle(fontSize: 8.sp, overflow: TextOverflow.clip),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
