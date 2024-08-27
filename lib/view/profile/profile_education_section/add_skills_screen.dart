import 'package:aimshala/controllers/profile_controller/profile_education_controller.dart';
import 'package:aimshala/models/profile_model/profile_section_data_model.dart';
import 'package:aimshala/utils/common/widgets/colors_common.dart';
import 'package:aimshala/utils/widgets/widgets_common.dart';
import 'package:aimshala/view/profile/common/widgets/widgets.dart';
import 'package:aimshala/view/profile/profile_education_section/add_education_screen.dart';
import 'package:aimshala/view/profile/profile_education_section/widgets/skill_widgets.dart';
import 'package:flutter/material.dart';
import 'dart:developer';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class AddProfileSkillsScreen extends StatelessWidget {
  final Education? edu;
  const AddProfileSkillsScreen({super.key, this.edu});

  @override
  Widget build(BuildContext context) {
    // final controller = Get.put(ProfileEducationController());
    final skillController = TextEditingController();
    final controller = Get.find<ProfileEducationController>();

    return Scaffold(
      appBar: profileAppBar(
        title: 'Skills',
        doneWidget: TextButton(
            onPressed: () => Get.off(() => AddEducationScreen(edu: edu)),
            child: const Text(
              'Done',
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
            )),
      ),
      body: SizedBox(
        // color: Colors.yellow,
        height: double.infinity,
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            if (skillController.text.isNotEmpty) {
              skillsAdding(skillController.text, controller);
              skillController.clear();
            }
          },
          child: Padding(
            padding: const EdgeInsets.only(top: 20),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        border: Border(
                          top: BorderSide(
                              color: textFieldColor.withOpacity(0.3), width: 1),
                          bottom: BorderSide(
                              color: textFieldColor.withOpacity(0.3), width: 1),
                        ),
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 14, vertical: 10),
                      child: Obx(
                        () {
                          final data = controller.addedSkill;
                          return data.isEmpty
                              ? skillTextField(
                                  controller: skillController,
                                  onFieldSubmitted: (value) {
                                    if (value.isNotEmpty) {
                                      skillsAdding(
                                          skillController.text, controller);
                                      skillController.clear();
                                    }
                                  },
                                )
                              : Wrap(
                                  spacing: 5,
                                  runSpacing: 4,
                                  crossAxisAlignment: WrapCrossAlignment.end,
                                  children: [
                                    ...List.generate(
                                      data.length,
                                      (index) {
                                        return selectedSkill(
                                          skill: data[index],
                                          onTap: () {
                                            data.removeAt(index);
                                            controller.update(['add-skill']);
                                            controller.updateSaveButton();
                                            controller.update(
                                                ['update-educationInfo']);
                                          },
                                        );
                                      },
                                    ),
                                    IntrinsicWidth(
                                        child: SizedBox(
                                      // color: Colors.yellow,
                                      height: 3.5.h,
                                      child: skillTextField(
                                        controller: skillController,
                                        onFieldSubmitted: (value) {
                                          if (value.isNotEmpty) {
                                            skillsAdding(skillController.text,
                                                controller);
                                            skillController.clear();
                                          }
                                        },
                                      ),
                                    ))
                                  ],
                                );
                        },
                      )),
                  hMBox,
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    width: double.infinity,
                    child: GetBuilder<ProfileEducationController>(
                        id: 'add-skill',
                        builder: (c) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Suggested Skills',
                                style: TextStyle(
                                    fontSize: 11, color: textFieldColor),
                              ),
                              ...List.generate(
                                c.suggestedSkill.length,
                                (index) => ListTile(
                                  shape: const Border(
                                      bottom: BorderSide(
                                          color: Color.fromARGB(
                                              255, 202, 201, 201))),
                                  contentPadding: EdgeInsets.zero,
                                  title: Text(
                                    c.suggestedSkill[index],
                                    style: TextStyle(
                                      color: kblack,
                                      fontSize: 14,
                                    ),
                                  ),
                                  trailing: Checkbox(
                                    activeColor: mainPurple,
                                    side: const BorderSide(color: Colors.grey),
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(6)),
                                    value: controller.addedSkill.any(
                                        (element) =>
                                            element == c.suggestedSkill[index]),
                                    onChanged: (value) {
                                      if (value != null) {
                                        skillsAdding(c.suggestedSkill[index],
                                            controller);
                                      }
                                    },
                                  ),
                                  onTap: () {
                                    skillsAdding(
                                        c.suggestedSkill[index], controller);
                                  },
                                ),
                              )
                            ],
                          );
                        }),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget skillTextField(
      {void Function(String)? onFieldSubmitted,
      TextEditingController? controller}) {
    return TextFormField(
      controller: controller,
      style: const TextStyle(fontSize: 13),
      cursorColor: mainPurple,
      cursorWidth: 1.5,
      onFieldSubmitted: onFieldSubmitted,
      decoration: const InputDecoration(
          isDense: true,
          border: InputBorder.none,
          hintText: 'Add more...',
          hintStyle: TextStyle(
            color: Color.fromARGB(255, 116, 118, 119),
            fontSize: 12,
          )),
    );
  }
}

void skillsAdding(String skill, ProfileEducationController controller) {
  if (!controller.addedSkill.contains(skill)) {
    controller.addedSkill.add(skill);
    controller.update(['update-educationInfo']);
    log("skill added to list");
  } else {
    controller.addedSkill.remove(skill);
    log("skill already exists in the list");
  }
  controller.update(['add-skill']);
  controller.update(['update-educationInfo']);
}
