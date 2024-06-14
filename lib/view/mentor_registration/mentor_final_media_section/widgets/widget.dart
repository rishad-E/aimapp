import 'package:aimshala/utils/common/widgets/colors_common.dart';
import 'package:aimshala/utils/common/widgets/text_common.dart';
import 'package:aimshala/utils/widgets/widgets_common.dart';
import 'package:aimshala/view/mentor_registration/common/widgets/widgets.dart';
import 'package:aimshala/view/mentor_registration/mentor_final_media_section/widgets/dotted_container_paint.dart';
import 'package:aimshala/view/profile/common/widgets/texts.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';

Widget uploadMediaMentor({void Function()? onTap, required String media}) {
  return mentorFields(
    item: media == 'Resume'
        ? primarytxt3('Upload your latest CV or Resume', 9.5.sp)
        : primarytxt3('Upload a Short Teaching Video (3-5 minutes)', 9.5.sp),
    textfiled: Column(
      children: [
        CustomPaint(
          painter: DottedBorderPainter(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: GestureDetector(
                  onTap: onTap,
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
                          text: 'Upload $media',
                          size: 10.8.sp,
                          color: mainPurple)
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        media == 'Resume'
            ? regularText(
                "Supported formats for upload: .pdf, .doc, .docx", 10.6.sp)
            : regularText(
                "Supported formats for upload: .mp4, .mov, .avi", 10.6.sp)
      ],
    ),
  );
}

Widget mentorMediaContainWidget(
    {required String fileName,
    required String fileSize,
    void Function()? onTapDelete,
    required String media}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      media == 'Resume'
          ? semiBoldChoiceText(
              text: 'Upload your latest CV or Resume', size: 11)
          : semiBoldChoiceText(
              text: 'Upload a Short Teaching Video (3-5 minutes)', size: 11),
      Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 12),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            border:
                Border.all(color: textFieldColor.withOpacity(0.3), width: 1)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(13),
                    decoration: BoxDecoration(
                      color: buttonColor,
                      shape: BoxShape.circle,
                    ),
                    child: SvgPicture.asset(
                      "assets/images/file.svg",
                    ),
                  ),
                  wMBox,
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          fileName,
                          style: TextStyle(
                            color: kblack,
                            fontSize: 10.8.sp,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                        ),
                        regularText(fileSize, 12, color: kblack)
                      ],
                    ),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: onTapDelete,
              child: SvgPicture.asset(
                "assets/images/delete-new.svg",
              ),
            ),
          ],
        ),
      ),
      media == 'Resume'
          ? regularText(
              "Supported formats for upload: .pdf, .doc, .docx", 10.6.sp)
          : regularText(
              "Supported formats for upload: .mp4, .mov, .avi", 10.6.sp)
    ],
  );
}

Widget agreeContainerMentor({required bool agree}) {
  return Container(
    height: 20,
    width: 20,
    decoration: BoxDecoration(
      color: agree == true ? mainPurple : kwhite,
      border: agree == false
          ? Border.all(
              width: 1, color: const Color.fromARGB(255, 195, 197, 198))
          : null,
      borderRadius: BorderRadius.circular(6),
    ),
    child: agree
        ? Center(
            child: Icon(
            Icons.done,
            color: kwhite,
            size: 13,
          ))
        : null,
  );
}

Widget agreeTextMentor(
    {void Function()? onTapTerms, void Function()? onTapPrivacy}) {
  return RichText(
    text: TextSpan(
      text: 'I agree to Aimshala\'s mentoring ',
      style: const TextStyle(
          color: Color.fromARGB(255, 132, 131, 131), fontSize: 11),
      children: [
        TextSpan(
          text: 'terms and conditions',
          style: const TextStyle(
              color: Colors.black,
              decoration: TextDecoration.underline,
              fontSize: 11),
          recognizer: TapGestureRecognizer()..onTap = onTapTerms,
        ),
        const TextSpan(
          text: ' and ',
          style: TextStyle(
              color: Color.fromARGB(255, 132, 131, 131), fontSize: 11),
        ),
        TextSpan(
          text: 'privacy policy.',
          style: const TextStyle(
            color: Colors.black,
            fontSize: 11,
            decoration: TextDecoration.underline,
          ),
          recognizer: TapGestureRecognizer()..onTap = onTapPrivacy,
        ),
      ],
    ),
  );
}

Widget errorTextFile() {
  return Align(
    alignment: Alignment.center,
    child: Column(
      children: [
        hBox,
        semiBoldChoiceText(
            text: "Please Provide a Link or a File", size: 11, color: kred),
      ],
    ),
  );
}

Widget errorTextVideoFile() {
  return Align(
    alignment: Alignment.center,
    child: Column(
      children: [
        hBox,
        semiBoldChoiceText(
            text: "Please Provide a Link or a File", size: 11, color: kred),
      ],
    ),
  );
}

Widget errorAgreementText() {
  return Align(
    alignment: Alignment.center,
    child: Column(
      children: [
        hBox,
        semiBoldChoiceText(
            text: "Please Agree to the Terms and Conditions",
            size: 11,
            color: kred),
      ],
    ),
  );
}

Widget mentorSubmit( {required Widget child,
    Color? borderColor,
    required Color boxColor,
    void Function()? onTap}) {
  return Expanded(
    child: GestureDetector(
      onTap: onTap,
      child: Container(
          height: 4.h,
          decoration: BoxDecoration(
            color: boxColor,
            border: borderColor != null
                ? Border.all(width: 1, color: borderColor)
                : null,
            borderRadius: BorderRadius.circular(6),
          ),
          child: child),
    ),
  );
}

Widget submitTextMentor({Color? color}) {
  return Center(
      child: Text(
    'Submit',
    style: TextStyle(color: color, fontWeight: FontWeight.w600, fontSize: 14),
  ));
}

Widget submitLoadingMentor() {
  return Center(
    child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: CircularProgressIndicator(
        strokeWidth: 2,
        color: kwhite,
      ),
    ),
  );
}
