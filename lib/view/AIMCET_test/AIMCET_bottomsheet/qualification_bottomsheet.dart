import 'package:aimshala/controllers/aimcet_test_controller.dart';
import 'package:aimshala/utils/common/colors_common.dart';
import 'package:aimshala/utils/widgets/widgets_common.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class QualificationBottomSheet extends StatelessWidget {
  const QualificationBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final aimcetController = Get.put(AIMCETController());
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 20, 10, 40),
      child: SizedBox(
        height: 45.h, 
        // height: 363,
        child: SingleChildScrollView(
          child: Column(
            children: [
              ListTile(
                contentPadding: const EdgeInsets.only(right: 7),
                leading: GestureDetector(
                  onTap: () => Get.back(),
                  child: SizedBox(
                      height: 30,
                      width: 30,
                      child: Image.asset('assets/images/close.png',
                          fit: BoxFit.cover)),
                ),
              ),
              ListTile(
                contentPadding: EdgeInsets.zero,
                leading: bottomHeadingQ('Tell us your Qualification...', 18,
                    FontWeight.w700, kblack),
              ),
              hMBox,
              Obx(
                () => aimcetController.qualificationList.isEmpty
                    ? const Center(
                        child: CircularProgressIndicator(
                            color: Color.fromARGB(255, 188, 185, 188)),
                      )
                    : Column(
                        children: [
                          ...List.generate(
                            aimcetController.qualificationList.length,
                            (index) {
                              final data =
                                  aimcetController.qualificationList[index];
                              return ListTile(
                                shape: const Border(
                                    bottom: BorderSide(
                                        color: Color.fromARGB(
                                            255, 202, 201, 201))),
                                contentPadding: EdgeInsets.zero,
                                title: Text(
                                  data.title.toString(),
                                  style: const TextStyle(fontSize: 14),
                                ),
                                trailing: Checkbox(
                                  side: BorderSide.none,
                                  activeColor: mainPurple,
                                  value: aimcetController.qualify.value ==
                                      data.title.toString(),
                                  onChanged: (value) {
                                    bottomSheetValueChange(aimcetController,
                                        data.title.toString());
                                  },
                                ),
                                onTap: () async {
                                  bottomSheetValueChange(
                                      aimcetController, data.title.toString());
                                  aimcetController.qualifyId =
                                      data.id.toString();
                                },
                              );
                            },
                          )
                        ],
                      ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Text bottomHeadingQ(
      String text, double size, FontWeight? fontWeight, Color? color) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: size,
        fontWeight: FontWeight.w700,
      ),
    );
  }
}

void bottomSheetValueChange(AIMCETController aimcet, String type) {
  Get.back();
  aimcet.qualify.value = type;
  aimcet.qualificationController.text = type;
  aimcet.update(['button-qualification']);
}
