import 'package:aimshala/models/profile_model/profile_all_data_model.dart';
import 'package:aimshala/utils/widgets/widgets_common.dart';
import 'package:aimshala/view/profile/common/widgets/widgets.dart';
import 'package:aimshala/view/profile/profile_home/profile_home.dart';
import 'package:aimshala/view/profile/profile_home/widgets/section_widgets.dart';
import 'package:aimshala/view/profile/profile_view_all_section/widgets/common_widgets.dart';
import 'package:aimshala/view/profile/profile_volunteer_info/add_volunteer_experience_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VolunteerSectionScreen extends StatelessWidget {
  final RxList<VolunteerExperience> volunteer;
  final String uId;

  const VolunteerSectionScreen(
      {super.key, required this.volunteer, required this.uId});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvoked: (didPop) =>
          Future.microtask(() => Get.off(() => ProfileHomeScreen(id: uId))),
      child: Scaffold(
        appBar:
            profileAppBar(title: 'volunteer experiences', doneWidget: shrinked),
        body: Container(
          decoration: profileMainContainer(),
          height: double.infinity,
          width: double.infinity,
          child: Column(
            children: [
              sectionMainContainer(
                  section: "volunteer experiences",
                  onTapAdd: () => Get.to(
                      () => ProfileAddVolunteerExperienceScreen(uId: uId)),
                  child: List.generate(
                    volunteer.length,
                    (index) {
                      final data = volunteer[index];
                      return edexlipbSectionWidget(
                        image: "assets/images/upEvent1.png",
                        school: data.organization.toString(),
                        degree: data.role.toString(),
                        year: data.endDate == "currently_working"
                            ? "${parseDateMonthYear(data.startDate.toString())}- ongoing"
                            : "${parseDateMonthYear(data.startDate.toString())}-${parseDateMonthYear(data.endDate.toString())}",
                        grade: "Education",
                        skill: "Skills: ",
                        description: data.description.toString(),
                        end: volunteer.length - 1 == index,
                        onTap: () => Get.to(() =>
                            ProfileAddVolunteerExperienceScreen(
                                uId: data.userId.toString(), volunteer: data)),
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
