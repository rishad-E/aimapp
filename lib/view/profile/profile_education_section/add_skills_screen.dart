import 'package:aimshala/controllers/profile_controller/profile_education_controller.dart';
import 'package:aimshala/models/profile_model/profile_all_data_model.dart';
import 'package:aimshala/utils/common/widgets/colors_common.dart';
import 'package:aimshala/utils/common/widgets/text_common.dart';
import 'package:aimshala/utils/widgets/widgets_common.dart';
import 'package:aimshala/view/profile/common/widgets/widgets.dart';
import 'package:aimshala/view/profile/profile_education_section/add_education_screen.dart';
import 'package:aimshala/view/profile/profile_education_section/widgets/skill_widgets.dart';
import 'package:flutter/material.dart';
import 'dart:developer';
import 'package:get/get.dart';

class AddProfileSkillsScreen extends StatelessWidget {
  final String uId;
  final Education? edu;
  const AddProfileSkillsScreen({super.key, required this.uId, this.edu});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProfileEducationController());
    List<String> skills = [
      'Health Education',
      'Health Promotion',
      'Health Policy Development',
      'Health Research',
      'Health Advocacy',
      'Health Informatics',
      'Health Economics'
    ];
    return Scaffold(
      appBar: profileAppBar(
        title: 'Skills',
        doneWidget: TextButton(
            onPressed: () =>
                Get.off(() => AddEducationScreen(uId: uId, edu: edu)),
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
                      final data = controller.addedSkill;
                      return data.isEmpty
                          ? primarytxt("Add Skills", 14)
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
                                        controller
                                            .update(['update-educationInfo']);
                                      },
                                    );
                                  },
                                ),
                                Text(
                                  "Add more...",
                                  style: TextStyle(
                                      fontSize: 16, color: textFieldColor),
                                )
                              ],
                            );
                    },
                  )),
              hMBox,
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Currently in your skill section',
                      style: TextStyle(fontSize: 11, color: textFieldColor),
                    ),
                    ListTile(
                      shape: const Border(
                          bottom: BorderSide(
                              color: Color.fromARGB(255, 202, 201, 201))),
                      contentPadding: EdgeInsets.zero,
                      title: Text(
                        "Health Assessment",
                        style: TextStyle(
                          color: kblack,
                          fontSize: 14,
                        ),
                      ),
                      trailing: Checkbox(
                        side: const BorderSide(color: Colors.grey),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6)),
                        value: false,
                        onChanged: (value) {},
                      ),
                      onTap: () {},
                    )
                  ],
                ),
              ),
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
                            'Additional Skill',
                            style:
                                TextStyle(fontSize: 11, color: textFieldColor),
                          ),
                          ...List.generate(
                            skills.length,
                            (index) => ListTile(
                              shape: const Border(
                                  bottom: BorderSide(
                                      color:
                                          Color.fromARGB(255, 202, 201, 201))),
                              contentPadding: EdgeInsets.zero,
                              title: Text(
                                skills[index],
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
                                value: controller.addedSkill
                                    .any((element) => element == skills[index]),
                                onChanged: (value) {
                                  if (value != null) {
                                    skillsAdding(skills[index], controller);
                                    c.update(['add-skill']);
                                    controller.update(['update-educationInfo']);
                                  }
                                },
                              ),
                              onTap: () {
                                skillsAdding(skills[index], controller);
                                log('added skill to list');
                                c.update(['add-skill']);
                                controller.update(['update-educationInfo']);
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
}
