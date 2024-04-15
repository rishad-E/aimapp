import 'package:aimshala/controllers/aimcet_test_controller.dart';
import 'package:aimshala/utils/common/colors_common.dart';
import 'package:aimshala/utils/widgets/widgets_common.dart';
import 'package:aimshala/view/AIMCET_test/AIMCET_RESULT_Screen/widgets/discovery_container.dart';
import 'package:aimshala/view/AIMCET_test/AIMCET_RESULT_Screen/widgets/mentorship_container.dart';
import 'package:aimshala/view/AIMCET_test/AIMCET_RESULT_Screen/widgets/personality_container.dart';
import 'package:aimshala/view/AIMCET_test/AIMCET_RESULT_Screen/widgets/topcareer_container.dart';
import 'package:aimshala/view/AIMCET_test/AIMCET_RESULT_Screen/widgets/topdegree_container.dart';
import 'package:aimshala/view/AIMCET_test/AIMCET_RESULT_Screen/widgets/trait_container.dart';
import 'package:aimshala/view/AIMCET_test/AIMCET_widgets/aimcet_images.dart';
import 'package:aimshala/view/home/home.dart';
import 'package:aimshala/view/home/widget/const.dart';
import 'package:aimshala/view/home/widget/home_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class AIMCETResultScreen extends StatelessWidget {
  final String userName;
  final String uId;
  const AIMCETResultScreen(
      {super.key, required this.userName, required this.uId});

  @override
  Widget build(BuildContext context) {
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
        appBar: AppBar(
          surfaceTintColor: Colors.white,
          elevation: 7,
          shadowColor: Colors.black.withOpacity(0.5),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10)),
          ),
          title: const Text(
            "Aim CET Results",
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 12),
          ),
          centerTitle: true,
        ),
        body: Container(
          padding: const EdgeInsets.only(top: 10),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset('assets/images/aimcetResult.png'),
                Padding(
                  padding: const EdgeInsets.only(left: 18, top: 25),
                  child: headersHome(
                      text1: 'Your',
                      text2: 'Discoveries',
                      divColor: const Color.fromARGB(255, 148, 39, 143)),
                ),
                hMBox,
                Padding(
                  padding:
                      const EdgeInsets.only(left: 18, right: 10, bottom: 15),
                  child: Text(
                    'Based on your responses, here are some characteristics that make you unique compared to everyone else.',
                    style: TextStyle(color: textFieldColor, fontSize: 12),
                    textAlign: TextAlign.center,
                  ),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: List.generate(
                      controller.personality.length,
                      (index) {
                        return Row(
                          children: [
                            homeCWB,
                            DiscoveryContainer(
                              personality: controller.personality[index],
                              image: discoveryImages[index],
                            )
                          ],
                        );
                      },
                    ),
                  ),
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
                    ? Center(
                        child: Text(
                          'Your career result is not processed',
                          style: TextStyle(color: textFieldColor, fontSize: 12),
                        ),
                      )
                    : Container(
                        height: 160,
                        padding: const EdgeInsets.only(left: 15),
                        child: GridView.builder(
                          scrollDirection: Axis.horizontal,
                          gridDelegate:
                              const SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: 110,
                            childAspectRatio: 2 / 4.5,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 3,
                          ),
                          itemCount: controller.careers.length,
                          itemBuilder: (BuildContext ctx, index) {
                            int careerImageIndex = index % topCareer.length;
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
                              bgImage: topCareer[careerImageIndex],
                              // bgImage: 'assets/images/topcareer9.png',
                              careersType: careersType[index],
                              salary: salaryRanges[index],
                            );
                          },
                        ),
                      ),
                hLBox,
                Container(
                  height: 35.h,
                  margin:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 22),
                  decoration: const BoxDecoration(
                    // color: Colors.yellow,
                    image: DecorationImage(
                      image: AssetImage('assets/images/assetFrameShare.png'),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                hLBox,
                Padding(
                  padding: const EdgeInsets.only(left: 18, top: 25),
                  child: headersHome(
                      text1: 'Your',
                      text2: 'Top Degrees',
                      divColor: const Color.fromARGB(255, 148, 39, 143)),
                ),
                hMBox,
                controller.degrees.isEmpty
                    ? Center(
                        child: Text(
                          'Your career result is not processed',
                          style: TextStyle(color: textFieldColor, fontSize: 12),
                        ),
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
                            int degreeImageIndex = index % topDegree.length;
                            return TopDegreeContainer(
                              degreeImage: topDegree[degreeImageIndex],
                              degree: controller.degrees[index],
                              // degreeCap: 'assets/images/cap icon.svg',
                              degreeCap: 'assets/images/degree-cap 1.png',
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
                          children: [homeCWB, const MentorshipContainer()],
                        );
                      },
                    ),
                  ),
                ),
                hLBox,
                hLBox,
                PersonalityContainer(userName: userName),
                hMBox,
                TraitContainer(userName: userName),
                hMBox,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
 // hMBox,
              // SingleChildScrollView(
              //   scrollDirection: Axis.horizontal,
              //   child: Row(
              //     children: List.generate(controller.degrees.length, (index) {
              //       int degreeImageIndex = index % topDegree.length;
              //       return Row(
              //         children: [
              //           homeCWB,
              //           TopDegreeContainer(
              //             degreeImage: topDegree[degreeImageIndex],
              //             degree: controller.degrees[index],
              //             // degreeCap: 'assets/images/cap icon.svg',
              //             degreeCap: 'assets/images/degree-cap 1.png',
              //           )
              //         ],
              //       );
              //     }),
              //   ),
              // ),

                 // hBox,
              // hBox,
              // SingleChildScrollView(
              //   scrollDirection: Axis.horizontal,
              //   child: Row(
              //     children: List.generate(4, (index) {
              //       return Row(
              //         children: [
              //           homeCWB,
              //           TopCareerContainer(bgImage: topCareerSec[index])
              //         ],
              //       );
              //     }),
              //   ),
              // ),