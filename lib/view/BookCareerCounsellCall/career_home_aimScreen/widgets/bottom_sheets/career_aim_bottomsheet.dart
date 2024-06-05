import 'dart:developer';
import 'package:aimshala/controllers/career_booking_controller.dart';
import 'package:aimshala/utils/common/colors_common.dart';
import 'package:aimshala/utils/widgets/widgets_common.dart';
import 'package:aimshala/view/bookcareercounsellcall/career_home_aimScreen/widgets/career__widgets.dart';
import 'package:aimshala/view/bookcareercounsellcall/career_home_aimScreen/widgets/bottom_sheets/career_home_bottomsheet.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class CareerAimBottomsheet extends StatelessWidget {
  const CareerAimBottomsheet({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<BookCareerCounsellController>();
    TextEditingController searchController = TextEditingController();
    controller.searchAimOptions(query: '');
    log('career aim bottom sheet open');
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
      child: Container(
        padding: const EdgeInsets.fromLTRB(20, 10, 10, 0),
        decoration: bottomSheetDecoration(),
        height: 46.5.h,
        // height: 363,
        child: Column(
          children: [
            aimInitialWidget(
              textField: TextFormField(
                controller: searchController,
                onChanged: (query) {
                  controller.searchAimOptions(query: searchController.text);
                },
                decoration: decorTextfield(
                    prefixWidget: careerSearchIcon(leftP: 10, rightP: 0),
                    hintText: "Search"),
              ),
            ),
            hMBox,
            SizedBox(
              height: 24.h,
              child: Obx(
                () {
                  return controller.searchAimRes.isEmpty
                      // ? const CircularProgressIndicator(
                      //     color: Color.fromARGB(255, 188, 185, 188))
                      ? Text(
                          "No aims found to your query",
                          style: TextStyle(color: textFieldColor),
                        )
                      : SingleChildScrollView(
                          child: Column(
                            children: List.generate(
                              controller.searchAimRes.length,
                              (index) {
                                final data = controller.searchAimRes[index];
                                return Column(
                                  children: [
                                    ListTile(
                                      dense: true,
                                      contentPadding: EdgeInsets.zero,
                                      title: Text(data.categoryName.toString(),
                                          style: optionText()),
                                      trailing: Checkbox(
                                        side: BorderSide.none,
                                        // value: true,
                                        activeColor: mainPurple,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                        value: controller
                                                .careerAimSelectedRole.value ==
                                            data.categoryName,
                                        onChanged: (value) {
                                          if (value != null && value) {
                                            aimBottomsheetListvaluechange(
                                                controller,
                                                data.categoryName.toString());
                                          }
                                        },
                                      ),
                                      onTap: () async {
                                        aimBottomsheetListvaluechange(
                                            controller,
                                            data.categoryName.toString());
                                        controller.aimId = data.id.toString();
                                        log(data.id.toString(), name: 'id');
                                        controller.searchMicroAimOptions(
                                            query: '',
                                            parentId: data.id.toString());
                                        controller.check.clear();
                                        log(controller.check.toString(),
                                            name: 'list after aim change');
                                        controller.update(['button-careerAim']);
                                      },
                                    ),
                                    const Divider(height: 4)
                                  ],
                                );
                              },
                            ),
                          ),
                        );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

void aimBottomsheetListvaluechange(
    BookCareerCounsellController controller, String type) {
  Get.back();
  controller.aimController.text = type;
  controller.careerAimSelectedRole.value = type;
}
