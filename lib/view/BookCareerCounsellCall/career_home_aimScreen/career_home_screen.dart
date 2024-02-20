import 'package:aimshala/controllers/career_booking_controller.dart';
import 'package:aimshala/utils/common/colors_common.dart';
import 'package:aimshala/utils/common/text_common.dart';
import 'package:aimshala/utils/widgets/widgets_common.dart';
import 'package:aimshala/view/BookCareerCounsellCall/career_home_aimScreen/career_aim_screen.dart';
import 'package:aimshala/view/BookCareerCounsellCall/career_home_aimScreen/widgets/bottom_sheets/career_home_bottomsheet.dart';
import 'package:aimshala/view/BookCareerCounsellCall/career_home_aimScreen/widgets/career_colors.dart';
import 'package:aimshala/view/BookCareerCounsellCall/career_home_aimScreen/widgets/career__widgets.dart';
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
      appBar: careerAppBar(),
      body: Container(
        decoration: careerMainContainerdecoration(),
        child: Center(
          child: SingleChildScrollView(
              child: Padding(
            padding: careerContainerP,
            child: Form(
              key: careerFormKey,
              child: careerSecContainer(
                child: Column(
                  children: [
                    boldText(text: "Who you are?", size: 20),
                    hMBox,
                    careerHomeField(
                      text: primarytxt3('Name', 11),
                      textField: TextFormField(
                        style: TextStyle(fontSize: 14, color: textFieldColor),
                        decoration: careerTextFiled(hintText: 'Enter Name'),
                        controller: careerController.nameController,
                        validator: (value) =>
                            careerController.nameValidation(value),
                        onChanged: (value) {
                          careerController.checkAllfieldCareerHome();
                        },
                      ),
                    ),
                    hMBox,
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
                              careerController.checkAllfieldCareerHome();
                            },
                            controller: careerController.roleController,
                            readOnly: true,
                          ),
                        ),
                      ),
                    ),
                    hBox,
                    hMBox,
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
                                  Get.to(() => BookCareerAimPage());
                                  career.searchAimOptions(query: '');
                                }
                              },
                              style: ButtonStyle(
                                shape: buttonShape(round: 8),
                                backgroundColor:
                                    MaterialStateProperty.resolveWith<Color>(
                                  (states) {
                                    return career
                                            .isAllCareerHomeFieldsSelected.value
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

  void showCareerRoleBottomSheet(
      BuildContext context, BookCareerCounsellController controller) {
    showModalBottomSheet(
      backgroundColor: kwhite,
      context: context,
      builder: (BuildContext context) {
        return const CareerHomeBottomSheet();
      },
    );
  }
}
