import 'package:aimshala/models/profile_model/profile_section_data_model.dart';
import 'package:aimshala/utils/widgets/widgets_common.dart';
import 'package:aimshala/view/profile/common/widgets/widgets.dart';
import 'package:aimshala/view/profile/profile_project_section/add_project_screen.dart';
import 'package:aimshala/view/profile/profile_view_all_section/widgets/common_widgets.dart';
import 'package:aimshala/view/profile/profile_view_all_section/widgets/project_widget.dart';
import 'package:aimshala/view/profile/profile_home/profile_home.dart';
import 'package:aimshala/view/profile/profile_home/widgets/section_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProjectSectionScreen extends StatelessWidget {
  final RxList<Project> project;
  final String uId;
  const ProjectSectionScreen(
      {super.key, required this.project, required this.uId});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvoked: (didPop) =>
          Future.microtask(() => Get.off(() => ProfileHomeScreen(id: uId))),
      child: Scaffold(
        appBar: profileAppBar(title: 'Projects', doneWidget: shrinked),
        body: Container(
          decoration: profileMainContainer(),
          height: double.infinity,
          width: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              children: [
                sectionMainContainer(
                  section: "Projects",
                  onTapAdd: () =>
                      Get.to(() => ProfileAddProjectScreen(uId: uId)),
                  child: List.generate(
                    project.length,
                    (index) {
                      final data = project[index];
                      return projectSectionWidget(
                        image: "assets/images/upEvent1.png",
                        title: data.title.toString(),
                        date: parseDateMonthYear(data.startDate.toString()),
                        assosiated: data.associated.toString(),
                        description: data.description.toString(),
                        skills: "Skills: ${data.skills.toString()}",
                        end: index == project.length - 1,
                        onTap: () {
                          
                          Get.to(() => ProfileAddProjectScreen(
                              uId: data.userId.toString(), project: data));
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
