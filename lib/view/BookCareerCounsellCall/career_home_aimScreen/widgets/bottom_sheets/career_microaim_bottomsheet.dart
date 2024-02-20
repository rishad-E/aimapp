import 'dart:developer';

import 'package:aimshala/controllers/career_booking_controller.dart';
import 'package:aimshala/utils/widgets/widgets_common.dart';
import 'package:aimshala/view/BookCareerCounsellCall/career_home_aimScreen/widgets/career__widgets.dart';
import 'package:aimshala/view/BookCareerCounsellCall/career_home_aimScreen/widgets/career_colors.dart';
import 'package:aimshala/view/BookCareerCounsellCall/career_home_aimScreen/widgets/bottom_sheets/career_home_bottomsheet.dart';
import 'package:aimshala/view/BookCareerCounsellCall/career_home_aimScreen/widgets/model/microaim_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class CareerMicroAimBottomsheet extends StatelessWidget {
  const CareerMicroAimBottomsheet({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<BookCareerCounsellController>();
    TextEditingController searchmicroController = TextEditingController();
    log('career microaim bottom sheet open');
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 20, 10, 40),
      child: SizedBox(
        // height: 37.h,
        height: 53.h,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              aimInitialWidget(
                textField: TextFormField(
                  controller: searchmicroController,
                  onChanged: (query) {
                    controller.searchMicroAimOptions(
                        query: searchmicroController.text,
                        parentId: controller.aimId.toString());
                  },
                  decoration: decorTextfield(
                      prefixWidget: const Icon(Icons.search, size: 25),
                      hintText: "Search"),
                ),
              ),
              hMBox,
              Obx(() {
                return controller.searchMicorAimRes.isEmpty
                    // ? const CircularProgressIndicator(
                    //     color: Color.fromARGB(255, 188, 185, 188))
                    ? Text(
                        "No Micro aims found to your query",
                        style: TextStyle(color: textFieldColor),
                      )
                    : Column(
                        children: [
                          ...List.generate(
                            // snapshot.data!.length,
                            controller.searchMicorAimRes.length,
                            // 20,
                            (index) {
                              final data = controller.searchMicorAimRes[index];
                              final model = MicroModel(
                                  microAim: data.categoryName.toString(),
                                  aimId: data.id.toString());
                              return ListTile(
                                shape: const Border(
                                    bottom: BorderSide(
                                        color: Color.fromARGB(
                                            255, 202, 201, 201))),
                                contentPadding: EdgeInsets.zero,
                                title: Text(data.categoryName.toString(),
                                    style: optionText()),
                                trailing: Checkbox(
                                  side: BorderSide.none,
                                  value: controller.check.any((item) => item.microAim == data.categoryName),
                                  onChanged: (value) {
                                    if (value != null && value) {
                                      microaimSheetListValueChange(
                                          controller, model);
                                    }
                                  },
                                ),
                                onTap: () {
                                  microaimSheetListValueChange(
                                      controller, model);
                                  log(controller.check.toString(),
                                      name: 'adding to list');
                                },
                              );
                            },
                          )
                        ],
                      );
              }),
            ],
          ),
        ),
      ),
    );
  }
}

void microaimSheetListValueChange(
    BookCareerCounsellController controller, MicroModel model) {
  if (!controller.check.contains(model)) {
    controller.check.add(model);
  }
  controller.update(['button-careerAim']);
}
