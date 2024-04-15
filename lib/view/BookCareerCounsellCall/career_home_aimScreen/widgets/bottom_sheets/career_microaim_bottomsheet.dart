import 'dart:developer';

import 'package:aimshala/controllers/career_booking_controller.dart';
import 'package:aimshala/utils/common/colors_common.dart';
import 'package:aimshala/utils/widgets/widgets_common.dart';
import 'package:aimshala/view/BookCareerCounsellCall/career_home_aimScreen/widgets/career__widgets.dart';
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
      // padding: const EdgeInsets.fromLTRB(20, 20, 10, 40),
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
      child: Container(
        padding: const EdgeInsets.fromLTRB(20, 10, 10, 0),
        decoration: bottomSheetDecoration(),
        height: 53.h,
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
            SizedBox(
              // color: Colors.yellow,
              height: 29.h,
              child: Obx(() {
                return controller.searchMicorAimRes.isEmpty
                    // ? const CircularProgressIndicator(
                    //     color: Color.fromARGB(255, 188, 185, 188))
                    ? Text(
                        "No Micro aims found to your query",
                        style: TextStyle(color: textFieldColor),
                      )
                    : SingleChildScrollView(
                        child: Column(
                          children: List.generate(
                            // snapshot.data!.length,
                            controller.searchMicorAimRes.length,
                            // 20,
                            (index) {
                              final data = controller.searchMicorAimRes[index];
                              final model = MicroModel(
                                  microAim: data.categoryName.toString(),
                                  aimId: data.id.toString());
                              return Column(
                                children: [
                                  ListTile(
                                    dense: true,
                                    contentPadding: EdgeInsets.zero,
                                    title: Text(data.categoryName.toString(),
                                        style: optionText()),
                                    trailing: Checkbox(
                                      side: BorderSide.none,
                                      activeColor: mainPurple,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      value: controller.check.any((item) =>
                                          item.microAim == data.categoryName),
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
                                      // log(controller.check[index].microAim.toString(),
                                      //     name: 'adding to list');
                                      log(controller.check.toString(),
                                          name: 'adding to list');
                                    },
                                  ),
                                  const Divider(height: 4)
                                ],
                              );
                            },
                          ),
                        ),
                      );
              }),
            ),
          ],
        ),
      ),
    );
  }
}

void microaimSheetListValueChange(
    BookCareerCounsellController controller, MicroModel model) {
  if (!controller.check.any((item) => item.microAim == model.microAim)) {
    controller.check.add(model);
    log("Model added to list");
  } else {
    log("Model already exists in the list");
  }
  controller.update(['button-careerAim']);
}
