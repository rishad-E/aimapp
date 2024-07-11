import 'dart:developer';

import 'package:aimshala/controllers/profile_controller/profile_experience_controller.dart';
import 'package:aimshala/models/profile_model/profile_section_data_model.dart';
import 'package:aimshala/utils/common/widgets/colors_common.dart';
import 'package:aimshala/utils/widgets/widgets_common.dart';
import 'package:aimshala/view/profile/common/widgets/widgets.dart';
import 'package:aimshala/view/profile/profile_experience_section/add_experience_screen.dart';
import 'package:aimshala/view/profile/profile_experience_section/widgets/experience_skill_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class AddExperienceSkillScreen extends StatelessWidget {
  final String uId;
  final Experience? ex;
  const AddExperienceSkillScreen({super.key, required this.uId, this.ex});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ProfileExperienceController>();
    final skillController = TextEditingController();

    return Scaffold(
      appBar: profileAppBar(
        title: 'Skills',
        doneWidget: TextButton(
            onPressed: () =>
                Get.off(() => AddExperienceScreen(uId: uId, experience: ex)),
            child: const Text(
              'Done',
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
            )),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
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
                padding:
                    const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                child: Obx(
                  () {
                    final data = controller.addedSkillEX;
                    return data.isEmpty
                        ? skillTextField(
                            controller: skillController,
                            onFieldSubmitted: (value) {
                              if (value.isNotEmpty) {
                                addSkilsExperience(
                                    skillController.text, controller);
                              }
                              skillController.clear();
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
                                  return selectedSkillEX(
                                    skill: data[index],
                                    onTap: () {
                                      data.removeAt(index);
                                      controller.update(['skill-experience']);
                                    },
                                  );
                                },
                              ),
                              IntrinsicWidth(
                                child: SizedBox(
                                    height: 3.5.h,
                                    child: skillTextField(
                                      controller: skillController,
                                      onFieldSubmitted: (value) {
                                        if (value.isNotEmpty) {
                                          addSkilsExperience(
                                              skillController.text, controller);
                                        }
                                        skillController.clear();
                                      },
                                    )),
                              )
                            ],
                          );
                  },
                ),
              ),
              hMBox,
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                width: double.infinity,
                child: GetBuilder<ProfileExperienceController>(
                    id: 'skill-experience',
                    builder: (c) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Suggested Skills',
                            style:
                                TextStyle(fontSize: 11, color: textFieldColor),
                          ),
                          ...List.generate(
                            c.suggestedSkill.length,
                            (index) {
                              final data = c.suggestedSkill[index];
                              return ListTile(
                                shape: const Border(
                                    bottom: BorderSide(
                                        color: Color.fromARGB(
                                            255, 202, 201, 201))),
                                contentPadding: EdgeInsets.zero,
                                title: Text(
                                  data,
                                  style: TextStyle(
                                    color: kblack,
                                    fontSize: 14,
                                  ),
                                ),
                                trailing: Checkbox(
                                  side: const BorderSide(color: Colors.grey),
                                  activeColor: mainPurple,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(6)),
                                  value: c.addedSkillEX
                                      .any((element) => element == data),
                                  onChanged: (value) {
                                    if (value != null) {
                                      addSkilsExperience(data, c);
                                    }
                                  },
                                ),
                                onTap: () {
                                  addSkilsExperience(data, c);
                                },
                              );
                            },
                          )
                        ],
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void addSkilsExperience(
      String skill, ProfileExperienceController controller) {
    if (!controller.addedSkillEX.contains(skill)) {
      controller.addedSkillEX.add(skill);
      log("skill added to list", name: 'EX');
    } else {
      controller.addedSkillEX.remove(skill);
    }
    controller.update(['skill-experience']);
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
