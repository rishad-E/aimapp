import 'dart:developer';
import 'package:aimshala/controllers/career_booking_controller.dart';
import 'package:aimshala/utils/common/widgets/colors_common.dart';
import 'package:aimshala/utils/common/widgets/text_common.dart';
import 'package:aimshala/utils/widgets/widgets_common.dart';
import 'package:aimshala/view/bookcareercounsellcall/career_aim_screen/widgets/bottom_sheets/career_aim_bottomsheet.dart';
import 'package:aimshala/view/bookcareercounsellcall/career_aim_screen/widgets/career__widgets.dart';
import 'package:aimshala/view/bookcareercounsellcall/career_aim_screen/widgets/career_colors.dart';
import 'package:aimshala/view/bookcareercounsellcall/career_date_time_Booking/career_date_time_booking_screen.dart';
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
                      text: shrinked,
                      textField: Obx(
                        () => GestureDetector(
                          onTap: () {
                            careerController.searchAimOptions(query: '');
                            careerController.searchAims('');
                            showCareerAimBottomSheet(context);
                          },
                          child: careerController.check.isEmpty
                              ? careerAimContainer(
                                  child: Row(
                                    children: [
                                      careerSearchIcon(leftP: 10, rightP: 10),
                                      Text(
                                        'Tell us your Micro aim',
                                        style: TextStyle(
                                          color: kblack.withOpacity(0.4),
                                          fontSize: 13,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              : careerAimContainer(
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        child: Wrap(
                                            spacing: 5,
                                            runSpacing: 4,
                                            crossAxisAlignment:
                                                WrapCrossAlignment.center,
                                            children: [
                                              ...List.generate(
                                                careerController.check.length,
                                                (index) {
                                                  final data =
                                                      careerController.check;
                                                  return selectedAimContainer(
                                                    microAim:
                                                        data[index].microAim,
                                                    onTap: () {
                                                      data.removeAt(index);
                                                      careerController.update(
                                                          ['button-careerAim']);
                                                    },
                                                  );
                                                },
                                              ),
                                              addmoreText()
                                            ]),
                                      ),
                                      const Icon(Icons.keyboard_arrow_down),
                                    ],
                                  ),
                                ),
                        ),
                      ),
                    ),
                    hMBox,
                    Container(
                      width: double.infinity,
                      height: 4.5.h,
                      decoration: boxdecoration(12),
                      child: GetBuilder<BookCareerCounsellController>(
                        id: 'button-careerAim',
                        builder: (c) {
                          return TextButton(
                            onPressed: () {
                              if (careeraimFormKey.currentState!.validate()) {
                                log(' Microaim=>${c.check}');
                                Get.to(()=>const CareerDateTimeBookingScreen(),transition: Transition.fade);
                              }
                            },
                            style: ButtonStyle(
                              shape: buttonShape(round: 8),
                              backgroundColor:
                                  MaterialStateProperty.resolveWith<Color>(
                                (states) {
                                  return c.check.isNotEmpty
                                      ? kpurple
                                      : buttonColor;
                                },
                              ),
                            ),
                            child: Text(
                              "Next",
                              style: TextStyle(
                                  color: c.check.isNotEmpty
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
            ),
          )),
        ),
      ),
    );
  }

  void showCareerAimBottomSheet(BuildContext context) {
    showModalBottomSheet(
      backgroundColor: kwhite,
      context: context,
      isScrollControlled: true,
      useSafeArea: false,
      builder: (BuildContext context) {
        return Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: const CareerAimBottomsheet(),
        );
      },
    );
  }

  // void showCareerMicroAimBottomSheet(
  //     BuildContext context, BookCareerCounsellController controller) {
  //   showModalBottomSheet(
  //     backgroundColor: kwhite,
  //     context: context,
  //     isScrollControlled: true,
  //     useSafeArea: false,
  //     builder: (BuildContext context) {
  //       controller.searchMicroAimOptions(
  //           query: '', parentId: controller.aimId.toString());
  //       return Padding(
  //         padding:
  //             EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
  //         child: CareerMicroAimBottomsheet(),
  //       );
  //     },
  //   );
  // }
}
