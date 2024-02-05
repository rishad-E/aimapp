import 'package:aimshala/models/upcomingmodel/upcomingevent.dart';
import 'package:aimshala/utils/common/colors_common.dart';
import 'package:aimshala/utils/widgets/widgets_common.dart';
import 'package:aimshala/view/home/widget/const.dart';
import 'package:aimshala/view/home/widget/home_widgets.dart';
import 'package:aimshala/view/home/widget/texts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
      appBar: appbarc(),
      body: Stack(
        children: [
          Positioned(
            child: Image.asset('assets/images/homebg.png'),
          ),
          Positioned(
            child: Padding(
              padding: const EdgeInsets.only(
                top: 130,
              ),
              child: SizedBox(
                // height: double.infinity,
                child: Center(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          height: 26.h,
                          width: 40.h,
                          decoration: BoxDecoration(
                            color: kwhite,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Column(
                            // crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              headersHome(text1: 'Your', text2: 'Journey'),
                              SizedBox(
                                height: 10.5.h,
                                width: 21.w,
                                child: SvgPicture.asset(
                                  'assets/images/personC1.svg',
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 40),
                                      child: Row(
                                        // mainAxisAlignment: MainAxisAlignment.start,
                                        // crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          CircleAvatar(
                                              radius: 12,
                                              backgroundColor: mainPurple,
                                              child: Icon(
                                                Icons.done_sharp,
                                                color: kwhite,
                                                size: 15,
                                              )),
                                          Expanded(
                                            child: Divider(
                                              thickness: 5,
                                              color: mainPurple,
                                            ),
                                          ),
                                          CircleAvatar(
                                              backgroundColor: mainPurple,
                                              radius: 14,
                                              child: Icon(
                                                Icons.done_sharp,
                                                color: kwhite,
                                                size: 16,
                                              )),
                                          const Expanded(
                                            child: Divider(
                                              thickness: 5,
                                              color: Color.fromARGB(
                                                  255, 249, 242, 250),
                                            ),
                                          ),
                                          const CircleAvatar(radius: 17),
                                          const SizedBox(
                                            width: 55,
                                            child: Divider(
                                              color: Color.fromARGB(
                                                  255, 249, 242, 250),
                                              thickness: 5,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const Padding(
                                      padding: EdgeInsets.only(right: 20),
                                      child: Row(
                                        // mainAxisAlignment: MainAxisAlignment.spaceAround,
                                        children: [
                                          Expanded(
                                            child: Column(
                                              children: [
                                                Text(
                                                  "Secondary Education",
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 8),
                                                ),
                                                Text(
                                                  "2 Years ago",
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 6),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Expanded(
                                            child: Column(
                                              children: [
                                                Text(
                                                  "Undergraduate Education",
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 8),
                                                ),
                                                Text(
                                                  "1 Month ago",
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 6),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Expanded(
                                            child: Column(
                                              children: [
                                                Text(
                                                  "Skill Enhancement",
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 8),
                                                ),
                                                Text(
                                                  "Upcoming",
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 6),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        homeCHB,
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            // color: kwhite,
                            image: const DecorationImage(
                                image: AssetImage(
                                  'assets/images/2box.png',
                                ),
                                fit: BoxFit.cover),
                          ),
                          height: 25.h,
                          width: 40.h,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(height: 3.5.h),
                              SizedBox(
                                height: 19.5.h,
                                width: 35.5.h,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "TAKE CHARGE!",
                                      style: TextStyle(
                                          fontSize: 13.5.sp,
                                          color: kwhite,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    hBox,
                                    SizedBox(
                                      height: 7.h,
                                      width: 32.5.w,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Schedule Your",
                                            style: TextStyle(
                                                fontSize: 9.3.sp,
                                                color: kwhite),
                                          ),
                                          Text(
                                            "FREE Expert",
                                            style: TextStyle(
                                                fontSize: 9.3.sp,
                                                color: kwhite,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                            "Video Call Today!",
                                            style: TextStyle(
                                                fontSize: 9.3.sp,
                                                color: kwhite,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Expanded(
                                          child: Text(
                                            home2Ctext,
                                            style: TextStyle(
                                                fontSize: 9.3.sp,
                                                color: kwhite),
                                          ),
                                        ),
                                        SizedBox(
                                            height: 4.2.h,
                                            width: 29.w,
                                            child: ElevatedButton.icon(
                                              style: ButtonStyle(
                                                shape: buttonShape(round: 8),
                                              ),
                                              onPressed: () {},
                                              icon: Text(
                                                "Book Now",
                                                style: TextStyle(
                                                    fontSize: 10.sp,
                                                    color: Colors.blue,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                              label: Icon(
                                                Icons.arrow_forward_ios_sharp,
                                                size: 10.5.sp,
                                                color: Colors.blue,
                                              ),
                                            ))
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        homeCHB,
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 5),
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
                          height: 44.5.h,
                          width: 40.h,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              SizedBox(
                                // color: Colors.yellow,
                                height: 23.h,
                                child: Image.asset('assets/images/chip.png'),
                              ),
                              SizedBox(
                                // color: Colors.yellow,
                                height: 5.8.h,
                                child: SvgPicture.asset(
                                    'assets/images/AimCET_LOGO.svg'),
                              ),
                              Text(
                                home3Ctext,
                                textAlign: TextAlign.center,
                                style:
                                    TextStyle(color: kwhite, fontSize: 9.8.sp),
                              ),
                              SizedBox(
                                  // color: Colors.yellow,
                                  height: 4.2.h,
                                  // width: 113,
                                  child: ElevatedButton.icon(
                                    style: ButtonStyle(
                                      shape: buttonShape(round: 8),
                                    ),
                                    onPressed: () {},
                                    icon: Text(
                                      "Take Psychometric Test",
                                      style: TextStyle(
                                          fontSize: 11.sp,
                                          color: Colors.blue,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    label: Icon(
                                      Icons.arrow_forward_ios_sharp,
                                      size: 11.sp,
                                      color: Colors.blue,
                                    ),
                                  ))
                            ],
                          ),
                        ),
                        homeCHB,
                        Container(
                          padding: const EdgeInsets.only(left: 24),
                          height: 30.5.h,
                          // color: Colors.blue,
                          child: Column(
                            children: [
                              headersHome(
                                  text1: 'Best',
                                  text2: 'Courses',
                                  divColor:
                                      const Color.fromARGB(255, 148, 39, 143)),
                              hMBox,
                              Expanded(
                                  child: ListView.separated(
                                scrollDirection: Axis.horizontal,
                                itemCount: 4,
                                itemBuilder: (context, index) {
                                  return Container(
                                    width: 63.w,
                                    height: 24.5.h,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        color: kwhite,
                                        border: Border.all(
                                            color: const Color.fromARGB(
                                                255, 236, 235, 235))),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        SizedBox(
                                          // color: Colors.amber,
                                          height: 10.5.h,
                                          width: 63.w,
                                          child: ClipRRect(
                                            borderRadius:
                                                const BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(12),
                                                    topRight:
                                                        Radius.circular(12)),
                                            child: Image.asset(
                                              'assets/images/BestCourse.png',
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 10),
                                          child: Row(
                                            children: [
                                              Container(
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(4),
                                                  color: const Color.fromARGB(
                                                      255, 247, 247, 247),
                                                ),
                                                height: 2.4.h,
                                                width: 18.w,
                                                child: Center(
                                                  child: Text(
                                                    "SEP 13, 2023",
                                                    style: TextStyle(
                                                        fontSize: 7.7.sp,
                                                        color: const Color
                                                            .fromARGB(255, 116,
                                                            118, 119)),
                                                  ),
                                                ),
                                              ),
                                              wBox,
                                              Text(
                                                "⭐ 4.3",
                                                style: TextStyle(
                                                    fontSize: 7.7.sp,
                                                    fontWeight: FontWeight.w600,
                                                    color: const Color.fromARGB(
                                                        255, 116, 118, 119)),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          padding: const EdgeInsets.only(
                                            left: 10,
                                          ),
                                          // color: Colors.amber,
                                          height: 10.h,
                                          child: Column(
                                              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Expanded(
                                                  child: Text(
                                                    "Dynamic World education community",
                                                    style: TextStyle(
                                                      fontSize: 10.8.sp,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Text(
                                                    "Skills you'll gain: Organizational Culture, Career Development, Strategic Thinking...",
                                                    style: TextStyle(
                                                        fontSize: 8.3.sp,
                                                        overflow:
                                                            TextOverflow.clip),
                                                  ),
                                                ),
                                              ]),
                                        )
                                      ],
                                    ),
                                  );
                                },
                                separatorBuilder: (context, index) => wMBox,
                              ))
                            ],
                          ),
                        ),
                        homeCHB,
                        Container(
                            width: 40.h,
                            height: 35.6.h,
                            padding: const EdgeInsets.only(top: 13),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: const DecorationImage(
                                  image: AssetImage(
                                    'assets/images/contributioncontainer.png',
                                  ),
                                  fit: BoxFit.cover),
                            ),
                            child: Column(
                              children: [
                                headersHome(
                                    text1: 'Our',
                                    text2: 'Contribution',
                                    textC: kwhite),
                                Expanded(
                                  child: Container(
                                    padding: const EdgeInsets.only(top: 10),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          // color: kwhite,
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 10,
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              Container(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 5),
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  color: const Color.fromARGB(
                                                          255, 200, 193, 193)
                                                      .withOpacity(0.4),
                                                ),
                                                height: 11.h,
                                                width: 23.w,
                                                child: Column(
                                                  children: [
                                                    SizedBox(
                                                      // color: Colors.yellow,
                                                      height: 3.h,
                                                      width: 7.w,
                                                      child: SvgPicture.asset(
                                                        'assets/images/3.svg',
                                                      ),
                                                    ),
                                                    Text(
                                                      "7,50,000",
                                                      style: TextStyle(
                                                          fontSize: 12.5.sp,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: kwhite),
                                                    ),
                                                    Text(
                                                      "Students Helped",
                                                      style: TextStyle(
                                                          fontSize: 9.sp,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          color: kwhite),
                                                      textAlign:
                                                          TextAlign.center,
                                                    )
                                                  ],
                                                ),
                                              ),
                                              Container(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 5),
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  color: const Color.fromARGB(
                                                          255, 200, 193, 193)
                                                      .withOpacity(0.4),
                                                ),
                                                height: 11.h,
                                                width: 23.w,
                                                child: Column(
                                                  children: [
                                                    SizedBox(
                                                      // color: Colors.yellow,
                                                      height: 3.h,
                                                      width: 7.w,
                                                      child: SvgPicture.asset(
                                                        'assets/images/2.svg',
                                                      ),
                                                    ),
                                                    Text(
                                                      "1,00,000",
                                                      style: TextStyle(
                                                          fontSize: 12.5.sp,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: kwhite),
                                                    ),
                                                    Text(
                                                      "Trees Saved  ",
                                                      style: TextStyle(
                                                          fontSize: 9.2.sp,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          color: kwhite),
                                                      textAlign:
                                                          TextAlign.center,
                                                    )
                                                  ],
                                                ),
                                              ),
                                              Container(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 5),
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  color: const Color.fromARGB(
                                                          255, 200, 193, 193)
                                                      .withOpacity(0.4),
                                                ),
                                                height: 11.h,
                                                width: 23.w,
                                                child: Column(
                                                  // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                  children: [
                                                    SizedBox(
                                                      // color: Colors.yellow,
                                                      height: 3.h,
                                                      width: 7.w,
                                                      child: SvgPicture.asset(
                                                        'assets/images/1.svg',
                                                      ),
                                                    ),
                                                    Text(
                                                      "15k (kg)",
                                                      style: TextStyle(
                                                          fontSize: 12.5.sp,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: kwhite),
                                                    ),
                                                    Text(
                                                      "Environment Saved",
                                                      style: TextStyle(
                                                          fontSize: 9.sp,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          color: kwhite),
                                                      textAlign:
                                                          TextAlign.center,
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          height: 8.3.h,
                                          color: const Color.fromARGB(
                                                  255, 115, 118, 118)
                                              .withOpacity(0.3),
                                          width: double.infinity,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Text("Your Contribution",
                                                  style: TextStyle(
                                                      fontSize: 10.sp,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color:
                                                          const Color.fromARGB(
                                                              255,
                                                              255,
                                                              203,
                                                              7))),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Column(
                                                    children: [
                                                      Text(
                                                        "250",
                                                        style: TextStyle(
                                                            fontSize: 15.sp,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: kwhite),
                                                      ),
                                                      Text(
                                                        "Trees Saved",
                                                        style: TextStyle(
                                                            fontSize: 9.sp,
                                                            color: kwhite),
                                                        // textAlign: TextAlign.center,
                                                      ),
                                                    ],
                                                  ),
                                                  wMBox,
                                                  Column(
                                                    children: [
                                                      Text(
                                                        "25",
                                                        style: TextStyle(
                                                            fontSize: 15.sp,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: kwhite),
                                                        // textAlign: TextAlign.center,
                                                      ),
                                                      Text(
                                                        "Students Helped",
                                                        style: TextStyle(
                                                            fontSize: 9.sp,
                                                            color: kwhite),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            Container(
                                              decoration: const BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.only(
                                                          topLeft:
                                                              Radius.circular(
                                                                  60),
                                                          topRight:
                                                              Radius.circular(
                                                                  60)),
                                                  color: Color.fromARGB(
                                                      255, 10, 154, 161)),
                                              height: 7.5.h,
                                              width: 19.5.w,
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      SizedBox(
                                                        //  color: Colors.yellow,
                                                        height: 2.6.h,
                                                        width: 5.5.w,
                                                        child: SvgPicture.asset(
                                                          'assets/images/starrounded.svg',
                                                        ),
                                                      ),
                                                      Text(
                                                        " 250",
                                                        style: TextStyle(
                                                            fontSize: 12.sp,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: kwhite),
                                                      ),
                                                    ],
                                                  ),
                                                  Text(
                                                    "Your Earned",
                                                    style: TextStyle(
                                                        fontSize: 8.sp,
                                                        color: kwhite),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            SizedBox(
                                                // color: Colors.red,
                                                height: 4.2.h,
                                                // width: 113,
                                                child: ElevatedButton.icon(
                                                  style: ButtonStyle(
                                                    shape:
                                                        buttonShape(round: 8),
                                                  ),
                                                  onPressed: () {},
                                                  icon: Text(
                                                    "Contribute Now",
                                                    style: TextStyle(
                                                        fontSize: 10.5.sp,
                                                        color: const Color
                                                            .fromARGB(
                                                            255, 15, 187, 195),
                                                        fontWeight:
                                                            FontWeight.w600),
                                                  ),
                                                  label: Icon(
                                                      Icons
                                                          .arrow_forward_ios_sharp,
                                                      size: 10.5.sp,
                                                      color:
                                                          const Color.fromARGB(
                                                              255,
                                                              15,
                                                              187,
                                                              195)),
                                                ))
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            )),
                        homeCHB,
                        Container(
                          padding: const EdgeInsets.only(left: 24),
                          height: 26.5.h,
                          // color: Colors.blue,
                          child: Column(
                            children: [
                              headersHome2(
                                  text1: 'Upcoming',
                                  text2: 'Events',
                                  divColor:
                                      const Color.fromARGB(255, 148, 39, 143)),
                              hMBox,
                              Expanded(
                                  child: ListView.separated(
                                scrollDirection: Axis.horizontal,
                                itemCount: 2,
                                itemBuilder: (context, index) {
                                  return Container(
                                    width: 46.w,
                                    // height: 165,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        color: kwhite,
                                        border: Border.all(
                                            color: const Color.fromARGB(
                                                255, 236, 235, 235))),
                                    child: Column(
                                      children: [
                                        SizedBox(
                                          // color: Colors.amber,
                                          height: 10.5.h,
                                          width: 46.w,
                                          child: ClipRRect(
                                            borderRadius:
                                                const BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(12),
                                                    topRight:
                                                        Radius.circular(12)),
                                            child: Image.asset(
                                              upEvent[index],
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Padding(
                                            padding:
                                                const EdgeInsets.only(left: 10),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            4),
                                                    color: const Color.fromARGB(
                                                        255, 247, 247, 247),
                                                  ),
                                                  height: 2.4.h,
                                                  width: 17.5.w,
                                                  child: Center(
                                                    child: Text(
                                                      "SEP 13, 2023",
                                                      style: TextStyle(
                                                          fontSize: 7.7.sp,
                                                          color: const Color
                                                              .fromARGB(255,
                                                              116, 118, 119)),
                                                    ),
                                                  ),
                                                ),
                                                Text(
                                                  "Virtual College Admissions Workshop",
                                                  style: TextStyle(
                                                    fontSize: 9.2.sp,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                                separatorBuilder: (context, index) => wMBox,
                              ))
                            ],
                          ),
                        ),
                        homeCHB,
                        Container(
                          padding: const EdgeInsets.only(left: 24),
                          height: 26.h,
                          // color: Colors.blue,
                          child: Column(
                            children: [
                              headersHome2(
                                  text1: 'Upcoming',
                                  text2: 'Sessions',
                                  divColor:
                                      const Color.fromARGB(255, 148, 39, 143)),
                              hMBox,
                              Expanded(
                                  child: ListView.separated(
                                scrollDirection: Axis.horizontal,
                                itemCount: 4,
                                itemBuilder: (context, index) {
                                  return Container(
                                    width: 46.5.w,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        color: kwhite,
                                        border: Border.all(
                                            color: const Color.fromARGB(
                                                255, 236, 235, 235))),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          color: Colors.amber,
                                          height: 10.5.h,
                                          width: 46.5.w,
                                          child: ClipRRect(
                                            borderRadius:
                                                const BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(12),
                                                    topRight:
                                                        Radius.circular(12)),
                                            child: Image.asset(
                                              'assets/images/BestCourse.png',
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 10),
                                          child: Row(
                                            children: [
                                              Container(
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(4),
                                                  color: const Color.fromARGB(
                                                      255, 247, 247, 247),
                                                ),
                                                height: 2.3.h,
                                                width: 18.w,
                                                child: Center(
                                                  child: Text(
                                                    "SEP 13, 2023",
                                                    style: TextStyle(
                                                        fontSize: 7.7.sp,
                                                        color: const Color
                                                            .fromARGB(255, 116,
                                                            118, 119)),
                                                  ),
                                                ),
                                              ),
                                              wBox,
                                              Container(
                                                // padding: EdgeInsets.symmetric(vertical: 5,horizontal: 5),
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(4),
                                                  color: const Color.fromARGB(
                                                      255, 247, 247, 247),
                                                ),
                                                height: 2.3.h,
                                                width: 15.5.w,
                                                child: Center(
                                                  child: Text(
                                                    "12:00 PM",
                                                    style: TextStyle(
                                                        fontSize: 7.7.sp,
                                                        color: const Color
                                                            .fromARGB(255, 116,
                                                            118, 119)),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          padding:
                                              const EdgeInsets.only(left: 10),
                                          // color: Colors.amber,
                                          // height: 85,
                                          child: Column(
                                              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "Connect with Jane Smith",
                                                  style: TextStyle(
                                                    fontSize: 10.5.sp,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                                Text(
                                                  "Career Strategist for Tech Industries",
                                                  style: TextStyle(
                                                      fontSize: 8.sp,
                                                      overflow:
                                                          TextOverflow.clip),
                                                ),
                                              ]),
                                        )
                                      ],
                                    ),
                                  );
                                },
                                separatorBuilder: (context, index) => wMBox,
                              ))
                            ],
                          ),
                        ),
                        homeCHB,
                        Container(
                          padding: const EdgeInsets.only(left: 24),
                          height: 26.5.h,
                          // color: Colors.blue,
                          child: Column(
                            children: [
                              headersHome2(
                                  text1: 'Latest',
                                  text2: 'Insights',
                                  divColor:
                                      const Color.fromARGB(255, 148, 39, 143)),
                              hMBox,
                              Expanded(
                                  child: ListView.separated(
                                scrollDirection: Axis.horizontal,
                                itemCount: 2,
                                itemBuilder: (context, index) {
                                  return Container(
                                    width: 46.5.w,
                                    // height: 165,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        color: kwhite,
                                        border: Border.all(
                                            color: const Color.fromARGB(
                                                255, 236, 235, 235))),
                                    child: Column(
                                      children: [
                                        SizedBox(
                                          // color: Colors.amber,
                                          height: 10.5.h,
                                          width: 46.5.w,
                                          child: ClipRRect(
                                            borderRadius:
                                                const BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(12),
                                                    topRight:
                                                        Radius.circular(12)),
                                            child: Image.asset(
                                              upEvent[index],
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Padding(
                                            padding:
                                                const EdgeInsets.only(left: 10),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  children: [
                                                    Container(
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(4),
                                                        color: const Color
                                                            .fromARGB(
                                                            255, 247, 247, 247),
                                                      ),
                                                      height: 2.3.h,
                                                      width: 18.w,
                                                      child: Center(
                                                        child: Text(
                                                          "SEP 13, 2023",
                                                          style: TextStyle(
                                                              fontSize: 7.7.sp,
                                                              color: const Color
                                                                  .fromARGB(
                                                                  255,
                                                                  116,
                                                                  118,
                                                                  119)),
                                                        ),
                                                      ),
                                                    ),
                                                    wBox,
                                                    Container(
                                                      // padding: EdgeInsets.symmetric(vertical: 5,horizontal: 5),
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(4),
                                                        border: Border.all(
                                                            color: const Color
                                                                .fromARGB(255,
                                                                236, 235, 235)),
                                                      ),
                                                      height: 2.3.h,
                                                      width: 15.5.w,
                                                      child: Center(
                                                        child: Text(
                                                          "Language",
                                                          style: TextStyle(
                                                              fontSize: 7.7.sp,
                                                              color: const Color
                                                                  .fromARGB(
                                                                  255,
                                                                  116,
                                                                  118,
                                                                  119)),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Text(
                                                  "New Scholarship  Program  for STEM students  announced",
                                                  style: TextStyle(
                                                    fontSize: 9.2.sp,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                                separatorBuilder: (context, index) => wMBox,
                              ))
                            ],
                          ),
                        ),
                        homeCHB,
                        Container(
                          padding: const EdgeInsets.only(left: 24),
                          height: 29.h,
                          // color: Colors.blue,
                          child: Column(
                            children: [
                              headersHome2(
                                  text1: 'Near',
                                  text2: 'You',
                                  divColor:
                                      const Color.fromARGB(255, 148, 39, 143)),
                              hMBox,
                              Expanded(
                                  child: ListView.separated(
                                scrollDirection: Axis.horizontal,
                                itemCount: 2,
                                itemBuilder: (context, index) {
                                  return Container(
                                    width: 46.5.w,
                                    // height: 165,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        color: kwhite,
                                        border: Border.all(
                                            color: const Color.fromARGB(
                                                255, 236, 235, 235))),
                                    child: Column(
                                      children: [
                                        SizedBox(
                                          // color: Colors.amber,
                                          height: 10.5.h,
                                          width: 46.5.w,
                                          child: ClipRRect(
                                            borderRadius:
                                                const BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(12),
                                                    topRight:
                                                        Radius.circular(12)),
                                            child: Image.asset(
                                              upEvent[index],
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                left: 6, right: 6),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  children: [
                                                    Container(
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(4),
                                                        color: const Color
                                                            .fromARGB(
                                                            255, 247, 247, 247),
                                                      ),
                                                      height: 2.3.h,
                                                      width: 18.w,
                                                      child: Center(
                                                        child: Text(
                                                          "SEP 13, 2023",
                                                          style: TextStyle(
                                                              fontSize: 7.7.sp,
                                                              color: const Color
                                                                  .fromARGB(
                                                                  255,
                                                                  116,
                                                                  118,
                                                                  119)),
                                                        ),
                                                      ),
                                                    ),
                                                    wBox,
                                                    Container(
                                                      // padding: EdgeInsets.symmetric(vertical: 5,horizontal: 5),
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(4),
                                                        border: Border.all(
                                                            color: const Color
                                                                .fromARGB(255,
                                                                236, 235, 235)),
                                                      ),
                                                      height: 2.3.h,
                                                      width: 15.5.w,
                                                      child: Center(
                                                        child: Text(
                                                          "Language",
                                                          style: TextStyle(
                                                              fontSize: 7.7.sp,
                                                              color: const Color
                                                                  .fromARGB(
                                                                  255,
                                                                  116,
                                                                  118,
                                                                  119)),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Text(
                                                  "Regular Program: 2 Year JEE Mains",
                                                  style: TextStyle(
                                                      fontSize: 9.2.sp,
                                                      fontWeight:
                                                          FontWeight.w600),
                                                ),
                                                Text(
                                                  "Aakash Institute, Pusa Road",
                                                  style: TextStyle(
                                                      fontSize: 8.5.sp),
                                                ),
                                                Text(
                                                  "Noida, Uttar Pradesh, India (On-site)",
                                                  style:
                                                      TextStyle(fontSize: 7.sp),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                                separatorBuilder: (context, index) => wMBox,
                              ))
                            ],
                          ),
                        ),
                        homeCHB,
                      ],
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
      bottomNavigationBar: SizedBox(
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
            const BottomNavigationBarItem(
              icon: Icon(Icons.menu_book),
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
    );
  }
}
