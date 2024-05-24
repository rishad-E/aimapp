import 'package:aimshala/models/profile_model/profile_all_data_model.dart';
import 'package:aimshala/utils/widgets/widgets_common.dart';
import 'package:aimshala/view/profile/common/widgets/widgets.dart';
import 'package:aimshala/view/profile/profile_honorsawards_section/add_honorsawards_screen.dart';
import 'package:aimshala/view/profile/profile_view_all_section/widgets/award_widget.dart';
import 'package:aimshala/view/profile/profile_view_all_section/widgets/common_widgets.dart';
import 'package:aimshala/view/profile/profile_home/profile_home.dart';
import 'package:aimshala/view/profile/profile_home/widgets/section_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AwardHonorSectionScreen extends StatelessWidget {
  final RxList<Award> award;
  final String uId;

  const AwardHonorSectionScreen(
      {super.key, required this.award, required this.uId});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvoked: (didPop) =>
          Future.microtask(() => Get.off(() => ProfileHomeScreen(id: uId))),
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
                onTapAdd: () =>
                    Get.to(() => ProfileAddHonorsandAwardsScreen(uId: uId)),
                child: List.generate(
                  award.length,
                  (index) {
                    final data = award[index];
                    return awarSectionWidget(
                      image: "assets/images/upEvent1.png",
                      title: data.title.toString(),
                      date: parseDateMonthYear(data.startDate.toString()),
                      assosiated: data.associated.toString(),
                      description: data.description.toString(),
                      end: index == award.length - 1,
                      onTap: () {
                        Get.to(() => ProfileAddHonorsandAwardsScreen(
                            uId: data.userId.toString(), award: data));
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
