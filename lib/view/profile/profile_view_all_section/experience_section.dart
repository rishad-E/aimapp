import 'dart:developer';

import 'package:aimshala/models/profile_model/add_media_model.dart';
import 'package:aimshala/models/profile_model/profile_section_data_model.dart';
import 'package:aimshala/utils/common/widgets/colors_common.dart';
import 'package:aimshala/utils/common/widgets/text_common.dart';
import 'package:aimshala/utils/widgets/widgets_common.dart';
import 'package:aimshala/view/profile/common/widgets/texts.dart';
import 'package:aimshala/view/profile/common/widgets/widgets.dart';
import 'package:aimshala/view/profile/profile_experience_section/add_experience_screen.dart';
import 'package:aimshala/view/profile/profile_home/widgets/profile_media_functions.dart';
import 'package:aimshala/view/profile/profile_view_all_section/widgets/common_widgets.dart';
import 'package:aimshala/view/profile/profile_home/profile_home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';

class ExperienceSectionScreen extends StatelessWidget {
  final RxList<Experience> experience;
  const ExperienceSectionScreen({
    super.key,
    required this.experience,
  });

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvoked: (didPop) => Future.microtask(
          () => Get.off(() => const ProfileHomeScreen())),
      child: Scaffold(
        appBar: profileAppBar(title: 'Experience', doneWidget: shrinked),
        body: Container(
          decoration: profileMainContainer(),
          height: double.infinity,
          width: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              children: [
                sectionMainContainer(
                  section: "Experience",
                  onTapAdd: () => Get.to(() => AddExperienceScreen()),
                  child: List.generate(
                    experience.length,
                    (index) {
                      final data = experience[index];
                      return exSectionWidget(
                          image: "assets/images/upEvent1.png",
                          title: data.title.toString(),
                          company:
                              "${data.companyName} · ${data.employmentType}",
                          year: formatDateRange(data.startDate.toString(),
                              data.endDate.toString()),
                          location: "${data.locationType},${data.location}",
                          skill: "Skills: ${data.skills}",
                          description: data.description.toString(),
                          experience: data,
                          end: experience.length - 1 == index,
                          onTap: () => Get.to(
                              () => AddExperienceScreen(experience: data)));
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

Widget exSectionWidget({
  required String image,
  required String title,
  required String company,
  required String year,
  required String location,
  required String skill,
  required String description,
  required bool end,
  void Function()? onTap,
  Experience? experience,
}) {
  String? mediaUrl;
  List<AddMediaModel> mediaItems = profileEducationMediaFunctions(experience);
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
                  text: title,
                  size: 11.sp,
                ),
                regularText(company, 9.sp, color: kblack),
                regularText(year, 8.sp),
                regularText(location, 8.sp),
                skill.isEmpty ? shrinked : regularText("Skills: $skill", 8.sp),
                regularText(description, 8.sp),
                Column(
                  children: List.generate(mediaItems.length, (index) {
                    if (experience?.media != null &&
                        experience?.imagePath != null) {
                      mediaUrl =
                          "http://154.26.130.161/elearning/${experience?.imagePath}/${mediaItems[index].url}";
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

String formatDateRange(String startDate, String? endDate) {
  try {
    DateTime start = DateTime.parse(startDate);
    DateTime end;
    bool isCurrentlyWorking = false;

    if (endDate == null || endDate.isEmpty || endDate == "currently_working") {
      end = DateTime.now();
      isCurrentlyWorking = true;
    } else {
      end = DateTime.parse(endDate);
    }

    DateFormat formatter = DateFormat('MMM yyyy');

    String startFormatted = formatter.format(start);
    String endFormatted =
        isCurrentlyWorking ? 'present' : formatter.format(end);

    int years = end.year - start.year;
    int months = end.month - start.month;

    if (months < 0) {
      years--;
      months += 12;
    }

    return '$startFormatted - $endFormatted · $years yrs $months mos';
  } catch (e) {
    log('Error parsing dates: $e');
    return '';
  }
}
