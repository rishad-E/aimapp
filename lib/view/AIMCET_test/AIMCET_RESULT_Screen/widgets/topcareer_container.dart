import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class TopCareerContainer extends StatelessWidget {
  final String bgImage;
  const TopCareerContainer({super.key,required this.bgImage});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 8),
      padding: const EdgeInsets.symmetric(vertical: 20),
      width: 38.w,
      // height: 72,
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage(bgImage), fit: BoxFit.fill),
        borderRadius: BorderRadius.circular(12),
        // color: Colors.yellow,
        border: Border.all(color: const Color.fromARGB(255, 221, 220, 220)),
      ),
      child: const Center(
        child: Column(
          children: [
            Text(
              "Finance and Investment Banking",
              style: TextStyle(fontSize: 11, fontWeight: FontWeight.w600),
              textAlign: TextAlign.center,
            ),
            Text(
              '(Avg Salary 14-18 lpa)',
              style: TextStyle(fontSize: 8),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
