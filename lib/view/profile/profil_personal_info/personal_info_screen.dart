import 'package:aimshala/utils/common/colors_common.dart';
import 'package:aimshala/utils/common/text_common.dart';
import 'package:aimshala/utils/widgets/widgets_common.dart';
import 'package:aimshala/view/profile/common/widgets/widgets.dart';
import 'package:aimshala/view/profile/profil_personal_info/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';

class PersonalInfoScreen extends StatelessWidget {
  const PersonalInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: profileAppBar(title: 'Profile'),
      body: Container(
        decoration: profileMainContainer(),
        child: Center(
          child: SingleChildScrollView(
            child: Container(
              width: double.infinity,
              // height: 50,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
              margin: const EdgeInsets.symmetric(horizontal: 24),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(24),
                    topRight: Radius.circular(24)),
                color: kwhite,
              ),
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
                      decoration:
                          infoFieldDecoration(hintText: 'Enter Full Name'),
                    ),
                  ),
                  perosnalInfoFiled(
                    text: primarytxt3('Username', 9.5.sp),
                    textField: TextFormField(
                      decoration: infoFieldDecoration(hintText: 'johndoe123'),
                    ),
                  ),
                  perosnalInfoFiled(
                    text: primarytxt3('Date of Birth', 9.5.sp),
                    textField: TextFormField(
                      decoration: infoFieldDecoration(
                        hintText: '24 - 08 - 1997',
                        suffixWidget: SvgPicture.asset(
                            'assets/images/calendar-booked.svg',
                            colorFilter:
                                ColorFilter.mode(kblack, BlendMode.srcIn),
                            fit: BoxFit.scaleDown),
                      ),
                    ),
                  ),
                  hLBox,
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Container(
                          height: 4.h,
                          decoration: BoxDecoration(
                            color: kwhite,
                            border: Border.all(width: 1, color: mainPurple),
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Center(
                              child: Text(
                            "Cancel",
                            style: TextStyle(
                                color: mainPurple,
                                fontWeight: FontWeight.w600,
                                fontSize: 14),
                          )),
                        ),
                      ),
                      wMBox,
                      Expanded(
                        child: GestureDetector(
                          onTap: () {},
                          child: Container(
                            height: 4.h,
                            decoration: BoxDecoration(
                              color: buttonColor,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Center(
                              child: Text(
                                "Save",
                                style: TextStyle(
                                    color: textFieldColor,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14),
                              ),
                            ),
                          ),
                        ),
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
