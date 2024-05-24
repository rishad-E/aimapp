import 'dart:developer';

import 'package:aimshala/controllers/profile_controller/profile_contact_info_controller.dart';
import 'package:aimshala/utils/common/colors_common.dart';
import 'package:aimshala/utils/common/text_common.dart';
import 'package:aimshala/utils/widgets/widgets_common.dart';
import 'package:aimshala/view/profile/common/widgets/widgets.dart';
import 'package:aimshala/view/profile/profile_contact_info/widgets/city_bottom_sheet.dart';
import 'package:aimshala/view/profile/profile_contact_info/widgets/state_bottom_sheet.dart';
import 'package:aimshala/view/profile/profile_contact_info/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class ProfileContactInfoScreen extends StatelessWidget {
  final String id;
  final String? userName;
  ProfileContactInfoScreen({super.key, required this.id, this.userName});
  final GlobalKey<FormState> formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UpdateContactInfo());
    return Scaffold(
      appBar: profileAppBar(title: 'Profile', doneWidget: shrinked),
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
                  profileRichText('Contact', 'Info'),
                  hBox,
                  Text(
                    "Tell us about your Contact Info",
                    style: TextStyle(fontSize: 14, color: textFieldColor),
                  ),
                  hLBox,
                  contactInfoFiled(
                    text: primarytxt3('Mobile Number', 9.5.sp),
                    textField: TextFormField(
                      controller: controller.mobController,
                      validator: (value) => controller.fieldValidator(value),
                      onChanged: (value) {
                        controller.allFieldSelect();
                        controller.update(['update-contactInfo']);
                      },
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      keyboardType: TextInputType.phone,
                      style: const TextStyle(fontSize: 12),
                      decoration: infoFieldDecoration(
                        hintText: '9729665668',
                        prefix: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const SizedBox(width: 8),
                            Text(
                              '+91',
                              style: TextStyle(
                                  fontSize: 14, color: kblack.withOpacity(0.4)),
                            ),
                            Icon(
                              Icons.keyboard_arrow_down,
                              size: 26,
                              color: kblack.withOpacity(0.4),
                            ),
                            wBox
                          ],
                        ),
                      ),
                    ),
                  ),
                  contactInfoFiled(
                    text: primarytxt3('Username', 9.5.sp),
                    textField: TextFormField(
                      controller: controller.usernameController
                        ..text = userName.toString(),
                      validator: (value) => controller.fieldValidator(value),
                      onChanged: (value) {
                        controller.allFieldSelect();
                        controller.update(['update-contactInfo']);
                      },
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      style: const TextStyle(fontSize: 12),
                      decoration: infoFieldDecoration(
                          hintText: 'johndoe123',
                          fill: userName != null ? true : false),
                    ),
                  ),
                  contactInfoFiled(
                    text: primarytxt3('Email', 9.5.sp),
                    textField: TextFormField(
                      controller: controller.emailController,
                      validator: (value) => controller.fieldValidator(value),
                      onChanged: (value) {
                        controller.allFieldSelect();
                        controller.update(['update-contactInfo']);
                      },
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      keyboardType: TextInputType.emailAddress,
                      style: const TextStyle(fontSize: 12),
                      decoration:
                          infoFieldDecoration(hintText: 'johndoe@gmail.com'),
                    ),
                  ),
                  contactInfoFiled(
                    text: primarytxt3('Address', 9.5.sp),
                    textField: TextFormField(
                      controller: controller.addressController,
                      validator: (value) => controller.fieldValidator(value),
                      onChanged: (value) {
                        controller.allFieldSelect();
                        controller.update(['update-contactInfo']);
                      },
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      style: const TextStyle(fontSize: 12),
                      decoration: infoFieldDecoration(
                          hintText: 'Ex: D-79, Block D, Sector 48 '),
                    ),
                  ),
                  contactInfoFiled(
                    text: primarytxt3('State', 9.5.sp),
                    textField: GestureDetector(
                      onTap: () {
                        log('ontap');
                        showStateBottomsheet(context);
                      },
                      child: AbsorbPointer(
                        child: TextFormField(
                          readOnly: true,
                          controller: controller.stateController,
                          validator: (value) =>
                              controller.fieldValidator(value),
                          onChanged: (value) {
                            controller.allFieldSelect();
                            controller.update(['update-contactInfo']);
                          },
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          style: const TextStyle(fontSize: 12),
                          decoration: infoFieldDecoration(
                            hintText: 'Please Select',
                            suffixWidget: Icon(Icons.keyboard_arrow_down,
                                size: 26, color: kblack),
                          ),
                        ),
                      ),
                    ),
                  ),
                  contactInfoFiled(
                    text: primarytxt3('City', 9.5.sp),
                    textField: GestureDetector(
                      onTap: () => showCityBottomsheet(context),
                      child: AbsorbPointer(
                        child: TextFormField(
                          controller: controller.cityController,
                          readOnly: true,
                          validator: (value) =>
                              controller.fieldValidator(value),
                          onChanged: (value) {
                            controller.allFieldSelect();
                            controller.update(['update-contactInfo']);
                          },
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          style: const TextStyle(fontSize: 12),
                          decoration: infoFieldDecoration(
                            hintText: 'Please Select',
                            suffixWidget: Icon(Icons.keyboard_arrow_down,
                                size: 26, color: kblack),
                          ),
                        ),
                      ),
                    ),
                  ),
                  hBox,
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Social Media",
                      style: TextStyle(
                          color: kpurple,
                          fontSize: 11.sp,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  contactInfoFiled(
                    text: primarytxt3('Facebook', 9.5.sp),
                    textField: TextFormField(
                      controller: controller.facebookController,
                      validator: (value) => controller.fieldValidator(value),
                      onChanged: (value) {
                        controller.allFieldSelect();
                        controller.update(['update-contactInfo']);
                      },
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      style: const TextStyle(fontSize: 12),
                      decoration: infoFieldDecoration(hintText: 'Facebook URL'),
                    ),
                  ),
                  contactInfoFiled(
                    text: primarytxt3('Instagram', 9.5.sp),
                    textField: TextFormField(
                      controller: controller.instagramController,
                      validator: (value) => controller.fieldValidator(value),
                      onChanged: (value) {
                        controller.allFieldSelect();
                        controller.update(['update-contactInfo']);
                      },
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      style: const TextStyle(fontSize: 12),
                      decoration:
                          infoFieldDecoration(hintText: 'Instegram URL'),
                    ),
                  ),
                  contactInfoFiled(
                    text: primarytxt3('Twitter', 9.5.sp),
                    textField: TextFormField(
                      controller: controller.twitterController,
                      validator: (value) => controller.fieldValidator(value),
                      onChanged: (value) {
                        controller.allFieldSelect();
                        controller.update(['update-contactInfo']);
                      },
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      style: const TextStyle(fontSize: 12),
                      decoration: infoFieldDecoration(hintText: 'Twitter URL'),
                    ),
                  ),
                  hLBox,
                  GetBuilder<UpdateContactInfo>(
                    id: 'update-contactInfo',
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
                                log('validate');
                                c.saveContactInfoFunction(
                                    uId: id.toString(),
                                    userName: userName.toString(),
                                    mobNumber: c.mobController.text,
                                    email: c.emailController.text,
                                    address: c.addressController.text,
                                    city: c.cityController.text,
                                    state: c.stateController.text,
                                    facebook: c.facebookController.text,
                                    instagram: c.instagramController.text,
                                    twitter: c.twitterController.text);
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
    );
  }

  void showStateBottomsheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return const StateBottomSheetClass();
      },
    );
  }

  void showCityBottomsheet(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return const CityBottomSheetClass();
        });
  }
}
