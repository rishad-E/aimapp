import 'dart:developer';

import 'package:aimshala/utils/common/widgets/colors_common.dart';
import 'package:aimshala/utils/common/widgets/text_common.dart';
import 'package:aimshala/utils/widgets/widgets_common.dart';
import 'package:aimshala/view/AIMCET_test/AIMCET_RESULT_Screen/widgets/discovery_container.dart';
import 'package:aimshala/view/AIMCET_test/AIMCET_RESULT_Screen/widgets/mentorship_container.dart';
import 'package:aimshala/view/AIMCET_test/AIMCET_widgets/aimcet_images.dart';
import 'package:aimshala/view/AIMCET_test/AIMCET_widgets/aimcet_widgets.dart';
import 'package:aimshala/view/home/widget/const.dart';
import 'package:aimshala/view/home/widget/home_widgets.dart';
import 'package:aimshala/view/profile/common/widgets/texts.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class TempResultScreen extends StatelessWidget {
  const TempResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    int initialVal = 0;
    log('builder top');
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        iconTheme: IconThemeData(color: mainPurple),
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
            children: [
              Image.asset('assets/images/aimcetResult.png'),
              Container(
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
                          2,
                          (index) {
                            return Row(
                              children: [
                                DiscoveryContainer(
                                  personality: "personality[index]",
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
                    Container(
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
                        itemCount: 15,
                        itemBuilder: (BuildContext ctx, index) {
                          return Container(
                            margin: const EdgeInsets.only(right: 8),
                            padding: const EdgeInsets.all(14),
                            decoration: BoxDecoration(
                              color: kwhite,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  // padding: EdgeInsets.all(5),
                                  decoration: const BoxDecoration(
                                      color: Color.fromARGB(255, 15, 187, 195),
                                      shape: BoxShape.circle),
                                  height: 20,
                                  width: 20,
                                  child: Center(
                                      child: Text(
                                    (index + 1).toString(),
                                    style: TextStyle(color: kwhite),
                                  )),
                                ),
                                wBox,
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        child: semiBoldChoiceText(
                                          text:
                                              'FINANCE AND INVESTMENT BANKING',
                                          size: 11,
                                          // overflow: TextOverflow.visible,
                                        ),
                                      ),
                                      regularText('(Avg Salary 14-18 lpa)', 10)
                                    ],
                                  ),
                                )
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                    hLBox,
                  ],
                ),
              ),
              Container(
                height: 37.h,
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
              Container(
                width: double.infinity,
                margin: const EdgeInsets.symmetric(horizontal: 16),
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  gradient: const LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xFF12054E),
                      Color(0xFF37065D),
                      Color(0xFF45108A),
                    ],
                    stops: [0.0, 0.4531, 1.0],
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      height: 23.h,
                      child: Image.asset('assets/images/chip.png'),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: SizedBox(
                        height: 5.5.h,
                        child: Image.asset('assets/images/acecet-home.png'),
                      ),
                    ),
                    boldText(text: 'Download', size: 20, color: kwhite),
                    regularText('Your Test Report', 20, color: kwhite),
                    Padding(
                      padding: const EdgeInsets.only(top: 12, bottom: 8),
                      child: SizedBox(
                        height: 4.2.h,
                        child: ElevatedButton.icon(
                          style: ButtonStyle(
                            shape: buttonShape(round: 8),
                          ),
                          icon: Text(
                            "Download Now!",
                            style: TextStyle(
                                fontSize: 11.sp,
                                color: const Color.fromARGB(255, 147, 38, 143),
                                fontWeight: FontWeight.w600),
                          ),
                          label: Icon(
                            Icons.arrow_forward_ios_sharp,
                            size: 11.sp,
                            color: const Color.fromARGB(255, 147, 38, 143),
                          ),
                          onPressed: () {},
                        ),
                      ),
                    )
                  ],
                ),
              ),
              hMBox,
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
                    Container(
                      height: 150,
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
                        itemCount: 15,
                        itemBuilder: (BuildContext ctx, index) {
                          return Container(
                            margin: const EdgeInsets.only(right: 8),
                            padding: const EdgeInsets.all(14),
                            decoration: BoxDecoration(
                              color: kwhite,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Row(
                              children: [
                                Container(
                                  // padding: EdgeInsets.all(5),
                                  decoration: const BoxDecoration(
                                      color: Color.fromARGB(255, 15, 187, 195),
                                      shape: BoxShape.circle),
                                  height: 20,
                                  width: 20,
                                  child: Center(
                                      child: Text(
                                    (index + 1).toString(),
                                    style: TextStyle(color: kwhite),
                                  )),
                                ),
                                wBox,
                                Expanded(
                                  child: semiBoldChoiceText(
                                    text: 'FINANCE AND INVESTMENT BANKING',
                                    size: 11,
                                    // overflow: TextOverflow.visible,
                                  ),
                                )
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                    hLBox,
                    Padding(
                      padding: const EdgeInsets.only(left: 18, top: 25),
                      child: headersHome(
                          text1: 'Best',
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
                  ],
                ),
              ),
              // hMBox,
              StatefulBuilder(
                  builder: (BuildContext context, StateSetter setState) {
                log('value===>$initialVal');
                return Column(
                  children: [
                    Container(
                      color: const Color.fromARGB(255, 231, 230, 240),
                      child: Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 40, vertical: 12),
                        height: 36,
                        // color: Colors.yellow,
                        decoration: BoxDecoration(
                          color: kwhite,
                          border: Border.all(
                              width: 1, color: textFieldColor.withOpacity(0.3)),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    initialVal = 0;
                                  });
                                  // c.updateIndex();
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      color:
                                          initialVal == 0 ? mainPurple : kwhite,
                                      borderRadius: const BorderRadius.only(
                                          bottomLeft: Radius.circular(6),
                                          topLeft: Radius.circular(6))),
                                  height: 4.h,
                                  child: Center(
                                      child: Text(
                                    "personality report",
                                    style: TextStyle(
                                        color: initialVal == 0
                                            ? kwhite
                                            : mainPurple,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 14),
                                  )),
                                ),
                              ),
                            ),
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  // c.updateIndex();
                                  setState(() {
                                    initialVal = 1;
                                  });
                                },
                                child: Container(
                                  height: 4.h,
                                  decoration: BoxDecoration(
                                      color:
                                          initialVal == 0 ? kwhite : mainPurple,
                                      borderRadius: const BorderRadius.only(
                                          bottomRight: Radius.circular(6),
                                          topRight: Radius.circular(6))),
                                  child: Center(
                                      child: Text(
                                    "Trait report",
                                    style: TextStyle(
                                        color: initialVal == 0
                                            ? mainPurple
                                            : kwhite,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 14),
                                  )),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    hMBox,
                    hMBox,
                  ],
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
