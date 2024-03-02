import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class DiscoveryContainer extends StatelessWidget {
  const DiscoveryContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 8),
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 5),
      width: 38.w,
      // height: 72,
      decoration: BoxDecoration(
        image: const DecorationImage(
            image: AssetImage('assets/images/aimcetReport.png'),
            fit: BoxFit.fill),
        borderRadius: BorderRadius.circular(12),
        // color: Colors.yellow,
        border: Border.all(color: const Color.fromARGB(255, 221, 220, 220)),
      ),
      child: const Center(
        child: Text(
          "Finance and Investment Banking",
          style: TextStyle(fontSize: 11, fontWeight: FontWeight.w600),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
