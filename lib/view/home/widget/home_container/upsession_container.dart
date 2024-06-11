import 'package:aimshala/utils/common/widgets/colors_common.dart';
import 'package:aimshala/utils/widgets/widgets_common.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class UpcomingSessionContainer extends StatelessWidget {
  final String mainImage;
  final String circleImage;
  const UpcomingSessionContainer({
    super.key,
    required this.mainImage,
    required this.circleImage,
  });

  @override
  Widget build(BuildContext context) {
    double imageH = 10.9.h;
    return Container(
      margin: const EdgeInsets.only(right: 8),
      width: 50.2.w,
      // height: 195,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: kwhite,
        border: Border.all(color: const Color.fromARGB(255, 221, 220, 220)),
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          SizedBox(
            height: imageH,
            // width: 48.w,
            width: double.infinity,
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(12), topRight: Radius.circular(12)),
              child: Image.asset(
                mainImage,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: imageH + (-15),
              left: 8,
              right: 5,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              //  mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    CircleAvatar(
                      radius: 22,
                      backgroundColor: Colors.white,
                      backgroundImage: AssetImage(circleImage),
                    ),
                    // wBox,
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
                hBox,
                Text(
                  "Connect with Jane Smith",
                  style: TextStyle(
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                hBox,
                Padding(
                  padding: const EdgeInsets.only(right: 8, bottom: 8),
                  child: Text(
                    "Career Strategist for Tech Industries",
                    style:
                        TextStyle(fontSize: 8.sp, overflow: TextOverflow.clip),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
