import 'package:aimshala/utils/common/colors_common.dart';
import 'package:aimshala/utils/widgets/widgets_common.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class MentorshipContainer extends StatelessWidget {
  const MentorshipContainer({super.key});

  @override
  Widget build(BuildContext context) {
    double imageH = 10.9.h;

    return Container(
      // margin: const EdgeInsets.only(right: 8),
      padding: const EdgeInsets.only(bottom: 15),
      width: 60.w,
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
                'assets/images/upSession1.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: imageH + (-15),
              left: 8,
              right: 8,
            ),
            child: Column(
             
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const CircleAvatar(
                      radius: 22,
                      backgroundColor: Colors.white,
                      backgroundImage:
                          AssetImage('assets/images/upSession3.png'),
                    ),
                    // wBox,
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 4),

                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(400),
                              border: Border.all(
                                  color: const Color.fromARGB(
                                      255, 230, 228, 228))),
                          height: 2.3.h,
                          // width: 17.w,
                          child: Center(
                            child: Text(
                              "Label",
                              style: TextStyle(
                                  fontSize: 7.7.sp,
                                  color:
                                      const Color.fromARGB(255, 116, 118, 119)),
                            ),
                          ),
                        ),
                        wBox,
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 4),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(400),
                              border: Border.all(
                                  color: const Color.fromARGB(
                                      255, 230, 228, 228))),
                          height: 2.3.h,
                          // width: 15.0.w,
                          child: Center(
                            child: Text(
                              "⭐ 4.5",
                              style: TextStyle(
                                  fontSize: 7.7.sp,
                                  color:
                                      const Color.fromARGB(255, 116, 118, 119)),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                hBox,
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Mentor Name",
                    style: TextStyle(
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                // hBox,
                Padding(
                  padding: const EdgeInsets.only(right: 0, bottom: 8),
                  child: Text(
                    "Achievements: Organizational Culture, Career Development, Strategic Thinking, Change",
                    style: TextStyle(
                      fontSize: 7.7.sp,
                    ),
                    // textAlign: TextAlign.start,
                  ),
                ),
                SizedBox(
                  height: 4.2.h,
                  child: ElevatedButton.icon(
                    style: ButtonStyle(
                      shape: buttonShape(round: 8),
                      backgroundColor: MaterialStateProperty.resolveWith<Color>(
                        (states) {
                          return kpurple;
                        },
                      ),
                    ),
                    onPressed: () {},
                    icon: Text(
                      "Book Now",
                      style: TextStyle(
                          fontSize: 10.sp,
                          color: kwhite,
                          fontWeight: FontWeight.w600),
                    ),
                    label: Icon(
                      Icons.arrow_forward_ios_sharp,
                      size: 10.5.sp,
                      color: kwhite,
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
