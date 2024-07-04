import 'package:aimshala/controllers/aimcet_test_controller.dart';
import 'package:aimshala/utils/common/widgets/colors_common.dart';
import 'package:aimshala/utils/widgets/widgets_common.dart';
import 'package:aimshala/view/AIMCET_test/AIMCET_RESULT_Screen/widgets/aimcet_res_download_container.dart';
import 'package:aimshala/view/AIMCET_test/AIMCET_RESULT_Screen/widgets/discovery_container.dart';
import 'package:aimshala/view/AIMCET_test/AIMCET_RESULT_Screen/widgets/mentorship_container.dart';
import 'package:aimshala/view/AIMCET_test/AIMCET_RESULT_Screen/widgets/review_widgets.dart';
import 'package:aimshala/view/AIMCET_test/AIMCET_RESULT_Screen/widgets/topcareer_container.dart';
import 'package:aimshala/view/AIMCET_test/AIMCET_RESULT_Screen/widgets/topdegree_container.dart';
import 'package:aimshala/view/AIMCET_test/AIMCET_RESULT_Screen/widgets/widgets.dart';
import 'package:aimshala/view/AIMCET_test/AIMCET_widgets/aimcet_images.dart';
import 'package:aimshala/view/AIMCET_test/AIMCET_widgets/aimcet_widgets.dart';
import 'package:aimshala/view/AIMCET_test/Personality-Report/personality_report_screen.dart';
import 'package:aimshala/view/AIMCET_test/Trait-Report/trait_report_screen.dart';
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
    final data = controller.personalityReport;
    final trait = controller.traitReport;
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
          color: kwhite,
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
                                    salary:
                                        '(Avg Salary ${salaryRanges[index]})',
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
                // hLBox,
                StatefulBuilder(
                    builder: (BuildContext context, StateSetter setState) {
                  // log('value===>$initialVal');
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
                      initialVal == 0
                          ? Obx(
                              () {
                                if (controller.gp.value == 'wait') {
                                  return fetchErrorText(
                                      text: "REPORT is processing");
                                } else if (controller.gp.value == "sucess") {
                                  return PersonalityReportPage(
                                      controller: controller, data: data);
                                } else if (controller.gp.value ==
                                    "personality-e") {
                                  return fetchErrorText(
                                      text: "REPORT Fetch failed...");
                                } else {
                                  return fetchErrorText(
                                      text: "REPORT Fetch failed...");
                                }
                              },
                            )
                          : Obx(
                              () {
                                if (controller.gp.value == 'wait') {
                                  return fetchErrorText(
                                      text: "REPORT is processing");
                                } else if (controller.gp.value == "sucess") {
                                  return TraitReportPage(
                                      controller: controller, data: trait);
                                } else if (controller.gp.value == "trait-e") {
                                  return fetchErrorText(
                                      text: "REPORT Fetch failed...");
                                } else {
                                  return fetchErrorText(
                                      text: "REPORT Fetch failed...");
                                }
                              },
                            ),
                    ],
                  );
                }),
                hMBox,
                ratingContainer(),
                choiceSizedBox(height: 12),
                writeReview(),
                userReviewWidget(),
                userReviewWidget(),
                Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 5, vertical: 12),
                  child: reviewWriteViewButton(matter: 'Show All Reviews'),
                ),
                hMBox,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
