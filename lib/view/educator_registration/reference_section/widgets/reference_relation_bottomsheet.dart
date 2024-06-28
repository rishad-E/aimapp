import 'package:aimshala/controllers/educator_controllers/educator_reference_controller.dart';
import 'package:aimshala/utils/common/widgets/colors_common.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReferenceRelationBottomSheet extends StatelessWidget {
  final String reference;
  const ReferenceRelationBottomSheet({super.key, required this.reference});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<EducatorReferenceController>();
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
                'Select Relation',
                style: TextStyle(
                  color: kblack,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Column(
              children: List.generate(
                controller.relationList.length,
                (index) {
                  final data = controller.relationList[index];
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
                      value: reference == '1'
                          ? controller.relationController1.text == data.name
                          : controller.relationController2.text == data.name,
                      onChanged: (value) {
                        if (value != null && value) {
                          if (reference == '1') {
                            controller.relationController1.text =
                                data.name.toString();
                            controller.otherRelation1.value =
                                data.name.toString();
                            controller.checkAlFields();
                          } else {
                            controller.relationController2.text =
                                data.name.toString();
                            controller.otherRelation2.value =
                                data.name.toString();
                            controller.checkAlFields();
                          }
                          Get.back();
                        }
                      },
                    ),
                    onTap: () {
                      if (reference == '1') {
                        controller.relationController1.text =
                            data.name.toString();
                        controller.otherRelation1.value = data.name.toString();
                        controller.checkAlFields();
                      } else {
                        controller.relationController2.text =
                            data.name.toString();
                        controller.otherRelation2.value = data.name.toString();
                        controller.checkAlFields();
                      }
                      Get.back();
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
}
