import 'dart:developer';

import 'package:aimshala/controllers/career_booking_controller.dart';
import 'package:aimshala/models/career_aim_model/micro_aim_model.dart';
import 'package:aimshala/utils/common/colors_common.dart';
import 'package:aimshala/view/Book_career_counsell/widgets/career__widgets.dart';
import 'package:aimshala/view/Book_career_counsell/widgets/career_home_bottomsheet.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CareerMicroAimBottomsheet extends StatelessWidget {
  const CareerMicroAimBottomsheet({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<BookCareerCounsellController>();
    log('career microaim bottom sheet open');
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 20, 10, 40),
      child: SizedBox(
        // height: 37.h,
        height: 450,
        child: FutureBuilder<List<SubCategory>?>(
            future: controller.getMicroAimOptions(
                aimId: controller.aimId.toString()),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return aimInitialWidget();
              }
              return SingleChildScrollView(
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
                            overlayColor:
                                MaterialStateProperty.resolveWith<Color?>(
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
                          'Select your Aim', 18, FontWeight.w700, kblack),
                    ),
                    ...List.generate(
                      snapshot.data!.length,
                    
                      (index) {
                        final data = snapshot.data![index];
                        return ListTile(
                          shape: const Border(
                              bottom: BorderSide(
                                  color: Color.fromARGB(255, 202, 201, 201))),
                          contentPadding: EdgeInsets.zero,
                          title: Text(data.categoryName.toString(),
                              style: optionText()),
                          trailing: Checkbox(
                            side: BorderSide.none,
                            value: controller.check.contains(data.categoryName),
                            onChanged: (value) {
                              if (value != null && value) {
                                microaimSheetListValueChange(
                                    controller, data.categoryName.toString());
                              }
                            },
                          ),
                          onTap: () {
                            microaimSheetListValueChange(
                                controller, data.categoryName.toString());

                            log(controller.check.toString(),
                                name: 'adding to list');
                          },
                        );
                      },
                    )
                  ],
                ),
              );
            }),
      ),
    );
  }
}

void microaimSheetListValueChange(
    BookCareerCounsellController controller, String type) {
  Get.back();
  // controller.careerMicroAimSelectedRole = type;
  controller.check.add(type);
  controller.update(['button-careerAim']);
}
