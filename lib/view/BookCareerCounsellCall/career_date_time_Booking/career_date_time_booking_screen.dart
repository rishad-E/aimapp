import 'dart:developer';
import 'package:aimshala/controllers/career_booking_controller.dart';
import 'package:aimshala/utils/common/colors_common.dart';
import 'package:aimshala/utils/common/text_common.dart';
import 'package:aimshala/utils/widgets/widgets_common.dart';
import 'package:aimshala/view/BookCareerCounsellCall/career_home_aimScreen/widgets/career__widgets.dart';
import 'package:aimshala/view/BookCareerCounsellCall/career_date_time_Booking/widgets/date_time_widgets.dart';
import 'package:aimshala/view/BookCareerCounsellCall/career_review_booking_screen/career_review_booking_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';

class CareerDateTimeBookingScreen extends StatefulWidget {
  const CareerDateTimeBookingScreen({super.key});

  @override
  State<CareerDateTimeBookingScreen> createState() =>
      _CareerDateTimeBookingScreenState();
}

class _CareerDateTimeBookingScreenState
    extends State<CareerDateTimeBookingScreen> {
  final controller = Get.put(BookCareerCounsellController());
  @override
  Widget build(BuildContext context) {
    log("message");
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: careerAppBar(),
      body: Container(
        decoration: careerMainContainerdecoration(),
        child: Center(
          child: SingleChildScrollView(
              child: Padding(
            padding: careerContainerP,
            child: careerSecContainer(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: boldText(
                        text: "Pick time to schedule the video Call", size: 20),
                  ),
                  // Container(
                  //   color: Colors.yellow,
                  //   width: 10.5.w,
                  //   height: 5.h,
                  // ),
                  hLBox,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          log("back");
                          // Handle back button tap
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 247, 245, 245),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          height: 25,
                          width: 25,
                          child: const Icon(
                            Icons.arrow_back_ios_new,
                            size: 15,
                          ),
                        ),
                      ),
                      FutureBuilder(
                        future: controller.fetchBookingDate(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return SizedBox(
                              height: 5.9.h,
                              width: MediaQuery.of(context).size.width - 120,
                            );
                          } else if (snapshot.hasError) {
                            return Text('Error: ${snapshot.error}');
                          } else {
                            // final List<dynamic>? dates = snapshot.data;
                            // if (dates != null &&
                            //     dates.isNotEmpty &&
                            //     controller.selectedDate == null) {
                            //   controller.selectedDate = dates[0].toString();
                            // }
                            return SizedBox(
                              height: 5.9.h,
                              width: MediaQuery.of(context).size.width - 120,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: snapshot.data?.length,
                                itemBuilder: (context, index) {
                                  final date = snapshot.data?[index];
                                  return GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        controller.selectedDate.value = date;
                                        // log(controller.selectedDate.toString(),
                                        //     name: 'dateeeeeeee');
                                        controller
                                            .update(['update-bookingButton']);
                                      });
                                    },
                                    child: dateFotmatBox(
                                      date,
                                      colorbb: controller.selectedDate == date
                                          ? mainPurple.withOpacity(0.1)
                                          : kwhite,
                                      colortext: controller.selectedDate == date
                                          ? mainPurple
                                          : kblack.withOpacity(0.5),
                                    ),
                                  );
                                },
                              ),
                            );
                          }
                        },
                      ),
                      GestureDetector(
                        onTap: () {
                          // Handle forward button tap
                          log("forward");
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 247, 245, 245),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          height: 25,
                          width: 25,
                          child: const Icon(
                            Icons.arrow_forward_ios,
                            size: 15,
                          ),
                        ),
                      ),
                    ],
                  ),
                  hMBox,
                  Obx(
                    () => FutureBuilder(
                      future: controller.fetchBookingTime(
                          date: controller.selectedDate.value.toString()),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const CircularProgressIndicator(
                              color: Color.fromARGB(255, 188, 185, 188));
                        } else if (controller.selectedDate.value.isEmpty) {
                          return const Center(
                            child: Text('please select date'),
                          );
                        } else if (snapshot.data!.isEmpty) {
                          return Center(
                            child: Text(
                              'No avaliable slots for selected date',
                              style: TextStyle(color: textFieldColor),
                            ),
                          );
                        } else {
                          return Wrap(
                            spacing: 6,
                            runSpacing: 8,
                            alignment: WrapAlignment.center,
                            children: List.generate(
                              snapshot.data!.length,
                              (index) {
                                final data = snapshot.data![index];
                                return GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      controller.selectedTime =
                                          data.slotStartTime.toString();
                                      log('${controller.selectedTime} + $index',
                                          name: 'timeeeeeeeeee');
                                      controller
                                          .update(['update-bookingButton']);
                                    });
                                  },
                                  child: timeContainer(
                                      timeData: convertToAMPM(
                                          data.slotStartTime.toString()),
                                      colortext: controller.selectedTime ==
                                              data.slotStartTime
                                          ? mainPurple
                                          : kblack,
                                      colorbb: controller.selectedTime ==
                                              data.slotStartTime
                                          ? mainPurple.withOpacity(0.1)
                                          : kwhite,
                                      select: controller.selectedTime ==
                                          data.slotStartTime),
                                );
                              },
                            ),
                          );
                        }
                      },
                    ),
                  ),
                  hLBox,
                  Container(
                    width: double.infinity,
                    height: 4.5.h,
                    decoration: boxdecoration(12),
                    child: GetBuilder<BookCareerCounsellController>(
                      id: 'update-bookingButton',
                      builder: (booking) {
                        return TextButton(
                          onPressed: () {
                            if (booking.selectedDate.value.isNotEmpty &&
                                booking.selectedTime != null) {
                              Get.to(() => const CareerReviewBookingScreen());
                            }
                          },
                          style: ButtonStyle(
                            shape: buttonShape(round: 8),
                            backgroundColor:
                                MaterialStateProperty.resolveWith<Color>(
                              (states) {
                                return booking.selectedDate.value.isNotEmpty &&
                                        booking.selectedTime != null
                                    ? mainPurple
                                    : buttonColor;
                              },
                            ),
                          ),
                          child: Text(
                            "Next",
                            style: TextStyle(
                                color: booking.selectedDate.value.isNotEmpty &&
                                        booking.selectedTime != null
                                    ? Colors.white
                                    : disableText),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          )),
        ),
      ),
    );
  }

  String convertToAMPM(String timeString) {
    DateTime dateTime = DateFormat('HH:mm').parse(timeString);
    String formattedTime = DateFormat('h:mm a').format(dateTime);
    if (dateTime.hour < 10) {
      formattedTime = '0$formattedTime';
    }
    return formattedTime;
  }
}
