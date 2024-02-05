import 'package:aimshala/controllers/signup_controller.dart';
import 'package:aimshala/utils/common/colors_common.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

void showRoleBottomSheet(BuildContext context, SignUpController controller) {
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
                trailing: GestureDetector(
                  onTap: () => Get.back(),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: SizedBox(
                      height: 30,
                      width: 30,
                      // color: Colors.yellow,
                      child: Image.asset('assets/images/close.png',fit: BoxFit.cover,)
                    ),
                  ),
                ),
              ),
              ListTile(
                contentPadding: EdgeInsets.zero,
                leading: bottomHeading('Select your role', 18),
              ),
              ListTile(
                shape: const Border(
                    bottom:
                        BorderSide(color: Color.fromARGB(255, 202, 201, 201))),
                contentPadding: EdgeInsets.zero,
                title: Text('Student', style: optionText()),
                trailing: Checkbox(
                  side: BorderSide.none,
                  value: controller.selectedRole == 'Student',
                  onChanged: (value) {
                    if (value != null && value) {
                      Get.back();
                      controller.roleController.text = 'Student';
                      controller.selectedRole = 'Student';
                    }
                  },
                ),
                onTap: () {
                  Get.back();
                  controller.roleController.text = 'Student';
                  controller.selectedRole = 'Student';
                  controller.allFieldsSelected();
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
                  controller.selectedRole = 'Professional';
                  controller.allFieldsSelected();
                },
                trailing: Checkbox(
                  side: BorderSide.none,
                  value: controller.selectedRole == 'Professional',
                  onChanged: (value) {
                    if (value != null && value) {
                      Get.back();
                      controller.roleController.text = 'Professional';
                      controller.selectedRole = 'Professional';
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
                  controller.selectedRole = 'Employee';
                  controller.allFieldsSelected();
                },
                trailing: Checkbox(
                  side: BorderSide.none,
                  value: controller.selectedRole == 'Employee',
                  onChanged: (value) {
                    if (value != null && value) {
                      Get.back();
                      controller.roleController.text = 'Employee';
                      controller.selectedRole = 'Employee';
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

Text bottomHeading(String text, double size) {
  return Text(
    text,
    style: TextStyle(
      color: kblack,
      fontSize: size,
      fontWeight: FontWeight.w700,
    ),
  );
}
