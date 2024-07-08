import 'dart:developer';

import 'package:aimshala/controllers/educator_controllers/educator_personal_detail_controller.dart';
import 'package:aimshala/controllers/mentor_controllers/mentor_personal_details_controller.dart';
import 'package:aimshala/utils/common/widgets/colors_common.dart';
import 'package:aimshala/utils/widgets/widgets_common.dart';
import 'package:aimshala/view/educator_registration/personal_detail_section/personal_deail_page.dart';
import 'package:aimshala/view/mentor_registration/mentor_personal_detail_section/mentor_personal_details_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class TempScreen extends StatelessWidget {
  const TempScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final mentor = Get.put(MentorPersonalDetailController());
    final educaotr = Get.put(EducatorPersonalDetailController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Temp Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            elevatedButtonItems(
              onPressed: () {
                // Get.to(() => TempResultScreen());
              },
              item: "aimcet result screen temp",
            ),
            hMBox,
            elevatedButtonItems(
              onPressed: () {
                log(educaotr.isEducator, name: 'isEducator');
                if (educaotr.isEducator == 'no') {
                  educaotr.clearAllfields();
                  Get.to(() => EducatorPersonalDetailPage());
                } else {
                  Get.snackbar(
                    "Hi ",
                    "You are already an Educator...",
                    snackPosition: SnackPosition.TOP,
                    duration: const Duration(seconds: 2),
                    backgroundColor: const Color.fromARGB(255, 191, 189, 194)
                        .withOpacity(0.7),
                    colorText: mainPurple,
                  );
                }
              },
              item: 'Educator',
            ),
            hMBox,
            elevatedButtonItems(
              onPressed: () {
                log(mentor.isMentor, name: 'isMentor');
                if (mentor.isMentor == 'no') {
                  Get.to(() => MentorPersonalDetailPage());
                } else {
                  Get.snackbar(
                    "Hi ",
                    "You are already a Mentor...",
                    snackPosition: SnackPosition.TOP,
                    duration: const Duration(seconds: 2),
                    backgroundColor: const Color.fromARGB(255, 191, 189, 194)
                        .withOpacity(0.7),
                    colorText: mainPurple,
                  );
                }
              },
              item: 'Mentor',
            ),
          ],
        ),
      ),
    );
  }
}

Widget elevatedButtonItems(
    {required void Function()? onPressed, required String item}) {
  return ElevatedButton.icon(
    style: ButtonStyle(
        shape: buttonShape(round: 8),
        side: MaterialStatePropertyAll(BorderSide(color: mainPurple))),
    onPressed: onPressed,
    icon: Text(
      item,
      style: TextStyle(
          fontSize: 11.sp, color: mainPurple, fontWeight: FontWeight.w600),
    ),
    label: Icon(
      Icons.arrow_forward_ios_sharp,
      size: 11.sp,
      color: mainPurple,
    ),
  );
}
