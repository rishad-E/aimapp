import 'package:flutter/material.dart';

class TopCareerContainer extends StatelessWidget {
  final String bgImage;
  final String careersType;
  final String salary;
  const TopCareerContainer(
      {super.key,
      required this.bgImage,
      required this.careersType,
      required this.salary});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 8),
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage(bgImage), fit: BoxFit.fill),
        // borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            careersType,
            style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w600),
            textAlign: TextAlign.center,
          ),
          Text(
            '(Avg Salary $salary)',
            style: const TextStyle(fontSize: 8),
            textAlign: TextAlign.center,
          ),
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
