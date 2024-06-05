import 'dart:developer';
import 'package:aimshala/controllers/career_booking_controller.dart';
import 'package:aimshala/utils/common/colors_common.dart';
import 'package:aimshala/utils/common/text_common.dart';
import 'package:aimshala/utils/widgets/widgets_common.dart';
import 'package:aimshala/view/bookcareercounsellcall/career_home_aimScreen/widgets/bottom_sheets/career_aim_bottomsheet.dart';
import 'package:aimshala/view/bookcareercounsellcall/career_home_aimScreen/widgets/career__widgets.dart';
import 'package:aimshala/view/bookcareercounsellcall/career_home_aimScreen/widgets/bottom_sheets/career_microaim_bottomsheet.dart';
import 'package:aimshala/view/bookcareercounsellcall/career_date_time_Booking/career_date_time_booking_screen.dart';
import 'package:aimshala/view/bookcareercounsellcall/career_home_aimScreen/widgets/career_colors.dart';
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
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        style: TextStyle(fontSize: 14, color: textFieldColor),
                        decoration: careerTextFiled(
                          hintText: 'Tell us your Aim',
                          prefixWidget: careerSearchIcon(leftP: 10, rightP: 10),
                        ),
                        validator: (value) =>
                            careerController.aimValidation(value),
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
                              showCareerMicroAimBottomSheet(
                                  context, careerController);
                            },
                            child: careerController.check.isEmpty
                                ? TextFormField(
                                    validator: (value) => careerController
                                        .microAimValidation(value),
                                    style: TextStyle(
                                        fontSize: 14, color: textFieldColor),
                                    decoration: careerTextFiled(
                                      hintText: 'Tell us your Micro Aim',
                                      prefixWidget: careerSearchIcon(
                                          leftP: 10, rightP: 10),
                                      suffixWidget:
                                          const Icon(Icons.keyboard_arrow_down),
                                    ),
                                    readOnly: true,
                                    onTap: () {
                                      showCareerMicroAimBottomSheet(
                                          context, careerController);
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
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Expanded(
                                          child: Wrap(
                                            spacing: 5,
                                            runSpacing: 4,
                                            children: List.generate(
                                              careerController.check.length,
                                              (index) {
                                                final data =
                                                    careerController.check;
                                                if (index == data.length - 1) {
                                                  return Row(
                                                    children: [
                                                      Flexible(
                                                        child: checking(
                                                          microAim: data[index]
                                                              .microAim
                                                              .toString(),
                                                          onTap: () {
                                                            log("delete onTap");
                                                            data.removeAt(
                                                                index);
                                                            careerController
                                                                .update([
                                                              'button-careerAim'
                                                            ]);
                                                          },
                                                        ),
                                                      ),
                                                      addmoreText()
                                                    ],
                                                  );
                                                } else {
                                                  return checking(
                                                    microAim:
                                                        data[index].microAim,
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
                                        ),
                                        const Icon(Icons.keyboard_arrow_down),
                                      ],
                                    ),
                                  )),
                      ),
                    ),
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
                              if (careeraimFormKey.currentState!.validate()) {
                                log("fst ${careerController.aimController.text}+name${careerController.roleController.text}");
                                Get.to(
                                    () => const CareerDateTimeBookingScreen());
                              }
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

  void showCareerMicroAimBottomSheet(
      BuildContext context, BookCareerCounsellController controller) {
    showModalBottomSheet(
      backgroundColor: kwhite,
      context: context,
      isScrollControlled: true,
      useSafeArea: false,
      builder: (BuildContext context) {
        controller.searchMicroAimOptions(
            query: '', parentId: controller.aimId.toString());
        return Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: const CareerMicroAimBottomsheet(),
        );
      },
    );
  }
}
