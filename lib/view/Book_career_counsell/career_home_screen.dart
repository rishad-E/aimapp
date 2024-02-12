import 'dart:developer';

import 'package:aimshala/controllers/career_booking_controller.dart';
import 'package:aimshala/utils/common/colors_common.dart';
import 'package:aimshala/utils/common/text_common.dart';
import 'package:aimshala/utils/widgets/widgets_common.dart';
import 'package:aimshala/view/Book_career_counsell/career_aim_screen.dart';
import 'package:aimshala/view/Book_career_counsell/widgets/career_bottomsheet.dart';
import 'package:aimshala/view/Book_career_counsell/widgets/career_colors.dart';
import 'package:aimshala/view/Book_career_counsell/widgets/career_home_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class BookCareerHomePage extends StatelessWidget {
  BookCareerHomePage({super.key});
  final careerController = Get.put(BookCareerCounsellController());
  final GlobalKey<FormState> careerFormKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        // title: appbarContainer(onPressed: () {}),
        title: const Text(
          "Book Career Counselling Call",
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 12),
        ),
        centerTitle: true,
      ),
      body: Container(
        // height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/bg-image.png'),
              fit: BoxFit.cover),
        ),
        child: Center(
          child: SingleChildScrollView(
              child: Padding(
            padding: const EdgeInsets.only(left: 17, right: 17, top: 15),
            child: Form(
              key: careerFormKey,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 17, vertical: 24),
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: kwhite,
                ),
                child: Column(
                  children: [
                    boldText(text: "Who you are?", size: 20),
                    hLBox,
                    careerHomeField(
                      text: primarytxt3('Name', 11),
                      textField: TextFormField(
                        style: TextStyle(fontSize: 14, color: textFieldColor),
                        decoration: careerTextFiled(hintText: 'Enter Name'),
                        controller: careerController.nameController,
                        validator: (value) =>
                            careerController.nameValidation(value),
                        onChanged: (value) {
                          careerController.checkAllfield();
                        },
                      ),
                    ),
                    hLBox,
                    GestureDetector(
                      onTap: () {
                        showCareerRoleBottomSheet(context, careerController);
                      },
                      child: AbsorbPointer(
                        child: careerHomeField(
                          text: primarytxt3('I am', 11),
                          textField: TextFormField(
                            style:
                                TextStyle(fontSize: 14, color: textFieldColor),
                            decoration: careerTextFiled(
                              hintText: 'Select your role',
                              suffixWidget:
                                  const Icon(Icons.keyboard_arrow_down),
                            ),
                            onChanged: (value) {
                              careerController.checkAllfield();
                            },
                            controller: careerController.roleController,
                            readOnly: true,
                          ),
                        ),
                      ),
                    ),
                    hBox,
                    hLBox,
                    Container(
                      width: double.infinity,
                      height: 4.5.h,
                      decoration: boxdecoration(12),
                      child: GetBuilder<BookCareerCounsellController>(
                          id: 'button-careerHome',
                          builder: (career) {
                            return TextButton(
                              onPressed: () {
                                if (careerFormKey.currentState!.validate()) {
                                  log(career.nameController.text +
                                      careerController.roleController.text);
                                  Get.to(() => const BookCareerAimPage());
                                }
                              },
                              style: ButtonStyle(
                                shape: buttonShape(round: 8),
                                backgroundColor:
                                    MaterialStateProperty.resolveWith<Color>(
                                  (states) {
                                    return career
                                            .isAllCareerFieldsSelected.value
                                        ? kpurple
                                        : buttonColor;
                                  },
                                ),
                              ),
                              child: Text(
                                "Next",
                                style: TextStyle(
                                    color: careerController
                                        .careerButtontext.value),
                              ),
                            );
                          }),
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
}
