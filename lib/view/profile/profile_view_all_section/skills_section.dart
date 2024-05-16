import 'package:aimshala/models/profile_model/profile_all_data_model.dart';
import 'package:aimshala/utils/widgets/widgets_common.dart';
import 'package:aimshala/view/profile/common/widgets/widgets.dart';
import 'package:aimshala/view/profile/profile_view_all_section/widgets/common_widgets.dart';
import 'package:aimshala/view/profile/profile_view_all_section/widgets/skill_widget.dart';
import 'package:aimshala/view/profile/profile_home/profile_home.dart';
import 'package:aimshala/view/profile/profile_home/widgets/section_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SkillsSectionScreen extends StatelessWidget {
  final RxList<Skill> skill;
  const SkillsSectionScreen({super.key, required this.skill});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvoked: (didPop) =>
          Future.microtask(() => Get.off(() => const ProfileHomeScreen())),
      child: Scaffold(
        appBar: profileAppBar(title: 'Skills', doneWidget: shrinked),
        body: Container(
          decoration: profileMainContainer(),
          height: double.infinity,
          width: double.infinity,
          child: Column(
            children: [
              sectionMainContainer(
                  section: "Skills",
                  onTapAdd: () {},
                  child: List.generate(
                    skill.length,
                    (index) {
                      final data = skill[index];
                      return skillSectionWidget(
                        image: "assets/images/upEvent1.png",
                        company: "Business Intelligence (BI)",
                        position: data.skillName.toString(),
                        end: skill.length - 1 == index,
                      );
                    },
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
