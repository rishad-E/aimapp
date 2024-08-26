import 'dart:async';
import 'dart:developer';
import 'package:aimshala/controllers/aimcet_test_controller.dart';
import 'package:aimshala/controllers/all_data_controller.dart';
import 'package:aimshala/controllers/career_booking_controller.dart';
import 'package:aimshala/utils/common/widgets/colors_common.dart';
import 'package:aimshala/utils/widgets/widgets_common.dart';
import 'package:aimshala/view/bookcareercounsellcall/career_date_time_Booking/career_date_time_booking_screen.dart';
import 'package:aimshala/view/bookcareercounsellcall/career_aim_screen/career_aim_screen.dart';
import 'package:aimshala/view/home/widget/texts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';

class TakeChargeC extends StatefulWidget {
  const TakeChargeC({super.key});

  @override
  State<TakeChargeC> createState() => _TakeChargeCState();
}

class _TakeChargeCState extends State<TakeChargeC> {
  Timer? _timer;
  final controller = Get.put(BookCareerCounsellController());
  final allDataC = Get.put(AllDataController());
  final now = DateTime.now();

  @override
  void initState() {
    super.initState();

    // Initialize and start the timer
    _timer = Timer.periodic(const Duration(minutes: 5), (Timer timer) {
      Get.find<AIMCETController>().checkAimcetTestTakenFunction();
      Get.find<BookCareerCounsellController>()
          .checkCounsellcallBookingFuntion();
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 18),
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: const DecorationImage(
            image: AssetImage('assets/images/2box.png'), fit: BoxFit.cover),
      ),
      child: Obx(
        () {
          final data = controller.counselBookedModel?.data;
          if (controller.isBooked.value == 'yes' && data != null) {
            try {
              final timeFormat = DateFormat('HH:mm');
              final startTime = timeFormat.parse(data.startTime.toString());
              final endTime = timeFormat.parse(data.endTime.toString());
              final todayStart = DateTime(now.year, now.month, now.day,
                  startTime.hour, startTime.minute);
              final todayEnd = DateTime(
                  now.year, now.month, now.day, endTime.hour, endTime.minute);
              final isJoinNow =
                  now.isAfter(todayStart) && now.isBefore(todayEnd);
              // log('starttime=>$startTime    endtime=>$endTime   todaystart=>$todayStart todayE=>$todayEnd  isjoin=>$isJoinNow');
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(height: 2.h),
                  counselBooked(
                    context: context,
                    time: data.formattedTime.toString(),
                    date: data.formattedDate.toString(),
                    onPressed: () {},
                    isJoinNow: isJoinNow,
                  )
                ],
              );
            } catch (e) {
              log("Error parsing time: $e");
              return const Center(child: Text("Error displaying session"));
            }
          } else {
            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(height: 3.5.h),
                counselNotBooked(
                  onPressed: () {
                    log("career aim=>${allDataC.userDetails?.aim}",
                        name: 'takecha');
                    if (allDataC.userDetails?.aim?.isEmpty == true) {
                      Get.to(() => BookCareerAimPage(),
                          transition: Transition.fade);
                    } else {
                      Get.to(() => const CareerDateTimeBookingScreen(),
                          transition: Transition.fade);
                    }
                  },
                )
              ],
            );
          }
        },
      ),
    );
  }
}

Widget counselBooked(
    {required BuildContext context,
    required String time,
    required String date,
    required void Function()? onPressed,
    required bool isJoinNow}) {
  return Container(
    padding: const EdgeInsets.only(bottom: 8, top: 0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Your Upcoming",
          style: TextStyle(fontSize: 14.sp, color: kwhite),
        ),
        Padding(
          padding:
              EdgeInsets.only(right: MediaQuery.of(context).size.width / 2),
          child: Text(
            "Counseling Session",
            style: TextStyle(
              fontSize: 14.sp,
              color: kwhite,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
              right: MediaQuery.of(context).size.width / 2.3, top: 8),
          child: Text(
            home2Ctext,
            style: TextStyle(fontSize: 9.3.sp, color: kwhite),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Row(
            children: [
              Row(
                children: [
                  SvgPicture.asset('assets/images/calendar-booked.svg'),
                  wBox,
                  Column(
                    children: [
                      Text(time,
                          style: TextStyle(
                              fontSize: 13.sp,
                              fontWeight: FontWeight.bold,
                              color: kwhite)),
                      Text(date,
                          style: TextStyle(
                              fontSize: 9.5.sp,
                              color: kwhite,
                              fontWeight: FontWeight.w600))
                    ],
                  )
                ],
              ),
              wMBox,
              Expanded(
                child: SizedBox(
                  height: 4.2.h,
                  child: ElevatedButton.icon(
                    style: ButtonStyle(
                      padding: const MaterialStatePropertyAll(
                          EdgeInsets.symmetric(horizontal: 12)),
                      shape: buttonShape(round: 8),
                    ),
                    onPressed: onPressed,
                    icon: Text(
                      isJoinNow ? 'Join Now' : "Counseling Session",
                      style: TextStyle(
                          fontSize: 11.sp,
                          color: const Color.fromARGB(255, 15, 187, 195),
                          fontWeight: FontWeight.w600),
                    ),
                    label: SvgPicture.asset('assets/images/Video-booked.svg'),
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

Widget counselNotBooked({required void Function()? onPressed}) {
  return Container(
    padding: const EdgeInsets.only(bottom: 8, top: 10),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "TAKE CHARGE!",
          style: TextStyle(
              fontSize: 13.0.sp, color: kwhite, fontWeight: FontWeight.bold),
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
        Padding(
          padding: const EdgeInsets.only(top: 5),
          child: Row(
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
                      padding: const MaterialStatePropertyAll(
                          EdgeInsets.symmetric(horizontal: 15)),
                      shape: buttonShape(round: 8),
                    ),
                    onPressed: onPressed,
                    icon: Text(
                      "Book Now",
                      style: TextStyle(
                          fontSize: 10.sp,
                          color: const Color.fromARGB(255, 15, 187, 195),
                          fontWeight: FontWeight.w600),
                    ),
                    label: Icon(
                      Icons.arrow_forward_ios_sharp,
                      size: 10.5.sp,
                      color: const Color.fromARGB(255, 15, 187, 195),
                    ),
                  ))
            ],
          ),
        ),
      ],
    ),
  );
}
