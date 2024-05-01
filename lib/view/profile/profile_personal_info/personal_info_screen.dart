import 'package:aimshala/controllers/profile_controller/personal_info_controller.dart';
import 'package:aimshala/utils/common/colors_common.dart';
import 'package:aimshala/utils/common/text_common.dart';
import 'package:aimshala/utils/widgets/widgets_common.dart';
import 'package:aimshala/view/profile/common/widgets/widgets.dart';
import 'package:aimshala/view/profile/profile_personal_info/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class ProfilePersonalInfoScreen extends StatelessWidget {
  final String id;
  final String? username;
  ProfilePersonalInfoScreen({super.key, required this.id, this.username});
  final GlobalKey<FormState> formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(PerosnalInfoController());
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: profileAppBar(title: 'Profile', doneWidget: shrinked),
      body: Container(
        decoration: profileMainContainer(),
        child: Center(
          child: SingleChildScrollView(
            child: Container(
              width: double.infinity,
              // height: 50,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
              margin: const EdgeInsets.symmetric(horizontal: 24),
              decoration: profileSecondaryContainer(),
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    profileRichText('Personal', 'Info'),
                    hBox,
                    Text(
                      "Tell us about your Personal Info",
                      style: TextStyle(fontSize: 14, color: textFieldColor),
                    ),
                    hLBox,
                    perosnalInfoFiled(
                      text: primarytxt3('Name', 9.5.sp),
                      textField: TextFormField(
                        controller: controller.nameController,
                        // validator: (value) => controller.fieldValidator(value),
                        onChanged: (value) {
                          // controller.allFieldSelect();
                          controller.update(['update-personalinfo']);
                        },
                        style: const TextStyle(fontSize: 12),
                        decoration:
                            infoFieldDecoration(hintText: 'Enter Full Name'),
                      ),
                    ),
                    perosnalInfoFiled(
                      text: primarytxt3('Username', 9.5.sp),
                      textField: TextFormField(
                        controller: controller.userNameController
                          ..text = username.toString(),
                        onChanged: (value) {
                          // controller.allFieldSelect();
                          controller.update(['update-personalinfo']);
                        },
                        style: const TextStyle(fontSize: 12),
                        decoration: infoFieldDecoration(
                            hintText: 'User Nane',
                            fill: username != null ? true : false),
                      ),
                    ),
                    perosnalInfoFiled(
                      text: primarytxt3('Date of Birth', 9.5.sp),
                      textField: TextFormField(
                        readOnly: true,
                        controller: controller.dateController,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        // onChanged: (value) {
                        //   // controller.allFieldSelect();
                        //   controller.update(['update-personalinfo']);
                        // },
                        validator: (value) => controller.fieldValidator(value),
                        style: const TextStyle(fontSize: 12),
                        decoration: infoFieldDecoration(
                          hintText: 'Date',
                          suffixWidget: GestureDetector(
                            onTap: () => controller.datePicker(context),
                            child: SvgPicture.asset(
                              'assets/images/calendar-booked.svg',
                              colorFilter:
                                  ColorFilter.mode(kblack, BlendMode.srcIn),
                              fit: BoxFit.scaleDown,
                            ),
                          ),
                        ),
                      ),
                    ),
                    hLBox,
                    GetBuilder<PerosnalInfoController>(
                      id: 'update-personalinfo',
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
                              textColor: c.nameController.text.isNotEmpty &&
                                      c.userNameController.text.isNotEmpty &&
                                      c.dateController.text.isNotEmpty
                                  ? kwhite
                                  : textFieldColor,
                              boxColor: c.nameController.text.isNotEmpty &&
                                      c.userNameController.text.isNotEmpty &&
                                      c.dateController.text.isNotEmpty
                                  ? mainPurple
                                  : buttonColor,
                              onTap: () {
                                if (formKey.currentState!.validate()) {
                                  // log('name: ${c.nameController.text} username:${c.userNameController.text}date: ${c.dateController.text} UID: $id');
                                  c.savepersonalInfoFunction(
                                      uId: id,
                                      fullName: c.nameController.text,
                                      userName: c.userNameController.text,
                                      dOB: c.dateController.text);
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
}
