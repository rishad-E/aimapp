import 'dart:developer';

import 'package:aimshala/controllers/career_booking_controller.dart';
import 'package:aimshala/controllers/login_controller.dart';
import 'package:aimshala/models/UserModel/user_model.dart';
import 'package:aimshala/utils/common/colors_common.dart';
import 'package:aimshala/utils/widgets/widgets_common.dart';
import 'package:aimshala/view/BookCareerCounsellCall/career_home_aimScreen/widgets/career__widgets.dart';
import 'package:aimshala/view/BookCareerCounsellCall/career_review_booking_screen/widgets/booking_dialoguebox.dart';
import 'package:aimshala/view/BookCareerCounsellCall/career_review_booking_screen/widgets/review_booking_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';

class CareerReviewBookingScreen extends StatelessWidget {
  const CareerReviewBookingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(BookCareerCounsellController());
    final UserDataModel? userData = Get.find<LoginController>().userData;
    if (userData != null) {
      controller.emailController.text = userData.user?.email ?? '';
      controller.mobNumberController.text = userData.user?.phone ?? '';
    }
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
                    careerBoldText(
                      text: 'Review Your Booking',
                      size: 20,
                      color: kblack,
                    ),
                    hBox,
                    careerBoldText(
                      text: controller.nameController.text,
                      size: 16,
                      color: kpurple,
                    ),
                    hBox,
                    reviewRoleController(
                        role: controller.roleController.text == "Other"
                            ? controller.otherRoleController.text
                            : controller.roleController.text),
                    hBox,
                    reviewValContainer(
                      svg: "assets/images/Mail.svg",
                      text: controller.emailController.text,
                    ),
                    hBox,
                    reviewValContainer(
                      svg: 'assets/images/call.svg',
                      text: controller.mobNumberController.text,
                    ),
                    hMBox,
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 7, vertical: 10),
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: const Color.fromARGB(255, 217, 219, 219)),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Your Aim:',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                            ),
                          ),
                          hBox,
                          Wrap(
                            spacing: 5,
                            runSpacing: 4,
                            children: List.generate(
                              controller.check.length,
                              // 5,
                              (index) {
                                return reviewAimWidget(
                                    microAim: controller.check[index].microAim);
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    hMBox,
                    reviewDateContainer(
                      time: convertToAMPM(controller.selectedTime.toString()),
                      date: formatDate(controller.selectedDate.toString()),
                    ),
                    hLBox,
                    Container(
                        width: double.infinity,
                        height: 4.5.h,
                        decoration: boxdecoration(12),
                        child: TextButton(
                          onPressed: () {
                            log("submit onpress");
                            List<String> selectedIds = controller.check
                                .map((item) => item.aimId)
                                .toList();
                            log(controller.roleController.text);
                            controller
                                .careerBokingSlotFucntion(
                                  name: controller.nameController.text,
                                  email: controller.emailController.text,
                                  phoneNumber:
                                      controller.mobNumberController.text,
                                  appointDate:
                                      controller.selectedDate.toString(),
                                  appointTime:
                                      controller.selectedTime.toString(),
                                  role: controller.roleController.text,
                                  aimId: controller.aimId.toString(),
                                  microAim: selectedIds,
                                )
                                .then((value) => {
                                      if (value == 'True')
                                        {
                                          showDialogBoxFunction(context),
                                        }
                                      else
                                        {
                                          Get.showSnackbar(
                                            const GetSnackBar(
                                              snackStyle: SnackStyle.FLOATING,
                                              message: "Booking failed",
                                              margin: EdgeInsets.all(10),
                                              backgroundColor: Colors.red,
                                              duration: Duration(seconds: 2),
                                            ),
                                          )
                                        }
                                    });
                          },
                          style: ButtonStyle(
                            shape: buttonShape(round: 8),
                            backgroundColor:
                                MaterialStateProperty.resolveWith<Color>(
                              (states) {
                                return kpurple;
                              },
                            ),
                          ),
                          child: const Text(
                            "Submit",
                            style: TextStyle(color: Colors.white),
                          ),
                        )),
                  ],
                ),
              ),
            ),
          ),
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

  String formatDate(String inputDateString) {
    DateTime dateTime = DateTime.parse(inputDateString);
    String dayOfWeek = DateFormat.E('en_US').format(dateTime);
    int dayOfMonth = dateTime.day;
    String month = DateFormat.MMM().format(dateTime);
    String formattedDate = '$dayOfWeek, $dayOfMonth $month';
    return formattedDate;
  }
}

void showDialogBoxFunction(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) {
      return const BookingDialogueBox();
    },
  );
}
