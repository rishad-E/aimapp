import 'package:aimshala/utils/common/colors_common.dart';
import 'package:aimshala/utils/common/text_common.dart';
import 'package:aimshala/utils/widgets/widgets_common.dart';
import 'package:aimshala/view/profile/common/widgets/widgets.dart';
import 'package:aimshala/view/profile/profile_contact_info/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class ProfileContactInfoScreen extends StatelessWidget {
  const ProfileContactInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // extendBodyBehindAppBar: true,
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
                    decoration:
                        infoFieldDecoration(hintText: 'johndoe123', fill: true),
                  ),
                ),
                contactInfoFiled(
                  text: primarytxt3('Email', 9.5.sp),
                  textField: TextFormField(
                    decoration:
                        infoFieldDecoration(hintText: 'johndoe@gmail.com'),
                  ),
                ),
                contactInfoFiled(
                  text: primarytxt3('Address', 9.5.sp),
                  textField: TextFormField(
                    decoration: infoFieldDecoration(
                        hintText: 'Ex: D-79, Block D, Sector 48 '),
                  ),
                ),
                contactInfoFiled(
                  text: primarytxt3('State', 9.5.sp),
                  textField: TextFormField(
                    decoration: infoFieldDecoration(
                      hintText: 'Please Select',
                      suffixWidget: Icon(Icons.keyboard_arrow_down,
                          size: 26, color: kblack),
                    ),
                  ),
                ),
                contactInfoFiled(
                  text: primarytxt3('State', 9.5.sp),
                  textField: TextFormField(
                    decoration: infoFieldDecoration(
                      hintText: 'Please Select',
                      suffixWidget: Icon(Icons.keyboard_arrow_down,
                          size: 26, color: kblack),
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
                    decoration: infoFieldDecoration(hintText: 'Facebook URL'),
                  ),
                ),
                contactInfoFiled(
                  text: primarytxt3('Instegram', 9.5.sp),
                  textField: TextFormField(
                    decoration: infoFieldDecoration(hintText: 'Instegram URL'),
                  ),
                ),
                contactInfoFiled(
                  text: primarytxt3('Twitter', 9.5.sp),
                  textField: TextFormField(
                    decoration: infoFieldDecoration(hintText: 'Twitter URL'),
                  ),
                ),
                hLBox,
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
    );
  }
}
