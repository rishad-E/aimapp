import 'package:aimshala/controllers/aimcet_test_controller.dart';
import 'package:aimshala/utils/widgets/widgets_common.dart';
import 'package:aimshala/view/AIMCET_test/AIMCET_widgets/aimcet_images.dart';
import 'package:aimshala/view/AIMCET_test/AIMCET_widgets/aimcet_widgets.dart';
import 'package:aimshala/view/AIMCET_test/Personality-Report/widgets/personality_widgets.dart';
import 'package:aimshala/view/AIMCET_test/Trait-Report/widgets/broad_percentage_indicator.dart';
import 'package:aimshala/view/AIMCET_test/Trait-Report/widgets/detailed_percentage_indicator.dart';
import 'package:aimshala/view/AIMCET_test/Trait-Report/widgets/pie_chart_page.dart';
import 'package:aimshala/view/AIMCET_test/Trait-Report/widgets/trait_report_textandcolor.dart';
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
      body: data == null
          ? const Center(child: CircularProgressIndicator())
          : Container(
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
                            children: [
                              homeCWB,
                              ...List.generate(
                                reportImages.length,
                                (index) {
                                  List<String> traitContainer = [
                                    "You are a ${data.traitType}.Your strongest trait is ${data.topTwoNames![0]}, and second strongest trait is ${data.topTwoNames![1]}.",
                                    data.dinterests.toString(),
                                    data.yourMHaves.toString(),
                                  ];
                                  return personSkillContainer(
                                    image: reportImages[index],
                                    title: traitHTexts[index],
                                    description: traitContainer[index],
                                  );
                                },
                              ),
                            ],
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
                          traitPlainText(text: broadIntrestText, size: 12),
                          hBox,
                          SizedBox(
                            height: 200,
                            child: TraitPieChart(riasec: data.riasec),
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
                          traitHeadingText(
                              text: 'Your Detailed Interests', size: 14),
                          traitPlainText(
                              text:
                                  'Must Haves reflect a person\'s values and priorities. They are needs that affect satisfaction. Match is greatest when a career fulfills a person\'s core needs; match is weakest when important needs go unsatisfied.',
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
                                      data.veryInterested?.length ?? 0,
                                      (index) {
                                        final item =
                                            data.veryInterested?[index];
                                        return item == null
                                            ? shrinked
                                            : traitListContainer(
                                                data: item,
                                                bgColor: const Color.fromARGB(
                                                        255, 0, 180, 216)
                                                    .withOpacity(0.1),
                                                textColor: const Color.fromARGB(
                                                    255, 0, 180, 216),
                                              );
                                      },
                                    ),
                                    //  List.generate(
                                    //   data.veryInterested!.length,
                                    //   (index) {
                                    //     return traitListContainer(
                                    //       data: data.veryInterested![index],
                                    //       bgColor: const Color.fromARGB(
                                    //               255, 0, 180, 216)
                                    //           .withOpacity(0.1),
                                    //       textColor: const Color.fromARGB(
                                    //           255, 0, 180, 216),
                                    //     );
                                    //   },
                                    // ),
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
                                          bgColor: const Color.fromARGB(
                                                  255, 59, 0, 154)
                                              .withOpacity(0.1),
                                          textColor: const Color.fromARGB(
                                              255, 59, 0, 154),
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
                                          bgColor: const Color.fromARGB(
                                                  255, 247, 37, 133)
                                              .withOpacity(0.1),
                                          textColor: const Color.fromARGB(
                                              255, 247, 37, 133),
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
                                          bgColor: const Color.fromARGB(
                                                  255, 181, 23, 158)
                                              .withOpacity(0.1),
                                          textColor: const Color.fromARGB(
                                              255, 181, 23, 158),
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
                          traitHeadingText(text: 'Your Must Haves', size: 14),
                          traitPlainText(text: mustHaveText, size: 12),
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
                                      data.veryInterestedHaves!.length,
                                      (index) {
                                        return traitListContainer(
                                          data:
                                              data.veryInterestedHaves![index],
                                          bgColor: const Color.fromARGB(
                                                  255, 0, 180, 216)
                                              .withOpacity(0.1),
                                          textColor: const Color.fromARGB(
                                              255, 0, 180, 216),
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
                                          bgColor: const Color.fromARGB(
                                                  255, 59, 0, 154)
                                              .withOpacity(0.1),
                                          textColor: const Color.fromARGB(
                                              255, 59, 0, 154),
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
                                          bgColor: const Color.fromARGB(
                                                  255, 247, 37, 133)
                                              .withOpacity(0.1),
                                          textColor: const Color.fromARGB(
                                              255, 247, 37, 133),
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
                          traitPlainText(text: cantStand, size: 12),
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
                                      data.takeIt!.length,
                                      (index) {
                                        return traitListContainer(
                                          data: data.takeIt![index],
                                          bgColor: const Color.fromARGB(
                                                  255, 0, 180, 216)
                                              .withOpacity(0.1),
                                          textColor: const Color.fromARGB(
                                              255, 0, 180, 216),
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
                                      data.dontIt!.length,
                                      (index) {
                                        return traitListContainer(
                                          data: data.dontIt![index],
                                          bgColor: const Color.fromARGB(
                                                  255, 59, 0, 154)
                                              .withOpacity(0.1),
                                          textColor: const Color.fromARGB(
                                              255, 59, 0, 154),
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
                          traitHeadingText(
                              text: "Your Skills Preferences", size: 14),
                          traitPlainText(text: skillsPreferenceText, size: 12),
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
                                      data.highlyPreferred!.length,
                                      (index) {
                                        return traitListContainer(
                                          data: data.highlyPreferred![index],
                                          bgColor: const Color.fromARGB(
                                                  255, 0, 180, 216)
                                              .withOpacity(0.1),
                                          textColor: const Color.fromARGB(
                                              255, 0, 180, 216),
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
                                      data.preferred!.length,
                                      (index) {
                                        return traitListContainer(
                                          data: data.preferred![index],
                                          bgColor: const Color.fromARGB(
                                                  255, 59, 0, 154)
                                              .withOpacity(0.1),
                                          textColor: const Color.fromARGB(
                                              255, 59, 0, 154),
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
                          traitHeadingText(
                              text: "Your Broad Personality", size: 14),
                          traitPlainText(text: broadPersonalityText, size: 12),
                          hMBox,
                          TraitPercentageIndicatorBroad(
                            broadPersonality: data.broadPersonality,
                          ),
                          hMBox,
                          traitHeadingText(
                              text: "Your Detailed Personality", size: 14),
                          traitPlainText(
                              text: detailedPersonalityText, size: 12),
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
