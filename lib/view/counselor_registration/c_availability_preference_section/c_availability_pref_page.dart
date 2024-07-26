import 'package:aimshala/controllers/counselor_controllers/counselor_availability_controller.dart';
import 'package:aimshala/utils/common/widgets/colors_common.dart';
import 'package:aimshala/utils/widgets/widgets_common.dart';
import 'package:aimshala/view/counselor_registration/c_experties_area_section/c_experties_area_page.dart';
import 'package:aimshala/view/counselor_registration/common/widgets/counselor_widgets.dart';
import 'package:aimshala/view/profile/common/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CounselorAvailabilityPage extends StatelessWidget {
  const CounselorAvailabilityPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CounselorAvailabilityController());
    List<String> dayList = [
      "Monday",
      "Tuesday",
      "Wednesday",
      "Thursday",
      "Friday",
      "Saturday",
      "Sunday"
    ];
    List<String> timeSlote = [
      "Morning (8-12)",
      "Afternoon (12-4)",
      "Evening (4-8)",
      "Night (8-12)"
    ];
    return Scaffold(
      appBar: counselorAppBar(backArrow: true),
      body: counselorContainer(
        child: Column(
          children: [
            counselorRichText(text1: 'Availability Preferences', text2: ''),
            hLBox,
            counselorFields(
              fieldItem: 'Preferred Days for Teaching',
              textfiled: GetBuilder<CounselorAvailabilityController>(
                id: 'update-counsAvaiableday',
                // init: CounselorAvailabilityController(),
                builder: (c) {
                  return Column(
                    children: List.generate(
                      dayList.length,
                      (index) => GestureDetector(
                        onTap: () => c.addAvaliableDay(day: dayList[index]),
                        child: checkBoxContainer(
                          item: dayList[index],
                          selected: c.availableDays.any(
                            (i) => i == dayList[index],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            counselorFields(
              fieldItem: 'Preferred Time Slots',
              textfiled: GetBuilder<CounselorAvailabilityController>(
                id: 'update-counsAvaiableTime',
                // init: CounselorAvailabilityController(),
                builder: (c) {
                  return Column(
                    children: List.generate(
                      timeSlote.length,
                      (index) => GestureDetector(
                        onTap: () => c.addAvaliableTime(time: timeSlote[index]),
                        child: checkBoxContainer(
                          item: timeSlote[index],
                          selected: c.availableTimes.any(
                            (i) => i == timeSlote[index],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            hBox,
            counselorFields(
              fieldItem: 'Additional Notes on Availability',
              textfiled: TextFormField(
                controller: controller.additionalnoteController,
                decoration:
                    infoFieldDecoration(hintText: 'Enter Current Job Title'),
                style: const TextStyle(fontSize: 13),
              ),
            ),
            hLBox,
            GetBuilder<CounselorAvailabilityController>(
                id: 'couns-availability',
                builder: (c) {
                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      actionContainer(
                        text: 'Previous',
                        textColor: mainPurple,
                        boxColor: kwhite,
                        borderColor: mainPurple,
                        onTap: () => Get.back(),
                      ),
                      wMBox,
                      actionContainer(
                        text: 'Next',
                        textColor: c.availableDays.isNotEmpty &&
                                c.availableTimes.isNotEmpty
                            ? kwhite
                            : textFieldColor,
                        boxColor: c.availableDays.isNotEmpty &&
                                c.availableTimes.isNotEmpty
                            ? mainPurple
                            : buttonColor,
                        onTap: () {
                          if (c.availableDays.isNotEmpty &&
                              c.availableTimes.isNotEmpty) {
                            Get.to(() => CounselorExpertiesPage());
                          } else {
                            // Get.showSnackbar(
                            //   const GetSnackBar(
                            //     snackStyle: SnackStyle.FLOATING,
                            //     message:
                            //         'Please select atleast one Prefered Day and Time',
                            //     margin: EdgeInsets.all(10),
                            //     backgroundColor: Colors.red,
                            //     duration: Duration(seconds: 2),
                            //   ),
                            // );
                            // Get.snackbar(
                            //   "Please select atleast one Prefered Day and Time",
                            //   '',
                            //   snackPosition: SnackPosition.TOP,
                            //   duration: const Duration(seconds: 2),
                            //   backgroundColor: kred,
                            //   colorText: Colors.white,
                            // );
                          }
                        },
                      ),
                    ],
                  );
                }),
          ],
        ),
      ),
    );
  }
}
