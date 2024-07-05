import 'package:aimshala/utils/common/widgets/colors_common.dart';
import 'package:aimshala/utils/common/widgets/text_common.dart';
import 'package:aimshala/utils/widgets/widgets_common.dart';
import 'package:aimshala/view/profile/common/widgets/texts.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

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

Widget writeReview() {
  return Container(
    decoration: reviewContainerDec(),
    margin: const EdgeInsets.symmetric(horizontal: 18),
    padding: const EdgeInsets.all(12),
    child: Column(
      children: [
        semiBoldChoiceText(text: 'Review ACE Test', size: 14, color: kblack),
        regularText('Write a review for this ACE Test', 11),
        hBox,
        reviewWriteViewButton(matter: 'Write a Course Review')
      ],
    ),
  );
}

Widget userReviewWidget() {
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
            'VS',
            style: TextStyle(color: kwhite),
          )),
        ),
        wBox,
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  semiBoldChoiceText(
                    text: 'Somia Adeel  ●',
                    size: 12,
                  ),
                  wMBox,
                  regularText('5 months ago', 8)
                ],
              ),
              regularText('⭐⭐⭐⭐ 3.0 Ratings', 11, color: kblack),
              regularText(
                  'I have a better understanding how the environment works',
                  11),
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

Widget reviewWriteViewButton({required String matter}) {
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
      onPressed: () {},
      child: semiBoldChoiceText(
        text: matter,
        size: 14,
        color: mainPurple,
      ),
    ),
  );
}
