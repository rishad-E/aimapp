import 'dart:developer';

import 'package:aimshala/controllers/profile_controller/profile_license_certification_controller.dart';
import 'package:aimshala/utils/common/colors_common.dart';
import 'package:aimshala/utils/common/text_common.dart';
import 'package:aimshala/utils/widgets/widgets_common.dart';
import 'package:aimshala/view/profile/common/widgets/widgets.dart';
import 'package:aimshala/view/profile/profile_license_certifications_section/add_license_certification_screen.dart';
import 'package:aimshala/view/profile/profile_license_certifications_section/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddLicenseSkillScreen extends StatelessWidget {
  final String uId;

  const AddLicenseSkillScreen({super.key, required this.uId});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProfileLicenseCertificationController());
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
                Get.off(() => AddLicenseCertificationsScreen(uId: uId)),
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
                    final data = controller.addedLicenseSkill;
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
                                  return selectedLicenseSkill(
                                    skill: data[index],
                                    onTap: () {
                                      data.removeAt(index);
                                      controller.update(['add-licenseSkill']);
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
                child: GetBuilder<ProfileLicenseCertificationController>(
                    id: 'add-licenseSkill',
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
                                value: controller.addedLicenseSkill
                                    .any((element) => element == skills[index]),
                                onChanged: (value) {
                                  if (value != null) {
                                    addLicenseSkill(skills[index], c);
                                    c.update(['add-licenseSkill']);
                                  }
                                },
                              ),
                              onTap: () {
                                addLicenseSkill(skills[index], c);
                                c.update(['add-licenseSkill']);
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

void addLicenseSkill(String skill, ProfileLicenseCertificationController c) {
  if (!c.addedLicenseSkill.contains(skill)) {
    c.addedLicenseSkill.add(skill);
    log("skill added to list");
  } else {
    log("skill already exists in the list");
  }
  c.update(['add-licenseSkill']);
}
