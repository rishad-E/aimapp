import 'package:aimshala/models/profile_model/profile_all_data_model.dart';
import 'package:aimshala/utils/common/colors_common.dart';
import 'package:aimshala/utils/widgets/widgets_common.dart';
import 'package:aimshala/view/profile/common/widgets/widgets.dart';
import 'package:aimshala/view/profile/profile_home/profile_home.dart';
import 'package:aimshala/view/profile/profile_home/widgets/section_widgets.dart';
import 'package:aimshala/view/profile/profile_language_section/add_language_screen.dart';
import 'package:aimshala/view/profile/profile_view_all_section/widgets/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class LanguageSectionScreen extends StatelessWidget {
  final RxList<Language> language;
  final String uId;

  const LanguageSectionScreen(
      {super.key, required this.language, required this.uId});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvoked: (didPop) =>
          Future.microtask(() => Get.off(() => ProfileHomeScreen(id: uId))),
      child: Scaffold(
        appBar: profileAppBar(title: 'Language', doneWidget: shrinked),
        body: Container(
          decoration: profileMainContainer(),
          height: double.infinity,
          width: double.infinity,
          child: Column(
            children: [
              sectionMainContainer(
                  section: "Language",
                  onTapAdd: () =>
                      Get.to(() => ProfileAddLanguageScreen(uId: uId)),
                  child: List.generate(
                    language.length,
                    (index) {
                      final data = language[index];
                      return Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              languageDataWidget(
                                language: data.language.toString(),
                                level: data.proficiency.toString(),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Get.to(() => ProfileAddLanguageScreen(
                                      uId: data.userId.toString(),
                                      language: data));
                                },
                                child: Icon(
                                  Icons.edit,
                                  size: 14.sp,
                                  color: mainPurple,
                                ),
                              ),
                            ],
                          ),
                          index == language.length - 1
                              ? shrinked
                              : const Divider(thickness: 0.2)
                        ],
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
