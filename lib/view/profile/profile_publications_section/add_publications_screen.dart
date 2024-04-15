import 'package:aimshala/utils/common/colors_common.dart';
import 'package:aimshala/utils/common/text_common.dart';
import 'package:aimshala/utils/widgets/widgets_common.dart';
import 'package:aimshala/view/profile/common/widgets/widgets.dart';
import 'package:aimshala/view/profile/profile_home/profile_home.dart';
import 'package:aimshala/view/profile/profile_publications_section/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class ProfileAddPublicationScreen extends StatelessWidget {
  const ProfileAddPublicationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvoked: (didPop) =>
          Future.microtask(() => Get.off(() => const ProfileHomeScreen())),
      child: Scaffold(
        appBar:
            profileAppBar(title: 'Add Publications', doneWidget: shrinked),
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
                  profileRichText('Add', 'Publications'),
                  hBox,
                  Text(
                    "Tell us about your Publications",
                    style: TextStyle(fontSize: 14, color: textFieldColor),
                  ),
                  hLBox,
                  publicationsInfoFiled(
                    text: primarytxt3('Title', 9.5.sp),
                    textField: TextFormField(
                      decoration: infoFieldDecoration(
                        hintText: 'Ex: Giving and receiving feedback',
                      ),
                    
                      style: const TextStyle(fontSize: 13),
                    ),
                  ),
                  publicationsInfoFiled(
                    text: primarytxt3('Publication/Publisher', 9.5.sp),
                    textField: TextFormField(
                      decoration: infoFieldDecoration(
                          hintText: 'Ex: Harvard Business Review',
                          suffixWidget: const Icon(Icons.keyboard_arrow_down)),
                      style: const TextStyle(fontSize: 13),
                    ),
                  ),
                  publicationsInfoFiled(
                    text: primarytxt3('Publication date', 9.5.sp),
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
                  publicationsInfoFiled(
                    text: primarytxt3('Publication URL', 9.5.sp),
                    textField: TextFormField(
                      decoration: infoFieldDecoration(
                        hintText: 'Enter Publication URL',
                      ),
                      style: const TextStyle(fontSize: 13),
                    ),
                  ),
                  publicationsInfoFiled(
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
