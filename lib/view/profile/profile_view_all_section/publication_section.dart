import 'package:aimshala/models/profile_model/profile_section_data_model.dart';
import 'package:aimshala/utils/common/widgets/colors_common.dart';
import 'package:aimshala/utils/common/widgets/text_common.dart';
import 'package:aimshala/utils/widgets/widgets_common.dart';
import 'package:aimshala/view/profile/common/widgets/texts.dart';
import 'package:aimshala/view/profile/common/widgets/widgets.dart';
import 'package:aimshala/view/profile/profile_publications_section/add_publications_screen.dart';
import 'package:aimshala/view/profile/profile_view_all_section/widgets/common_widgets.dart';
import 'package:aimshala/view/profile/profile_home/profile_home.dart';
import 'package:aimshala/view/profile/profile_home/widgets/section_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class PublicationsSectionScreen extends StatelessWidget {
  final RxList<Publication> publication;
  const PublicationsSectionScreen({super.key, required this.publication});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvoked: (didPop) =>
          Future.microtask(() => Get.off(() => const ProfileHomeScreen())),
      child: Scaffold(
        appBar: profileAppBar(title: 'Publications', doneWidget: shrinked),
        body: Container(
          decoration: profileMainContainer(),
          height: double.infinity,
          width: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              children: [
                sectionMainContainer(
                    section: "Publications",
                    onTapAdd: () => Get.to(() => ProfileAddPublicationScreen()),
                    child: List.generate(
                      publication.length,
                      (index) {
                        final data = publication[index];
                        return publicationSectionWidget(
                          image: "assets/images/upEvent1.png",
                          title: data.title.toString(),
                          publication: "${data.publication} - Fulltime",
                          year: parseDateMonthYear(
                              data.publicationDate.toString()),
                          description: data.description.toString(),
                          end: publication.length - 1 == index,
                          onTap: () {
                            Get.to(() =>
                                ProfileAddPublicationScreen(publication: data));
                          },
                        );
                      },
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget publicationSectionWidget({
  required String image,
  required String title,
  required String publication,
  required String year,
  required String description,
  required bool end,
  void Function()? onTap,
}) {
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
                regularText(publication, 9.sp, color: kblack),
                regularText(year, 8.sp),
                regularText(description, 8),
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
