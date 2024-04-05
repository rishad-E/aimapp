import 'dart:developer';
import 'package:aimshala/utils/common/colors_common.dart';
import 'package:aimshala/utils/widgets/widgets_common.dart';
import 'package:aimshala/view/home/home.dart';
import 'package:aimshala/view/profile/common/widgets/widgets.dart';
import 'package:aimshala/view/profile/profile_contact_info/contact_info_screen.dart';
import 'package:aimshala/view/profile/profile_education_section/add_education_screen.dart';
import 'package:aimshala/view/profile/profile_experience_section/add_experience_screen.dart';
import 'package:aimshala/view/profile/profile_personal_info/personal_info_screen.dart';
import 'package:aimshala/view/profile/profile_home/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileHomeScreen extends StatelessWidget {
  const ProfileHomeScreen({super.key});
  final double coverHeight = 240;
  final double profileHeight = 130;
  @override
  Widget build(BuildContext context) {
    final top = coverHeight - profileHeight / 1.2;
    final bottom = profileHeight / 7;
    return PopScope(
      onPopInvoked: (didPop) =>
          Future.microtask(() => Get.off(() => const HomeScreen())),
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: profileAppBar(title: "Profile", doneWidget: shrinked),
        backgroundColor: Colors.grey.shade100,
        body: ListView(
          padding: EdgeInsets.zero,
          children: [
            buildTopContent(
              bottom: bottom,
              coverHeight: coverHeight,
              top: top,
              profileHeight: profileHeight,
              profilePicWidget: buildProfileImage(
                profileHeight: profileHeight,
                onPressed: () => log('camera icon profile'),
              ),
            ),
            hMBox,
            Column(
              children: [
                hBox,
                const Text(
                  'Jhon Doe',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const Text(
                  'Flutter Developer',
                  style: TextStyle(fontSize: 12),
                ),
                hMBox,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      infoContainer(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                infoHeading("Personal Info"),
                                GestureDetector(
                                  onTap: () {
                                    log('edit personal info');
                                    Get.to(() => ProfilePersonalInfoScreen());
                                  },
                                  child: Icon(
                                    Icons.edit,
                                    color: kpurple,
                                  ),
                                )
                              ],
                            ),
                            hBox,
                            infoText(text1: 'Full Name:', text2: 'John Doe'),
                            infoText(text1: 'Username:', text2: 'johndoe123'),
                            infoText(
                                text1: 'Date of Birth:',
                                text2: '24 - 08 - 1997'),
                          ],
                        ),
                      ),
                      // hBox,
                      // hBox,
                      infoContainer(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                infoHeading("Contact Info"),
                                GestureDetector(
                                  onTap: () {
                                    log('edit contact info');
                                    Get.to(
                                        () => const ProfileContactInfoScreen());
                                  },
                                  child: Icon(
                                    Icons.edit,
                                    color: kpurple,
                                  ),
                                )
                              ],
                            ),
                            hBox,
                            contactInfos(
                              text: '+91 97296 65668',
                              svg: 'assets/images/call.svg',
                            ),
                            contactInfos(
                              text: 'johndoe@gmail.com',
                              svg: 'assets/images/email.svg',
                            ),
                            contactInfos(
                              text:
                                  'D-79, Block D, Sector 48, Noida, Uttar Pradesh 201303, India',
                              svg: 'assets/images/location.svg',
                            ),
                            contactInfos(
                              text: '_',
                              svg: 'assets/images/Instagram.svg',
                            ),
                            contactInfos(
                              text: '_',
                              svg: 'assets/images/facebook.svg',
                            ),
                            contactInfos(
                              text: '_',
                              svg: 'assets/images/twitter.svg',
                            ),
                          ],
                        ),
                      ),
                      infoContainer(
                          child: Column(
                        children: [
                          infoHeading('Education'),
                          hBox,
                          const Text(
                            "No Education included yet",
                            style: TextStyle(fontSize: 12),
                          ),
                          TextButton.icon(
                            onPressed: () =>
                                Get.to(() => const AddEducationScreen()),
                            icon: const Text(
                              "Add Now",
                              style: TextStyle(
                                  fontSize: 11,
                                  color: Color.fromARGB(255, 15, 187, 195),
                                  fontWeight: FontWeight.w600),
                            ),
                            label: const Icon(
                              Icons.add,
                              size: 16,
                              color: Color.fromARGB(255, 15, 187, 195),
                            ),
                          )
                        ],
                      )),
                      infoContainer(
                        child: Column(
                          children: [
                            infoHeading('Experience'),
                            hBox,
                            const Text(
                              "No Experience included yet",
                              style: TextStyle(fontSize: 12),
                            ),
                            TextButton.icon(
                              onPressed: () =>
                                  Get.to(() => const AddExperienceScreen()),
                              icon: const Text(
                                "Add Now",
                                style: TextStyle(
                                    fontSize: 11,
                                    color: Color.fromARGB(255, 15, 187, 195),
                                    fontWeight: FontWeight.w600),
                              ),
                              label: const Icon(
                                Icons.add,
                                size: 16,
                                color: Color.fromARGB(255, 15, 187, 195),
                              ),
                            )
                          ],
                        ),
                      ),
                      infoContainer(
                          child: Column(
                        children: [
                          infoHeading('Honors & awards'),
                          hBox,
                          const Text(
                            "No Honors & awards included yet",
                            style: TextStyle(fontSize: 12),
                          ),
                          TextButton.icon(
                            onPressed: () {},
                            icon: const Text(
                              "Add Now",
                              style: TextStyle(
                                  fontSize: 11,
                                  color: Color.fromARGB(255, 15, 187, 195),
                                  fontWeight: FontWeight.w600),
                            ),
                            label: const Icon(
                              Icons.add,
                              size: 16,
                              color: Color.fromARGB(255, 15, 187, 195),
                            ),
                          )
                        ],
                      )),
                      infoContainer(
                          child: Column(
                        children: [
                          infoHeading('Licenses & Certifications'),
                          hBox,
                          const Text(
                            "No Licenses & Certifications included yet",
                            style: TextStyle(fontSize: 12),
                          ),
                          TextButton.icon(
                            onPressed: () {},
                            icon: const Text(
                              "Add Now",
                              style: TextStyle(
                                  fontSize: 11,
                                  color: Color.fromARGB(255, 15, 187, 195),
                                  fontWeight: FontWeight.w600),
                            ),
                            label: const Icon(
                              Icons.add,
                              size: 16,
                              color: Color.fromARGB(255, 15, 187, 195),
                            ),
                          )
                        ],
                      )),
                      infoContainer(
                          child: Column(
                        children: [
                          infoHeading('Publications'),
                          hBox,
                          const Text(
                            "No Publications included yet",
                            style: TextStyle(fontSize: 12),
                          ),
                          TextButton.icon(
                            onPressed: () {},
                            icon: const Text(
                              "Add Now",
                              style: TextStyle(
                                  fontSize: 11,
                                  color: Color.fromARGB(255, 15, 187, 195),
                                  fontWeight: FontWeight.w600),
                            ),
                            label: const Icon(
                              Icons.add,
                              size: 16,
                              color: Color.fromARGB(255, 15, 187, 195),
                            ),
                          )
                        ],
                      )),
                      infoContainer(
                          child: Column(
                        children: [
                          infoHeading('Skills'),
                          hBox,
                          const Text(
                            "No Skills included yet",
                            style: TextStyle(fontSize: 12),
                          ),
                          TextButton.icon(
                            onPressed: () {},
                            icon: const Text(
                              "Add Now",
                              style: TextStyle(
                                  fontSize: 11,
                                  color: Color.fromARGB(255, 15, 187, 195),
                                  fontWeight: FontWeight.w600),
                            ),
                            label: const Icon(
                              Icons.add,
                              size: 16,
                              color: Color.fromARGB(255, 15, 187, 195),
                            ),
                          )
                        ],
                      )),
                      infoContainer(
                          child: Column(
                        children: [
                          infoHeading('Projects'),
                          hBox,
                          const Text(
                            "No Projects included yet",
                            style: TextStyle(fontSize: 12),
                          ),
                          TextButton.icon(
                            onPressed: () {},
                            icon: const Text(
                              "Add Now",
                              style: TextStyle(
                                  fontSize: 11,
                                  color: Color.fromARGB(255, 15, 187, 195),
                                  fontWeight: FontWeight.w600),
                            ),
                            label: const Icon(
                              Icons.add,
                              size: 16,
                              color: Color.fromARGB(255, 15, 187, 195),
                            ),
                          )
                        ],
                      )),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
