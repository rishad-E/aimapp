import 'package:aimshala/controllers/aimcet_test_controller.dart';
import 'package:aimshala/utils/widgets/widgets_common.dart';
import 'package:aimshala/view/AIMCET_test/AIMCET_widgets/aimcet_images.dart';
import 'package:aimshala/view/AIMCET_test/AIMCET_widgets/aimcet_widgets.dart';
import 'package:aimshala/view/AIMCET_test/Personality-Report/widgets/personality_widgets.dart';
import 'package:aimshala/view/AIMCET_test/Trait-Report/widgets/broad_percentage_indicator.dart';
import 'package:aimshala/view/AIMCET_test/Trait-Report/widgets/detailed_percentage_indicator.dart';
import 'package:aimshala/view/AIMCET_test/Trait-Report/widgets/pie_chart_page.dart';
import 'package:aimshala/view/AIMCET_test/Trait-Report/widgets/trait_widgets.dart';
import 'package:aimshala/view/home/widget/const.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TraitReportScreen extends StatelessWidget {
  final String userName;
  const TraitReportScreen({super.key, required this.userName});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AIMCETController());
    final data = controller.traitReport;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: aimcetResultAppBar(),
      body: Container(
        padding: const EdgeInsets.only(top: 85),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              traitReportImageContainer(
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
                          List<String> traitContainer = [
                            'You are a ${data!.traitType}. Your strongest trait is ${data.topRiasec![0]}, and second strongest trait is ${data.topRiasec![1]}.',
                            data.detailedInterests.toString(),
                            data.yourMustHavesSentence.toString(),
                          ];
                          if (index == 0) {
                            return Row(
                              children: [
                                homeCWB,
                                personSkillContainer(
                                  image: reportImages[index],
                                  text: personalityHTexts[index],
                                  text2: traitContainer[index],
                                )
                              ],
                            );
                          } else {
                            return personSkillContainer(
                              image: reportImages[index],
                              text: personalityHTexts[index],
                              text2: traitContainer[index],
                            );
                          }
                        },
                      ),
                    ),
                  ),
                ),
              ),
              hLBox,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    traitTwoText(text1: 'You Broad', text2: 'Interests'),
                    hBox,
                    traitPlainText(
                        text:
                            'Detailed interests are work activities that tend to cluster together. They are more specific than Holland codes, allowing for finer distinctions between areas of interest. A career can usually be described by a small number of basic interests. Showing nterestin the activities that best describe a career is an excellent indicator of a match with that career.',
                        size: 12),
                    hBox,
                    SizedBox(
                      height: 200,
                      child: TraitPieChart(riasec: data!.riasec),
                    ),
                    hBox,
                    piechartTexts(
                      color1: const Color.fromARGB(255, 2, 213, 255),
                      text1: 'Realistic',
                      color2: const Color.fromARGB(255, 181, 23, 158),
                      text2: 'Social',
                    ),
                    hBox,
                    piechartTexts(
                      color1: const Color.fromARGB(255, 46, 0, 119),
                      text1: 'Investigative',
                      color2: const Color.fromARGB(255, 86, 11, 173),
                      text2: 'Enterprising',
                    ),
                    hBox,
                    piechartTexts(
                      color1: const Color.fromARGB(255, 46, 147, 250),
                      text1: 'Artistic',
                      color2: const Color.fromARGB(255, 144, 9, 183),
                      text2: 'Conventional',
                    ),
                    hMBox,
                    traitHeadingText(text: 'Your Detailed Interests', size: 14),
                    traitPlainText(
                        text:
                            "Must Haves reflect a person's values and priorities. They are needs that affect satisfaction. Match is greatest when a career fulfills a person's core needs; match is weakest when important needs go unsatisfied.",
                        size: 12),
                    hMBox,
                    Container(
                      decoration: reportDecoration(),
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: traitListMainContainer(
                              title: "Very Interested",
                              list: List.generate(
                                data.veryInterested!.length,
                                (index) {
                                  return traitListContainer(
                                    data: data.veryInterested![index],
                                    bgColor:
                                        const Color.fromARGB(255, 0, 180, 216)
                                            .withOpacity(0.1),
                                    textColor:
                                        const Color.fromARGB(255, 0, 180, 216),
                                  );
                                },
                              ),
                            ),
                          ),
                          traitDivider(),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: traitListMainContainer(
                              title: "Interested",
                              list: List.generate(
                                data.interested!.length,
                                (index) {
                                  return traitListContainer(
                                    data: data.interested![index],
                                    bgColor:
                                        const Color.fromARGB(255, 59, 0, 154)
                                            .withOpacity(0.1),
                                    textColor:
                                        const Color.fromARGB(255, 59, 0, 154),
                                  );
                                },
                              ),
                            ),
                          ),
                          traitDivider(),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: traitListMainContainer(
                              title: "Neutral",
                              list: List.generate(
                                data.neutral!.length,
                                (index) {
                                  return traitListContainer(
                                    data: data.neutral![index],
                                    bgColor:
                                        const Color.fromARGB(255, 247, 37, 133)
                                            .withOpacity(0.1),
                                    textColor:
                                        const Color.fromARGB(255, 247, 37, 133),
                                  );
                                },
                              ),
                            ),
                          ),
                          traitDivider(),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: traitListMainContainer(
                              title: "Uninterested",
                              list: List.generate(
                                data.uninterested!.length,
                                (index) {
                                  return traitListContainer(
                                    data: data.uninterested![index],
                                    bgColor:
                                        const Color.fromARGB(255, 181, 23, 158)
                                            .withOpacity(0.1),
                                    textColor:
                                        const Color.fromARGB(255, 181, 23, 158),
                                  );
                                },
                              ),
                            ),
                          ),
                          hBox,
                        ],
                      ),
                    ),
                    hMBox,
                    traitHeadingText(text: 'Have Not Haves', size: 14),
                    traitPlainText(
                        text:
                            "\"Have Not Haves\" are essential values and priorities of a person. They are crucial for satisfaction. The best career match happens when it meets these core needs; the worst match occurs when these needs are unmet.",
                        size: 12),
                    hMBox,
                    Container(
                      decoration: reportDecoration(),
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: traitListMainContainer(
                              title: "Very Important",
                              list: List.generate(
                                data.yourMustHaves!.length,
                                (index) {
                                  return traitListContainer(
                                    data: data.yourMustHaves![index],
                                    bgColor:
                                        const Color.fromARGB(255, 0, 180, 216)
                                            .withOpacity(0.1),
                                    textColor:
                                        const Color.fromARGB(255, 0, 180, 216),
                                  );
                                },
                              ),
                            ),
                          ),
                          traitDivider(),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: traitListMainContainer(
                              title: "Important",
                              list: List.generate(
                                data.importantHaves!.length,
                                (index) {
                                  return traitListContainer(
                                    data: data.importantHaves![index],
                                    bgColor:
                                        const Color.fromARGB(255, 59, 0, 154)
                                            .withOpacity(0.1),
                                    textColor:
                                        const Color.fromARGB(255, 59, 0, 154),
                                  );
                                },
                              ),
                            ),
                          ),
                          traitDivider(),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: traitListMainContainer(
                              title: "Neutral",
                              list: List.generate(
                                data.neutralHaves!.length,
                                (index) {
                                  return traitListContainer(
                                    data: data.neutralHaves![index],
                                    bgColor:
                                        const Color.fromARGB(255, 247, 37, 133)
                                            .withOpacity(0.1),
                                    textColor:
                                        const Color.fromARGB(255, 247, 37, 133),
                                  );
                                },
                              ),
                            ),
                          ),
                          hBox,
                        ],
                      ),
                    ),
                    hMBox,
                    traitHeadingText(text: "You Can't Stands", size: 14),
                    traitPlainText(
                        text:
                            "\"Can't Stands\" are things people dislike in work environments, like certain physical or social elements. They're deal-breakers that can lead to job dissatisfaction. A career is a poor fit if it includes these disliked factors.",
                        size: 12),
                    hMBox,
                    Container(
                      decoration: reportDecoration(),
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: traitListMainContainer(
                              title: "Take It Or Leave It",
                              list: List.generate(
                                data.dislikeWorkEnvTakeIt!.length,
                                (index) {
                                  return traitListContainer(
                                    data: data.dislikeWorkEnvTakeIt![index],
                                    bgColor:
                                        const Color.fromARGB(255, 0, 180, 216)
                                            .withOpacity(0.1),
                                    textColor:
                                        const Color.fromARGB(255, 0, 180, 216),
                                  );
                                },
                              ),
                            ),
                          ),
                          traitDivider(),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: traitListMainContainer(
                              title: "Don't Mind It",
                              list: List.generate(
                                data.dislikeWorkEnvDontMindIt!.length,
                                (index) {
                                  return traitListContainer(
                                    data: data.dislikeWorkEnvDontMindIt![index],
                                    bgColor:
                                        const Color.fromARGB(255, 59, 0, 154)
                                            .withOpacity(0.1),
                                    textColor:
                                        const Color.fromARGB(255, 59, 0, 154),
                                  );
                                },
                              ),
                            ),
                          ),
                          hBox,
                        ],
                      ),
                    ),
                    hMBox,
                    traitHeadingText(text: "Your Skills Preferences", size: 14),
                    traitPlainText(
                        text:
                            "Skills Preferences are about wanting or not wanting a job that needs certain skills. It's about enjoying a skill, not being good at it. A career is a great match if it uses skills you enjoy; it's a poor match if it needs skills you prefer to avoid.",
                        size: 12),
                    hMBox,
                    Container(
                      decoration: reportDecoration(),
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: traitListMainContainer(
                              title: "Highly Preferred",
                              list: List.generate(
                                data.skillsHighlyPreferred!.length,
                                (index) {
                                  return traitListContainer(
                                    data: data.skillsHighlyPreferred![index],
                                    bgColor:
                                        const Color.fromARGB(255, 0, 180, 216)
                                            .withOpacity(0.1),
                                    textColor:
                                        const Color.fromARGB(255, 0, 180, 216),
                                  );
                                },
                              ),
                            ),
                          ),
                          traitDivider(),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: traitListMainContainer(
                              title: "Preferred",
                              list: List.generate(
                                data.skillsPreferred!.length,
                                (index) {
                                  return traitListContainer(
                                    data: data.skillsPreferred![index],
                                    bgColor:
                                        const Color.fromARGB(255, 59, 0, 154)
                                            .withOpacity(0.1),
                                    textColor:
                                        const Color.fromARGB(255, 59, 0, 154),
                                  );
                                },
                              ),
                            ),
                          ),
                          hBox,
                        ],
                      ),
                    ),
                    hMBox,
                    traitHeadingText(text: "Your Broad Personality", size: 14),
                    traitPlainText(
                        text:
                            "Your personality is comprised of several factors ranging from how independent you are to how much of a leader you are. Below is a more in-depth look at your personality.",
                        size: 12),
                    hMBox,
                    TraitPercentageIndicatorBroad(
                      broadPersonality: data.broadPersonality,
                    ),
                    hMBox,
                    traitHeadingText(
                        text: "Your Detailed Personality", size: 14),
                    traitPlainText(
                        text:
                            "Your personality is comprised of several factors ranging from how independent you are to how much of a leader you are. Below is a more in-depth look at your personality.",
                        size: 12),
                    hMBox,
                    TraitPercentageIndicatorDetailed(
                      detailedPersonality: data.detailedPersonality,
                    ),
                    hLBox,
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
