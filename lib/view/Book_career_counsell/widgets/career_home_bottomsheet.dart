import 'dart:developer';

import 'package:aimshala/controllers/career_booking_controller.dart';
import 'package:aimshala/utils/common/colors_common.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CareerHomeBottomSheet extends StatelessWidget {
  const CareerHomeBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<BookCareerCounsellController>();
    List<String> valueListTile = ['Student', 'Professional', 'Employee'];
    log('career home bottom sheet open');
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
            ...List.generate(valueListTile.length, (index) {
              return ListTile(
                shape: const Border(
                    bottom:
                        BorderSide(color: Color.fromARGB(255, 202, 201, 201))),
                contentPadding: EdgeInsets.zero,
                title: Text(valueListTile[index], style: optionText()),
                trailing: Checkbox(
                  side: BorderSide.none,
                  value: controller.careerSelectedRole == valueListTile[index],
                  onChanged: (value) {
                    if (value != null && value) {
                      bottomSheetListValueOnchanged(
                          controller, valueListTile[index]);
                    }
                  },
                ),
                onTap: () {
                  bottomSheetListValueOnchanged(
                      controller, valueListTile[index]);
                  controller.checkAllfieldCareerHome();
                },
              );
            })
          ],
        ),
      ),
    );
  }
}

void bottomSheetListValueOnchanged(
    BookCareerCounsellController controller, String type) {
    Get.back();
    controller.roleController.text = type;
    controller.careerSelectedRole = type;
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
