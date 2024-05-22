import 'package:aimshala/models/profile_model/profile_all_data_model.dart';
import 'package:aimshala/utils/widgets/widgets_common.dart';
import 'package:aimshala/view/profile/common/widgets/widgets.dart';
import 'package:aimshala/view/profile/profile_experience_section/add_experience_screen.dart';
import 'package:aimshala/view/profile/profile_view_all_section/widgets/common_widgets.dart';
import 'package:aimshala/view/profile/profile_home/profile_home.dart';
import 'package:aimshala/view/profile/profile_home/widgets/section_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ExperienceSectionScreen extends StatelessWidget {
  final RxList<Experience> experience;
  const ExperienceSectionScreen({super.key, required this.experience});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvoked: (didPop) =>
          Future.microtask(() => Get.off(() => const ProfileHomeScreen())),
      child: Scaffold(
        appBar: profileAppBar(title: 'Experience', doneWidget: shrinked),
        body: Container(
          decoration: profileMainContainer(),
          height: double.infinity,
          width: double.infinity,
          child: Column(
            children: [
              sectionMainContainer(
                section: "Experience",
                onTapAdd: () {},
                child: List.generate(
                  experience.length,
                  (index) {
                    final data = experience[index];
                    return edexlipbSectionWidget(
                        image: "assets/images/upEvent1.png",
                        school: data.employmentType.toString(),
                        degree: data.companyName.toString(),
                        year: data.endDate == null
                            ? "${parseDateMonthYear(data.startDate.toString())}- on-going"
                            : "${parseDateMonthYear(data.startDate.toString())}-${parseDateMonthYear(data.endDate.toString())}",
                        grade: "${data.locationType},${data.location}",
                        skill: "Skills: ${data.skills}",
                        description: data.description.toString(),
                        end: experience.length - 1 == index,
                        onTap: () => Get.to(() => AddExperienceScreen(
                            uId: data.userId.toString(), experience: data)));
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
