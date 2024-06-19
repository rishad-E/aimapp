import 'package:aimshala/utils/common/widgets/colors_common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

BottomNavigationBar homeBottomNav(
    {required int currentIndex, void Function(int)? onTap}) {
  return BottomNavigationBar(
    currentIndex: currentIndex,
    type: BottomNavigationBarType.fixed,
    backgroundColor: kwhite,
    selectedItemColor: mainPurple,
    unselectedItemColor: Colors.grey,
    showSelectedLabels: true,
    showUnselectedLabels: true,
    selectedLabelStyle: TextStyle(color: mainPurple, fontSize: 10),
    unselectedLabelStyle: const TextStyle(color: Colors.grey, fontSize: 10),
    items: [
      bottomNavItem(
        image: "assets/images/search.svg",
        label: 'Explore',
      ),
      BottomNavigationBarItem(
        icon: SizedBox(
          height: 25,
          width: 25,
          // child: SvgPicture.asset(
          //   "assets/images/prepare.svg",
          //   // color: Colors.purple,
          // ),
          child: Image.asset(
            "assets/images/prepare.png",
            // color: Colors.purple,
          ),
        ),
        label: 'Prepare',
      ),
      bottomNavItem(
        image: "assets/images/Contribute.svg",
        label: 'Contribute',
      ),
      bottomNavItem(
        image: "assets/images/mentorship.svg",
        label: 'Mentorship',
      ),
      bottomNavItem(
        image: "assets/images/Engage.svg",
        label: 'Engage',
      ),
      bottomNavItem(
        image: "assets/images/nearyou.svg",
        label: 'Near you',
      ),
    ],
    onTap: onTap,
  );
}

BottomNavigationBarItem bottomNavItem(
    {required String image, required String label}) {
  return BottomNavigationBarItem(
    icon: SizedBox(
      height: 25,
      width: 25,
      child: SvgPicture.asset(image),
    ),
    label: label,
  );
}

Widget bottomNavContainer({required Widget child}) {
  return ClipRRect(
    borderRadius: const BorderRadius.only(
      topLeft: Radius.circular(20.0),
      topRight: Radius.circular(20.0),
    ),
    child: SizedBox(
      height: 80,
      width: double.infinity,
      child: child,
    ),
  );
}

      // BottomNavigationBarItem(
      //   icon: SizedBox(
      //     height: 25,
      //     width: 25,
      //     // child: SvgPicture.asset(
      //     //   "assets/images/prepare.svg",
      //     //   // color: Colors.purple,
      //     // ),
      //     child: Image.asset(
      //       "assets/images/prepare.png",
      //       // color: Colors.purple,
      //     ),
      //   ),
      //   label: 'Prepare',
      // ),
      // BottomNavigationBarItem(
      //   icon: SizedBox(
      //     height: 25,
      //     width: 25,
      //     child: SvgPicture.asset(
      //       "assets/images/Contribute.svg",
      //       // color: Colors.purple,
      //     ),
      //   ),
      //   label: 'Contribute',
      // ),
      // BottomNavigationBarItem(
      //   icon: SizedBox(
      //     height: 25,
      //     width: 25,
      //     child: SvgPicture.asset(
      //       "assets/images/mentorship.svg",
      //       // color: Colors.purple,
      //     ),
      //   ),
      //   label: 'Mentorship',
      // ),
      // BottomNavigationBarItem(
      //   icon: SizedBox(
      //     height: 25,
      //     width: 25,
      //     child: SvgPicture.asset(
      //       "assets/images/Engage.svg",
      //       // color: Colors.purple,
      //     ),
      //   ),
      //   label: 'Engage',
      // ),
      // BottomNavigationBarItem(
      //   icon: SizedBox(
      //     height: 25,
      //     width: 25,
      //     child: SvgPicture.asset(
      //       "assets/images/nearyou.svg",
      //       // color: Colors.purple,
      //     ),
      //   ),
      //   label: 'Near you',
      // ),