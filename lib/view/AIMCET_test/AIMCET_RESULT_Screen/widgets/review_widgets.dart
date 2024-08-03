import 'package:aimshala/utils/common/widgets/colors_common.dart';
import 'package:aimshala/utils/common/widgets/text_common.dart';
import 'package:aimshala/utils/widgets/widgets_common.dart';
import 'package:aimshala/view/profile/common/widgets/texts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:sizer/sizer.dart';

Widget ratingContainer() {
  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 18),
    padding: const EdgeInsets.all(10),
    decoration: BoxDecoration(
      color: kwhite,
      border: Border.all(
        color: const Color.fromARGB(255, 238, 236, 236),
      ),
      borderRadius: BorderRadius.circular(8),
    ),
    child: Column(
      children: [
        Row(
          children: [
            Column(
              children: [
                semiBoldChoiceText(text: '4.0', size: 32, color: mainPurple),
                regularText('⭐⭐⭐⭐', 12),
                semiBoldChoiceText(
                  text: 'Course Rating',
                  size: 10,
                  color: const Color.fromARGB(255, 15, 187, 195),
                ),
              ],
            ),
            Expanded(
                child: Column(
              children: List.generate(5, (index) => linearPercentReview()),
            ))
          ],
        ),
      ],
    ),
  );
}

Widget linearPercentReview() {
  return Row(
    children: [
      Expanded(
        child: LinearPercentIndicator(
          barRadius: const Radius.circular(20),
          percent: .68,
          progressColor: mainPurple,
          backgroundColor: const Color.fromARGB(255, 231, 230, 240),
          animation: true,
        ),
      ),
      wBox,
      regularText('⭐⭐⭐⭐', 12),
      choiceSizedBox(width: 3),
      regularText('68%', 11),
    ],
  );
}

Decoration reviewContainerDec() {
  return BoxDecoration(
    color: kwhite,
    border: Border.all(
      color: const Color.fromARGB(255, 238, 236, 236),
    ),
    borderRadius: BorderRadius.circular(8),
  );
}

Widget writeReview({required void Function()? onPressed}) {
  return Container(
    decoration: reviewContainerDec(),
    margin: const EdgeInsets.symmetric(horizontal: 18),
    padding: const EdgeInsets.all(12),
    child: Column(
      children: [
        semiBoldChoiceText(text: 'Review ACE Test', size: 14, color: kblack),
        regularText('Write a review for this ACE Test', 11),
        hBox,
        reviewWriteViewButton(
            matter: 'Write a Course Review', onPressed: onPressed)
      ],
    ),
  );
}

Widget userReviewWidget(
    {required String initials,
    required String name,
    required String time,
    required String rating,
    required String review}) {
  int ratingValue = int.tryParse(rating) ?? 0;
  return Container(
    margin: const EdgeInsets.only(left: 18, right: 18, top: 12),
    padding: const EdgeInsets.all(12),
    decoration: reviewContainerDec(),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(7),
          decoration: const BoxDecoration(
              color: Color.fromARGB(255, 15, 187, 195), shape: BoxShape.circle),
          child: Center(
              child: Text(
            initials,
            style: TextStyle(color: kwhite),
          )),
        ),
        wBox,
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  semiBoldChoiceText(
                    text: '$name .',
                    size: 12,
                  ),
                  wBox,
                  regularText(time, 8.sp)
                ],
              ),
              // regularText('⭐⭐⭐⭐ $rating Ratings', 11, color: kblack),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: List.generate(
                  5,
                  (index) => Container(
                    padding: const EdgeInsets.symmetric(horizontal: 1),
                    child: SvgPicture.asset(
                      'assets/images/star-review.svg',
                      height: 15,
                      colorFilter: ColorFilter.mode(
                          ratingValue >= (index + 1)
                              ? Colors.yellow
                              : Colors.grey.shade300,
                          BlendMode.srcIn),
                    ),
                  ),
                ),
              ),
              review.isEmpty ? shrinked : regularText(review, 11),
              hBox,
              semiBoldChoiceText(
                text: 'Was this review helpful?',
                size: 11,
              ),
              hBox,
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        // color: mainPurple,
                        border: Border.all(color: mainPurple),
                        shape: BoxShape.circle),
                    child: Icon(
                      Icons.thumb_up_alt_outlined,
                      color: mainPurple,
                      size: 17,
                    ),
                  ),
                  wBox,
                  wBox,
                  Container(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        // color: mainPurple,
                        border: Border.all(color: mainPurple),
                        shape: BoxShape.circle),
                    child: Icon(
                      Icons.thumb_down_alt_outlined,
                      color: mainPurple,
                      size: 17,
                    ),
                  ),
                  wMBox,
                  semiBoldChoiceText(text: 'Report', size: 11),
                ],
              ),
            ],
          ),
        )
      ],
    ),
  );
}

Widget reviewWriteViewButton(
    {required String matter, required void Function()? onPressed}) {
  return Container(
    width: double.infinity,
    margin: const EdgeInsets.symmetric(horizontal: 12),
    child: TextButton(
      style: ButtonStyle(
        side: MaterialStateProperty.all(BorderSide(color: mainPurple)),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
      onPressed: onPressed,
      child: semiBoldChoiceText(
        text: matter,
        size: 14,
        color: mainPurple,
      ),
    ),
  );
}
