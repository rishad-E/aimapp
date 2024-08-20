import 'package:aimshala/controllers/aimcet_test_controller.dart';
import 'package:aimshala/utils/common/widgets/colors_common.dart';
import 'package:aimshala/utils/widgets/widgets_common.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AimcetTestBottomsheet extends StatelessWidget {
  const AimcetTestBottomsheet({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AIMCETController());

    return SingleChildScrollView(
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).pop();
        },
        child: Container(
            // height: 700,
            padding: const EdgeInsets.only(left: 20, top: 10, bottom: 30),
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(24),
                    topRight: Radius.circular(24))),
            child: Obx(
              () => Column(
                children: [
                  const Align(
                    alignment: Alignment.topCenter,
                    child: Icon(Icons.keyboard_arrow_down_sharp),
                  ),
                  ...List.generate(
                    controller.aimcetList.length,
                    (index) {
                      if (index == controller.aimcetList.length - 1) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: controller.secID.value == index &&
                                            controller.end.value == 'yes'
                                        ? mainPurple
                                        : kwhite,
                                    border: Border.all(
                                      color: textFieldColor.withOpacity(0.1),
                                      width: 1,
                                    ),
                                  ),
                                  child: controller.secID.value == index &&
                                          controller.end.value == 'yes'
                                      ? Icon(Icons.done, color: kwhite)
                                      : CircleAvatar(
                                          radius: 12,
                                          backgroundColor: kwhite,
                                        ),
                               
                               
                                ),
                                wMBox,
                                Text(
                                  controller.aimcetList[index],
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14,
                                      color: mainPurple),
                                )
                              ],
                            ),
                          ],
                        );
                      } else {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: controller.secID > index
                                        ? mainPurple
                                        : kwhite,
                                    border: Border.all(
                                      color: textFieldColor.withOpacity(0.1),
                                      width: 1,
                                    ),
                                  ),
                                  child: controller.secID > index
                                      ? Icon(Icons.done, color: kwhite)
                                      : CircleAvatar(
                                          radius: 12,
                                          backgroundColor: kwhite,
                                        ),
                                ),
                                wMBox,
                                Text(
                                  controller.aimcetList[index],
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14,
                                      color: mainPurple),
                                )
                              ],
                            ),
                            Container(
                              margin: const EdgeInsets.only(left: 10),
                              width: 5,
                              height: 25,
                              color: textFieldColor.withOpacity(0.1),
                            ),
                          ],
                        );
                      }
                    },
                  ),
                ],
              ),
            )),
      ),
    );
  }
}

// if (index == 0) {
//   return Column(
//     crossAxisAlignment: CrossAxisAlignment.start,
//     children: [
//       Row(
//         mainAxisAlignment: MainAxisAlignment.start,
//         children: [
//           CircleAvatar(
//             radius: 12,
//             backgroundColor: mainPurple,
//             child: Icon(
//               Icons.done_sharp,
//               color: kwhite,
//               size: 15,
//             ),
//           ),
//           wMBox,
//           Text(
//             "Personality Assesment",
//             style: TextStyle(
//                 fontWeight: FontWeight.w600,
//                 fontSize: 14,
//                 color: mainPurple),
//           )
//         ],
//       ),
//       Container(
//         margin: const EdgeInsets.only(left: 10),
//         // padding: EdgeInsets.only(left: 15),
//         width: 5,
//         height: 25,
//         color: textFieldColor.withOpacity(0.1),
//       ),
//     ],
//   );
// } else if (index == 7) {
//   return Column(
//     crossAxisAlignment: CrossAxisAlignment.start,
//     children: [
//       Row(
//         mainAxisAlignment: MainAxisAlignment.start,
//         children: [
//           Container(
//             decoration: BoxDecoration(
//               shape: BoxShape.circle,
//               border: Border.all(
//                 color: textFieldColor.withOpacity(0.1),
//                 width: 1,
//               ),
//             ),
//             child: CircleAvatar(
//               radius: 12,
//               backgroundColor: kwhite,
//             ),
//           ),
//           wMBox,
//           Text(
//             "Personality Assesment",
//             style: TextStyle(
//                 fontWeight: FontWeight.w600,
//                 fontSize: 14,
//                 color: mainPurple),
//           )
//         ],
//       ),
//     ],
//   );
// } else {
//   return Column(
//     crossAxisAlignment: CrossAxisAlignment.start,
//     children: [
//       Row(
//         mainAxisAlignment: MainAxisAlignment.start,
//         children: [
//           Container(
//             decoration: BoxDecoration(
//               shape: BoxShape.circle,
//               border: Border.all(
//                 color: textFieldColor.withOpacity(0.1),
//                 width: 1,
//               ),
//             ),
//             child: CircleAvatar(
//               radius: 12,
//               backgroundColor: kwhite,
//             ),
//           ),
//           wMBox,
//           Text(
//             "Personality Assesment",
//             style: TextStyle(
//                 fontWeight: FontWeight.w600,
//                 fontSize: 14,
//                 color: mainPurple),
//           )
//         ],
//       ),
//       Container(
//         margin: const EdgeInsets.only(left: 10),
//         // padding: EdgeInsets.only(left: 15),
//         width: 5,
//         height: 25,
//         color: textFieldColor.withOpacity(0.1),
//       ),
//     ],
//   );
// }
