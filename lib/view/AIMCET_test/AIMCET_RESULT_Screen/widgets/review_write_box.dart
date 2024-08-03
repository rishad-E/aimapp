import 'dart:developer';

import 'package:aimshala/controllers/aimcet_test_controller.dart';
import 'package:aimshala/utils/common/widgets/colors_common.dart';
import 'package:aimshala/utils/common/widgets/text_common.dart';
import 'package:aimshala/utils/widgets/widgets_common.dart';
import 'package:aimshala/view/chatbot/widgets/amy_radial_gradient.dart';
import 'package:aimshala/view/profile/common/widgets/texts.dart';
import 'package:aimshala/view/profile/common/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class WriteAimcetReview extends StatelessWidget {
  const WriteAimcetReview({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<AIMCETController>();
    return AlertDialog(
      surfaceTintColor: kwhite,
      backgroundColor: kwhite,
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Padding(
              padding: EdgeInsets.only(right: 50),
              child: AmyBotRadialColor(),
            ),
            hMBox,
            boldText(text: 'Share Your Experience', size: 14.sp),
            hBox,
            regularText(
                'Your feedback helps us improve and helps others learn about the course. Please take a moment to leave a review.',
                10,
                textAlign: TextAlign.center),
            const SizedBox(height: 8),
            GetBuilder<AIMCETController>(
              init: AIMCETController(),
              id: 'review-star',
              builder: (c) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: List.generate(
                    5,
                    (index) => GestureDetector(
                      onTap: () => c.updateStarCount(index + 1),
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 1),
                        child: SvgPicture.asset(
                          'assets/images/star-review.svg',
                          height: 15,
                          colorFilter: ColorFilter.mode(
                              c.starCount >= (index + 1)
                                  ? Colors.yellow
                                  : Colors.grey.shade300,
                              BlendMode.srcIn),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
            hBox,
            TextFormField(
              decoration: infoFieldDecoration(
                  hintText: 'Please write your thoughts and suggestions.'),
              minLines: 4,
              maxLines: null,
              maxLength: 500,
              // cursorHeight:,
              cursorWidth: 1.5,
              style: const TextStyle(fontSize: 13),
              controller: controller.reviewController,
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () {},
                  child: semiBoldChoiceText(
                    text: 'Privacy Policy',
                    size: 14,
                    color: mainPurple,
                  ),
                ),
                TextButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(mainPurple),
                    padding: const MaterialStatePropertyAll(
                        EdgeInsets.symmetric(horizontal: 15)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6),
                      ),
                    ),
                  ),
                  onPressed: () {
                    final userId =
                        controller.testuserDetails?.userId?.toString() ?? '';
                    final testId =
                        controller.testuserDetails?.id?.toString() ?? '';
                    // Get.back();
                    if (controller.reviewController.text.isNotEmpty) {
                      log('review=>${controller.reviewController.text} userId=>$userId testId=>$testId rating=>${controller.starCount}');
                      controller.submitTestReview(
                        uId: userId,
                        testId: testId,
                        rating: controller.starCount.toString(),
                        review: controller.reviewController.text,
                      );
                      Get.back();
                    }
                  },
                  child: semiBoldChoiceText(
                    text: 'Submit',
                    size: 14,
                    color: kwhite,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
