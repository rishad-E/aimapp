import 'package:aimshala/controllers/career_booking_controller.dart';
import 'package:aimshala/utils/common/colors_common.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void showCareerRoleBottomSheet(
    BuildContext context, BookCareerCounsellController controller) {
  showModalBottomSheet(
    backgroundColor: kwhite,
    context: context,
    builder: (BuildContext context) {
      return Padding(
        padding: const EdgeInsets.fromLTRB(20, 20, 10, 40),
        child: SizedBox(
          // height: 37.h,
          height: 301,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                contentPadding: EdgeInsets.zero,
                leading: GestureDetector(
                  onTap: () => Get.back(),
                  child: SizedBox(
                      height: 30,
                      width: 30,
                      child: Image.asset(
                        'assets/images/close.png',
                        fit: BoxFit.cover,
                      )),
                ),
                trailing: Padding(
                  padding: const EdgeInsets.only(right: 5),
                  child: TextButton(
                    onPressed: () {},
                    style: ButtonStyle(
                      overlayColor: MaterialStateProperty.resolveWith<Color?>(
                        (Set<MaterialState> states) {
                          if (states.contains(MaterialState.pressed)) {
                            return Colors.transparent;
                          }
                          return null;
                        },
                      ),
                    ),
                    child: bottomHeading(
                        'Resend Code', 14, FontWeight.w600, mainPurple),
                  ),
                ),
              ),
              ListTile(
                contentPadding: EdgeInsets.zero,
                leading: bottomHeading(
                    'Select your role', 18, FontWeight.w700, kblack),
              ),
              ListTile(
                shape: const Border(
                    bottom:
                        BorderSide(color: Color.fromARGB(255, 202, 201, 201))),
                contentPadding: EdgeInsets.zero,
                title: Text('Student', style: optionText()),
                trailing: Checkbox(
                  side: BorderSide.none,
                  value: controller.careerSelectedRole == 'Student',
                  onChanged: (value) {
                    if (value != null && value) {
                      Get.back();
                      controller.roleController.text = 'Student';
                      controller.careerSelectedRole = 'Student';
                    }
                  },
                ),
                onTap: () {
                  Get.back();
                  controller.roleController.text = 'Student';
                  controller.careerSelectedRole = 'Student';
                  controller.checkAllfield();
                },
              ),
              ListTile(
                shape: const Border(
                    bottom:
                        BorderSide(color: Color.fromARGB(255, 202, 201, 201))),
                contentPadding: EdgeInsets.zero,
                title: Text('Professional', style: optionText()),
                onTap: () {
                  Get.back();
                  controller.roleController.text = 'Professional';
                  controller.careerSelectedRole = 'Professional';
                  controller.checkAllfield();
                },
                trailing: Checkbox(
                  side: BorderSide.none,
                  value: controller.careerSelectedRole == 'Professional',
                  onChanged: (value) {
                    if (value != null && value) {
                      Get.back();
                      controller.roleController.text = 'Professional';
                      controller.careerSelectedRole = 'Professional';
                    }
                  },
                ),
              ),
              ListTile(
                shape: const Border(
                    bottom:
                        BorderSide(color: Color.fromARGB(255, 202, 201, 201))),
                contentPadding: EdgeInsets.zero,
                title: Text(style: optionText(), 'Employee'),
                onTap: () {
                  Get.back();
                  controller.roleController.text = 'Employee';
                  controller.careerSelectedRole = 'Employee';
                  controller.checkAllfield();
                },
                trailing: Checkbox(
                  side: BorderSide.none,
                  value: controller.careerSelectedRole == 'Employee',
                  onChanged: (value) {
                    if (value != null && value) {
                      Get.back();
                      controller.roleController.text = 'Employee';
                      controller.careerSelectedRole = 'Employee';
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}

TextStyle optionText() {
  return TextStyle(
    color: kblack,
    fontSize: 14,
    fontWeight: FontWeight.w400,
  );
}

Text bottomHeading(
    String text, double size, FontWeight? fontWeight, Color? color) {
  return Text(
    text,
    style: TextStyle(
      color: color,
      fontSize: size,
      fontWeight: FontWeight.w700,
    ),
  );
}
