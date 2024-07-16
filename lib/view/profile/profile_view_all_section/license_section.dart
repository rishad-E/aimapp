import 'package:aimshala/models/profile_model/add_media_model.dart';
import 'package:aimshala/models/profile_model/profile_section_data_model.dart';
import 'package:aimshala/utils/common/widgets/colors_common.dart';
import 'package:aimshala/utils/common/widgets/text_common.dart';
import 'package:aimshala/utils/widgets/widgets_common.dart';
import 'package:aimshala/view/profile/common/widgets/texts.dart';
import 'package:aimshala/view/profile/common/widgets/widgets.dart';
import 'package:aimshala/view/profile/profile_home/widgets/profile_media_functions.dart';
import 'package:aimshala/view/profile/profile_license_certifications_section/add_license_certification_screen.dart';
import 'package:aimshala/view/profile/profile_view_all_section/experience_section.dart';
import 'package:aimshala/view/profile/profile_view_all_section/widgets/common_widgets.dart';
import 'package:aimshala/view/profile/profile_home/profile_home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class LicenseSectionScreen extends StatelessWidget {
  final RxList<License> license;
  final String uId;

  const LicenseSectionScreen(
      {super.key, required this.license, required this.uId});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvoked: (didPop) =>
          Future.microtask(() => Get.off(() => ProfileHomeScreen(id: uId))),
      child: Scaffold(
        appBar: profileAppBar(
            title: 'Licenses & Certifications', doneWidget: shrinked),
        body: Container(
          decoration: profileMainContainer(),
          height: double.infinity,
          width: double.infinity,
          child: Column(
            children: [
              sectionMainContainer(
                  section: "Licenses & Certifications",
                  onTapAdd: () =>
                      Get.to(() => AddLicenseCertificationsScreen(uId: uId)),
                  child: List.generate(
                    license.length,
                    (index) {
                      final data = license[index];
                      return licenseSectionWidget(
                        image: "assets/images/upEvent1.png",
                        school: data.name.toString(),
                        organization: data.organization.toString(),
                        year: formatDateRange(
                            data.issueDate.toString(), data.expireDate),
                        skill: data.skills.toString(),
                        license: data,
                        end: license.length - 1 == index,
                        onTap: () {
                          Get.to(() => AddLicenseCertificationsScreen(
                              uId: data.userId.toString(), license: data));
                        },
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

Widget licenseSectionWidget({
  required String image,
  required String school,
  required String organization,
  required String year,
  required String skill,
  required bool end,
  void Function()? onTap,
  License? license,
}) {
  String? mediaUrl;
  List<AddMediaModel> mediaItems = profileEducationMediaFunctions(license);
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
                regularText(organization, 9.sp, color: kblack),
                regularText(year, 8.sp),
                skill.isEmpty ? shrinked : regularText("Skills: $skill", 8.sp),
                Column(
                  children: List.generate(mediaItems.length, (index) {
                    if (license?.media != null && license?.imagePath != null) {
                      mediaUrl =
                          "http://154.26.130.161/elearning/${license?.imagePath}/${mediaItems[index].url}";
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
