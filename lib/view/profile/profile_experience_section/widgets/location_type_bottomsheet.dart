import 'package:aimshala/controllers/profile_controller/profile_experience_controller.dart';
import 'package:aimshala/utils/common/widgets/colors_common.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LocationTypeBottomSheet extends StatelessWidget {
  const LocationTypeBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ProfileExperienceController>();
    List<String> employeeTypes = [
      "Remote",
      "On-site",
      "Hybrid",
      "Nagaland",
      "WFH",
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
                'Select your Location Type',
                style: TextStyle(
                  color: kblack,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Column(
              children: List.generate(
                employeeTypes.length,
                (index) {
                  return ListTile(
                    shape: const Border(
                        bottom: BorderSide(
                            color: Color.fromARGB(255, 202, 201, 201))),
                    contentPadding: EdgeInsets.zero,
                    title: Text(
                      employeeTypes[index],
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
                      value: controller.locationTypeController.text ==
                          employeeTypes[index],
                      onChanged: (value) {
                        if (value != null && value) {
                          controller.locationTypeController.text =
                              employeeTypes[index];
                          controller.updateSaveButtonEX();
                          controller.update(['update-experienceInfo']);
                          Get.back();
                        }
                      },
                    ),
                    onTap: () {
                      controller.locationTypeController.text =
                          employeeTypes[index];
                      controller.updateSaveButtonEX();
                      controller.update(['update-experienceInfo']);
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
