import 'package:aimshala/utils/common/widgets/colors_common.dart';
import 'package:aimshala/utils/common/widgets/text_common.dart';
import 'package:aimshala/utils/widgets/widgets_common.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class TestResDownloadPage extends StatelessWidget {
  const TestResDownloadPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        gradient: const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFF12054E),
            Color(0xFF37065D),
            Color(0xFF45108A),
          ],
          stops: [0.0, 0.4531, 1.0],
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
            height: 23.h,
            child: Image.asset('assets/images/chip.png'),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: SizedBox(
              height: 5.5.h,
              child: Image.asset('assets/images/acecet-home.png'),
            ),
          ),
          boldText(text: 'Download', size: 20, color: kwhite),
          regularText('Your Test Report', 20, color: kwhite),
          Padding(
            padding: const EdgeInsets.only(top: 12, bottom: 8),
            child: SizedBox(
              height: 4.2.h,
              child: ElevatedButton.icon(
                style: ButtonStyle(
                  shape: buttonShape(round: 8),
                ),
                icon: Text(
                  "Download Now!",
                  style: TextStyle(
                      fontSize: 11.sp,
                      color: const Color.fromARGB(255, 147, 38, 143),
                      fontWeight: FontWeight.w600),
                ),
                label: Icon(
                  Icons.arrow_forward_ios_sharp,
                  size: 11.sp,
                  color: const Color.fromARGB(255, 147, 38, 143),
                ),
                onPressed: () {},
              ),
            ),
          )
        ],
      ),
    );
  }
}
