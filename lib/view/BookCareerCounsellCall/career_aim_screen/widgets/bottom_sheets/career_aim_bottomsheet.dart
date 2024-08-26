import 'package:aimshala/controllers/career_booking_controller.dart';
import 'package:aimshala/utils/common/widgets/colors_common.dart';
import 'package:aimshala/utils/widgets/widgets_common.dart';
import 'package:aimshala/view/bookcareercounsellcall/career_aim_screen/widgets/career__widgets.dart';
import 'package:aimshala/view/bookcareercounsellcall/career_aim_screen/widgets/model/microaim_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class CareerAimBottomsheet extends StatelessWidget {
  const CareerAimBottomsheet({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<BookCareerCounsellController>();
    TextEditingController searchController = TextEditingController();
    // controller.searchAimOptions(query: '');

    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
      child: Container(
        padding: const EdgeInsets.fromLTRB(20, 10, 10, 0),
        decoration: bottomSheetDecoration(),
        height: 48.5.h,
        // height: 363,
        child: Column(
          children: [
            aimInitialWidget(
              textField: TextFormField(
                controller: searchController,
                onChanged: (query) {
                  controller.searchAims(searchController.text);
                },
                decoration: decorTextfield(
                    prefixWidget: careerSearchIcon(leftP: 10, rightP: 0),
                    hintText: "Search"),
              ),
            ),
            hMBox,
            SizedBox(
              height: 23.h,
              child: Obx(
                () {
                  return controller.isLoading.value
                      ? Center(
                          child: CircularProgressIndicator(
                              strokeWidth: 1, color: textFieldColor),
                        )
                      : controller.searchAimRes.isEmpty
                          ? Text(
                              "No aims found to your query",
                              style: TextStyle(color: textFieldColor),
                            )
                          : ListView.builder(
                              itemCount: controller.filteredAims.length,
                              itemBuilder: (context, index) {
                                final data = controller.filteredAims[index];
                                final model = MicroModel(
                                  microAim: data.name.toString(),
                                  aimId: data.id.toString(),
                                );
                                return Column(
                                  children: [
                                    ListTile(
                                      dense: true,
                                      contentPadding: EdgeInsets.zero,
                                      title: Text(data.name.toString(),
                                          style: optionText()),
                                      trailing: Checkbox(
                                        side: BorderSide.none,
                                        activeColor: mainPurple,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                        value: controller.check.any((item) =>
                                            item.microAim == data.name),
                                        onChanged: (value) {
                                          if (value != null && value) {
                                            aimBottomsheetListvaluechange(
                                                controller, model);
                                          }
                                        },
                                      ),
                                      onTap: () async {
                                        aimBottomsheetListvaluechange(
                                            controller, model);
                                      },
                                    ),
                                    const Divider(height: 4)
                                  ],
                                );
                              },
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
    BookCareerCounsellController controller, MicroModel model) {
  if (controller.check.length > 2) {
    Get.showSnackbar(
      const GetSnackBar(
        snackStyle: SnackStyle.FLOATING,
        message: 'You can only select 3 Aims',
        borderRadius: 4,
        margin: EdgeInsets.all(10),
        backgroundColor: Colors.red,
        duration: Duration(seconds: 2),
      ),
    );
  } else {
    if (!controller.check.any((item) => item.microAim == model.microAim)) {
      controller.check.add(model);
      // log("Model added to list");
    } else {
      controller.check.removeWhere((item) => item.microAim == model.microAim);
      // log("Model already exists in the list");
    }
  }
  // Get.back();
  controller.update(['button-careerAim']);
}

