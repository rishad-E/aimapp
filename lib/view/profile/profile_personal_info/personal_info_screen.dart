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
  ProfilePersonalInfoScreen({super.key});
  final dateController = TextEditingController();
  final DateTime dateTime = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: profileAppBar(title: 'Profile',doneWidget: shrinked),
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
                      decoration: infoFieldDecoration(
                          hintText: 'johndoe123', fill: true),
                    ),
                  ),
                  perosnalInfoFiled(
                    text: primarytxt3('Date of Birth', 9.5.sp),
                    textField: TextFormField(
                      readOnly: true,
                      controller: dateController,
                      decoration: infoFieldDecoration(
                        hintText: '24 - 08 - 1997',
                        suffixWidget: GestureDetector(
                          onTap: () => datePicker(context),
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

  Future<void> datePicker(BuildContext context) async {
    final DateTime? picker = await showDatePicker(
      context: context,
      initialDate: dateTime,
      firstDate: DateTime(2000),
      lastDate: DateTime(2050),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.dark().copyWith(
            colorScheme: const ColorScheme.dark(
              primary: Colors.purple, // Header background color
              onPrimary: Colors.white, // Header text color
              //   surface: Colors.grey.shade300, // Calendar background color
              //   onSurface: Colors.black, // Calendar text color
            ),

            dialogBackgroundColor: Colors.white, // Dialog background color
          ),
          child: child!,
        );
      },
    );
    if (picker != null && picker != dateTime) {
      dateController.text = picker.toString().split(" ")[0];
    }
  }
}
