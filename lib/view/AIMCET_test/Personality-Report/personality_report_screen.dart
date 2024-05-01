import 'package:aimshala/controllers/aimcet_test_controller.dart';
import 'package:aimshala/utils/widgets/widgets_common.dart';
import 'package:aimshala/view/AIMCET_test/AIMCET_widgets/aimcet_images.dart';
import 'package:aimshala/view/AIMCET_test/AIMCET_widgets/aimcet_texts.dart';
import 'package:aimshala/view/AIMCET_test/AIMCET_widgets/aimcet_widgets.dart';
import 'package:aimshala/view/AIMCET_test/Personality-Report/widgets/personality_widgets.dart';
import 'package:aimshala/view/home/widget/const.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PersonalityReportPage extends StatelessWidget {
  final String userName;
  const PersonalityReportPage({super.key, required this.userName});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AIMCETController());
    final data = controller.personalityReport;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: aimcetResultAppBar(),
      body: Container(
        padding: const EdgeInsets.only(top: 85),
        child: SingleChildScrollView(
          child: Column(
            children: [
              personReportImageContainer(
                userName: userName,
                image: 'assets/images/resultbg-1.png',
              ),
              Container(
                decoration: report3Container(),
                padding: const EdgeInsets.symmetric(vertical: 24),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: IntrinsicHeight(
                    child: Row(
                      children: List.generate(
                        reportImages.length,
                        (index) {
                          List<String> personalityexplanation = [
                            data!.learnExplanation.toString(),
                            data.showSkills.toString(),
                            data.showStrengths.toString(),
                          ];
                          if (index == 0) {
                            return Row(
                              children: [
                                homeCWB,
                                personSkillContainer(
                                  image: reportImages[index],
                                  text: 'Learn About ${controller.personality[0]}',
                                  text2: personalityexplanation[index],
                                )
                              ],
                            );
                          } else {
                            return personSkillContainer(
                              image: reportImages[index],
                              text: personalityHTexts[index],
                              text2: personalityexplanation[index],
                            );
                          }
                        },
                      ),
                    ),
                  ),
                ),
              ),
              hLBox,
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 16),
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                decoration: personConDecoration(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    personalityTwoText(
                        text1: "You are a",
                        text2: data!.personalityType.toString()),
                    hBox,
                    personPlainText(
                      text: data.personalityDescription.toString(),
                      size: 12,
                    ),
                    hBox,
                    personHeadingText(
                        text: 'Skills you can focus on', size: 14),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: List.generate(
                          data.topSkills!.length,
                          (index) {
                            return Row(
                              children: [
                                personPlainText(text: "•", size: 12),
                                wBox,
                                personPlainText(
                                    text: data.topSkills![index], size: 12)
                              ],
                            );
                          },
                        ),
                      ),
                    ),
                    hBox,
                    personHeadingText(
                        text: 'Tendencies to be careful of', size: 14),
                    hBox,
                    personPlainText(
                      text: data.careerTendencies.toString(),
                      size: 12,
                    ),
                    hBox,
                    personHeadingText(text: 'You working style', size: 14),
                    hBox,
                    personPlainText(
                      text: data.workingStyle.toString(),
                      size: 12,
                    ),
                    hMBox,
                    personalityContainer(
                      image: "assets/images/strength.png",
                      text: 'Strengths',
                      listGenerate: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: List.generate(
                          data.strengths!.length,
                          (index) {
                            return Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                personPlainText(text: "•", size: 12),
                                wBox,
                                Expanded(
                                  child: personPlainText(
                                      text: data.strengths![index], size: 12),
                                )
                              ],
                            );
                          },
                        ),
                      ),
                    ),
                    hMBox,
                    personalityContainer(
                      image: "assets/images/watchout.png",
                      text: 'Watch out for',
                      listGenerate: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: List.generate(
                          data.cautiousAreas!.length,
                          (index) {
                            return Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                personPlainText(text: "•", size: 12),
                                wBox,
                                Expanded(
                                  child: personPlainText(
                                      text: data.cautiousAreas![index],
                                      size: 12),
                                )
                              ],
                            );
                          },
                        ),
                      ),
                    ),
                    hMBox,
                    personalityContainer(
                      image: "assets/images/teaminteraction.png",
                      text: 'Team interaction',
                      listGenerate: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: List.generate(
                          data.teamInteraction!.length,
                          (index) {
                            return Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                personPlainText(text: "•", size: 12),
                                wBox,
                                Expanded(
                                    child: personPlainText(
                                        text: data.teamInteraction![index],
                                        size: 12))
                              ],
                            );
                          },
                        ),
                      ),
                    ),
                    hMBox,
                    personalityContainer(
                      image: "assets/images/personalstyle.png",
                      text: 'Personal style',
                      listGenerate: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: List.generate(
                          data.personalStyle!.length,
                          (index) {
                            return Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                personPlainText(text: "•", size: 12),
                                wBox,
                                Expanded(
                                  child: personPlainText(
                                      text: data.personalStyle![index],
                                      size: 12),
                                )
                              ],
                            );
                          },
                        ),
                      ),
                    ),
                    hMBox,
                    personalityContainer(
                      image: "assets/images/workenvironment.png",
                      text: 'Ideal work enviorment',
                      listGenerate: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: List.generate(
                          data.idealWorkEnvironment!.length,
                          (index) {
                            return Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                personPlainText(text: "•", size: 12),
                                wBox,
                                Expanded(
                                    child: personPlainText(
                                        text: data.idealWorkEnvironment![index],
                                        size: 12))
                              ],
                            );
                          },
                        ),
                      ),
                    ),
                    hMBox,
                    personalityContainer(
                      image: "assets/images/values.png",
                      text: 'Values',
                      listGenerate: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: List.generate(
                          data.valueOfPersonalityReport!.length,
                          (index) {
                            return Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                personPlainText(text: "•", size: 12),
                                wBox,
                                Expanded(
                                    child: personPlainText(
                                        text: data
                                            .valueOfPersonalityReport![index],
                                        size: 12))
                              ],
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              hLBox,
            ],
          ),
        ),
      ),
    );
  }
}
