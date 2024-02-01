import 'package:aimshala/utils/common/colors_common.dart';
import 'package:aimshala/utils/widgets/widgets_common.dart';
import 'package:aimshala/view/home/widget/const.dart';
import 'package:aimshala/view/home/widget/home_widgets.dart';
import 'package:aimshala/view/home/widget/texts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
              padding: const EdgeInsets.only(top: 130, bottom: 10),
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
                            borderRadius: BorderRadius.circular(12),
                            color: Colors.white,
                          ),
                          child: Column(
                            // crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              headersHome(text1: 'Your', text2: 'Journey'),
                              SizedBox(
                                height: 90,
                                width: 85,
                                // color: Colors.amber,
                                child: SvgPicture.asset(
                                  'assets/images/personC1.svg',
                                ),
                              ),
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
                                          fontSize: 18,
                                          color: kwhite,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    const SizedBox(height: 5),
                                    SizedBox(
                                      height: 60,
                                      width: 130,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Schedule Your",
                                            style: TextStyle(
                                                fontSize: 12, color: kwhite),
                                          ),
                                          Text(
                                            "FREE Expert",
                                            style: TextStyle(
                                                fontSize: 12,
                                                color: kwhite,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                            "Video Call Today!",
                                            style: TextStyle(
                                                fontSize: 12,
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
                                                fontSize: 12, color: kwhite),
                                          ),
                                        ),
                                        SizedBox(
                                            // color: Colors.yellow,
                                            height: 36,
                                            width: 113,
                                            child: ElevatedButton.icon(
                                              style: ButtonStyle(
                                                shape: buttonShape(round: 8),
                                              ),
                                              onPressed: () {},
                                              icon: const Text(
                                                "Book Now",
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    color: Colors.blue,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                              label: const Icon(
                                                Icons.arrow_forward_ios_sharp,
                                                size: 14,
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
                          height: 381,
                          width: 343,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              SizedBox(
                                height: 198,
                                // color: Colors.yellow,
                                child: Image.asset('assets/images/chip.png'),
                              ),
                              SizedBox(
                                height: 50,
                                // color: Colors.yellow,
                                child: SvgPicture.asset(
                                    'assets/images/AimCET_LOGO.svg'),
                              ),
                              Text(
                                "Understand your strengths, interests, and potential with our advanced AI test. Gain insights for informed decisions.",
                                textAlign: TextAlign.center,
                                style: TextStyle(color: kwhite, fontSize: 13),
                              ),
                              SizedBox(
                                  // color: Colors.yellow,
                                  height: 36,
                                  // width: 113,
                                  child: ElevatedButton.icon(
                                    style: ButtonStyle(
                                      shape: buttonShape(round: 8),
                                    ),
                                    onPressed: () {},
                                    icon: const Text(
                                      "Take Psychometric Test",
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.blue,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    label: const Icon(
                                      Icons.arrow_forward_ios_sharp,
                                      size: 14,
                                      color: Colors.blue,
                                    ),
                                  ))
                            ],
                          ),
                        ),
                        homeCHB,
                        Container(
                          padding: const EdgeInsets.only(left: 24),
                          height: 260,
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
                                    width: 250,
                                    height: 208,
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
                                          height: 90,
                                          width: 250,
                                          child: ClipRRect(
                                            borderRadius:
                                                const BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(12),
                                                    topRight:
                                                        Radius.circular(12)),
                                            child: Image.asset(
                                              'assets/images/Rectangle.png',
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
                                                height: 20,
                                                width: 68,
                                                child: const Center(
                                                  child: Text(
                                                    "SEP 13, 2023",
                                                    style: TextStyle(
                                                        fontSize: 10,
                                                        color: Color.fromARGB(
                                                            255,
                                                            116,
                                                            118,
                                                            119)),
                                                  ),
                                                ),
                                              ),
                                              wBox,
                                              const Text(
                                                "⭐ 4.3",
                                                style: TextStyle(
                                                    fontSize: 10,
                                                    fontWeight: FontWeight.w600,
                                                    color: Color.fromARGB(
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
                                          height: 85,
                                          child: const Column(
                                              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Expanded(
                                                  child: Text(
                                                    "Dynamic World education community",
                                                    style: TextStyle(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Text(
                                                    "Skills you'll gain: Organizational Culture, Career Development, Strategic Thinking...",
                                                    style: TextStyle(
                                                        fontSize: 11,
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
                      ],
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
