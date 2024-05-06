import 'dart:developer';
import 'dart:io';

import 'package:aimshala/controllers/profile_controller/profile_honoraward_controller.dart';
import 'package:aimshala/utils/common/colors_common.dart';
import 'package:aimshala/utils/common/text_common.dart';
import 'package:aimshala/utils/widgets/widgets_common.dart';
import 'package:aimshala/view/profile/common/widgets/widgets.dart';
import 'package:aimshala/view/profile/profile_home/profile_home.dart';
import 'package:aimshala/view/profile/profile_honorsawards_section/widgets/add_media_screen.dart';
import 'package:aimshala/view/profile/profile_honorsawards_section/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class ProfileAddHonorsandAwardsScreen extends StatelessWidget {
  final String uId;
  ProfileAddHonorsandAwardsScreen({super.key, required this.uId});
  final GlobalKey<FormState> formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProfileHonorsAwardsController());
    return PopScope(
      onPopInvoked: (didPop) =>
          Future.microtask(() => Get.off(() => const ProfileHomeScreen())),
      child: Scaffold(
        appBar:
            profileAppBar(title: 'Add honors & awards', doneWidget: shrinked),
        body: Container(
          decoration: profileMainContainer(),
          child: Container(
            width: double.infinity,
            // height: 50,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
            margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
            decoration: profileSecondaryContainer(),
            child: SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    profileRichText('Add', 'Honors & awards'),
                    hBox,
                    Text(
                      "Tell us about your Honors & awards",
                      style: TextStyle(fontSize: 14, color: textFieldColor),
                    ),
                    hLBox,
                    honorsawardsInfoFiled(
                      text: primarytxt3('Title', 9.5.sp),
                      textField: TextFormField(
                        controller: controller.titileController,
                        validator: (value) => controller.filedValidation(value),
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        onChanged: (value) {
                          controller.allFieldSelect();
                          controller.update(['update-HonorAwardsbutton']);
                        },
                        decoration: infoFieldDecoration(
                          hintText: 'Ex: Retail Sales Manager',
                        ),
                        maxLength: 255,
                        style: const TextStyle(fontSize: 13),
                      ),
                    ),
                    honorsawardsInfoFiled(
                      text: primarytxt3('Associated with', 9.5.sp),
                      textField: TextFormField(
                        controller: controller.assosiatedController,
                        validator: (value) => controller.filedValidation(value),
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        onChanged: (value) {
                          controller.allFieldSelect();
                          controller.update(['update-HonorAwardsbutton']);
                        },
                        decoration: infoFieldDecoration(
                            hintText: 'Please Select',
                            suffixWidget:
                                const Icon(Icons.keyboard_arrow_down)),
                        style: const TextStyle(fontSize: 13),
                      ),
                    ),
                    honorsawardsInfoFiled(
                      text: primarytxt3('Issuer', 9.5.sp),
                      textField: TextFormField(
                        controller: controller.issuerController,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) => controller.filedValidation(value),
                        onChanged: (value) {
                          controller.allFieldSelect();
                          controller.update(['update-HonorAwardsbutton']);
                        },
                        decoration: infoFieldDecoration(
                          hintText: 'Ex: Microsoft',
                        ),
                        style: const TextStyle(fontSize: 13),
                      ),
                    ),
                    honorsawardsInfoFiled(
                      text: primarytxt3('Start Date', 9.5.sp),
                      textField: TextFormField(
                        controller: controller.startdateController,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) => controller.filedValidation(value),
                        decoration: infoFieldDecoration(
                            hintText: 'Date',
                            suffixWidget: GestureDetector(
                              onTap: () => controller.datePicker(context),
                              child: SvgPicture.asset(
                                  'assets/images/calendar-booked.svg',
                                  colorFilter:
                                      ColorFilter.mode(kblack, BlendMode.srcIn),
                                  fit: BoxFit.scaleDown),
                            )),
                        style: const TextStyle(fontSize: 13),
                      ),
                    ),
                    honorsawardsInfoFiled(
                      text: primarytxt3('Description', 9.5.sp),
                      textField: TextFormField(
                        controller: controller.descriptionController,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) => controller.filedValidation(value),
                        onChanged: (value) {
                          controller.allFieldSelect();
                          controller.update(['update-HonorAwardsbutton']);
                        },
                        decoration: infoFieldDecoration(
                          hintText: 'Enter Description',
                        ),
                        maxLength: 2000,
                        minLines: 2,
                        maxLines: null,
                        style: const TextStyle(fontSize: 13),
                      ),
                    ),
                    honorsawardsAdditional(
                        onTap: () => showMediaOptions(context, controller),
                        heading: 'Media',
                        subText:
                            'Add Documents, photos, sites, videos, and presentations.',
                        secSub: 'Learn more about media file types supported',
                        selected: Obx(() {
                          final data = controller.allAwardMedias;
                          return data.isEmpty
                              ? shrinked
                              : Column(
                                  children: List.generate(data.length, (index) {
                                    return addedMediaHomeHonorAward(
                                        data[index]!, () {
                                      data.removeAt(index);
                                      controller
                                          .update(['update-HonorAwardsbutton']);
                                      controller.allFieldSelect();
                                    });
                                  }),
                                );
                        })),
                    hMBox,
                    GetBuilder<ProfileHonorsAwardsController>(
                      id: 'update-HonorAwardsbutton',
                      builder: (c) {
                        return Row(
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
                              textColor: c.saveText.value,
                              boxColor: c.saveBG.value,
                              onTap: () {
                                if (formKey.currentState!.validate()) {
                                  log('uid=>$uId title=>${c.titileController.text} assosiated=>${c.assosiatedController.text} issuer=>${c.issuerController.text} startdate=>${c.startdateController.text} description=>${c.descriptionController.text} media=>${c.allAwardMedias}',
                                      name: 'add honor-screen');
                                  List<File> imagesList = c.allAwardMedias
                                      .where((file) => file != null)
                                      .cast<File>()
                                      .toList();
                                  c.saveHonorAwardFunction(
                                      uId: uId,
                                      titile: c.titileController.text,
                                      assosiated: c.assosiatedController.text,
                                      issuer: c.issuerController.text,
                                      startdate: c.startdateController.text,
                                      description: c.assosiatedController.text,
                                      media: imagesList);
                                }
                              },
                            ),
                          ],
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void showMediaOptions(
      BuildContext context, ProfileHonorsAwardsController controller) {
    showModalBottomSheet(
      context: context,
      builder: (_) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              honorMediaListTile(
                title: 'Add a Link',
                leading: Transform.rotate(
                  angle: -0.7,
                  child: const Icon(Icons.link),
                ),
                onTap: () {},
              ),
              honorMediaListTile(
                title: 'Upload a Photo',
                leading: SvgPicture.asset('assets/images/gallery.svg'),
                onTap: () {
                  controller.pickImageMedia().then((value) {
                    return Get.to(() =>
                        AddHonorAwardsMediaScreen(image: value, uId: uId));
                  });
                },
              ),
              honorMediaListTile(
                title: 'Take a Photo',
                leading: SvgPicture.asset('assets/images/camera.svg'),
                onTap: () {
                  controller.pickCameraMedia().then((value) {
                    return Get.to(() =>
                        AddHonorAwardsMediaScreen(image: value, uId: uId));
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
