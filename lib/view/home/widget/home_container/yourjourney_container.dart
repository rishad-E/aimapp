import 'package:aimshala/utils/common/colors_common.dart';
import 'package:aimshala/view/home/widget/home_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';

class YourJourneyContiner extends StatelessWidget {
  const YourJourneyContiner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      margin: const EdgeInsets.symmetric(horizontal: 18),
      // height: 26.h,
      // width: 40.h,
      decoration: BoxDecoration(
        color: kwhite,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          headersHome(text1: 'Your', text2: 'Journey'),
          SizedBox(
            height: 12.h,
            width: 21.w,
            child: SvgPicture.asset(
              'assets/images/personC1.svg',
            ),
          ),
          Column(
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
                        color: Color.fromARGB(255, 249, 242, 250),
                      ),
                    ),
                    const CircleAvatar(radius: 17),
                    const SizedBox(
                      width: 55,
                      child: Divider(
                        color: Color.fromARGB(255, 249, 242, 250),
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
                                fontWeight: FontWeight.w500,
                                fontSize: 8),
                          ),
                          Text(
                            "2 Years ago",
                            style: TextStyle(color: Colors.black, fontSize: 6),
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
                                fontWeight: FontWeight.w500,
                                fontSize: 8),
                          ),
                          Text(
                            "1 Month ago",
                            style: TextStyle(color: Colors.black, fontSize: 6),
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
                                fontWeight: FontWeight.w500,
                                fontSize: 8),
                          ),
                          Text(
                            "Upcoming",
                            style: TextStyle(color: Colors.black, fontSize: 6),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
