import 'package:aimshala/utils/common/colors_common.dart';
import 'package:aimshala/utils/widgets/widgets_common.dart';
import 'package:aimshala/view/home/widget/home_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';

class ContributionContainer extends StatelessWidget {
  const ContributionContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 18),
      padding: const EdgeInsets.only(top: 13),
      decoration: BoxDecoration(
        // color: Colors.yellow,
        borderRadius: BorderRadius.circular(10),
        image: const DecorationImage(
          image: AssetImage(
            'assets/images/contributioncontainer.png',
          ),
          fit: BoxFit.fill,
        ),
      ),
      child: Column(
        children: [
          headersHome(text1: 'Our', text2: 'Contribution', textC: kwhite),
          Container(
            padding: const EdgeInsets.only(top: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  // color: kwhite,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      descriptionContainer(
                        image: 'assets/images/3.svg',
                        maintext: "7,50,000",
                        abouttext: "Students Helped",
                      ),
                      descriptionContainer(
                        image: 'assets/images/2.svg',
                        maintext: "1,00,000",
                        abouttext: "Trees         Saved  ",
                      ),
                      descriptionContainer(
                        image: 'assets/images/1.svg',
                        maintext: "15k (kg)",
                        abouttext: "Environment Saved",
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Container(
                    // height: 8.3.h,
                    color: const Color.fromARGB(255, 115, 118, 118)
                        .withOpacity(0.3),
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    width: double.infinity,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text("Your Contribution",
                            style: TextStyle(
                                fontSize: 10.sp,
                                fontWeight: FontWeight.bold,
                                color: const Color.fromARGB(255, 255, 203, 7))),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                              children: [
                                Text(
                                  "250",
                                  style: TextStyle(
                                      fontSize: 15.sp,
                                      fontWeight: FontWeight.bold,
                                      color: kwhite),
                                ),
                                Text(
                                  "Trees Saved",
                                  style:
                                      TextStyle(fontSize: 9.sp, color: kwhite),
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
                                      fontWeight: FontWeight.bold,
                                      color: kwhite),
                                  // textAlign: TextAlign.center,
                                ),
                                Text(
                                  "Students Helped",
                                  style:
                                      TextStyle(fontSize: 9.sp, color: kwhite),
                                ),
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(60),
                              topRight: Radius.circular(60)),
                          color: Color.fromARGB(255, 10, 154, 161)),
                      height: 7.5.h,
                      width: 19.5.w,
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  child: SvgPicture.asset(
                                    'assets/images/starrounded.svg',
                                  ),
                                ),
                                Text(
                                  " 250",
                                  style: TextStyle(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.bold,
                                      color: const Color.fromARGB(
                                          255, 255, 203, 7)),
                                ),
                              ],
                            ),
                            Text(
                              "Your Earned",
                              style: TextStyle(fontSize: 8.sp, color: kwhite),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                        // color: Colors.red,
                        height: 4.2.h,
                        // width: 113,
                        child: ElevatedButton.icon(
                          style: ButtonStyle(
                            shape: buttonShape(round: 8),
                          ),
                          onPressed: () {},
                          icon: Text(
                            "Contribute Now",
                            style: TextStyle(
                                fontSize: 10.5.sp,
                                color: const Color.fromARGB(255, 15, 187, 195),
                                fontWeight: FontWeight.w600),
                          ),
                          label: Icon(Icons.arrow_forward_ios_sharp,
                              size: 10.5.sp,
                              color: const Color.fromARGB(255, 15, 187, 195)),
                        ))
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

Widget descriptionContainer({
  required String image,
  required String maintext,
  required String abouttext,
}) {
  return Container(
    padding: const EdgeInsets.symmetric(vertical: 5),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      color: const Color.fromARGB(255, 200, 193, 193).withOpacity(0.4),
    ),
    width: 23.w,
    child: Column(
      children: [
        SizedBox(
          child: SvgPicture.asset(image),
        ),
        Text(
          maintext,
          style: TextStyle(
              fontSize: 12.5.sp, fontWeight: FontWeight.bold, color: kwhite),
        ),
        Text(
          abouttext,
          style: TextStyle(
              fontSize: 9.sp, fontWeight: FontWeight.w600, color: kwhite),
          textAlign: TextAlign.center,
        )
      ],
    ),
  );
}
