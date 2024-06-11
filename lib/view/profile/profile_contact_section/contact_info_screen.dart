import 'dart:developer';

import 'package:aimshala/controllers/profile_controller/profile_contact_info_controller.dart';
import 'package:aimshala/models/UserModel/user_model.dart';
import 'package:aimshala/utils/common/widgets/colors_common.dart';
import 'package:aimshala/utils/common/widgets/text_common.dart';
import 'package:aimshala/utils/widgets/widgets_common.dart';
import 'package:aimshala/view/profile/common/widgets/widgets.dart';
import 'package:aimshala/view/profile/profile_contact_section/widgets/city_bottom_sheet.dart';
import 'package:aimshala/view/profile/profile_contact_section/widgets/country_bottomsheet.dart';
import 'package:aimshala/view/profile/profile_contact_section/widgets/state_bottom_sheet.dart';
import 'package:aimshala/view/profile/profile_contact_section/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class ProfileContactInfoScreen extends StatelessWidget {
  final String id;
  final User? user;
  ProfileContactInfoScreen({super.key, required this.id, this.user});
  final GlobalKey<FormState> formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UpdateContactInfo());
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      if (user != null) {
        controller.mobController.text = user?.phone as String;
        controller.usernameController.text = user?.username as String;
        controller.emailController.text = user?.email as String;
        controller.addressController.text = user?.address as String;
        controller.pincodeController.text = user?.zip as String;
        controller.stateController.text = user?.state as String;
        controller.cityController.text = user?.city as String;
        controller.countryController.text = user?.country as String;
        controller.facebookController.text = user?.facebook as String;
        controller.instagramController.text = user?.instagram as String;
        controller.twitterController.text = user?.twitter as String;
        controller.allFieldSelect();
        controller.update(['update-contactInfo']);
      }
      log('call back chekc');
    });
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
                      controller: controller.usernameController,
                      validator: (value) => controller.fieldValidator(value),
                      onChanged: (value) {
                        controller.allFieldSelect();
                        controller.update(['update-contactInfo']);
                      },
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      style: const TextStyle(fontSize: 12),
                      decoration: infoFieldDecoration(
                          hintText: 'johndoe123',
                          fill: user?.username != null ? true : false),
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
                    text: primarytxt3('Pincode', 9.5.sp),
                    textField: TextFormField(
                      controller: controller.pincodeController,
                      validator: (value) => controller.fieldValidator(value),
                      onChanged: (value) {
                        controller.allFieldSelect();
                        controller.update(['update-contactInfo']);
                      },
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      style: const TextStyle(fontSize: 12),
                      decoration: infoFieldDecoration(hintText: 'Ex: 135001'),
                    ),
                  ),
                  contactInfoFiled(
                    text: primarytxt3('State', 9.5.sp),
                    textField: GestureDetector(
                      onTap: () => showStateBottomsheet(context: context),
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
                  contactInfoFiled(
                    text: primarytxt3('Country', 9.5.sp),
                    textField: GestureDetector(
                      onTap: () => showCountryBottomsheet(context: context),
                      child: AbsorbPointer(
                        child: TextFormField(
                          controller: controller.countryController,
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
                                  userName: c.usernameController.text,
                                  mobNumber: c.mobController.text,
                                  email: c.emailController.text,
                                  address: c.addressController.text,
                                  pincode: c.pincodeController.text,
                                  city: c.cityController.text,
                                  state: c.stateController.text,
                                  country: c.countryController.text,
                                  facebook: c.facebookController.text,
                                  instagram: c.instagramController.text,
                                  twitter: c.twitterController.text,
                                );
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

  void showStateBottomsheet({required BuildContext context}) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return const StateBottomSheetClass();
      },
    );
  }

  void showCountryBottomsheet({required BuildContext context}) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return const CountryBottomSheet();
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
