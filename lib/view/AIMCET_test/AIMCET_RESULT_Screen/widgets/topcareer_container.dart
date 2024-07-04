import 'package:aimshala/utils/common/widgets/colors_common.dart';
import 'package:aimshala/utils/common/widgets/text_common.dart';
import 'package:aimshala/utils/widgets/widgets_common.dart';
import 'package:aimshala/view/profile/common/widgets/texts.dart';
import 'package:flutter/material.dart';

class TopCareerContainer extends StatelessWidget {
  final String index;
  final String careers;
  final String salary;
  const TopCareerContainer(
      {super.key,
      required this.index,
      required this.careers,
      required this.salary});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 8),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: kwhite,
        border: Border.all( color: const Color.fromARGB(255, 238, 236, 236),),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            // padding: EdgeInsets.all(5),
            decoration: const BoxDecoration(
                color: Color.fromARGB(255, 15, 187, 195),
                shape: BoxShape.circle),
            height: 20,
            width: 20,
            child: Center(
                child: Text(
              index,
              style: TextStyle(color: kwhite),
            )),
          ),
          wBox,
          wBox,
          Flexible(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                  child: semiBoldChoiceText(
                    text: careers,
                    size: 11,
                    // overflow: TextOverflow.visible,
                  ),
                ),
                regularText(salary, 10)
              ],
            ),
          )
        ],
      ),
    );
  }
}






// class TopCareerContainer extends StatelessWidget {
//   final String bgImage;
//   const TopCareerContainer({super.key,required this.bgImage});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: const EdgeInsets.only(right: 8),
//       padding: const EdgeInsets.symmetric(vertical: 20),
//       width: 38.w,
//       // height: 72,
//       decoration: BoxDecoration(
//         image: DecorationImage(
//             image: AssetImage(bgImage), fit: BoxFit.fill),
//         borderRadius: BorderRadius.circular(12),
//         // color: Colors.yellow,
//         border: Border.all(color: const Color.fromARGB(255, 221, 220, 220)),
//       ),
//       child: const Center(
//         child: Column(
//           children: [
//             Text(
//               "Hospitality and Tourism",
//               style: TextStyle(fontSize: 11, fontWeight: FontWeight.w600),
//               textAlign: TextAlign.center,
//             ),
//             Text(
//               '(Avg Salary 14-18 lpa)',
//               style: TextStyle(fontSize: 8),
//               textAlign: TextAlign.center,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
