import 'dart:developer';

import 'package:aimshala/models/profile_model/add_media_model.dart';
import 'package:aimshala/models/profile_model/profile_section_data_model.dart';
import 'package:aimshala/utils/common/widgets/colors_common.dart';
import 'package:aimshala/utils/common/widgets/text_common.dart';
import 'package:aimshala/utils/widgets/widgets_common.dart';
import 'package:aimshala/view/profile/common/widgets/texts.dart';
import 'package:aimshala/view/profile/common/widgets/widgets.dart';
import 'package:aimshala/view/profile/profile_home/widgets/profile_media_functions.dart';
import 'package:aimshala/view/profile/profile_view_all_section/widgets/common_widgets.dart';
import 'package:aimshala/view/profile/profile_education_section/add_education_screen.dart';
import 'package:aimshala/view/profile/profile_home/profile_home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class EducationSectionScreen extends StatelessWidget {
  final RxList<Education> education;
  const EducationSectionScreen({
    super.key,
    required this.education,
  });

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvoked: (didPop) =>
          Future.microtask(() => Get.off(() => const ProfileHomeScreen(id: ''))),
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
                  onTapAdd: () => Get.to(() => AddEducationScreen()),
                  child: List.generate(
                    education.length,
                    (index) {
                      final data = education[index];
                      return eduSectionWdget(
                        image: "assets/images/upEvent1.png",
                        school: data.school.toString(),
                        degree: data.degree.toString(),
                        year:
                            "${parseYear(data.startDate.toString())} - ${parseYear(data.endDate.toString())}",
                        grade: data.grade.toString(),
                        skill: data.skills.toString(),
                        description: data.description.toString(),
                        edu: data,
                        end: education.length - 1 == index,
                        onTap: () =>
                            Get.to(() => AddEducationScreen(edu: data)),
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

Widget eduSectionWdget({
  required String image,
  required String school,
  required String degree,
  required String year,
  required String grade,
  required String skill,
  required String description,
  required bool end,
  void Function()? onTap,
  Education? edu,
}) {
  String? mediaUrl;
  List<AddMediaModel> mediaItems = profileEducationMediaFunctions(edu);
  return Column(
    children: [
      Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 3.7.h,
            width: 8.w,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                    image: AssetImage(image), fit: BoxFit.cover)),
          ),
          wBox,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                semiBoldChoiceText(
                  text: school,
                  size: 11.sp,
                ),
                regularText(degree, 9.sp, color: kblack),
                regularText(year, 8.sp),
                grade.isEmpty ? shrinked : regularText("Grade: $grade", 8.sp),
                skill.isEmpty ? shrinked : regularText("Skills: $skill", 8.sp),
                description.isEmpty ? shrinked : regularText(description, 8.sp),
                Column(
                  children: List.generate(mediaItems.length, (index) {
                    if (edu?.media != null && edu?.imagePath != null) {
                      mediaUrl =
                          "http://154.26.130.161/elearning/${edu?.imagePath}/${mediaItems[index].url}";
                    }
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 2),
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(6),
                            child: SizedBox(
                              height: 6.h,
                              width: 20.w,
                              child: mediaItems[index].url != null
                                  ? Image.network(
                                      mediaUrl!,
                                      fit: BoxFit.fill,
                                      loadingBuilder:
                                          (context, child, loadingProgress) {
                                        if (loadingProgress == null) {
                                          return child;
                                        } else {
                                          return Center(
                                            child: CircularProgressIndicator(
                                              valueColor:
                                                  AlwaysStoppedAnimation(
                                                      mainPurple),
                                              strokeWidth: 1.5,
                                              value: loadingProgress
                                                          .expectedTotalBytes !=
                                                      null
                                                  ? loadingProgress
                                                          .cumulativeBytesLoaded /
                                                      loadingProgress
                                                          .expectedTotalBytes!
                                                  : null,
                                            ),
                                          );
                                        }
                                      },
                                    )
                                  : Image.asset(
                                      image,
                                      fit: BoxFit.fill,
                                    ),
                            ),
                          ),
                          wBox,
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                regularText(mediaItems[index].title, 8.sp),
                                regularText(
                                  mediaItems[index].description,
                                  8,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: onTap,
            child: Icon(
              Icons.edit,
              size: 14.sp,
              color: mainPurple,
            ),
          ),
        ],
      ),
      end ? shrinked : const Divider(thickness: 0.2)
    ],
  );
}

String parseYear(String dateString) {
  try {
    DateTime parsedDate = DateTime.parse(dateString);
    return parsedDate.year.toString();
  } catch (e) {
    log('Error parsing date: $e');
    return '';
  }
}
