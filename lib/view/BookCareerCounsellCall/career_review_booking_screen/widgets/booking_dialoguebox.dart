import 'package:aimshala/utils/common/colors_common.dart';
import 'package:aimshala/utils/common/text_common.dart';
import 'package:aimshala/utils/widgets/widgets_common.dart';
import 'package:aimshala/view/home/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class BookingDialogueBox extends StatelessWidget {
  
  const BookingDialogueBox({super.key});

  @override
  Widget build(BuildContext context) {
    // final bookingController = Get.put(BookCareerCounsellController());
    return AlertDialog(
      backgroundColor: kwhite,
      surfaceTintColor: kwhite,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircleAvatar(
            radius: 55.sp,
            backgroundColor: kwhite,
            backgroundImage: const AssetImage('assets/images/person.png'),
          ),
          hMBox,
          Text('Thank You!',
              style: TextStyle(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.bold,
                  color: kpurple)),
          hBox,
          primarytxt2("For booking a counseling session!", 11.sp),
          hBox,
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
            decoration: BoxDecoration(
              border:
                  Border.all(color: const Color.fromARGB(255, 217, 219, 219)),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              children: [
                SizedBox(
                  // color: Colors.yellow,
                  height: 4.h,
                  child: Image.asset('assets/images/AimCET_LOGO2.png'),
                ),
                hBox,
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                  child: primarytxt2(
                      'Enhance your experience by taking a suggested Aimshala Career explorer test',
                      12),
                )
              ],
            ),
          ),
          hMBox,
          Container(
            width: 79.w,
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
              onPressed: () {
                
                Get.offAll(() => const HomeScreen());
              },
              child: Text(
                'Take Aim CET',
                style: TextStyle(color: kwhite),
              ),
            ),
          ),
          hMBox,
          GestureDetector(
            onTap: () => Get.offAll(() => const HomeScreen()),
            child: Text('Not Now',
                style: TextStyle(color: kpurple, fontWeight: FontWeight.w600)),
          )
        ],
      ),
    );
  }
}
