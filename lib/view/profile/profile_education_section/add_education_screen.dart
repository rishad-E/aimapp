import 'dart:developer';

import 'package:aimshala/controllers/profile_controller/education_controller.dart';
import 'package:aimshala/utils/common/colors_common.dart';
import 'package:aimshala/utils/common/text_common.dart';
import 'package:aimshala/utils/widgets/widgets_common.dart';
import 'package:aimshala/view/profile/common/widgets/widgets.dart';
import 'package:aimshala/view/profile/profile_education_section/add_media_screen.dart';
import 'package:aimshala/view/profile/profile_education_section/add_skills_screen.dart';
import 'package:aimshala/view/profile/profile_education_section/widgets/widgets.dart';
import 'package:aimshala/view/profile/profile_home/profile_home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class AddEducationScreen extends StatelessWidget {
  const AddEducationScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProfileEducationController());
    return PopScope(
      onPopInvoked: (didPop) =>
          Future.microtask(() => Get.off(() => const ProfileHomeScreen())),
      child: Scaffold(
        appBar: profileAppBar(title: 'Add Education', doneWidget: shrinked),
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
                  profileRichText('Add', 'Education'),
                  hBox,
                  Text(
                    "Tell us about your Education",
                    style: TextStyle(fontSize: 14, color: textFieldColor),
                  ),
                  hLBox,
                  educationInfoFiled(
                    text: primarytxt3('School', 9.5.sp),
                    textField: TextFormField(
                      decoration: infoFieldDecoration(
                        hintText: 'Ex: Boston University',
                      ),
                      maxLength: 150,
                      style: const TextStyle(fontSize: 13),
                    ),
                  ),
                  educationInfoFiled(
                    text: primarytxt3('Degree', 9.5.sp),
                    textField: TextFormField(
                      decoration:
                          infoFieldDecoration(hintText: 'Ex: Bachelor’s'),
                      maxLength: 150,
                      style: const TextStyle(fontSize: 13),
                    ),
                  ),
                  educationInfoFiled(
                    text: primarytxt3('Field of study', 9.5.sp),
                    textField: TextFormField(
                      decoration: infoFieldDecoration(hintText: 'Ex: Business'),
                      maxLength: 150,
                      style: const TextStyle(fontSize: 13),
                    ),
                  ),
                  educationInfoFiled(
                    text: primarytxt3('Start date', 9.5.sp),
                    textField: TextFormField(
                      readOnly: true,
                      controller: controller.startdateController,
                      decoration: infoFieldDecoration(
                        hintText: 'Date',
                        suffixWidget: GestureDetector(
                          onTap: () =>
                              controller.datePicker(context, start: true),
                          child: SvgPicture.asset(
                              'assets/images/calendar-booked.svg',
                              colorFilter:
                                  ColorFilter.mode(kblack, BlendMode.srcIn),
                              fit: BoxFit.scaleDown),
                        ),
                      ),
                      style: const TextStyle(fontSize: 13, height: 1.7),
                    ),
                  ),
                  educationInfoFiled(
                    text: primarytxt3('End date (or expected)', 9.5.sp),
                    textField: TextFormField(
                      controller: controller.endDateController,
                      readOnly: true,
                      decoration: infoFieldDecoration(
                        hintText: 'Date',
                        suffixWidget: GestureDetector(
                          onTap: () => controller.datePicker(context),
                          child: SvgPicture.asset(
                              'assets/images/calendar-booked.svg',
                              colorFilter:
                                  ColorFilter.mode(kblack, BlendMode.srcIn),
                              fit: BoxFit.scaleDown),
                        ),
                      ),
                      style: const TextStyle(fontSize: 13, height: 1.7),
                    ),
                  ),
                  educationInfoFiled(
                    text: primarytxt3('Grade', 9.5.sp),
                    textField: TextFormField(
                      decoration: infoFieldDecoration(hintText: 'Enter Grade'),
                      maxLength: 80,
                      style: const TextStyle(fontSize: 13),
                    ),
                  ),
                  educationInfoFiled(
                    text: primarytxt3('Activities and societies', 9.5.sp),
                    textField: TextFormField(
                      decoration: infoFieldDecoration(
                          hintText: 'Enter Activities and societies'),
                      maxLength: 500,
                      style: const TextStyle(fontSize: 13),
                    ),
                  ),
                  educationInfoFiled(
                    text: primarytxt3('Description', 9.5.sp),
                    textField: TextFormField(
                      decoration:
                          infoFieldDecoration(hintText: 'Enter Description'),
                      maxLength: 1000,
                      minLines: 3,
                      maxLines: null,
                      style: const TextStyle(fontSize: 13),
                    ),
                  ),
                  educationAdditional(
                    onTap: () {
                      log("add skill on tap");
                      Get.to(() => const AddProfileSkillsScreen());
                    },
                    heading: 'Skills',
                    subText:
                        'We recommend adding your top 5 used in this experience. They’ll also appear in your Skills section.',
                    selected: Obx(() => controller.addedSkill.isEmpty
                        ? const SizedBox.shrink()
                        : Column(
                            children: List.generate(
                                controller.addedSkill.length, (index) {
                              final data = controller.addedSkill;
                              return addedskillHome(data[index]);
                            }),
                          )),
                  ),
                  educationAdditional(
                    onTap: () {
                      log("add Media on tap");
                      showMediaOptions(context, controller);
                    },
                    heading: 'Media',
                    subText:
                        'Add Documents, photos, sites, videos, and presentations.',
                    secSub: 'Learn more about media file types supported',
                    selected: Obx(() => controller.allMedias.isEmpty
                        ? const SizedBox.shrink()
                        : Column(
                            children: List.generate(controller.allMedias.length,
                                (index) {
                              final data = controller.allMedias;
                              return addedMediaHome(data[index]!);
                            }),
                          )),
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
                        textColor: textFieldColor,
                        boxColor: buttonColor,
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

  void showMediaOptions(
      BuildContext context, ProfileEducationController controller) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              mediaListTile(
                title: 'Add a Link',
                leading: Transform.rotate(
                  angle: -0.7,
                  child: const Icon(Icons.link),
                ),
                onTap: () {},
              ),
              mediaListTile(
                title: 'Upload a Photo',
                leading: SvgPicture.asset('assets/images/gallery.svg'),
                onTap: () {
                  controller.pickImageMedia().then((value) {
                    return Get.to(
                      () => AddProfileMediaScreen(image: value),
                    );
                  });
                },
              ),
              mediaListTile(
                title: 'Take a Photo',
                leading: SvgPicture.asset('assets/images/camera.svg'),
                onTap: () {
                  controller.pickCameraMedia().then((value) {
                    return Get.to(() => AddProfileMediaScreen(image: value));
                  });
                },
              ),
            ],
          ),
        );
      },
    );
  }
}







  // Future<void> datePicker(BuildContext context, {bool? start}) async {
  //   final DateTime? picker = await showDatePicker(
  //     context: context,
  //     initialDate: dateTime,
  //     firstDate: DateTime(2000),
  //     lastDate: DateTime(2050),
  //     builder: (BuildContext context, Widget? child) {
  //       return Theme(
  //         data: ThemeData.dark().copyWith(
  //           colorScheme: const ColorScheme.dark(
  //             primary: Colors.purple, // Header background color
  //             onPrimary: Colors.white, // Header text color
  //             //   surface: Colors.grey.shade300, // Calendar background color
  //             //   onSurface: Colors.black, // Calendar text color
  //           ),

  //           dialogBackgroundColor: Colors.white, // Dialog background color
  //         ),
  //         child: child!,
  //       );
  //     },
  //   );
  //   if (picker != null && picker != dateTime) {
  //     if (start == true) {
  //       startdateController.text = picker.toString().split(" ")[0];
  //     } else {
  //       endDateController.text = picker.toString().split(" ")[0];
  //     }
  //   }
  // }