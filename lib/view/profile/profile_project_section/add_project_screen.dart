import 'package:aimshala/utils/common/colors_common.dart';
import 'package:aimshala/utils/common/text_common.dart';
import 'package:aimshala/utils/widgets/widgets_common.dart';
import 'package:aimshala/view/profile/common/widgets/widgets.dart';
import 'package:aimshala/view/profile/profile_home/profile_home.dart';
import 'package:aimshala/view/profile/profile_project_section/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class ProfileAddProjectScreen extends StatelessWidget {
  const ProfileAddProjectScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvoked: (didPop) =>
          Future.microtask(() => Get.off(() => const ProfileHomeScreen())),
      child: Scaffold(
        appBar: profileAppBar(title: 'Add Project', doneWidget: shrinked),
        body: Container(
          decoration: profileMainContainer(),
          child: Container(
            width: double.infinity,
            // height: 50,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
            margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
            decoration: profileSecondaryContainer(),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  profileRichText('Add', 'Project'),
                  hBox,
                  Text(
                    "Tell us about your Project",
                    style: TextStyle(fontSize: 14, color: textFieldColor),
                  ),
                  hLBox,
                  projectInfoFiled(
                    text: primarytxt3('Project Name', 9.5.sp),
                    textField: TextFormField(
                      decoration: infoFieldDecoration(
                        hintText: 'Ex: World History',
                      ),
                      maxLength: 255,
                      style: const TextStyle(fontSize: 13),
                    ),
                  ),
                  projectInfoFiled(
                    text: primarytxt3('Description', 9.5.sp),
                    textField: TextFormField(
                      decoration: infoFieldDecoration(
                        hintText: 'Enter Description',
                      ),
                      maxLength: 2000,
                      minLines: 2,
                      maxLines: null,
                      style: const TextStyle(fontSize: 13),
                    ),
                  ),
                  projectAdditional(
                    onTap: () {},
                    heading: 'Skills',
                    subText:
                        'We recommend adding your top 5 used in this experience. They’ll also appear in your Skills section.',
                    selected: Column(
                      children: List.generate(3, (index) {
                        return addedskillHomeProject();
                      }),
                    ),
                  ),
                  projectAdditional(
                    onTap: () {},
                    heading: 'Media',
                    subText:
                        'Add Documents, photos, sites, videos, and presentations.',
                    secSub: 'Learn more about media file types supported',
                    selected: Column(
                      children: List.generate(4, (index) {
                        return addedMediaHomeProject();
                      }),
                    ),
                  ),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text("Additiional Details",
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 14)),
                  ),
                  currentlyWorkingProject(),
                  projectInfoFiled(
                    text: primarytxt3('Start date', 9.5.sp),
                    textField: TextFormField(
                      decoration: infoFieldDecoration(
                          hintText: 'Date',
                          suffixWidget: SvgPicture.asset(
                              'assets/images/calendar-booked.svg',
                              colorFilter:
                                  ColorFilter.mode(kblack, BlendMode.srcIn),
                              fit: BoxFit.scaleDown)),
                      style: const TextStyle(fontSize: 13),
                    ),
                  ),
                  projectInfoFiled(
                    text: primarytxt3('End date', 9.5.sp),
                    textField: TextFormField(
                      decoration: infoFieldDecoration(
                          hintText: 'Date',
                          suffixWidget: SvgPicture.asset(
                              'assets/images/calendar-booked.svg',
                              colorFilter:
                                  ColorFilter.mode(kblack, BlendMode.srcIn),
                              fit: BoxFit.scaleDown)),
                      style: const TextStyle(fontSize: 13),
                    ),
                  ),
                  projectInfoFiled(
                    text: primarytxt3('Associated with', 9.5.sp),
                    textField: TextFormField(
                      decoration: infoFieldDecoration(
                          hintText: 'Please Select',
                          suffixWidget: const Icon(Icons.keyboard_arrow_down)),
                      style: const TextStyle(fontSize: 13),
                    ),
                  ),
                  hMBox,
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      actionContainer(
                        text: 'Cancel',
                        textColor: mainPurple,
                        boxColor: kwhite,
                        borderColor: mainPurple,
                        onTap: () => Get.back(),
                      ),
                      wMBox,
                      actionContainer(
                        text: 'Save',
                        textColor: kwhite,
                        boxColor: mainPurple,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
