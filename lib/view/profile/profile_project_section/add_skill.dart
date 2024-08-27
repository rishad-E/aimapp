import 'package:aimshala/controllers/profile_controller/profile_project_controller.dart';
import 'package:aimshala/models/profile_model/profile_section_data_model.dart';
import 'package:aimshala/utils/common/widgets/colors_common.dart';
import 'package:aimshala/utils/widgets/widgets_common.dart';
import 'package:aimshala/view/profile/common/widgets/widgets.dart';
import 'package:aimshala/view/profile/profile_project_section/add_project_screen.dart';
import 'package:aimshala/view/profile/profile_project_section/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class AddProjectSkillScreen extends StatelessWidget {
  final Project? project;
  const AddProjectSkillScreen({super.key, this.project});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ProfileProjectController>();
    final skillController = TextEditingController();
    return Scaffold(
      appBar: profileAppBar(
        title: 'Skills',
        doneWidget: TextButton(
            onPressed: () {
              Get.off(() => ProfileAddProjectScreen(project: project));
            },
            child: const Text(
              'Done',
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
            )),
      ),
      body: SizedBox(
        height: double.infinity,
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            if (skillController.text.isNotEmpty) {
              projectSkillsAdding(skillController.text, controller);
              skillController.clear();
            }
          },
          child: Padding(
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
                      padding: const EdgeInsets.symmetric(
                          horizontal: 14, vertical: 10),
                      child: Obx(() {
                        final data = controller.addedProjectSkill;
                        return data.isEmpty
                            ? skillTextField(
                                controller: skillController,
                                onFieldSubmitted: (value) {
                                  if (value.isNotEmpty) {
                                    projectSkillsAdding(
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
                                      return selectedPSkill(
                                        skill: data[index],
                                        onTap: () {
                                          data.removeAt(index);
                                          controller
                                              .update(['add-projectSkill']);
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
                                            projectSkillsAdding(
                                                skillController.text,
                                                controller);
                                            skillController.clear();
                                          }
                                        },
                                      ),
                                    ),
                                  )
                                ],
                              );
                      })),
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
                                'Suggested Skills',
                                style: TextStyle(
                                    fontSize: 11, color: textFieldColor),
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
                                      activeColor: mainPurple,
                                      side:
                                          const BorderSide(color: Colors.grey),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(6)),
                                      value: c.addedProjectSkill
                                          .any((i) => i == data),
                                      onChanged: (value) {
                                        if (value != null) {
                                          projectSkillsAdding(data, c);
                                        }
                                      },
                                    ),
                                    onTap: () {
                                      projectSkillsAdding(data, c);
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

void projectSkillsAdding(String skill, ProfileProjectController controller) {
  if (!controller.addedProjectSkill.contains(skill)) {
    controller.addedProjectSkill.add(skill);
  } else {
    controller.addedProjectSkill.remove(skill);
  }
  controller.update(['update-educationInfo']);
  controller.update(['add-projectSkill']);
}
