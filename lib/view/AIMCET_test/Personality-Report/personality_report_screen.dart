import 'package:aimshala/controllers/aimcet_test_controller.dart';
import 'package:aimshala/utils/common/widgets/colors_common.dart';
import 'package:aimshala/utils/widgets/widgets_common.dart';
import 'package:aimshala/view/AIMCET_test/AIMCET_widgets/aimcet_images.dart';
import 'package:aimshala/view/AIMCET_test/AIMCET_widgets/aimcet_texts.dart';
import 'package:aimshala/view/AIMCET_test/AIMCET_widgets/aimcet_widgets.dart';
import 'package:aimshala/view/AIMCET_test/Personality-Report/widgets/personality_widgets.dart';
import 'package:aimshala/view/home/widget/const.dart';
import 'package:flutter/material.dart';

class PersonalityReportPage extends StatelessWidget {
  final AIMCETController controller;
  final dynamic data;
  const PersonalityReportPage({super.key, required this.controller, this.data});

  @override
  Widget build(BuildContext context) {
    if (data == null) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
    return Container(
      color: kwhite,
      child: Column(
        children: [
          buildHorizontalScrollSection(controller, data),
          buildDetailedReportSection(data),
        ],
      ),
    );
  }
}

Widget buildHorizontalScrollSection(AIMCETController controller, dynamic data) {
  List<String> personalityexplanation = [
    data.learnExplanation.toString(),
    data.showSkills.toString(),
    data.showStrengths.toString(),
  ];
  return Container(
    color: kwhite,
    padding: const EdgeInsets.symmetric(vertical: 24),
    child: SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: IntrinsicHeight(
        child: Row(
          children: List.generate(
            reportImages.length,
            (index) {
              if (index == 0) {
                return Row(
                  children: [
                    homeCWB,
                    personSkillContainer(
                      image: reportImages[index],
                      title: 'Learn About ${controller.personality[0]}',
                      description: personalityexplanation[index],
                    ),
                  ],
                );
              } else {
                return personSkillContainer(
                  image: reportImages[index],
                  title: personalityHTexts[index],
                  description: personalityexplanation[index],
                );
              }
            },
          ),
        ),
      ),
    ),
  );
}

Widget buildDetailedReportSection(dynamic data) {
  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 16),
    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
    decoration: personConDecoration(),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        personalityTwoText(
          text1: "You are a",
          text2: data.personalityType.toString(),
        ),
        hBox,
        personPlainText(
          text: data.personalityDescription.toString(),
          size: 12,
        ),
        hBox,
        buildSection('Skills you can focus on', data.topSkills),
        hBox,
        buildSection('Tendencies to be careful of', data.careerTendencies),
        hBox,
        buildSection('You working style', data.workingStyle),
        hMBox,
        buildContainerSection(
          'assets/images/strength.png',
          'Strengths',
          data.strengths,
        ),
        hMBox,
        buildContainerSection(
          'assets/images/watchout.png',
          'Watch out for',
          data.cautiousAreas,
        ),
        hMBox,
        buildContainerSection(
          'assets/images/teaminteraction.png',
          'Team interaction',
          data.teamInteraction,
        ),
        hMBox,
        buildContainerSection(
          'assets/images/personalstyle.png',
          'Personal style',
          data.personalStyle,
        ),
        hMBox,
        buildContainerSection(
          'assets/images/workenvironment.png',
          'Ideal work environment',
          data.idealWorkEnvironment,
        ),
        hMBox,
        buildContainerSection(
          'assets/images/values.png',
          'Values',
          data.valueOfPersonalityReport,
        ),
      ],
    ),
  );
}

Widget buildSection(String title, dynamic data) {
  if (data is List) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        personHeadingText(text: title, size: 14),
        hBox,
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: List.generate(
            data.length,
            (index) {
              return Row(
                children: [
                  personPlainText(text: "•", size: 12),
                  wBox,
                  personPlainText(text: data[index], size: 12),
                ],
              );
            },
          ),
        ),
      ],
    );
  } else if (data is String) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        personHeadingText(text: title, size: 14),
        hBox,
        personPlainText(text: data, size: 12),
      ],
    );
  }
  return shrinked;
}

Widget buildContainerSection(String image, String text, List<String>? data) {
  if (data == null) return shrinked;
  return personalityContainer(
    image: image,
    text: text,
    listGenerate: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: List.generate(
        data.length,
        (index) {
          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              personPlainText(text: "•", size: 12),
              wBox,
              Expanded(
                child: personPlainText(text: data[index], size: 12),
              ),
            ],
          );
        },
      ),
    ),
  );
}
