import 'dart:developer';
import 'package:aimshala/controllers/login_controller.dart';
import 'package:aimshala/models/UserModel/user_model.dart';
import 'package:aimshala/utils/common/colors_common.dart';
import 'package:aimshala/utils/widgets/widgets_common.dart';
import 'package:aimshala/view/home/home.dart';
import 'package:aimshala/view/profile/common/widgets/widgets.dart';
import 'package:aimshala/view/profile/profile_add_skill_section/add_skill_screen.dart';
import 'package:aimshala/view/profile/profile_contact_info/contact_info_screen.dart';
import 'package:aimshala/view/profile/profile_education_section/add_education_screen.dart';
import 'package:aimshala/view/profile/profile_experience_section/add_experience_screen.dart';
import 'package:aimshala/view/profile/profile_honorsawards_section/add_honorsawards_screen.dart';
import 'package:aimshala/view/profile/profile_personal_info/personal_info_screen.dart';
import 'package:aimshala/view/profile/profile_home/widgets/widgets.dart';
import 'package:aimshala/view/profile/profile_project_section/add_project_screen.dart';
import 'package:aimshala/view/profile/profile_publications_section/add_publications_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileHomeScreen extends StatelessWidget {
  const ProfileHomeScreen({super.key});
  final double coverHeight = 240;
  final double profileHeight = 130;
  @override
  Widget build(BuildContext context) {
    // String? name;
    // String? email;
    // String? id;
    // String? mobNo;
    // String? userName;
    // String? dOB;
    User? data;
    final UserDataModel? userData = Get.put(LoginController()).userData;
    if (userData != null) {
      data = userData.user;
      // name = userData.user?.name ?? '';
      // email = userData.user?.email ?? '';
      // mobNo = userData.user?.phone ?? '';
      // id = userData.user?.id.toString() ?? '';
      // userName = userData.user?.username;
      // dOB = userData.user?.dob;
    }
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
                Text(
                  // name.toString(),
                  data?.name ?? '',
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
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
                                    Get.to(() => ProfilePersonalInfoScreen(
                                        id: data?.id.toString() ?? '',
                                        username: data?.username));
                                  },
                                  child: Icon(
                                    Icons.edit,
                                    color: kpurple,
                                  ),
                                )
                              ],
                            ),
                            hBox,
                            infoText(
                                text1: 'Full Name:', text2: data?.name ?? '_'),
                            infoText(
                                text1: 'Username:',
                                text2: data?.username ?? '_'),
                            infoText(
                                text1: 'Date of Birth:',
                                text2: data?.dob ?? '_'),
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
                                    Get.to(() => ProfileContactInfoScreen(
                                        id: data?.id.toString() ?? '',
                                        userName: data?.username));
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
                              text: '+91 ${data?.phone}',
                              svg: 'assets/images/call.svg',
                            ),
                            contactInfos(
                              text: data?.email ?? '_',
                              svg: 'assets/images/email.svg',
                            ),
                            contactInfos(
                              text: data?.address ?? '_',
                              svg: 'assets/images/location.svg',
                            ),
                            contactInfos(
                              text: data?.instagram ?? '_',
                              svg: 'assets/images/Instagram.svg',
                            ),
                            contactInfos(
                              text: data?.facebook ?? '_',
                              svg: 'assets/images/facebook.svg',
                            ),
                            contactInfos(
                              text: data?.twitter ?? '_',
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
                            onPressed: () => Get.to(
                                () => const ProfileAddHonorsandAwardsScreenn()),
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
                            onPressed: () => Get.to(
                                () => const ProfileAddPublicationScreen()),
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
                            onPressed: () =>
                                Get.to(() => const ProfileAddSkillScreen()),
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
                            onPressed: () =>
                                Get.to(() => const ProfileAddProjectScreen()),
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
