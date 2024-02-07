import 'package:aimshala/utils/common/colors_common.dart';
import 'package:aimshala/utils/widgets/widgets_common.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class TempScreen extends StatelessWidget {
  const TempScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          // height: 190,
          width: 47.5.w,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: kwhite,
              border:
                  Border.all(color: const Color.fromARGB(255, 236, 235, 235))),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Stack(
                clipBehavior: Clip.none,
                alignment: Alignment.topCenter,
                children: [
                  SizedBox(
                    height: 10.5.h,
                    width: 46.5.w,
                    child: ClipRRect(
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(12),
                          topRight: Radius.circular(12)),
                      child: Image.asset(
                        'assets/images/upSession1.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 80, // Adjust this value to position the CircleAvatar
                    left: 3,
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: mainPurple,
                          width: 1,
                        ),
                      ),
                      child: const CircleAvatar(
                        radius: 20,
                        backgroundColor: Colors.white,
                        backgroundImage:
                            AssetImage('assets/images/upSession1.png'),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 100, // Adjust this value to position the Row widget
                    right: -6,
                    // left: 10,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10, right: 5),
                      child: Row(
                        // mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              color: const Color.fromARGB(255, 247, 247, 247),
                            ),
                            height: 2.3.h,
                            width: 18.w,
                            child: Center(
                              child: Text(
                                "SEP 13, 2023",
                                style: TextStyle(
                                    fontSize: 7.7.sp,
                                    color: const Color.fromARGB(
                                        255, 116, 118, 119)),
                              ),
                            ),
                          ),
                          wBox,
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              color: const Color.fromARGB(255, 247, 247, 247),
                            ),
                            height: 2.3.h,
                            width: 15.5.w,
                            child: Center(
                              child: Text(
                                "12:00 PM",
                                style: TextStyle(
                                    fontSize: 7.7.sp,
                                    color: const Color.fromARGB(
                                        255, 116, 118, 119)),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                padding: const EdgeInsets.only(left: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Connect with Jane Smith",
                      style: TextStyle(
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    hBox,
                    Text(
                      "Career Strategist for Tech Industries",
                      style: TextStyle(
                          fontSize: 8.sp, overflow: TextOverflow.clip),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}



  // child: Stack(
        //   alignment: AlignmentDirectional.topEnd,
        //   children: [
        //     Container(
        //       // width: 30,
        //       // height: 30,
        //       decoration: BoxDecoration(
        //         shape: BoxShape.circle,
        //         border: Border.all(
        //           color: const Color.fromARGB(255, 215, 211, 211),
        //           width: 1,
        //         ),
        //       ),
        //       child: CircleAvatar(
        //         radius: 15,
        //         backgroundColor: kwhite,
        //         backgroundImage: const AssetImage(
        //           'assets/images/appbarWomen.png',
        //         ),
        //       ),
        //     ),
        //     Positioned(
        //       // top: -25,
        //       // bottom: 25,
        //       child: Container(
        //         decoration: BoxDecoration(
        //             borderRadius: BorderRadius.circular(4),
        //             border: Border.all(
        //               color: mainPurple,
        //               width: 1,
        //             ),
        //             color: kwhite),
        //         child: const Icon(
        //           Icons.question_mark_sharp,
        //           size: 12,
        //         ),
        //       ),
        //     ),
        //   ],
        // ),