import 'package:aimshala/controllers/career_booking_controller.dart';
import 'package:aimshala/utils/common/colors_common.dart';
import 'package:aimshala/utils/widgets/widgets_common.dart';
import 'package:aimshala/view/BookCareerCounsellCall/career_home_aimScreen/career_home_screen.dart';
import 'package:aimshala/view/home/widget/texts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class TakeChargeC extends StatelessWidget {
  final String userName;
  const TakeChargeC({super.key, required this.userName});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(BookCareerCounsellController());
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 18),
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        // color: kwhite,
        image: const DecorationImage(
            image: AssetImage('assets/images/2box.png'), fit: BoxFit.cover),
      ),
      child: Obx(
        () {
          final data = controller.counselBookedModel?.data;
          return controller.isBooked.value == 'yes' &&
                  controller.counselBookedModel?.data != null
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 2.h,
                      // color: Colors.red,
                    ),
                    Container(
                      padding: const EdgeInsets.only(bottom: 8, top: 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Your Upcoming",
                            style: TextStyle(fontSize: 14.sp, color: kwhite),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                right: MediaQuery.of(context).size.width / 2),
                            child: Text(
                              "Counseling Session",
                              style: TextStyle(
                                fontSize: 14.sp,
                                color: kwhite,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                right: MediaQuery.of(context).size.width / 2.3,
                                top: 8),
                            child: Text(
                              home2Ctext,
                              style: TextStyle(fontSize: 9.3.sp, color: kwhite),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Row(
                              children: [
                                Row(
                                  children: [
                                    SvgPicture.asset(
                                        'assets/images/calendar-booked.svg'),
                                    wBox,
                                    Column(
                                      children: [
                                        Text(data!.appointTime.toString(),
                                            style: TextStyle(
                                                fontSize: 13.sp,
                                                fontWeight: FontWeight.bold,
                                                color: kwhite)),
                                        Text(data.appointDate.toString(),
                                            style: TextStyle(
                                                fontSize: 9.5.sp,
                                                color: kwhite,
                                                fontWeight: FontWeight.w600))
                                      ],
                                    )
                                  ],
                                ),
                                wMBox,
                                SizedBox(
                                    height: 4.2.h,
                                    child: ElevatedButton.icon(
                                      style: ButtonStyle(
                                        padding: const MaterialStatePropertyAll(
                                            EdgeInsets.symmetric(
                                                horizontal: 15)),
                                        shape: buttonShape(round: 8),
                                      ),
                                      onPressed: () {
                                        // Get.to(() => BookCareerHomePage());
                                      },
                                      icon: Text(
                                        "Counseling Session",
                                        style: TextStyle(
                                            fontSize: 11.sp,
                                            color: const Color.fromARGB(
                                                255, 15, 187, 195),
                                            fontWeight: FontWeight.w600),
                                      ),
                                      label: SvgPicture.asset(
                                          'assets/images/Video-booked.svg'),
                                    ))
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                )
              : Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 3.5.h,
                      // color: Colors.red,
                    ),
                    Container(
                      padding: const EdgeInsets.only(bottom: 8, top: 10),
                      // height: 19.5.h,
                      // color: Colors.yellow,
                      // width: 35.5.h,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "TAKE CHARGE!",
                            style: TextStyle(
                                fontSize: 13.0.sp,
                                color: kwhite,
                                fontWeight: FontWeight.bold),
                          ),
                          hBox,
                          SizedBox(
                            height: 7.h,
                            width: 32.5.w,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Schedule Your",
                                  style: TextStyle(
                                      fontSize: 9.3.sp, color: kwhite),
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
                          Padding(
                            padding: const EdgeInsets.only(top: 5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Expanded(
                                  child: Text(
                                    home2Ctext,
                                    style: TextStyle(
                                        fontSize: 9.3.sp, color: kwhite),
                                  ),
                                ),
                                SizedBox(
                                    height: 4.2.h,
                                    child: ElevatedButton.icon(
                                      style: ButtonStyle(
                                        padding: const MaterialStatePropertyAll(
                                            EdgeInsets.symmetric(
                                                horizontal: 15)),
                                        shape: buttonShape(round: 8),
                                      ),
                                      onPressed: () {
                                        Get.to(() => BookCareerHomePage());
                                      },
                                      icon: Text(
                                        "Book Now",
                                        style: TextStyle(
                                            fontSize: 10.sp,
                                            color: const Color.fromARGB(
                                                255, 15, 187, 195),
                                            fontWeight: FontWeight.w600),
                                      ),
                                      label: Icon(
                                        Icons.arrow_forward_ios_sharp,
                                        size: 10.5.sp,
                                        color: const Color.fromARGB(
                                            255, 15, 187, 195),
                                      ),
                                    ))
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
        },
      ),
    );
  }
}

  
/*-------------not booked----------*/
//         Column(
//         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Container(
//             height: 3.5.h,
//             // color: Colors.red,
//           ),
//           Container(
//             padding: const EdgeInsets.only(bottom: 8, top: 10),
//             // height: 19.5.h,
//             // color: Colors.yellow,
//             // width: 35.5.h,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   "TAKE CHARGE!",
//                   style: TextStyle(
//                       fontSize: 13.0.sp,
//                       color: kwhite,
//                       fontWeight: FontWeight.bold),
//                 ),
//                 hBox,
//                 SizedBox(
//                   height: 7.h,
//                   width: 32.5.w,
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         "Schedule Your",
//                         style: TextStyle(fontSize: 9.3.sp, color: kwhite),
//                       ),
//                       Text(
//                         "FREE Expert",
//                         style: TextStyle(
//                             fontSize: 9.3.sp,
//                             color: kwhite,
//                             fontWeight: FontWeight.bold),
//                       ),
//                       Text(
//                         "Video Call Today!",
//                         style: TextStyle(
//                             fontSize: 9.3.sp,
//                             color: kwhite,
//                             fontWeight: FontWeight.bold),
//                       ),
//                     ],
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.only(top: 5),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     crossAxisAlignment: CrossAxisAlignment.end,
//                     children: [
//                       Expanded(
//                         child: Text(
//                           home2Ctext,
//                           style: TextStyle(fontSize: 9.3.sp, color: kwhite),
//                         ),
//                       ),
//                       SizedBox(
//                           height: 4.2.h,
//                           child: ElevatedButton.icon(
//                             style: ButtonStyle(
//                               shape: buttonShape(round: 8),
//                             ),
//                             onPressed: () {
//                               Get.to(() => BookCareerHomePage());
//                             },
//                             icon: Text(
//                               "Book Now",
//                               style: TextStyle(
//                                   fontSize: 10.sp,
//                                   color:
//                                       const Color.fromARGB(255, 15, 187, 195),
//                                   fontWeight: FontWeight.w600),
//                             ),
//                             label: Icon(
//                               Icons.arrow_forward_ios_sharp,
//                               size: 10.5.sp,
//                               color: const Color.fromARGB(255, 15, 187, 195),
//                             ),
//                           ))
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),


/* ----------if booked------- */
//         Column(
//         // mainAxisAlignment: MainAxisAlignment.start,
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Container(
//             height: 2.h,
//             color: Colors.red,
//           ),
//           Container(
//             padding: const EdgeInsets.only(bottom: 8, top: 0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   "Your Upcoming",
//                   style: TextStyle(fontSize: 14.sp, color: kwhite),
//                 ),
//                 Padding(
//                   padding: EdgeInsets.only(
//                       right: MediaQuery.of(context).size.width / 2),
//                   child: Text(
//                     "Counseling Session",
//                     style: TextStyle(
//                       fontSize: 14.sp,
//                       color: kwhite,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ),
//                 Padding(
//                   padding: EdgeInsets.only(
//                       right: MediaQuery.of(context).size.width / 2.3, top: 8),
//                   child: Text(
//                     home2Ctext,
//                     style: TextStyle(fontSize: 9.3.sp, color: kwhite),
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.only(top: 10),
//                   child: Row(
//                     children: [
//                       Row(
//                         children: [
//                           SvgPicture.asset('assets/images/calendar-booked.svg'),
//                           wBox,
//                           Column(
//                             children: [
//                               Text('5:30 PM',
//                                   style: TextStyle(
//                                       fontSize: 17,
//                                       fontWeight: FontWeight.bold,
//                                       color: kwhite)),
//                               Text('Wed , 16 Aug',
//                                   style: TextStyle(
//                                       fontSize: 11,
//                                       color: kwhite,
//                                       fontWeight: FontWeight.w600))
//                             ],
//                           )
//                         ],
//                       ),
//                       wMBox,
//                       SizedBox(
//                           height: 4.2.h,
//                           child: ElevatedButton.icon(
//                             style: ButtonStyle(
//                               shape: buttonShape(round: 8),
//                             ),
//                             onPressed: () {
//                               // Get.to(() => BookCareerHomePage());
//                             },
//                             icon: Text(
//                               "Counseling Session",
//                               style: TextStyle(
//                                   fontSize: 11.sp,
//                                   color:
//                                       const Color.fromARGB(255, 15, 187, 195),
//                                   fontWeight: FontWeight.w600),
//                             ),
//                             label: SvgPicture.asset(
//                                 'assets/images/Video-booked.svg'),
//                           ))
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),