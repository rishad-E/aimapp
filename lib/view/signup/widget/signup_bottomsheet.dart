import 'package:aimshala/controllers/signup_controller.dart';
import 'package:aimshala/utils/common/colors_common.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SingUpBottomSheet extends StatelessWidget {
  const SingUpBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<SignUpController>();
    List<String> valueListTile = ['Student', 'Professional', 'Employee'];
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
                      child: Image.asset(
                        'assets/images/close.png',
                        fit: BoxFit.cover,
                      )),
                ),
              ),
            ),
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: bottomHeading('Select your role', 18),
            ),
            ...List.generate(
              valueListTile.length,
              (index) {
                return ListTile(
                  shape: const Border(
                      bottom: BorderSide(
                          color: Color.fromARGB(255, 202, 201, 201))),
                  contentPadding: EdgeInsets.zero,
                  title: Text(valueListTile[index], style: optionText()),
                  trailing: Checkbox(
                    side: BorderSide.none,
                    value: controller.selectedRole == valueListTile[index],
                    onChanged: (value) {
                      if (value != null && value) {
                        signupbottomSheetListValueOnchanged(
                            controller, valueListTile[index]);
                      }
                    },
                  ),
                  onTap: () {
                    signupbottomSheetListValueOnchanged(
                        controller, valueListTile[index]);
                    controller.allFieldsSelected();
                  },
                );
              },
            )
          ],
        ),
      ),
    );
  }
}

void signupbottomSheetListValueOnchanged(
    SignUpController controller, String type) {
  Get.back();
  controller.roleController.text = type;
  controller.selectedRole = type;
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
