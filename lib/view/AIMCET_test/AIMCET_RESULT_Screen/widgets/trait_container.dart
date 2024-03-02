import 'package:aimshala/utils/common/colors_common.dart';
import 'package:aimshala/utils/widgets/widgets_common.dart';
import 'package:flutter/material.dart';

class TraitContainer extends StatelessWidget {
  const TraitContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color.fromARGB(255, 230, 228, 228)),
      ),
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
      // height: 50,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 22),
      child: Column(
        children: [
          Container(
            height: 425,
            width: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/traitbg.png'),
                fit: BoxFit.fill,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 25, left: 50, right: 50),
              child: Column(
                children: [
                  Text(
                    "TRAIT REPORT",
                    style: TextStyle(
                      fontSize: 16,
                      color: kwhite,
                    ),
                  ),
                  Text(
                    "You're Artistic",
                    style: TextStyle(
                        color: kwhite,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "In fact, you're more artistic than 86% of the population.",
                    style: TextStyle(
                      fontSize: 12,
                      color: kwhite,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    "For Neeraj",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: kwhite,
                    ),
                  ),
                ],
              ),
            ),
          ),
          hLBox,
          Text(
            "Learn what makes you unique and how you compare to the rest of the world.",
            style: TextStyle(color: textFieldColor),
          ),
          hMBox,
          Row(
            children: [
              Text(
                "VIEW REPORT",
                style: TextStyle(
                    color: mainPurple,
                    fontWeight: FontWeight.w600,
                    fontSize: 16),
              ),
              Icon(
                Icons.arrow_forward,
                color: mainPurple,
                size: 19,
              )
            ],
          )
        ],
      ),
    );
  }
}
