import 'package:aimshala/models/profile_model/profile_all_data_model.dart';
import 'package:aimshala/utils/widgets/widgets_common.dart';
import 'package:aimshala/view/profile/common/widgets/widgets.dart';
import 'package:aimshala/view/profile/profile_license_certifications_section/add_license_certification_screen.dart';
import 'package:aimshala/view/profile/profile_view_all_section/widgets/common_widgets.dart';
import 'package:aimshala/view/profile/profile_home/profile_home.dart';
import 'package:aimshala/view/profile/profile_home/widgets/section_widgets.dart';
import 'package:aimshala/view/profile/profile_home/widgets/texts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
                      return edexlipbSectionWidget(
                        image: "assets/images/upEvent1.png",
                        school: data.name.toString(),
                        degree: data.organization.toString(),
                        year:
                            "${parseDateMonthYear(data.issueDate.toString())}-${parseDateMonthYear(data.expireDate.toString())}",
                        grade: "Education",
                        skill: "Skills: ${data.skills}",
                        description: edSubText,
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
