import 'package:aimshala/controllers/profile_controller/profile_publications_controller.dart';
import 'package:aimshala/models/profile_model/profile_all_data_model.dart';
import 'package:aimshala/utils/widgets/widgets_common.dart';
import 'package:aimshala/view/profile/common/widgets/widgets.dart';
import 'package:aimshala/view/profile/profile_publications_section/add_publications_screen.dart';
import 'package:aimshala/view/profile/profile_view_all_section/widgets/common_widgets.dart';
import 'package:aimshala/view/profile/profile_home/profile_home.dart';
import 'package:aimshala/view/profile/profile_home/widgets/section_widgets.dart';
import 'package:aimshala/view/profile/profile_home/widgets/texts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PublicationsSectionScreen extends StatelessWidget {
  final RxList<Publication> publication;
  final String uId;

  const PublicationsSectionScreen(
      {super.key, required this.publication, required this.uId});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvoked: (didPop) =>
          Future.microtask(() => Get.off(() => ProfileHomeScreen(id: uId))),
      child: Scaffold(
        appBar: profileAppBar(title: 'Publications', doneWidget: shrinked),
        body: Container(
          decoration: profileMainContainer(),
          height: double.infinity,
          width: double.infinity,
          child: Column(
            children: [
              sectionMainContainer(
                  section: "Publications",
                  onTapAdd: () =>
                      Get.to(() => ProfileAddPublicationScreen(uId: uId)),
                  child: List.generate(
                    publication.length,
                    (index) {
                      final data = publication[index];
                      return edexlipbSectionWidget(
                        image: "assets/images/upEvent1.png",
                        school: data.title.toString(),
                        degree: data.publication.toString(),
                        year:
                            parseDateMonthYear(data.publicationDate.toString()),
                        grade: "Education",
                        skill: "Skills: Coach, Training",
                        description: edSubText,
                        end: publication.length - 1 == index,
                        onTap: () {
                          Get.to(() => ProfileAddPublicationScreen(
                              uId: data.userId.toString(), publication: data));
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
