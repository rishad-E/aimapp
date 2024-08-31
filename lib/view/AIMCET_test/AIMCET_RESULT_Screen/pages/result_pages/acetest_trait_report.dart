import 'package:aimshala/utils/common/widgets/colors_common.dart';
import 'package:aimshala/utils/common/widgets/text_common.dart';
import 'package:aimshala/utils/widgets/widgets_common.dart';
import 'package:aimshala/view/AIMCET_test/AIMCET_RESULT_Screen/pages/result_widgets/result_widgets.dart';
import 'package:aimshala/view/profile/common/widgets/texts.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class TraitsReportPage extends StatelessWidget {
  const TraitsReportPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, top: 5, right: 16),
      child: SingleChildScrollView(
        child: Column(
          children: [
            reportHeadears(tex1t: 'You are an ', text2: 'Architect'),
            choiceSizedBox(height: 22),
            Container(
              color: kwhite,
              padding: const EdgeInsets.all(8),
              child: Column(
                children: [
                  regularText(
                      'Your strongest trait is Investigative, and your second strongest is Realistic, which makes you an Architect. Architects are analytical thinkers who like to work in the physical world. Their diverse nature translates in their ability to think intellectually and apply what they know with physical work, like working with their hands. They are curious about the physical world and how it works. They enjoy intellectual challenges that are unconventional, and love solving complex problems. ',
                      12),
                  Container(
                    height: 290,
                    color: Colors.green.shade300,
                  ),
                  regularText(
                      'Based on the Holland Codes (RIASEC), your Career Explorer Report identifies your dominant career personality types: Realistic, Investigative, Artistic, Social, Enterprising, and Conventional. This model helps align your interests and strengths with the most suitable career paths. ',
                      12),
                ],
              ),
            ),
            choiceSizedBox(height: 10),
            ...List.generate(
              6,
              (index) => raisecItems(),
            ),
            hLBox
          ],
        ),
      ),
    );
  }
}

Widget raisecItems() {
  return Container(
    margin: const EdgeInsets.symmetric(vertical: 4),
    padding: const EdgeInsets.all(8),
    decoration: BoxDecoration(
        color: kwhite,
        border: Border.all(color: textFieldColor.withOpacity(.2), width: 1)),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        boldText(text: 'Realistic (R)', size: 14),
        choiceSizedBox(height: 3),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 2),
          child: Container(
            width: double.infinity,
            color: Colors.yellow,
            height: 15,
            child: LinearPercentIndicator(
              lineHeight: 17,
              padding: EdgeInsets.zero,
              percent: .85,
              progressColor: const Color.fromARGB(255, 34, 180, 110),
              animation: true,
              fillColor: const Color.fromARGB(255, 231, 230, 240),
              center: const Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: EdgeInsets.only(right: 5),
                  child: Text(
                    '85%',
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        Row(
          children: [
            semiBoldChoiceText(
                text: 'Traits:',
                color: const Color.fromARGB(255, 122, 122, 122)),
            regularText(' Practical, hands-on, enjoys physical objects. ', 12,
                color: const Color.fromARGB(255, 116, 118, 119))
          ],
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            semiBoldChoiceText(
                text: 'Activities:',
                color: const Color.fromARGB(255, 122, 122, 122)),
            Expanded(
              child: regularText(
                  ' Mechanical skills, physical strength, coordination.', 12,
                  color: const Color.fromARGB(255, 116, 118, 119)),
            )
          ],
        ),
      ],
    ),
  );
}
