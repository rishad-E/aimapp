import 'package:aimshala/models/profile_model/profile_section_data_model.dart';
import 'package:aimshala/utils/widgets/widgets_common.dart';
import 'package:aimshala/view/profile/common/widgets/widgets.dart';
import 'package:aimshala/view/profile/profile_view_all_section/widgets/common_widgets.dart';
import 'package:aimshala/view/profile/profile_education_section/add_education_screen.dart';
import 'package:aimshala/view/profile/profile_home/profile_home.dart';
import 'package:aimshala/view/profile/profile_home/widgets/section_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EducationSectionScreen extends StatelessWidget {
  final RxList<Education> education;
  final String uId;
  const EducationSectionScreen(
      {super.key, required this.education, required this.uId});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvoked: (didPop) =>
          Future.microtask(() => Get.off(() => ProfileHomeScreen(id: uId))),
      child: Scaffold(
        appBar: profileAppBar(title: 'Education', doneWidget: shrinked),
        body: Container(
          decoration: profileMainContainer(),
          height: double.infinity,
          width: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              children: [
                sectionMainContainer(
                  section: "Education",
                  onTapAdd: () => Get.to(() => AddEducationScreen(uId: uId)),
                  child: List.generate(
                    education.length,
                    (index) {
                      final data = education[index];
                      return edexlipbSectionWidget(
                        image: "assets/images/upEvent1.png",
                        school: data.school.toString(),
                        degree: data.degree.toString(),
                        year:
                            "${yearFormatter(data.startDate.toString())}-${yearFormatter(data.endDate.toString())}",
                        grade: data.grade.toString(),
                        skill: "Skills: ${data.skills.toString()}",
                        description: data.description.toString(),
                        end: education.length - 1 == index,
                        onTap: () {
                          Get.to(() => AddEducationScreen(
                              uId: data.userId.toString(), edu: data));
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
