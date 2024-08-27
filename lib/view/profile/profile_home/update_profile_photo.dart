import 'package:aimshala/controllers/profile_controller/profile_home_controller.dart';
import 'package:aimshala/utils/common/widgets/colors_common.dart';
import 'package:aimshala/utils/common/widgets/text_common.dart';
import 'package:aimshala/utils/widgets/widgets_common.dart';
import 'package:aimshala/view/profile/common/widgets/texts.dart';
import 'package:aimshala/view/profile/common/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sizer/sizer.dart';

class UpdateProfilePhotoScreen extends StatelessWidget {
  UpdateProfilePhotoScreen({super.key});
  final profileC = Get.find<ProfileHomeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: profileAppBar(title: 'Profile Photo', doneWidget: shrinked),
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: Obx(
                () => profileC.isLoading.value
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation(mainPurple),
                            strokeWidth: 1.5,
                          ),
                          hMBox,
                          regularText('Profile photo is uploading....', 12)
                        ],
                      )
                    : Container(
                        margin: const EdgeInsets.symmetric(horizontal: 25),
                        decoration: BoxDecoration(
                          // color: Colors.red,
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: profileC.selectedImage.value.isNotEmpty
                                ? NetworkImage(profileC.selectedImage.value)
                                    as ImageProvider
                                : const AssetImage('assets/images/person.png'),
                          ),
                        ),
                      ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InkWell(
                onTap: () async =>
                    await profileC.selectProfilePic(source: ImageSource.camera),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.camera_alt,
                      color: textFieldColor,
                    ),
                    semiBoldChoiceText(
                        text: 'Add Photo', size: 11.sp, color: textFieldColor)
                  ],
                ),
              ),
              InkWell(
                onTap: () async => await profileC.selectProfilePic(
                    source: ImageSource.gallery),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.edit,
                      color: textFieldColor,
                    ),
                    semiBoldChoiceText(
                        text: 'Add Photo', size: 11.sp, color: textFieldColor)
                  ],
                ),
              ),
              InkWell(
                onTap: () async => await profileC.deleteProfilePic(),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      "assets/images/delete.svg",
                    ),
                    semiBoldChoiceText(
                        text: 'Delete', size: 11.sp, color: textFieldColor)
                  ],
                ),
              ),
            ],
          ),
          hLBox
        ],
      ),
    );
  }
}
