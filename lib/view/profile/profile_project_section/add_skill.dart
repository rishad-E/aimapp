import 'dart:developer';

import 'package:aimshala/controllers/profile_controller/profile_project_controller.dart';
import 'package:aimshala/utils/common/colors_common.dart';
import 'package:aimshala/utils/common/text_common.dart';
import 'package:aimshala/utils/widgets/widgets_common.dart';
import 'package:aimshala/view/profile/common/widgets/widgets.dart';
import 'package:aimshala/view/profile/profile_project_section/add_project_screen.dart';
import 'package:aimshala/view/profile/profile_project_section/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddProjectSkillScreen extends StatelessWidget {
  final String uId;
  const AddProjectSkillScreen({super.key, required this.uId});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProfileProjectController());
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
            onPressed: () {
              Get.off(() => ProfileAddProjectScreen(
                    uId: uId,
                  ));
            },
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
                  child: Obx(() {
                    final data = controller.addedProjectSkill;
                    return data.isEmpty
                        ? primarytxt('Add Skills', 14)
                        : Wrap(
                            spacing: 5,
                            runSpacing: 4,
                            crossAxisAlignment: WrapCrossAlignment.end,
                            children: [
                              ...List.generate(
                                data.length,
                                (index) {
                                  return selectedPSkill(
                                    skill: data[index],
                                    onTap: () {
                                      data.removeAt(index);
                                      controller.update(['add-projectSkill']);
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
                  })),
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
                child: GetBuilder<ProfileProjectController>(
                    id: 'add-projectSkill',
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
                                side: const BorderSide(color: Colors.grey),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(6)),
                                value: false,
                                onChanged: (value) {
                                  if (value != null) {
                                    projectSkillsAdding(skills[index], c);
                                    c.update(['add-projectSkill']);
                                    c.update(['update-projectInfo']);
                                  }
                                },
                              ),
                              onTap: () {
                                projectSkillsAdding(skills[index], c);
                                c.update(['add-projectSkill']);
                                c.update(['update-projectInfo']);
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

void projectSkillsAdding(String skill, ProfileProjectController controller) {
  if (!controller.addedProjectSkill.contains(skill)) {
    controller.addedProjectSkill.add(skill);
    controller.update(['update-educationInfo']);
    log("skill added to list");
  } else {
    log("skill already exists in the list");
  }
  controller.update(['add-projectSkill']);
}
