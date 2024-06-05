import 'package:aimshala/utils/common/colors_common.dart';
import 'package:aimshala/utils/common/text_common.dart';
import 'package:aimshala/utils/widgets/widgets_common.dart';
import 'package:aimshala/view/profile/common/widgets/texts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';

Widget uploadMediaWidget({void Function()? onTap,required String item}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 15),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            border:
                Border.all(color: textFieldColor.withOpacity(0.3), width: 1)),
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
                  text: 'Upload $item', size: 10.8.sp, color: mainPurple)
            ],
          ),
        ),
      ),
      regularText("Supported formats for upload: .pdf, .doc, .docx", 10.6.sp)
    ],
  );
}

Widget mediaContainWidget(
    {required String fileName, required String fileSize,void Function()? onTapDelete}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      semiBoldChoiceText(text: 'Upload your latest CV or Resume', size: 11),
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
      regularText("Supported formats for upload: .pdf, .doc, .docx", 10.6.sp)
    ],
  );
}
