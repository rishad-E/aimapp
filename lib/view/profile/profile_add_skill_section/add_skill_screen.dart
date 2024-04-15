import 'package:aimshala/utils/common/colors_common.dart';
import 'package:aimshala/utils/common/text_common.dart';
import 'package:aimshala/utils/widgets/widgets_common.dart';
import 'package:aimshala/view/profile/common/widgets/texts.dart';
import 'package:aimshala/view/profile/common/widgets/widgets.dart';
import 'package:aimshala/view/profile/profile_add_skill_section/widgets/widgets_skill.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class ProfileAddSkillScreen extends StatelessWidget {
  const ProfileAddSkillScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // extendBodyBehindAppBar: true,
      appBar: profileAppBar(title: 'Add Skill', doneWidget: shrinked),
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
              // mainAxisAlignment: MainAxisAlignment.center,
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                profileRichText('Add', 'Skill'),
                hLBox,
                skillInfoFiled(
                  text: primarytxt3('Skill', 9.5.sp),
                  textField: TextFormField(
                    decoration: infoFieldDecoration(
                        hintText: 'Ex: Retail Sales Manager'),
                  ),
                ),
                hBox,
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: kblack.withOpacity(0.3)),
                      borderRadius: BorderRadius.circular(12)),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                  // height: 50,
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      semiBoldText(text: 'Suggested based on your profile'),
                      const SizedBox(height: 8),
                      Wrap(
                        spacing: 4,
                        //  spacing: 6,
                            runSpacing: 8,
                        children: List.generate(5, (index) {
                          return suggestedSkills(suggestedskillText[index]);
                        }),
                      )
                    ],
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
