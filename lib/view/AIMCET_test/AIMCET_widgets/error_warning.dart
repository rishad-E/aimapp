import 'package:aimshala/utils/common/widgets/colors_common.dart';
import 'package:aimshala/utils/common/widgets/text_common.dart';
import 'package:aimshala/utils/widgets/widgets_common.dart';
import 'package:aimshala/view/home/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class ErrorWarning extends StatelessWidget {
  const ErrorWarning({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Error!',
            style: TextStyle(
                fontSize: 15.sp, fontWeight: FontWeight.bold, color: kred),
          ),
          Text(
            "Failed to fetch the questions...Please try after sometimes.",
            style: errorStyle(),
          ),
          hMBox,
          Container(
            // width: double.infinity,
            height: 4.5.h,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(15),
              ),
            ),
            child: ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(kpurple),
                  shape: buttonShape(round: 10)),
              onPressed: () => Get.to(() => const HomeScreen()),
              child: Text(
                'Go to Home',
                style: TextStyle(
                    color: kwhite, fontWeight: FontWeight.w600, fontSize: 14),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
