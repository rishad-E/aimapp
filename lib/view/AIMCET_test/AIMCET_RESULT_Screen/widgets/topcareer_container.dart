import 'package:aimshala/utils/common/widgets/colors_common.dart';
import 'package:aimshala/utils/common/widgets/text_common.dart';
import 'package:aimshala/utils/widgets/widgets_common.dart';
import 'package:aimshala/view/profile/common/widgets/texts.dart';
import 'package:flutter/material.dart';

class TopCareerContainer extends StatelessWidget {
  final String index;
  final String careers;
  final String salary;
  const TopCareerContainer(
      {super.key,
      required this.index,
      required this.careers,
      required this.salary});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 8),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: kwhite,
        border: Border.all(
          color: const Color.fromARGB(255, 238, 236, 236),
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 6),
            height: 30,
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 15, 187, 195),
              shape: BoxShape.circle,
            ),
            child: Center(
              child: semiBoldChoiceText(
                text: index,
                size: 16,
                color: kwhite,
              ),
            ),
          ),
          wBox,
          wBox,
          Flexible(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                  child: semiBoldChoiceText(
                    text: careers,
                    size: 11,
                  ),
                ),
                regularText(salary, 10)
              ],
            ),
          )
        ],
      ),
    );
  }
}
