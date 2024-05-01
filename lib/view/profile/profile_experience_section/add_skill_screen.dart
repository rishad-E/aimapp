import 'dart:developer';

import 'package:aimshala/controllers/profile_controller/experience_controller.dart';
import 'package:aimshala/utils/common/colors_common.dart';
import 'package:aimshala/utils/common/text_common.dart';
import 'package:aimshala/utils/widgets/widgets_common.dart';
import 'package:aimshala/view/profile/common/widgets/widgets.dart';
import 'package:aimshala/view/profile/profile_experience_section/add_experience_screen.dart';
import 'package:aimshala/view/profile/profile_experience_section/widgets/experience_skill_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddExperienceSkillScreen extends StatelessWidget {
  final String uId;
  const AddExperienceSkillScreen({super.key, required this.uId});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProfileExperienceController());
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
            onPressed: () => Get.off(() => AddExperienceScreen(uId: uId,)),
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
                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                child: Obx(
                  () {
                    final data = controller.addedSkillEX;
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
                                  return selectedSkillEX(
                                    skill: data[index],
                                    onTap: () {
                                      data.removeAt(index);
                                      controller.update(['skill-experience']);
                                      controller.updateSaveButtonEX();
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
                ),
              ),
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
                child: GetBuilder<ProfileExperienceController>(
                    id: 'skill-experience',
                    builder: (c) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Additional Skill',
                            style: TextStyle(fontSize: 11, color: textFieldColor),
                          ),
                          ...List.generate(
                            skills.length,
                            (index) => ListTile(
                              shape: const Border(
                                  bottom: BorderSide(
                                      color: Color.fromARGB(255, 202, 201, 201))),
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
                                value: c.addedSkillEX
                                    .any((element) => element == skills[index]),
                                onChanged: (value) {
                                  if (value != null) {
                                    addSkilsExperience(skills[index], c);
                                    c.update(['skill-experience']);
                                  }
                                },
                              ),
                              onTap: () {
                                addSkilsExperience(skills[index], c);
                                c.update(['skill-experience']);
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

  void addSkilsExperience(
      String skill, ProfileExperienceController controller) {
    if (!controller.addedSkillEX.contains(skill)) {
      controller.addedSkillEX.add(skill);
      log("skill added to list", name: 'EX');
    } else {
      log("skill already exists in the list", name: 'EX');
    }
  }
}
