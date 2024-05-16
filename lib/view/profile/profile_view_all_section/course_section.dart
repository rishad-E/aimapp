import 'package:aimshala/models/profile_model/profile_all_data_model.dart';
import 'package:aimshala/utils/widgets/widgets_common.dart';
import 'package:aimshala/view/profile/common/widgets/widgets.dart';
import 'package:aimshala/view/profile/profile_add_course_info/add_course_info_screen.dart';
import 'package:aimshala/view/profile/profile_view_all_section/widgets/common_widgets.dart';
import 'package:aimshala/view/profile/profile_view_all_section/widgets/course_widget.dart';
import 'package:aimshala/view/profile/profile_home/profile_home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CoursesSectionScreen extends StatelessWidget {
  final RxList<Course> course;
  const CoursesSectionScreen({super.key, required this.course});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvoked: (didPop) =>
          Future.microtask(() => Get.off(() => const ProfileHomeScreen())),
      child: Scaffold(
        appBar: profileAppBar(title: 'Courses', doneWidget: shrinked),
        body: Container(
          decoration: profileMainContainer(),
          height: double.infinity,
          width: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              children: [
                sectionMainContainer(
                  section: "Courses",
                  onTapAdd: () {},
                  child: List.generate(
                    course.length,
                    (index) {
                      final data = course[index];
                      return courseSectionWidget(
                        image: "assets/images/upEvent1.png",
                        course: data.courseName.toString(),
                        courseNo: data.courseNumber.toString(),
                        associated: data.associatedWith.toString(),
                        end: course.length - 1 == index,
                        onTap: () => Get.to(
                          () => ProfileAddCourseScreen(
                              uId: data.userId.toString(), course: data),
                        ),
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
