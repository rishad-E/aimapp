import 'package:aimshala/models/profile_model/add_media_model.dart';
import 'package:aimshala/models/profile_model/profile_section_data_model.dart';
import 'package:aimshala/utils/common/widgets/colors_common.dart';
import 'package:aimshala/utils/common/widgets/text_common.dart';
import 'package:aimshala/utils/widgets/widgets_common.dart';
import 'package:aimshala/view/profile/common/widgets/texts.dart';
import 'package:aimshala/view/profile/common/widgets/widgets.dart';
import 'package:aimshala/view/profile/profile_home/profile_home.dart';
import 'package:aimshala/view/profile/profile_home/widgets/profile_media_functions.dart';
import 'package:aimshala/view/profile/profile_view_all_section/experience_section.dart';
import 'package:aimshala/view/profile/profile_view_all_section/widgets/common_widgets.dart';
import 'package:aimshala/view/profile/profile_volunteer_section/add_volunteer_experience_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class VolunteerSectionScreen extends StatelessWidget {
  final RxList<VolunteerExperience> volunteer;
  const VolunteerSectionScreen({super.key, required this.volunteer});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvoked: (didPop) =>
          Future.microtask(() => Get.off(() => const ProfileHomeScreen())),
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
                  onTapAdd: () =>
                      Get.to(() => ProfileAddVolunteerExperienceScreen()),
                  child: List.generate(
                    volunteer.length,
                    (index) {
                      final data = volunteer[index];
                      return volunteerSectionWidget(
                        image: "assets/images/upEvent1.png",
                        organization: data.organization.toString(),
                        role: data.role.toString(),
                        date: formatDateRange(
                            data.startDate.toString(), data.endDate),
                        cause: data.cause.toString(),
                        description: data.description.toString(),
                        volunteer: data,
                        end: volunteer.length - 1 == index,
                        onTap: () => Get.to(() =>
                            ProfileAddVolunteerExperienceScreen(
                                volunteer: data)),
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

Widget volunteerSectionWidget({
  required String image,
  required String organization,
  required String role,
  required String cause,
  required String date,
  required String description,
  required bool end,
  void Function()? onTap,
  VolunteerExperience? volunteer,
}) {
  String? mediaUrl;
  List<AddMediaModel> mediaItems = profileEducationMediaFunctions(volunteer);

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
                  text: role,
                  size: 11.sp,
                ),
                regularText(organization, 9.sp, color: kblack),
                regularText(date, 8.sp),
                regularText(cause, 8.sp),
                regularText(description, 8),
                hBox,
                Column(
                  children: List.generate(mediaItems.length, (index) {
                    if (volunteer?.media != null &&
                        volunteer?.imagePath != null) {
                      mediaUrl =
                          "http://154.26.130.161/elearning/${volunteer?.imagePath}/${mediaItems[index].url}";
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
