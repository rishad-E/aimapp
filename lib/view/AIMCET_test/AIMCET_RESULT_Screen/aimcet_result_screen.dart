import 'dart:developer';

import 'package:aimshala/utils/common/widgets/colors_common.dart';
import 'package:aimshala/utils/common/widgets/text_common.dart';
import 'package:aimshala/utils/widgets/widgets_common.dart';
import 'package:aimshala/view/AIMCET_test/AIMCET_RESULT_Screen/widgets/widgets.dart';
import 'package:aimshala/view/AIMCET_test/AIMCET_widgets/aimcet_widgets.dart';
import 'package:aimshala/view/profile/common/widgets/texts.dart';
import 'package:flutter/material.dart';

class AimcetResultScreen extends StatelessWidget {
  const AimcetResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    int initialVal = 0;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: aimcetResultAppBar(),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(top: 100),
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/aimcet-result-bg.png'),
                  fit: BoxFit.fill),
            ),
            width: double.infinity,
            // height: 250,
            child: Column(
              children: [
                SizedBox(
                  height: 50,
                  child: Image.asset('assets/images/acecet-home.png'),
                ),
                hBox,
                semiBoldChoiceText(
                  text: 'Your Results',
                  size: 20,
                  color: kwhite,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 80),
                  child: regularText(
                      'Your personalised career results are ready—explore your best-fit options now.',
                      10,
                      color: kwhite,
                      textAlign: TextAlign.center),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 16),
                  height: 60,
                  child: Image.asset('assets/images/download-report.png'),
                ),
              ],
            ),
          ),
          StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
            return Column(
              children: [
                horizontalTabMain(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: List.generate(
                        10,
                        (index) => tabItems(
                            onTap: () {
                              log('index=>${index + 1} item');
                              setState(() {
                                initialVal = index;
                              });
                            },
                            selected: initialVal == index),
                      ),
                    ),
                  ),
                ),
                hLBox,
                boxes[initialVal]
              ],
            );
          })
        ],
      ),
    );
  }
}

List<Widget> boxes = [
  Container(color: Colors.red, height: 100, width: 100), // Box 1
  Container(color: Colors.green, height: 120, width: 120), // Box 2
  Container(color: Colors.blue, height: 140, width: 140), // Box 3
  Container(color: Colors.orange, height: 160, width: 160), // Box 4
  Container(color: Colors.purple, height: 180, width: 180), // Box 5
  Container(color: Colors.yellow, height: 200, width: 200), // Box 6
  Container(color: Colors.pink, height: 220, width: 220), // Box 7
  Container(color: Colors.teal, height: 240, width: 240), // Box 8
  Container(color: Colors.cyan, height: 260, width: 260), // Box 9
  Container(color: Colors.brown, height: 280, width: 280), // Box 10
];


// class MyTabBarPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//       length: 5, // Number of tabs
//       child: Scaffold(
//         appBar: AppBar(
//           title: Text('TabBar Example'),
//           bottom: TabBar(
//             tabs: [
//               Tab(icn: Icon(Icons.=directions_car), text: "Car"),
//               Tab(icon: Icon(Icons.directions_transit), text: "Transit"),
//               Tab(icon: Icon(Icons.directions_bike), text: "Bike"),
//               Tab(icon: Icon(Icons.directions_boat), text: "Boat"),
//               Tab(icon: Icon(Icons.directions_walk), text: "Walk"),
//             ],
//           ),
//         ),
//         body: TabBarView(
//           children: [
//             Center(child: Text('Car Tab')),
//             Center(child: Text('Transit Tab')),
//             Center(child: Text('Bike Tab')),
//             Center(child: Text('Boat Tab')),
//             Center(child: Text('Walk Tab')),
//           ],
//         ),
//       ),
//     );
//   }
// }