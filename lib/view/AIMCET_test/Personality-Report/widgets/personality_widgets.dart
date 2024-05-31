import 'package:aimshala/utils/common/colors_common.dart';
import 'package:aimshala/utils/common/text_common.dart';
import 'package:aimshala/utils/widgets/widgets_common.dart';
import 'package:aimshala/view/AIMCET_test/AIMCET_widgets/aimcet_texts.dart';
import 'package:flutter/material.dart';

Widget personalityContainer(
    {required String image,
    required String text,
    required Widget listGenerate}) {
  return Container(
    decoration: personConDecoration(),
    padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 18,
              width: 18,
              child: Image.asset(
                image,
                // color: Colors.purple,
              ),
            ),
            wBox,
            personHeadingText(text: text, size: 14),
          ],
        ),
        hBox,
        listGenerate,
      ],
    ),
  );
}

BoxDecoration personConDecoration() {
  return BoxDecoration(
    color: kwhite,
    border: Border.all(
      width: 1,
      color: const Color.fromARGB(255, 238, 236, 236),
    ),
    borderRadius: BorderRadius.circular(8),
  );
}

Widget personSkillContainer(
    {required String image, required String title, required String description}) {
  return Container(
    margin: const EdgeInsets.only(right: 8),
    padding: const EdgeInsets.fromLTRB(20, 7, 20, 10),
    width: 228,
    // height: 168,
    decoration: BoxDecoration(
        color: kwhite,
        border: Border.all(
          width: 1,
          color: const Color.fromARGB(255, 227, 224, 224),
        ),
        borderRadius: BorderRadius.circular(8)),
    child: Column(
      children: [
        Image.asset(
          image,
          fit: BoxFit.contain,
        ),
        boldText(text: title, size: 14),
        primarytxt(description, 12)
      ],
    ),
  );
}

Widget personReportImageContainer(
    {required String userName, required String image}) {
  return Container(
    padding: const EdgeInsets.symmetric(vertical: 35),
    decoration: BoxDecoration(
      image: DecorationImage(image: AssetImage(image), fit: BoxFit.cover),
    ),
    // height: 100,
    width: double.infinity,
    child: Column(
      children: [
        Text(
          "$userName's",
          style: const TextStyle(
              fontSize: 18, color: Color.fromARGB(255, 244, 63, 238)),
        ),
        Text(
          "Personality Report",
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 20,
            color: kwhite,
          ),
        ),
      ],
    ),
  );
}
