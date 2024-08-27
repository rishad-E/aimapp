import 'package:aimshala/models/profile_model/add_media_model.dart';
import 'package:aimshala/models/profile_model/profile_section_data_model.dart';
import 'package:aimshala/utils/common/widgets/colors_common.dart';
import 'package:aimshala/utils/common/widgets/text_common.dart';
import 'package:aimshala/utils/widgets/widgets_common.dart';
import 'package:aimshala/view/profile/common/widgets/texts.dart';
import 'package:aimshala/view/profile/common/widgets/widgets.dart';
import 'package:aimshala/view/profile/profile_home/widgets/profile_media_functions.dart';
import 'package:aimshala/view/profile/profile_honorsawards_section/add_honorsawards_screen.dart';
import 'package:aimshala/view/profile/profile_view_all_section/experience_section.dart';
import 'package:aimshala/view/profile/profile_view_all_section/widgets/common_widgets.dart';
import 'package:aimshala/view/profile/profile_home/profile_home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class AwardHonorSectionScreen extends StatelessWidget {
  final RxList<Award> award;
  const AwardHonorSectionScreen({super.key, required this.award});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvoked: (didPop) =>
          Future.microtask(() => Get.off(() => const ProfileHomeScreen(id: ''))),
      child: Scaffold(
        appBar: profileAppBar(title: 'Honors & awards', doneWidget: shrinked),
        body: Container(
          decoration: profileMainContainer(),
          height: double.infinity,
          width: double.infinity,
          child: Column(
            children: [
              sectionMainContainer(
                section: "Honors & awards",
                onTapAdd: () => Get.to(() => ProfileAddHonorsandAwardsScreen()),
                child: List.generate(
                  award.length,
                  (index) {
                    final data = award[index];
                    return awarSectionWidget(
                      image: "assets/images/upEvent1.png",
                      title: data.title.toString(),
                      date: formatDateRange(
                          data.startDate.toString(), data.startDate),
                      assosiated: data.associated.toString(),
                      description: data.description.toString(),
                      award: data,
                      end: index == award.length - 1,
                      onTap: () {
                        Get.to(
                            () => ProfileAddHonorsandAwardsScreen(award: data));
                      },
                    );
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

Widget awarSectionWidget({
  required String title,
  required String date,
  required String image,
  required String assosiated,
  required String description,
  required bool end,
  void Function()? onTap,
  Award? award,
}) {
  String? mediaUrl;
  List<AddMediaModel> mediaItems = profileEducationMediaFunctions(award);
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
                regularText(date, 8.2.sp),
                regularText(assosiated, 8.sp),
                regularText(description, 8.sp),
                Column(
                  children: List.generate(mediaItems.length, (index) {
                    if (award?.media != null && award?.imagePath != null) {
                      mediaUrl =
                          "http://154.26.130.161/elearning/${award?.imagePath}/${mediaItems[index].url}";
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
