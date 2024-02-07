import 'package:aimshala/utils/common/colors_common.dart';
import 'package:aimshala/utils/widgets/widgets_common.dart';
import 'package:aimshala/view/home/widget/texts.dart';
import 'package:aimshala/view/temp.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class TakeChargeC extends StatelessWidget {
  const TakeChargeC({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 18),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        // color: kwhite,
        image: const DecorationImage(
            image: AssetImage(
              'assets/images/2box.png',
            ),
            fit: BoxFit.cover),
      ),
      // height: 25.h,
      // width: 40.h,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(height: 3.5.h),
          Container(
            padding: const EdgeInsets.only(bottom: 12),
            // height: 19.5.h,
            // color: Colors.yellow,
            width: 35.5.h,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "TAKE CHARGE!",
                  style: TextStyle(
                      fontSize: 13.0.sp,
                      color: kwhite,
                      fontWeight: FontWeight.bold),
                ),
                hBox,
                SizedBox(
                  height: 7.h,
                  width: 32.5.w,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Schedule Your",
                        style: TextStyle(fontSize: 9.3.sp, color: kwhite),
                      ),
                      Text(
                        "FREE Expert",
                        style: TextStyle(
                            fontSize: 9.3.sp,
                            color: kwhite,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "Video Call Today!",
                        style: TextStyle(
                            fontSize: 9.3.sp,
                            color: kwhite,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Expanded(
                      child: Text(
                        home2Ctext,
                        style: TextStyle(fontSize: 9.3.sp, color: kwhite),
                      ),
                    ),
                    SizedBox(
                        height: 4.2.h,
                        child: ElevatedButton.icon(
                          style: ButtonStyle(
                            shape: buttonShape(round: 8),
                          ),
                          onPressed: () {
                           Get.to(() => const TempScreen());
                          },
                          icon: Text(
                            "Book Now",
                            style: TextStyle(
                                fontSize: 10.sp,
                                color: Colors.blue,
                                fontWeight: FontWeight.w600),
                          ),
                          label: Icon(
                            Icons.arrow_forward_ios_sharp,
                            size: 10.5.sp,
                            color: Colors.blue,
                          ),
                        ))
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
