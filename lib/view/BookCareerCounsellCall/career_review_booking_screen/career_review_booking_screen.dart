import 'dart:developer';

import 'package:aimshala/controllers/all_data_controller.dart';
import 'package:aimshala/controllers/career_booking_controller.dart';
import 'package:aimshala/utils/common/snackbar/snackbar.dart';
import 'package:aimshala/utils/common/widgets/colors_common.dart';
import 'package:aimshala/utils/widgets/widgets_common.dart';
import 'package:aimshala/view/bookcareercounsellcall/career_home_aimScreen/widgets/career__widgets.dart';
import 'package:aimshala/view/bookcareercounsellcall/career_home_aimScreen/widgets/model/microaim_model.dart';
import 'package:aimshala/view/bookcareercounsellcall/career_review_booking_screen/widgets/booking_dialoguebox.dart';
import 'package:aimshala/view/bookcareercounsellcall/career_review_booking_screen/widgets/review_booking_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class CareerReviewBookingScreen extends StatelessWidget {
  const CareerReviewBookingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(BookCareerCounsellController());
    final alldataC = Get.find<AllDataController>();
    String? userId;
    userId = initializeFields(alldataC, controller);
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
                            log('id=>$userId name=>${controller.nameController.text} email=>${controller.emailController.text} phone=>${controller.mobNumberController.text} role=${controller.roleController.text} appointDate=>${controller.selectedDate} appointTime=>${controller.selectedTime} aimId=>${controller.aimId} microAim=>$selectedIds',
                                name: 'reviewBooking screen');
                            controller
                                .careerBokingSlotFucntion(
                                  uId: userId.toString(),
                                  appointDate:
                                      controller.selectedDate.toString(),
                                  appointTime:
                                      controller.selectedTime.toString(),
                                  aimId: controller.aimId.toString(),
                                  microAim: selectedIds,
                                  // role: controller.roleController.text,
                                  // name: controller.nameController.text,
                                  // email: controller.emailController.text,
                                  // phoneNumber:
                                  //     controller.mobNumberController.text,
                                )
                                .then((value) => {
                                      if (value == 'True')
                                        {
                                          showDialogBoxFunction(
                                            context,
                                            userId.toString(),
                                            controller,
                                            controller.nameController.text,
                                          ),
                                        }
                                      else
                                        {
                                          SnackbarPopUps.popUpB(
                                              '"Booking failed"'),
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

  String? initializeFields(
      AllDataController alldataC, BookCareerCounsellController controller) {
    if (alldataC.userData == null) return null;
    String? id = alldataC.userData?.id.toString();
    controller.emailController.text =
        alldataC.userData?.email ?? controller.emailController.text;
    controller.mobNumberController.text =
        alldataC.userData?.phone ?? controller.mobNumberController.text;
    controller.nameController.text =
        alldataC.userData?.name ?? controller.nameController.text;
    controller.roleController.text =
        alldataC.userDetails?.userRole ?? controller.roleController.text;
    if (alldataC.userDetails?.aim?.name != "" ||
        alldataC.userDetails?.aim?.name == null) {
      controller.aimId = alldataC.userDetails?.aim?.id.toString();
      MicroModel model = MicroModel(
        microAim: alldataC.userDetails?.microAim?.name as String,
        aimId: alldataC.userDetails?.microAim?.id.toString() as String,
      );
      if (!controller.check.any((item) => item.microAim == model.microAim)) {
        controller.check.add(model);
      }
    }
    // controller.aimId = alldataC.userDetails?.aim?.id.toString();
    // MicroModel model = MicroModel(
    //   microAim: alldataC.userDetails?.microAim?.name as String,
    //   aimId: alldataC.userDetails?.microAim?.id.toString() as String,
    // );
    // if (!controller.check.any((item) => item.microAim == model.microAim)) {
    //   controller.check.add(model);
    // }
    // log('microAim=${counsel.check[0].microAim} id=>${counsel.check[0].microAim}');
    // userId = alldata.userData?.id.toString();
    return id;
  }

  void showDialogBoxFunction(BuildContext context, String userId,
      BookCareerCounsellController c, String name) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        c.checkCounsellcallBookingFuntion(userId: userId);
        return BookingDialogueBox(id: userId, userName: name);
      },
    );
  }
}
