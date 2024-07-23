import 'package:aimshala/controllers/home_controller.dart';
import 'package:aimshala/controllers/login_controller.dart';
import 'package:aimshala/models/UserModel/user_model.dart';
import 'package:aimshala/models/upcomingmodel/upcomingevent.dart';
import 'package:aimshala/utils/widgets/widgets_common.dart';
import 'package:aimshala/view/home/widget/bottom_nav.dart';
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
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    String? name;
    String? id;
  
    final UserModel? userData = Get.put(LoginController()).userData;
    if (userData != null) {
      name = userData.user?.name ?? '';
      id = userData.user?.id.toString();
    }

    return Scaffold(
      extendBodyBehindAppBar: true,
      drawer: HomeDrawer(uId: id.toString()),
      backgroundColor: const Color.fromARGB(255, 237, 233, 237),
      appBar: appbarHome(name: name, uId: id.toString()),
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
      bottomNavigationBar: bottomNavContainer(
        child: GetBuilder<HomeController>(
          init: HomeController(),
          id: 'bottom-nav',
          builder: (c) {
            return homeBottomNav(
              currentIndex: c.currentStep,
              // onTap: (index) => c.toggelNav(index),
            );
          },
        ),
      ),
    );
  }
}
