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
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';
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
      initializeFormFields(controller, user);
    });
    log(controller.otpError.value, name: 'otp error value');
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
                  Obx(
                    () => contactInfoFiled(
                      text: primarytxt3('Mobile Number', 9.5.sp),
                      textField: TextFormField(
                        controller: controller.mobController,
                        validator: (value) => controller.fieldValidator(value),
                        onChanged: (value) {
                          controller.allFieldSelect();
                          controller.update(['update-contactInfo']);
                          controller.isNumChangedAfterVerification.value = true;
                          controller.canSave.value = false;
                          if (value.length == 10) {
                            controller.validateNewNumber(mob: value);
                            // log(value.toString());
                          } else {
                            controller.otpError.value = 'OTP verified success';
                          }
                        },
                        inputFormatters: [LengthLimitingTextInputFormatter(10)],
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        keyboardType: TextInputType.phone,
                        readOnly:
                            controller.otpVerifiedNum.value == 1 ? false : true,
                        style: const TextStyle(fontSize: 12),
                        decoration: infoFieldDecoration(
                            prefix: phoneIcon(),
                            suffixWidget: controller.changePhone.value ==
                                    'onScreen'
                                ? changePhoneWidget(
                                    text: "Change",
                                    onPressed: () {
                                      controller.otpController.clear();
                                      controller.phoneNumberOTPverification(
                                          mobileNo:
                                              '+91${controller.mobController.text}');
                                    },
                                  )
                                : controller.changePhone.value == 'verified' &&
                                        controller.otpError.isEmpty
                                    ? changePhoneWidget(
                                        text: "Send Code",
                                        onPressed: () {
                                          controller.otpController.clear();
                                          controller.phoneNumberOTPverification(
                                              mobileNo:
                                                  '+91${controller.mobController.text}');
                                        },
                                      )
                                    : null),
                      ),
                    ),
                  ),
                  // hBox,
                  Obx(() {
                    final defaultpin = PinTheme(
                      height: 4.5.h,
                      width: 10.w,
                      textStyle: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: kblack.withOpacity(.7),
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: kblack.withOpacity(0.2)),
                      ),
                    );
                    return controller.changePhone.value == 'sendOTP'
                        ? Column(
                            children: [
                              hBox,
                              Pinput(
                                defaultPinTheme: defaultpin,
                                focusedPinTheme: defaultpin.copyWith(
                                  decoration: defaultpin.decoration!.copyWith(
                                    border: Border.all(color: kpurple),
                                  ),
                                ),
                                onCompleted: (value) {},
                                onChanged: (value) {},
                                controller: controller.otpController,
                              ),
                              hBox,
                              otpValidateBox(
                                onPressed: () {
                                  controller.validateOTP(
                                      mob:
                                          '+91${controller.mobController.text}',
                                      otp: controller.otpController.text);
                                },
                              )
                            ],
                          )
                        : shrinked;
                  }),
                  // hBox,
                  Obx(() =>
                      controller.otpError.value == 'OTP verified success' ||
                              controller.otpError.isEmpty
                          ? shrinked
                          : otpErrorText(controller.otpError.value)),
                  Obx(
                    () => controller.changePhone.value == 'sendOTP'
                        ? Column(
                            children: [
                              choiceSizedBox(height: 8),
                              Align(
                                alignment: Alignment.centerLeft,
                                child:
                                    primarytxt("Didn't recieve Code?", 11.sp),
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: GestureDetector(
                                  onTap: () => controller.resendOTP(
                                      mob:
                                          '+91${controller.mobController.text}'),
                                  child: Text(
                                    "Resend Code",
                                    style: TextStyle(
                                        color: mainPurple,
                                        fontSize: 10.sp,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                              ),
                            ],
                          )
                        : shrinked,
                  ),
                  // hBox,
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
                          hintText: 'username',
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
                      decoration: infoFieldDecoration(),
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
                      keyboardType: TextInputType.number,
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
                      onTap: () {
                        controller.filterStates('');
                        showStateBottomsheet(context: context);
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
                      onTap: () {
                        controller.searchController.clear();
                        controller.filterCity('a');
                        showCityBottomsheet(context);
                      },
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
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      style: const TextStyle(fontSize: 12),
                      decoration: infoFieldDecoration(hintText: 'Facebook URL'),
                    ),
                  ),
                  contactInfoFiled(
                    text: primarytxt3('Instagram', 9.5.sp),
                    textField: TextFormField(
                      controller: controller.instagramController,
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
                          saveContainer(
                            boxColor: kwhite,
                            borderColor: mainPurple,
                            child: saveContainerText(
                              text: 'Cancel',
                              textColor: mainPurple,
                            ),
                            onTap: () => Get.back(),
                          ),
                          wMBox,
                          saveContainer(
                            boxColor: c.saveBG.value,
                            child: Obx(
                              () => c.isSaving.value
                                  ? CircularProgressIndicator(
                                      strokeWidth: 1, color: kwhite)
                                  : saveContainerText(
                                      text: 'Save',
                                      textColor: c.canSave.value == false ||
                                              c.isNumChangedAfterVerification
                                                  .value
                                          ? textFieldColor
                                          : c.saveText.value,
                                    ),
                            ),
                            onTap: () {
                              if (c.canSave.value &&
                                  !c.isNumChangedAfterVerification.value) {
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
                              // c.canSave.value == false&& !c.isNumChangedAfterVerification.value
                              //     ? null
                              //     : c.saveContactInfoFunction(
                              //         uId: id.toString(),
                              //         userName: c.usernameController.text,
                              //         mobNumber: c.mobController.text,
                              //         email: c.emailController.text,
                              //         address: c.addressController.text,
                              //         pincode: c.pincodeController.text,
                              //         city: c.cityController.text,
                              //         state: c.stateController.text,
                              //         country: c.countryController.text,
                              //         facebook: c.facebookController.text,
                              //         instagram: c.instagramController.text,
                              //         twitter: c.twitterController.text,
                              //       );
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

  void initializeFormFields(UpdateContactInfo c, User? user) {
    if (user == null) return;
    c.mobController.text = user.phone ?? c.mobController.text;
    c.usernameController.text = user.username ?? c.emailController.text;
    c.emailController.text = user.email ?? c.emailController.text;
    c.addressController.text = user.address ?? c.addressController.text;
    c.pincodeController.text = user.zip ?? c.pincodeController.text;
    c.stateController.text = user.state ?? c.stateController.text;
    c.cityController.text = user.city ?? c.cityController.text;
    c.countryController.text = user.country ?? c.countryController.text;
    c.facebookController.text = user.facebook ?? c.facebookController.text;
    c.instagramController.text = user.instagram ?? c.instagramController.text;
    c.twitterController.text = user.twitter ?? c.twitterController.text;
    c.allFieldSelect();
    c.update(['update-contactInfo']);
  }

  void showStateBottomsheet({required BuildContext context}) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      useSafeArea: false,
      builder: (context) {
        return Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: StateBottomSheetClass(),
        );
      },
    );
  }

  void showCityBottomsheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      useSafeArea: false,
      builder: (context) {
        return Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: const CityBottomSheetClass(),
        );
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
}
