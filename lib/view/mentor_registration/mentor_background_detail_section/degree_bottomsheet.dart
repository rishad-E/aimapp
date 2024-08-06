import 'dart:developer';

import 'package:aimshala/controllers/mentor_controllers/mentor_background_detail_controller.dart';
import 'package:aimshala/utils/common/widgets/colors_common.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MentorDegreeBottomsheet extends StatelessWidget {
  const MentorDegreeBottomsheet({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<MentorBackgroundDetailController>();
    
    // List<String> degreeItems = [
    //   "10th Standard",
    //   "12th Standard",
    //   "Deploma",
    //   "Bachelor's Degree",
    //   "Master's Degree",
    //   "Doctorate or Ph.D.",
    //   "Vocational or Technical Degree/Certificate",
    //   "Others"
    // ];
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
                'Select your Degree',
                style: TextStyle(
                  color: kblack,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Column(
              children: List.generate(
                controller.degreeList.length,
                (index) {
                  final data = controller.degreeList[index];
                  log(data.toString());
                  return ListTile(
                    shape: const Border(
                        bottom: BorderSide(
                            color: Color.fromARGB(255, 202, 201, 201))),
                    contentPadding: EdgeInsets.zero,
                    title: Text(
                      data.name.toString(),
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
                      value: controller.degreeController.text ==
                          data.name,
                      onChanged: (value) {
                        if (value != null && value) {
                          listValueChange(controller, data.name.toString());
                        }
                      },
                    ),
                    onTap: () {
                      listValueChange(controller, data.name.toString());
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

  void listValueChange(MentorBackgroundDetailController c, String item) {
    c.degreeController.text = item;
    c.update(['mentor-backgroundinfo']);
    c.other.value = item;
    Get.back();
  }
}
