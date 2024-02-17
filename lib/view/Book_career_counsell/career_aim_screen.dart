import 'dart:developer';
import 'package:aimshala/controllers/career_booking_controller.dart';
import 'package:aimshala/utils/common/colors_common.dart';
import 'package:aimshala/utils/common/text_common.dart';
import 'package:aimshala/utils/widgets/widgets_common.dart';
import 'package:aimshala/view/Book_career_counsell/widgets/bottom_sheets/career_aim_bottomsheet.dart';
import 'package:aimshala/view/Book_career_counsell/widgets/career_colors.dart';
import 'package:aimshala/view/Book_career_counsell/widgets/career__widgets.dart';
import 'package:aimshala/view/Book_career_counsell/widgets/bottom_sheets/career_microaim_bottomsheet.dart';
import 'package:aimshala/view/date_time_Booking/date_time_booking_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class BookCareerAimPage extends StatelessWidget {
  BookCareerAimPage({super.key});
  final careerController = Get.put(BookCareerCounsellController());
  final GlobalKey<FormState> careeraimFormKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: careerAppBar(),
      body: Container(
        height: double.infinity,
        decoration: careerMainContainerdecoration(),
        child: Center(
          child: SingleChildScrollView(
              child: Padding(
            padding: careerContainerP,
            child: Form(
              key: careeraimFormKey,
              child: careerSecContainer(
                child: Column(
                  children: [
                    boldText(text: "What is your Aim? ", size: 20),
                    hMBox,
                    careerHomeField(
                      text: primarytxt3('Your Aim', 11),
                      textField: TextFormField(
                        style: TextStyle(fontSize: 14, color: textFieldColor),
                        decoration: careerTextFiled(
                          hintText: 'Tell us your Aim',
                          prefixWidget: Icon(
                            Icons.search_rounded,
                            size: 20,
                            color: kblack,
                          ),
                        ),
                        validator: (value) {
                          if (careerController.aimController.text.isEmpty) {
                            return 'Please select your aim';
                          }
                          return null;
                        },
                        controller: careerController.aimController,
                        readOnly: true,
                        onTap: () {
                          careerController.searchAimOptions(query: '');
                          showCareerAimBottomSheet(context);
                        },
                      ),
                    ),
                    hMBox,
                    careerHomeField(
                        text: primarytxt3('Your Micro Aim', 11),
                        textField: Obx(
                          () => GestureDetector(
                              onTap: () {
                                log('ontap');
                                showCareerMicroAimBottomSheet(context);
                              },
                              child: careerController.check.isEmpty
                                  ? TextFormField(
                                      style: TextStyle(
                                          fontSize: 14, color: textFieldColor),
                                      decoration: careerTextFiled(
                                        hintText: 'Tell us your Micro Aim',
                                        prefixWidget: Icon(
                                          Icons.search_rounded,
                                          size: 20,
                                          color: kblack,
                                        ),
                                      ),
                                      readOnly: true,
                                      onTap: () {
                                        showCareerMicroAimBottomSheet(context);
                                      })
                                  : Container(
                                      width: double.infinity,
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 7, vertical: 10),
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color: const Color.fromARGB(
                                                255, 173, 174, 175)),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: Wrap(
                                        spacing: 5,
                                        runSpacing: 2,
                                        children: List.generate(
                                          careerController.check.length,
                                          (index) {
                                            final data = careerController.check;
                                            if (index == data.length - 1) {
                                              return Row(
                                                children: [
                                                  checking(
                                                      microAim: data[index]
                                                          .toString(),
                                                      onTap: () {
                                                        log("delte ontap");
                                                        data.removeAt(index);
                                                        careerController
                                                            .update([
                                                          'button-careerAim'
                                                        ]);
                                                      }),
                                                  const Expanded(
                                                    child: Text(
                                                      " Add more...",
                                                      style: TextStyle(
                                                        color: Color.fromARGB(
                                                            255, 116, 118, 119),
                                                      ),
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                    ),
                                                  )
                                                ],
                                              );
                                            } else {
                                              return checking(
                                                microAim:
                                                    data[index].toString(),
                                                onTap: () {
                                                  data.removeAt(index);
                                                  log("delte ontap");
                                                  careerController.update(
                                                      ['button-careerAim']);
                                                },
                                              );
                                            }
                                          },
                                        ),
                                      ),
                                    )),
                        )),
                    hBox,
                    Obx(
                      () => careerController.careerAimSelectedRole.value ==
                              'Your aim'
                          ? const SizedBox.shrink()
                          : remindWidget(),
                    ),
                    hBox,
                    hMBox,
                    Container(
                      width: double.infinity,
                      height: 4.5.h,
                      decoration: boxdecoration(12),
                      child: GetBuilder<BookCareerCounsellController>(
                        id: 'button-careerAim',
                        builder: (career) {
                          return TextButton(
                            onPressed: () {
                              if (careeraimFormKey.currentState!.validate()) {}
                              log("fst ${careerController.aimController.text}+scnd${careerController.check.toString()}");
                              Get.to(() =>
                                  // TempScreen( microAim: careerController.check)
                                  const CareerDateTimeBookingScreen());
                            },
                            style: ButtonStyle(
                              shape: buttonShape(round: 8),
                              backgroundColor:
                                  MaterialStateProperty.resolveWith<Color>(
                                (states) {
                                  return career.aimController.text.isNotEmpty &&
                                          career.check.isNotEmpty
                                      ? kpurple
                                      : buttonColor;
                                },
                              ),
                            ),
                            child: Text(
                              "Next",
                              style: TextStyle(
                                  color: career.aimController.text.isNotEmpty &&
                                          career.check.isNotEmpty
                                      ? Colors.white
                                      : const Color.fromARGB(
                                          255, 116, 118, 119)),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )),
        ),
      ),
    );
  }

  void showCareerAimBottomSheet(BuildContext context) {
    // Get.bottomSheet(
    //     // ignoreSafeArea: false,
    //     // isScrollControlled: true,
    //     const CareerAimBottomsheet(),
    //     backgroundColor: kwhite);
    showModalBottomSheet(
      backgroundColor: kwhite,
      context: context,
      // isScrollControlled: true,
      // useSafeArea: false,
      builder: (BuildContext context) {
        return const CareerAimBottomsheet();
      },
    );
  }

  void showCareerMicroAimBottomSheet(BuildContext context) {
    showModalBottomSheet(
      backgroundColor: kwhite,
      context: context,
      builder: (BuildContext context) {
        return const CareerMicroAimBottomsheet();
      },
    );
  }
}
