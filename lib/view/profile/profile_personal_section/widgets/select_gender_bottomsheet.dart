import 'package:aimshala/controllers/profile_controller/profile_personal_info_controller.dart';
import 'package:aimshala/utils/common/colors_common.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GenderTypeBottomSheet extends StatelessWidget {
  const GenderTypeBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<PerosnalInfoController>();
    List<String> genderTypes = [
      "Male",
      "Female",
      "Other",
    ];
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 20, 10, 40),
      child: SingleChildScrollView(
        child: Column(
          children: [
            ListTile(
              contentPadding: EdgeInsets.zero,
              trailing: GestureDetector(
                onTap: () => Get.back(),
                child: SizedBox(
                    height: 30,
                    width: 30,
                    child: Image.asset(
                      'assets/images/close.png',
                      fit: BoxFit.cover,
                    )),
              ),
            ),
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: Text(
                'Select your Gender',
                style: TextStyle(
                  color: kblack,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Column(
              children: List.generate(
                genderTypes.length,
                (index) {
                  return ListTile(
                    shape: const Border(
                        bottom: BorderSide(
                            color: Color.fromARGB(255, 202, 201, 201))),
                    contentPadding: EdgeInsets.zero,
                    title: Text(
                      genderTypes[index],
                      style: TextStyle(
                        color: kblack,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    trailing: Checkbox(
                      side: BorderSide.none,
                      activeColor: mainPurple,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5)),
                      value: controller.genderController.text == genderTypes[index],
                      onChanged: (value) {
                        if (value != null && value) {
                          controller.genderController.text = genderTypes[index];
                          controller.update(['update-personalinfo']);
                          Get.back();
                        }
                      },
                    ),
                    onTap: () {
                      controller.genderController.text = genderTypes[index];
                      controller.update(['update-personalinfo']);
                      Get.back();
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
