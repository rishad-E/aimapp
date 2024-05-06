import 'package:aimshala/controllers/home_controller.dart';
import 'package:aimshala/controllers/login_controller.dart';
import 'package:aimshala/models/UserModel/user_model.dart';
import 'package:aimshala/models/upcomingmodel/upcomingevent.dart';
import 'package:aimshala/utils/common/colors_common.dart';
import 'package:aimshala/utils/widgets/widgets_common.dart';
import 'package:aimshala/view/home/widget/const.dart';
import 'package:aimshala/view/home/widget/drawer_home.dart';
import 'package:aimshala/view/home/widget/home_container/aimcet_container.dart';
import 'package:aimshala/view/home/widget/home_container/bestcourse_container.dart';
import 'package:aimshala/view/home/widget/home_container/contribution_container.dart';
import 'package:aimshala/view/home/widget/home_container/insights_container.dart';
import 'package:aimshala/view/home/widget/home_container/nearyou_container.dart';
import 'package:aimshala/view/home/widget/home_container/takecharge_container.dart';
import 'package:aimshala/view/home/widget/home_container/upevent_container.dart';
import 'package:aimshala/view/home/widget/home_container/upsession_container.dart';
import 'package:aimshala/view/home/widget/home_container/yourjourney_container.dart';
import 'package:aimshala/view/home/widget/home_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    String? name;
    String? id;
    final UserDataModel? userData = Get.put(LoginController()).userData;
    if (userData != null) {
      name = userData.user?.name ?? '';
      id = userData.user?.id.toString();
    }
    return Scaffold(
      extendBodyBehindAppBar: true,
      drawer: HomeDrawer(uId: id.toString()),
      backgroundColor: const Color.fromARGB(255, 237, 233, 237),
      appBar: appbarHome(name: name),
      body: SingleChildScrollView(
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Image.asset('assets/images/homebg.png'),
            Padding(
              padding: const EdgeInsets.only(top: 130),
              child: Column(
                children: [
                  const YourJourneyContiner(),
                  homeCHB,
                  TakeChargeC(userName: name.toString()),
                  homeCHB,
                  AimcetContainer(
                    userName: name.toString(),
                    id: id.toString(),
                  ),
                  homeCHB,
                  Padding(
                    padding: const EdgeInsets.only(left: 18),
                    child: headersHome(
                        text1: 'Best',
                        text2: 'Courses',
                        divColor: const Color.fromARGB(255, 148, 39, 143)),
                  ),
                  hMBox,
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(children: [
                      homeCWB,
                      ...List.generate(4, (index) {
                        return const BestCourseContainer();
                      }),
                    ]),
                  ),
                  homeCHB,
                  const ContributionContainer(),
                  homeCHB,
                  Padding(
                    padding: const EdgeInsets.only(left: 18),
                    child: headersHome2(
                        text1: 'Upcoming',
                        text2: 'Events',
                        divColor: const Color.fromARGB(255, 148, 39, 143)),
                  ),
                  hMBox,
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(children: [
                      homeCWB,
                      ...List.generate(4, (index) {
                        return UpcomingEventContainer(image: upEvent[index]);
                      }),
                    ]),
                  ),
                  homeCHB,
                  Padding(
                    padding: const EdgeInsets.only(left: 18),
                    child: headersHome2(
                        text1: 'Upcoming',
                        text2: 'Sessions',
                        divColor: const Color.fromARGB(255, 148, 39, 143)),
                  ),
                  hMBox,
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(children: [
                      homeCWB,
                      ...List.generate(4, (index) {
                        return UpcomingSessionContainer(
                          mainImage: upSession[index],
                          circleImage: upSessioncircle[index],
                        );
                      }),
                    ]),
                  ),
                  homeCHB,
                  Padding(
                    padding: const EdgeInsets.only(left: 24),
                    child: headersHome2(
                        text1: 'Latest',
                        text2: 'Insights',
                        divColor: const Color.fromARGB(255, 148, 39, 143)),
                  ),
                  hMBox,
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(children: [
                      homeCWB,
                      ...List.generate(4, (index) {
                        return InsightsContainer(image: latestIn[index]);
                      }),
                    ]),
                  ),
                  homeCHB,
                  Padding(
                    padding: const EdgeInsets.only(left: 18),
                    child: headersHome2(
                        text1: 'Near',
                        text2: 'You',
                        divColor: const Color.fromARGB(255, 148, 39, 143)),
                  ),
                  hMBox,
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(children: [
                      homeCWB,
                      ...List.generate(4, (index) {
                        return NearYouContainer(image: nearYou[index]);
                      }),
                    ]),
                  ),
                  homeCHBs,
                ],
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
        child: GetBuilder<HomeController>(
            init: HomeController(),
            id: 'bottom-nav',
            builder: (c) {
              return SizedBox(
                height: 80,
                width: double.infinity,
                // padding: EdgeInsets.only(right: 5),
                child: BottomNavigationBar(
                    currentIndex: c.currentStep,
                    type: BottomNavigationBarType.fixed,
                    backgroundColor: kwhite,
                    selectedItemColor: mainPurple,
                    unselectedItemColor: Colors.grey,
                    showSelectedLabels: true,
                    showUnselectedLabels: true,
                    selectedLabelStyle:
                        TextStyle(color: mainPurple, fontSize: 10),
                    unselectedLabelStyle:
                        const TextStyle(color: Colors.grey, fontSize: 10),
                    items: [
                      BottomNavigationBarItem(
                        icon: SizedBox(
                          height: 25,
                          width: 25,
                          child: SvgPicture.asset(
                            "assets/images/search.svg",
                            // color: Colors.purple,
                          ),
                        ),
                        label: 'Explore',
                      ),
                      BottomNavigationBarItem(
                        icon: SizedBox(
                          height: 25,
                          width: 25,
                          // child: SvgPicture.asset(
                          //   "assets/images/prepare.svg",
                          //   // color: Colors.purple,
                          // ),
                          child: Image.asset(
                            "assets/images/prepare.png",
                            // color: Colors.purple,
                          ),
                        ),
                        label: 'Prepare',
                      ),
                      BottomNavigationBarItem(
                        icon: SizedBox(
                          height: 25,
                          width: 25,
                          child: SvgPicture.asset(
                            "assets/images/Contribute.svg",
                            // color: Colors.purple,
                          ),
                        ),
                        label: 'Contribute',
                      ),
                      BottomNavigationBarItem(
                        icon: SizedBox(
                          height: 25,
                          width: 25,
                          child: SvgPicture.asset(
                            "assets/images/mentorship.svg",
                            // color: Colors.purple,
                          ),
                        ),
                        label: 'Mentorship',
                      ),
                      BottomNavigationBarItem(
                        icon: SizedBox(
                          height: 25,
                          width: 25,
                          child: SvgPicture.asset(
                            "assets/images/Engage.svg",
                            // color: Colors.purple,
                          ),
                        ),
                        label: 'Engage',
                      ),
                      BottomNavigationBarItem(
                        icon: SizedBox(
                          height: 25,
                          width: 25,
                          child: SvgPicture.asset(
                            "assets/images/nearyou.svg",
                            // color: Colors.purple,
                          ),
                        ),
                        label: 'Near you',
                      ),
                    ],
                    onTap: (int index) => c.toggelNav(index)),
              );
            }),
      ),
    );
  }
}
