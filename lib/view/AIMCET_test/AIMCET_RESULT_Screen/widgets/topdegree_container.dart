import 'package:aimshala/utils/common/widgets/colors_common.dart';
import 'package:aimshala/utils/widgets/widgets_common.dart';
import 'package:aimshala/view/profile/common/widgets/texts.dart';
import 'package:flutter/material.dart';

class TopDegreeContainer extends StatelessWidget {
  final String index;
  final String degree;

  const TopDegreeContainer({
    super.key,
    required this.index,
    required this.degree,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 8),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: kwhite,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: const Color.fromARGB(255, 238, 236, 236)),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 6),
            decoration: const BoxDecoration(
                color: Color.fromARGB(255, 15, 187, 195),
                shape: BoxShape.circle),
            height: 28,
            // width: 20,
            child: Center(
              child: semiBoldChoiceText(
                text: index,
                size: 16,
                color: kwhite,
              ),
            ),
          ),
          wBox,
          Expanded(
            child: semiBoldChoiceText(
              text: degree,
              size: 11,
              // overflow: TextOverflow.visible,
            ),
          )
        ],
      ),
    );
  }
}
