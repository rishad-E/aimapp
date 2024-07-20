import 'package:aimshala/utils/common/widgets/colors_common.dart';
import 'package:aimshala/utils/common/widgets/text_common.dart';
import 'package:aimshala/utils/widgets/widgets_common.dart';
import 'package:aimshala/view/counselor_registration/common/widgets/counselor_widgets.dart';
import 'package:aimshala/view/profile/common/widgets/texts.dart';
import 'package:aimshala/view/profile/common/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CounselorMediaPage extends StatelessWidget {
  const CounselorMediaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: counselorAppBar(backArrow: true),
      body: counselorContainer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.center,
              child: counselorRichText(text1: 'Final Steps', text2: ''),
            ),
            hLBox,
            boldText(text: 'Resume/CV/LinkedIn Profile Link', size: 11.sp),
            counselorFields(
              fieldItem: 'LinkedIn Profile Link',
              textfiled: TextFormField(
                decoration: infoFieldDecoration(
                    hintText: 'Enter LinkedIn Profile Link'),
                style: const TextStyle(fontSize: 13),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: semiBoldChoiceText(text: 'Or', size: 11),
            ),
            counselorFields(
              fieldItem: 'Upload your latest CV or Resume',
              textfiled: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                            color: textFieldColor.withOpacity(0.3), width: 1)),
                    child: GestureDetector(
                      onTap: () {},
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(15),
                            decoration: BoxDecoration(
                              color: buttonColor,
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              Icons.file_upload_outlined,
                              color: mainPurple,
                            ),
                          ),
                          hMBox,
                          semiBoldChoiceText(
                              text: 'Upload Resume',
                              size: 10.8.sp,
                              color: mainPurple)
                        ],
                      ),
                    ),
                  ),
                  regularText("Supported formats for upload: .pdf, .doc, .docx",
                      10.6.sp)
                ],
              ),
            ),
            hLBox,
            boldText(
              text: 'Upload a Short Teaching Video (3-5 minutes)',
              size: 11.sp,
            ),
            counselorFields(
              fieldItem: 'Video Link',
              textfiled: TextFormField(
                decoration: infoFieldDecoration(hintText: 'Enter Video Link'),
                style: const TextStyle(fontSize: 13),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: semiBoldChoiceText(text: 'Or', size: 11),
            ),
            counselorFields(
              fieldItem: 'Upload a Short Teaching Video (3-5 minutes)',
              textfiled: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                            color: textFieldColor.withOpacity(0.3), width: 1)),
                    child: GestureDetector(
                      onTap: () {},
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(15),
                            decoration: BoxDecoration(
                              color: buttonColor,
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              Icons.file_upload_outlined,
                              color: mainPurple,
                            ),
                          ),
                          hMBox,
                          semiBoldChoiceText(
                              text: 'Upload Resume',
                              size: 10.8.sp,
                              color: mainPurple)
                        ],
                      ),
                    ),
                  ),
                  regularText("Supported formats for upload: .mp4, .mov, .avi",
                      10.6.sp)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
