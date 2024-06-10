import 'dart:developer';

import 'package:aimshala/controllers/mentor_controllers/mentor_reference_controller.dart';
import 'package:aimshala/utils/common/colors_common.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MentorOtherRelationBottomsheet extends StatelessWidget {
  final String ref;
  const MentorOtherRelationBottomsheet({super.key, required this.ref});

  @override
  Widget build(BuildContext context) {
    final c = Get.find<MentorReferencesController>();
    List<String> relationList = [
      "Professional Colleague",
      "Supervisor/Manager",
      "Teacher/Professor",
      "Mentor",
      "Co-Worker",
      "Client/Customer",
      "Friend",
      "Family",
      "Other(Please Specify)",
    ];
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
                relationList.length,
                (index) {
                  return ListTile(
                    shape: const Border(
                        bottom: BorderSide(
                            color: Color.fromARGB(255, 202, 201, 201))),
                    contentPadding: EdgeInsets.zero,
                    title: Text(
                      relationList[index],
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
                      value: ref == '1'
                          ? c.relationController1.text == relationList[index]
                          : c.relationController2.text == relationList[index],
                      onChanged: (value) {
                        if (value != null && value) {
                          if (ref == '1') {
                            c.relationController1.text = relationList[index];
                            c.otherRelation1.value = relationList[index];
                            log(c.otherRelation1.value);
                            c.checkAlFields();
                            c.update(['mentor-reference']);
                          } else {
                            c.relationController2.text = relationList[index];
                            c.otherRelation2.value = relationList[index];
                            log(c.otherRelation2.value);
                            c.checkAlFields();
                            c.update(['mentor-reference']);
                          }
                          Get.back();
                        }
                      },
                    ),
                    onTap: () {
                      if (ref == '1') {
                        c.relationController1.text = relationList[index];
                        c.otherRelation1.value = relationList[index];
                        log(c.otherRelation1.value);
                        // c.checkAlFields();
                        // c.update(['edu-referenceInfo']);
                      } else {
                        c.relationController2.text = relationList[index];
                        c.otherRelation2.value = relationList[index];
                        log(c.otherRelation2.value);
                        // c.checkAlFields();
                        // c.update(['edu-referenceInfo']);
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
