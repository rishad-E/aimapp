import 'dart:developer';
import 'package:aimshala/controllers/career_booking_controller.dart';
import 'package:aimshala/utils/common/colors_common.dart';
import 'package:aimshala/utils/common/text_common.dart';
import 'package:aimshala/utils/widgets/widgets_common.dart';
import 'package:aimshala/view/bookcareercounsellcall/career_home_aimScreen/widgets/career__widgets.dart';
import 'package:aimshala/view/bookcareercounsellcall/career_date_time_Booking/widgets/date_time_widgets.dart';
import 'package:aimshala/view/bookcareercounsellcall/career_review_booking_screen/career_review_booking_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';

class CareerDateTimeBookingScreen extends StatelessWidget {
  const CareerDateTimeBookingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(BookCareerCounsellController());
    ScrollController scrollController = ScrollController();
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
                  hLBox,
                  FutureBuilder(
                    future: controller.fetchBookingDate(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return SizedBox(
                          height: 5.9.h,
                          width: MediaQuery.of(context).size.width - 120,
                        );
                      } else if (snapshot.hasError) {
                        return Text('Error: ${snapshot.error}');
                      } else {
                        return Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                log("back");
                                double newScrollPosition =
                                    scrollController.offset -
                                        MediaQuery.of(context).size.width;
                                scrollController.animateTo(
                                  newScrollPosition,
                                  duration: const Duration(milliseconds: 700),
                                  curve: Curves.ease,
                                );
                              },
                              child: backForth(
                                const Icon(Icons.arrow_back_ios_new, size: 15),
                              ),
                            ),
                            SizedBox(
                              height: 5.9.h,
                              width: MediaQuery.of(context).size.width - 120,
                              child: ListView.builder(
                                controller: scrollController,
                                scrollDirection: Axis.horizontal,
                                // physics: NeverScrollableScrollPhysics(),
                                itemCount: snapshot.data?.length,
                                itemBuilder: (context, index) {
                                  final date = snapshot.data?[index];
                                  return GetBuilder<
                                          BookCareerCounsellController>(
                                      id: 'update-date',
                                      builder: (c) {
                                        return GestureDetector(
                                          onTap: () {
                                            // setState(() {
                                            c.selectedDate.value = date;
                                            c.update(['update-bookingButton']);
                                            c.update(['update-date']);
                                            // });
                                          },
                                          child: dateFotmatBox(
                                            date,
                                            colorbb: c.selectedDate == date
                                                ? mainPurple.withOpacity(0.1)
                                                : kwhite,
                                            colortext: c.selectedDate == date
                                                ? mainPurple
                                                : kblack.withOpacity(0.5),
                                          ),
                                        );
                                      });
                                },
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                scrollController.animateTo(
                                  scrollController.offset +
                                      MediaQuery.of(context).size.width,
                                  duration: const Duration(milliseconds: 700),
                                  curve: Curves.ease,
                                );
                              },
                              child: backForth(
                                const Icon(Icons.arrow_forward_ios, size: 15),
                              ),
                            ),
                          ],
                        );
                      }
                    },
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
                                return GetBuilder<BookCareerCounsellController>(
                                    id: 'update-time',
                                    builder: (c) {
                                      return GestureDetector(
                                        onTap: () {
                                          c.selectedTime =
                                              data.slotStartTime.toString();
                                          log('${c.selectedTime} + $index ${c.selectedDate.value}',
                                              name: 'timeeeeeeeeee');
                                          c.update(['update-bookingButton']);
                                          c.update(['update-time']);
                                        },
                                        child: timeContainer(
                                            timeData: convertToAMPM(
                                                data.slotStartTime.toString()),
                                            colortext: c.selectedTime ==
                                                    data.slotStartTime
                                                ? mainPurple
                                                : kblack,
                                            colorbb: c.selectedTime ==
                                                    data.slotStartTime
                                                ? mainPurple.withOpacity(0.1)
                                                : kwhite,
                                            select: c.selectedTime ==
                                                data.slotStartTime),
                                      );
                                    });
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
