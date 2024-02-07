import 'package:aimshala/models/upcomingmodel/upcomingevent.dart';
import 'package:aimshala/utils/common/colors_common.dart';
import 'package:aimshala/utils/widgets/widgets_common.dart';
import 'package:aimshala/view/home/widget/const.dart';
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
import 'package:sizer/sizer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentStep = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: const Color.fromARGB(255, 237, 233, 237),
      appBar: appbarc(),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Positioned(
              child: Image.asset('assets/images/homebg.png'),
            ),
            Positioned(
              child: Padding(
                padding: const EdgeInsets.only(top: 130),
                child: Column(
                  children: [
                    const YourJourneyContiner(),
                    homeCHB,
                    const TakeChargeC(),
                    homeCHB,
                    const AimcetContainer(),
                    homeCHB,
                    SizedBox(
                      height: 30.5.h,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 18),
                            child: headersHome(
                                text1: 'Best',
                                text2: 'Courses',
                                divColor:
                                    const Color.fromARGB(255, 148, 39, 143)),
                          ),
                          hMBox,
                          Expanded(
                            child: ListView.separated(
                                scrollDirection: Axis.horizontal,
                                itemCount: 4,
                                itemBuilder: (context, index) {
                                  if (index == 0) {
                                    return Row(
                                      children: [
                                        homeCWB,
                                        const BestCourseContainer()
                                      ],
                                    );
                                  } else {
                                    return const BestCourseContainer();
                                  }
                                },
                                separatorBuilder: (context, index) => homeCWBs),
                          )
                        ],
                      ),
                    ),
                    homeCHB,
                    const ContributionContainer(),
                    homeCHB,
                    SizedBox(
                      // padding: const EdgeInsets.only(left: 24),
                      height: 26.5.h,
                      // color: Colors.blue,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 18),
                            child: headersHome2(
                                text1: 'Upcoming',
                                text2: 'Events',
                                divColor:
                                    const Color.fromARGB(255, 148, 39, 143)),
                          ),
                          hMBox,
                          Expanded(
                              child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            itemCount: 4,
                            itemBuilder: (context, index) {
                              if (index == 0) {
                                return Row(
                                  children: [
                                    homeCWB,
                                    UpcomingEventContainer(
                                        image: upEvent[index])
                                  ],
                                );
                              } else {
                                return UpcomingEventContainer(
                                    image: upEvent[index]);
                              }
                            },
                            separatorBuilder: (context, index) => homeCWBs,
                          ))
                        ],
                      ),
                    ),
                    homeCHB,
                    Container(
                      // height: 27.h,
                      height: MediaQuery.of(context).size.height * 0.27,
                      color: Colors.blue,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 18),
                            child: headersHome2(
                                text1: 'Upcoming', 
                                text2: 'Sessions',
                                divColor:
                                    const Color.fromARGB(255, 148, 39, 143)),
                          ),
                          hMBox,
                          Expanded(
                              child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            itemCount: 4,
                            itemBuilder: (context, index) {
                              if (index == 0) {
                                return Row(
                                  children: [
                                    homeCWB,
                                    UpcomingSessionContainer(
                                      mainImage: upSession[index],
                                      circleImage: upSessioncircle[index],
                                    )
                                  ],
                                );
                              } else {
                                return UpcomingSessionContainer(
                                  mainImage: upSession[index],
                                  circleImage: upSessioncircle[index],
                                );
                              }
                            },
                            separatorBuilder: (context, index) => homeCWBs,
                          ))
                        ],
                      ),
                    ),
                    homeCHB,
                    SizedBox(
                      // padding: const EdgeInsets.only(left: 24),
                      height: 28.7.h,
                      // height: MediaQuery.of(context).size.height * 0.3,
                      // color: Colors.blue,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 24),
                            child: headersHome2(
                                text1: 'Latest',
                                text2: 'Insights',
                                divColor:
                                    const Color.fromARGB(255, 148, 39, 143)),
                          ),
                          hMBox,
                          Expanded(
                              child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            itemCount: 4,
                            itemBuilder: (context, index) {
                              if (index == 0) {
                                return Row(
                                  children: [
                                    homeCWB,
                                    InsightsContainer(image: latestIn[index])
                                  ],
                                );
                              } else {
                                return InsightsContainer(
                                    image: latestIn[index]);
                              }
                            },
                            separatorBuilder: (context, index) => homeCWBs,
                          ))
                        ],
                      ),
                    ),
                    homeCHB,
                    SizedBox(
                      // padding: const EdgeInsets.only(left: 24),
                      height: 29.h,
                      // color: Colors.blue,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 18),
                            child: headersHome2(
                                text1: 'Near',
                                text2: 'You',
                                divColor:
                                    const Color.fromARGB(255, 148, 39, 143)),
                          ),
                          hMBox,
                          Expanded(
                            child: ListView.separated(
                                scrollDirection: Axis.horizontal,
                                itemCount: 4,
                                itemBuilder: (context, index) {
                                  if (index == 0) {
                                    return Row(
                                      children: [
                                        homeCWB,
                                        NearYouContainer(image: nearYou[index])
                                      ],
                                    );
                                  } else {
                                    return NearYouContainer(
                                        image: nearYou[index]);
                                  }
                                },
                                separatorBuilder: (context, index) => homeCWBs),
                          )
                        ],
                      ),
                    ),
                    homeCHBs,
                  ],
                ),
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
        child: SizedBox(
          height: 80,
          width: double.infinity,
          // padding: EdgeInsets.only(right: 5),
          child: BottomNavigationBar(
            currentIndex: _currentStep,
            backgroundColor: kwhite,
            selectedItemColor: mainPurple,
            unselectedItemColor: Colors.grey,
            showSelectedLabels: true,
            showUnselectedLabels: true,
            selectedLabelStyle: TextStyle(color: mainPurple, fontSize: 10),
            unselectedLabelStyle:
                const TextStyle(color: Colors.grey, fontSize: 10),
            items: [
              const BottomNavigationBarItem(
                icon: Icon(Icons.search),
                label: 'Explore',
              ),
              BottomNavigationBarItem(
                icon: SizedBox(
                  height: 25,
                  width: 25,
                  child: Image.asset("assets/images/prepare.png"),
                ),
                label: 'Prepare',
              ),
              const BottomNavigationBarItem(
                icon: Icon(Icons.volunteer_activism_outlined),
                label: 'Contribute',
              ),
              BottomNavigationBarItem(
                icon: SizedBox(
                  height: 25,
                  width: 25,
                  child: Image.asset("assets/images/mentor.png"),
                ),
                label: 'Mentorship',
              ),
              BottomNavigationBarItem(
                icon: SizedBox(
                  height: 25,
                  width: 25,
                  child: Image.asset("assets/images/Engage.png"),
                ),
                label: 'Engage',
              ),
              const BottomNavigationBarItem(
                icon: Icon(Icons.near_me),
                label: 'Near you',
              ),
            ],
            onTap: (int index) {
              setState(() {
                _currentStep = index;
              });
            },
          ),
        ),
      ),
    );
  }
}
