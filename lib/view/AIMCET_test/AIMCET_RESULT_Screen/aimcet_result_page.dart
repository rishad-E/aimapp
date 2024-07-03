import 'dart:developer';

import 'package:aimshala/controllers/aimcet_test_controller.dart';
import 'package:aimshala/utils/common/widgets/colors_common.dart';
import 'package:aimshala/utils/widgets/widgets_common.dart';
import 'package:aimshala/view/AIMCET_test/AIMCET_RESULT_Screen/widgets/aimcet_res_download_container.dart';
import 'package:aimshala/view/AIMCET_test/AIMCET_RESULT_Screen/widgets/discovery_container.dart';
import 'package:aimshala/view/AIMCET_test/AIMCET_RESULT_Screen/widgets/mentorship_container.dart';
import 'package:aimshala/view/AIMCET_test/AIMCET_RESULT_Screen/widgets/personality_container.dart';
import 'package:aimshala/view/AIMCET_test/AIMCET_RESULT_Screen/widgets/topcareer_container.dart';
import 'package:aimshala/view/AIMCET_test/AIMCET_RESULT_Screen/widgets/topdegree_container.dart';
import 'package:aimshala/view/AIMCET_test/AIMCET_RESULT_Screen/widgets/trait_container.dart';
import 'package:aimshala/view/AIMCET_test/AIMCET_RESULT_Screen/widgets/widgets.dart';
import 'package:aimshala/view/AIMCET_test/AIMCET_widgets/aimcet_images.dart';
import 'package:aimshala/view/AIMCET_test/AIMCET_widgets/aimcet_texts.dart';
import 'package:aimshala/view/AIMCET_test/AIMCET_widgets/aimcet_widgets.dart';
import 'package:aimshala/view/AIMCET_test/Personality-Report/personality_report_screen.dart';
import 'package:aimshala/view/AIMCET_test/Personality-Report/widgets/personality_widgets.dart';
import 'package:aimshala/view/home/home.dart';
import 'package:aimshala/view/home/widget/const.dart';
import 'package:aimshala/view/home/widget/home_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AIMCETResultScreen extends StatelessWidget {
  final String userName;
  final String uId;
  const AIMCETResultScreen(
      {super.key, required this.userName, required this.uId});

  @override
  Widget build(BuildContext context) {
    int initialVal = 0;
    final controller = Get.put(AIMCETController());
    return PopScope(
      onPopInvoked: (didPop) {
        Future.microtask(() {
          controller.checkAimcetTestTakenFunction(userId: uId);
          Get.offAll(() => const HomeScreen());
        });
      },
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: aimcetResultAppBar(),
        body: Container(
          padding: const EdgeInsets.only(top: 10),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset('assets/images/aimcetResult.png'),
                Container(
                  // color: Colors.yellow,
                  decoration: report3Container(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 18, top: 25),
                        child: headersHome(
                            text1: 'Your',
                            text2: 'Discoveries',
                            divColor: const Color.fromARGB(255, 148, 39, 143)),
                      ),
                      hMBox,
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 18, right: 10, bottom: 15),
                        child: Text(
                          'Based on your responses, here are some characteristics that make you unique compared to everyone else.',
                          style: TextStyle(color: textFieldColor, fontSize: 12),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(children: [
                          homeCWB,
                          ...List.generate(
                            controller.personality.length,
                            (index) {
                              return Row(
                                children: [
                                  DiscoveryContainer(
                                    personality: controller.personality[index],
                                    image: discoveryImages[index],
                                  ),
                                ],
                              );
                            },
                          ),
                        ]),
                      ),
                      hBox,
                      Padding(
                        padding: const EdgeInsets.only(left: 18, top: 25),
                        child: headersHome(
                            text1: 'Your',
                            text2: 'Top Careers',
                            divColor: const Color.fromARGB(255, 148, 39, 143)),
                      ),
                      hMBox,
                      controller.careers.isEmpty
                          ? notReadyContainer(
                              text: 'Your career result is not processed')
                          : Container(
                              height: 160,
                              padding: const EdgeInsets.only(left: 15),
                              child: GridView.builder(
                                scrollDirection: Axis.horizontal,
                                gridDelegate:
                                    const SliverGridDelegateWithMaxCrossAxisExtent(
                                  maxCrossAxisExtent: 110,
                                  childAspectRatio: 2 / 6,
                                  crossAxisSpacing: 10,
                                  mainAxisSpacing: 5,
                                ),
                                itemCount: controller.careers.length,
                                itemBuilder: (BuildContext ctx, index) {
                                  List<String> careersType = [];
                                  List<String> salaryRanges = [];
                                  for (var item in controller.careers) {
                                    List<String> parts =
                                        item.split(" - Salary range: ");
                                    if (parts.length == 2) {
                                      careersType.add(parts[0]);
                                      salaryRanges.add(parts[1]);
                                    }
                                  }
                                  return TopCareerContainer(
                                    index: (index + 1).toString(),
                                    careers: careersType[index],
                                    salary: salaryRanges[index],
                                  );
                                },
                              ),
                            ),
                      hLBox,
                    ],
                  ),
                ),
                const DiscoveryShareContainer(),
                const TestResDownloadPage(),
                Container(
                  decoration: colorGradient3(),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 18, top: 25),
                        child: headersHome(
                            text1: 'Your',
                            text2: 'Top Degrees',
                            divColor: const Color.fromARGB(255, 148, 39, 143)),
                      ),
                      hMBox,
                      controller.degrees.isEmpty
                          ? notReadyContainer(
                              text: 'Your career result is not processed',
                            )
                          : Container(
                              height: 150,
                              padding: const EdgeInsets.only(left: 15),
                              child: GridView.builder(
                                scrollDirection: Axis.horizontal,
                                gridDelegate:
                                    const SliverGridDelegateWithMaxCrossAxisExtent(
                                  maxCrossAxisExtent: 110,
                                  childAspectRatio: 2 / 6.5,
                                  crossAxisSpacing: 10,
                                  mainAxisSpacing: 3,
                                ),
                                itemCount: controller.degrees.length,
                                itemBuilder: (BuildContext ctx, index) {
                                  return TopDegreeContainer(
                                    index: (index + 1).toString(),
                                    degree: controller.degrees[index],
                                  );
                                },
                              ),
                            ),
                      hLBox,
                      Padding(
                        padding: const EdgeInsets.only(left: 18, top: 25),
                        child: headersHome(
                            text1: 'Your',
                            text2: 'Mentorship programs',
                            divColor: const Color.fromARGB(255, 148, 39, 143)),
                      ),
                      hMBox,
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: List.generate(
                            4,
                            (index) {
                              return Row(
                                children: [
                                  homeCWB,
                                  const MentorshipContainer()
                                ],
                              );
                            },
                          ),
                        ),
                      ),
                      hLBox,
                    ],
                  ),
                ),
                hLBox,
                StatefulBuilder(
                    builder: (BuildContext context, StateSetter setState) {
                  final data = controller.personalityReport;
                  log('value===>$initialVal');
                  return Column(
                    children: [
                      reportButtonContainer(
                        child: Row(
                          children: [
                            personalityReportButton(
                              onTap: () {
                                setState(() {
                                  initialVal = 0;
                                });
                              },
                              boxColor: initialVal == 0 ? mainPurple : kwhite,
                              textColor: initialVal == 0 ? kwhite : mainPurple,
                            ),
                            traitReportButton(
                              onTap: () {
                                setState(() {
                                  initialVal = 1;
                                });
                              },
                              boxColor: initialVal == 0 ? kwhite : mainPurple,
                              textColor: initialVal == 0 ? mainPurple : kwhite,
                            ),
                          ],
                        ),
                      ),
                      // hLBox,
                      initialVal == 0
                          ? data == null
                              ? shrinked
                              : Column(
                                  children: [
                                    buildHorizontalScrollSection(
                                        controller, data),
                                    buildDetailedReportSection(data),
                                  ],
                                )
                          : const Center(child: CircularProgressIndicator()),
                    ],
                  );
                }),
                hLBox,
              ],
            ),
          ),
        ),
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
    decoration: report3Container(),
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

 // Container(
 //   decoration: personalityTrairContainerGradient(),
 //   child: Column(
 //     children: [
 //       hLBox,
 //       PersonalityContainer(userName: userName),
 //       hMBox,
 //       TraitContainer(userName: userName),
 //       hMBox,
 //     ],
 //   ),
 // ),



 // PersonalityReportPage(userName: userName),
 // initialVal == 0
 //     ? Obx(
 //         () {
 //           if (controller.gp.value == 'wait') {
 //             return fetchErrorText(
 //                 text: "REPORT is processing");
 //           } else if (controller.gp.value == "sucess") {
 //             return PersonalityContainer(
 //                 userName: userName);
 //           } else if (controller.gp.value ==
 //               "personality-e") {
 //             return fetchErrorText(
 //                 text: "REPORT Fetch failed...");
 //           } else {
 //             return fetchErrorText(
 //                 text: "REPORT Fetch failed...");
 //           }
 //         },
 //       )
 //     : Obx(
 //         () {
 //           if (controller.gp.value == 'wait') {
 //             return fetchErrorText(
 //                 text: "REPORT is processing");
 //           } else if (controller.gp.value == "sucess") {
 //             return TraitContainer(userName: userName);
 //           } else if (controller.gp.value ==
 //               "personality-e") {
 //             return fetchErrorText(
 //                 text: "REPORT Fetch failed...");
 //           } else {
 //             return fetchErrorText(
 //                 text: "REPORT Fetch failed...");
 //           }
 //         },
 //       )
 // hMBox,