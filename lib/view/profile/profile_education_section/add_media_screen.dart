import 'dart:io';
import 'package:aimshala/utils/common/colors_common.dart';
import 'package:aimshala/utils/common/text_common.dart';
import 'package:aimshala/utils/widgets/widgets_common.dart';
import 'package:aimshala/view/profile/common/widgets/widgets.dart';
import 'package:aimshala/view/profile/profile_education_section/add_education_screen.dart';
import 'package:aimshala/view/profile/profile_education_section/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class AddProfileMediaScreen extends StatelessWidget {
  final File? image;
  final String uId;
  const AddProfileMediaScreen({super.key, this.image, required this.uId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: profileAppBar(
        title: 'Add Media',
        doneWidget: TextButton(
            onPressed: () => Get.off(() => AddEducationScreen(uId:uId,)),
            child: const Text(
              'Apply',
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
            )),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
        child: Column(
          children: [
            educationInfoFiled(
              text: primarytxt3('Title', 9.5.sp),
              textField: TextFormField(
                decoration: infoFieldDecoration(hintText: 'Ex: Certificate'),
                style: const TextStyle(fontSize: 13),
              ),
            ),
            educationInfoFiled(
              text: primarytxt3('Description', 9.5.sp),
              textField: TextFormField(
                decoration: infoFieldDecoration(hintText: 'Enter Description'),
                style: const TextStyle(fontSize: 13),
                minLines: 3,
                maxLines: null,
              ),
            ),
            hMBox,
            SizedBox(
              height: 17.h,
              width: double.infinity,
              // color: Colors.yellow,
              child: image != null
                  ? Image.file(image!, fit: BoxFit.contain)
                  : Center(
                      child: Text(
                        "Please select an image",
                        style: TextStyle(color: textFieldColor),
                        textAlign: TextAlign.center,
                      ),
                    ),
            )
          ],
        ),
      ),
    );
  }
}
