import 'package:aimshala/controllers/aimcet_test_controller.dart';
import 'package:aimshala/utils/common/colors_common.dart';
import 'package:aimshala/utils/widgets/widgets_common.dart';
import 'package:aimshala/view/AIMCET_test/Personality-Report/personality_report_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PersonalityContainer extends StatelessWidget {
  final String userName;
  const PersonalityContainer({super.key, required this.userName});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AIMCETController());
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color.fromARGB(255, 230, 228, 228)),
      ),
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
      // height: 50,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 22),
      child: Column(
        children: [
          Container(
            height: 425,
            width: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/personalitybg.png'),
                fit: BoxFit.fill,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 25, left: 50, right: 50),
              child: Column(
                children: [
                  Text(
                    "PERSONALITY REPORT",
                    style: TextStyle(
                      fontSize: 16,
                      color: kwhite,
                    ),
                  ),
                  Text(
                    "You're a ${controller.personality[0]}",
                    style: TextStyle(
                        color: kwhite,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "You're a unique blend of artistic and investigative types.",
                    style: TextStyle(
                      fontSize: 12,
                      color: kwhite,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    'For $userName',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: kwhite,
                    ),
                  ),
                ],
              ),
            ),
          ),
          hLBox,
          Text(
            "Learn what makes you unique and how you compare to the rest of the world.",
            style: TextStyle(color: textFieldColor),
          ),
          hMBox,
          Obx(
            () => controller.gp.value == 'wait'
                ? Text(
                    "REPORT is processing",
                    style: TextStyle(
                        color: mainPurple,
                        fontWeight: FontWeight.w600,
                        fontSize: 16),
                  )
                : controller.gp.value == "sucess"
                    ? GestureDetector(
                        onTap: () {
                          Get.to(() => PersonalityReportPage(userName: userName));
                          // log(controller.gp.value,name: 'gp');
                        },
                        child: Row(
                          children: [
                            Text(
                              "VIEW REPORT",
                              style: TextStyle(
                                  color: mainPurple,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16),
                            ),
                            Icon(
                              Icons.arrow_forward,
                              color: mainPurple,
                              size: 19,
                            )
                          ],
                        ),
                      )
                    : Text(
                        "REPORT Fetch failed...",
                        style: TextStyle(
                          color: textFieldColor,
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                        ),
                      ),
          )
        ],
      ),
    );
  }
}
