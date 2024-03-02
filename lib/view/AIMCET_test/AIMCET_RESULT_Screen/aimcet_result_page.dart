import 'package:aimshala/utils/common/colors_common.dart';
import 'package:aimshala/utils/widgets/widgets_common.dart';
import 'package:aimshala/view/AIMCET_test/AIMCET_RESULT_Screen/result_images.dart';
import 'package:aimshala/view/AIMCET_test/AIMCET_RESULT_Screen/widgets/discovery_container.dart';
import 'package:aimshala/view/AIMCET_test/AIMCET_RESULT_Screen/widgets/mentorship_container.dart';
import 'package:aimshala/view/AIMCET_test/AIMCET_RESULT_Screen/widgets/personality_container.dart';
import 'package:aimshala/view/AIMCET_test/AIMCET_RESULT_Screen/widgets/topcareer_container.dart';
import 'package:aimshala/view/AIMCET_test/AIMCET_RESULT_Screen/widgets/topdegree_container.dart';
import 'package:aimshala/view/AIMCET_test/AIMCET_RESULT_Screen/widgets/trait_container.dart';
import 'package:aimshala/view/home/home.dart';
import 'package:aimshala/view/home/widget/const.dart';
import 'package:aimshala/view/home/widget/home_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class AIMCETResultScreen extends StatelessWidget {
  const AIMCETResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        // leading: IconButton(
        //   onPressed: () {},
        //   icon: Icon(Icons.arrow_back, color: mainPurple),
        // ),
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
                padding: const EdgeInsets.only(left: 18, right: 10, bottom: 15),
                child: Text(
                  'Based on your responses, here are some characteristics that make you unique compared to everyone else.',
                  style: TextStyle(color: textFieldColor, fontSize: 12),
                  textAlign: TextAlign.center,
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(2, (index) {
                    return Row(
                      children: [homeCWB, const DiscoveryContainer()],
                    );
                  }),
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
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(4, (index) {
                    return Row(
                      children: [
                        homeCWB,
                        TopCareerContainer(bgImage: topCareer[index])
                      ],
                    );
                  }),
                ),
              ),
              hBox,
              hBox,
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(4, (index) {
                    return Row(
                      children: [
                        homeCWB,
                        TopCareerContainer(bgImage: topCareerSec[index])
                      ],
                    );
                  }),
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
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(4, (index) {
                    return Row(
                      children: [
                        homeCWB,
                        const TopDegreeContainer(
                          degreeImage: 'assets/images/topdegree1.png',
                          degree: "Bachelor of Arts",
                          degreeCap: 'assets/images/degree-cap 1.svg',
                        )
                      ],
                    );
                  }),
                ),
              ),
              hMBox,
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(4, (index) {
                    return Row(
                      children: [
                        homeCWB,
                        const TopDegreeContainer(
                          degreeImage: 'assets/images/topdegree1.png',
                          degree: "Bachelor of Science in Computer Engineering",
                          degreeCap: 'assets/images/degree-cap 1.svg',
                        )
                      ],
                    );
                  }),
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
              const PersonalityContainer(),
              hMBox,
              const TraitContainer(),
              hMBox,
              Align(
                alignment: Alignment.center,
                child: SizedBox(
                  height: 4.2.h,
                  child: ElevatedButton.icon(
                    style: ButtonStyle(
                      shape: buttonShape(round: 8),
                      backgroundColor: MaterialStateProperty.resolveWith<Color>(
                        (states) {
                          return kpurple;
                        },
                      ),
                    ),
                    onPressed: () => Get.offAll(()=>const HomeScreen()),
                    icon: Text(
                      "Go to Home",
                      style: TextStyle(
                          fontSize: 10.sp,
                          color: kwhite,
                          fontWeight: FontWeight.w600),
                    ),
                    label: Icon(
                      Icons.arrow_forward_ios_sharp,
                      size: 10.5.sp,
                      color: kwhite,
                    ),
                  ),
                ),
              ),
              hMBox,
            ],
          ),
        ),
      ),
    );
  }
}
