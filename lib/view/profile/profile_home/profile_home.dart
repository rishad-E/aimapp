import 'dart:developer';
import 'package:aimshala/controllers/profile_controller/profile_contact_info_controller.dart';
import 'package:aimshala/controllers/profile_controller/profile_education_controller.dart';
import 'package:aimshala/controllers/profile_controller/profile_experience_controller.dart';
import 'package:aimshala/controllers/profile_controller/profile_home_controller.dart';
import 'package:aimshala/controllers/profile_controller/profile_honoraward_controller.dart';
import 'package:aimshala/controllers/profile_controller/profile_language_course_controller.dart';
import 'package:aimshala/controllers/profile_controller/profile_license_certification_controller.dart';
import 'package:aimshala/controllers/profile_controller/profile_project_controller.dart';
import 'package:aimshala/controllers/profile_controller/profile_publications_controller.dart';
import 'package:aimshala/controllers/profile_controller/profile_skill_info_controller.dart';
import 'package:aimshala/controllers/profile_controller/profile_volunteer_controller.dart';
import 'package:aimshala/utils/common/widgets/colors_common.dart';
import 'package:aimshala/utils/common/widgets/text_common.dart';
import 'package:aimshala/utils/widgets/widgets_common.dart';
import 'package:aimshala/view/home/home.dart';
import 'package:aimshala/view/profile/common/widgets/widgets.dart';
import 'package:aimshala/view/profile/profile_add_course_section/add_course_info_screen.dart';
import 'package:aimshala/view/profile/profile_add_skill_section/add_skill_screen.dart';
import 'package:aimshala/view/profile/profile_home/update_profile_photo.dart';
import 'package:aimshala/view/profile/profile_view_all_section/course_section.dart';
import 'package:aimshala/view/profile/profile_view_all_section/education_section.dart';
import 'package:aimshala/view/profile/profile_view_all_section/experience_section.dart';
import 'package:aimshala/view/profile/profile_view_all_section/honor_award_section.dart';
import 'package:aimshala/view/profile/profile_view_all_section/language_section.dart';
import 'package:aimshala/view/profile/profile_view_all_section/license_section.dart';
import 'package:aimshala/view/profile/profile_view_all_section/project_section.dart';
import 'package:aimshala/view/profile/profile_view_all_section/publication_section.dart';
import 'package:aimshala/view/profile/profile_view_all_section/skills_section.dart';
import 'package:aimshala/view/profile/profile_contact_section/contact_info_screen.dart';
import 'package:aimshala/view/profile/profile_education_section/add_education_screen.dart';
import 'package:aimshala/view/profile/profile_experience_section/add_experience_screen.dart';
import 'package:aimshala/view/profile/profile_home/widgets/section_widgets.dart';
import 'package:aimshala/view/profile/profile_home/widgets/texts.dart';
import 'package:aimshala/view/profile/profile_honorsawards_section/add_honorsawards_screen.dart';
import 'package:aimshala/view/profile/profile_language_section/add_language_screen.dart';
import 'package:aimshala/view/profile/profile_license_certifications_section/add_license_certification_screen.dart';
import 'package:aimshala/view/profile/profile_personal_section/personal_info_screen.dart';
import 'package:aimshala/view/profile/profile_home/widgets/widgets.dart';
import 'package:aimshala/view/profile/profile_project_section/add_project_screen.dart';
import 'package:aimshala/view/profile/profile_publications_section/add_publications_screen.dart';
import 'package:aimshala/view/profile/profile_view_all_section/volunteer_section.dart';
import 'package:aimshala/view/profile/profile_volunteer_section/add_volunteer_experience_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileHomeScreen extends StatelessWidget {
  final String id;
  const ProfileHomeScreen({super.key, required this.id});
  final double coverHeight = 240;
  final double profileHeight = 130;
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProfileSkillController());
    final profileC = Get.put(ProfileHomeController());
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      log(id, name: 'callback uid profile Home');
      controller.getProfileAlldataFunction(uId: id);
      profileC.fetchAlluserData(uId: id);
    });
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
              profilePicWidget: Obx(
                () => buildProfileImage(
                  profileHeight: profileHeight,
                  image: profileC.selectedImage.value.isNotEmpty
                      ? NetworkImage(profileC.selectedImage.value)
                          as ImageProvider
                      : const AssetImage('assets/images/person.png'),
                  onPressed: () => showDialog(
                      context: context,
                      builder: (context) => UpdateProfilePhotoScreen(uId: id)),
                ),
              ),
            ),
            hMBox,
            Column(
              children: [
                hBox,
                Obx(() => Text(
                      profileC.userData.value?.name ?? '',
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    )),
                Obx(
                  () => Text(
                    profileC.userRole.value,
                    style: const TextStyle(fontSize: 12),
                  ),
                ),
                hBox,
                hMBox,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      infoContainer(child: Obx(() {
                        final data = profileC.userData.value;
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                infoHeading("Personal Info"),
                                GestureDetector(
                                  onTap: () =>
                                      Get.to(() => ProfilePersonalInfoScreen(
                                            user: data,
                                            id: id,
                                            dob: profileC.userDOB.value,
                                            gender: profileC.userGender.value,
                                          )),
                                  child: Icon(Icons.edit, color: kpurple),
                                )
                              ],
                            ),
                            hBox,
                            infoText(
                              text1: 'Full Name:',
                              text2: data?.name ?? '_',
                            ),
                            infoText(
                              text1: 'Username:',
                              text2: data?.username ?? '_',
                            ),
                            infoText(
                              text1: 'Date of Birth:',
                              text2: profileC.userDOB.value,
                            ),
                            infoText(
                              text1: 'Gender:',
                              text2: profileC.userGender.value,
                            ),
                            hBox,
                            hBox,
                            regularText(data?.about ?? '_', 12)
                          ],
                        );
                      })),
                      Obx(
                        () {
                          final data = profileC.userData.value;
                          return infoContainer(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    infoHeading("Contact Info"),
                                    GestureDetector(
                                      onTap: () {
                                        Get.put(UpdateContactInfo())
                                            .fetchCountryStates();
                                        Get.to(() => ProfileContactInfoScreen(
                                            user: data, id: id));
                                      },
                                      child: Icon(Icons.edit, color: kpurple),
                                    )
                                  ],
                                ),
                                hBox,
                                data?.phone == null
                                    ? shrinked
                                    : contactInfos(
                                        text: '+91 ${data?.phone}',
                                        svg: 'assets/images/call.svg',
                                        height: 22,
                                        fit: BoxFit.fitHeight,
                                      ),
                                data?.email == null
                                    ? shrinked
                                    : contactInfos(
                                        text: "${data?.email}",
                                        svg: 'assets/images/email.svg',
                                        fit: BoxFit.contain,
                                      ),
                                data?.address == null
                                    ? shrinked
                                    : contactInfos(
                                        text:
                                            "${data?.address}, ${data?.city}, ${data?.state}",
                                        svg: 'assets/images/location.svg',
                                        height: 27,
                                        fit: BoxFit.fitHeight,
                                      ),
                                data?.instagram == "" || data?.instagram == null
                                    ? shrinked
                                    : contactInfos(
                                        text: data?.instagram,
                                        svg: 'assets/images/Instagram.svg',
                                        fit: BoxFit.contain,
                                      ),
                                data?.facebook == "" || data?.facebook == null
                                    ? shrinked
                                    : contactInfos(
                                        text: data?.facebook,
                                        svg: 'assets/images/facebook.svg',
                                        height: 23,
                                        fit: BoxFit.contain,
                                      ),
                                data?.twitter == null || data?.twitter == ''
                                    ? shrinked
                                    : contactInfos(
                                        text: data?.twitter,
                                        svg: 'assets/images/twitter.svg',
                                        fit: BoxFit.contain,
                                      ),
                              ],
                            ),
                          );
                        },
                      ),
                      Obx(() {
                        final data = controller.education;
                        final eduController =
                            Get.put(ProfileEducationController());
                        return controller.profileDataLoading.value
                            ? loadingWidget()
                            : data.isEmpty
                                ? profileNodataContainer(
                                    headingText: 'Education',
                                    subText: 'No Education included yet',
                                    onPressed: () {
                                      eduController.clearallFields();
                                      Get.to(() => AddEducationScreen(uId: id));
                                    },
                                  )
                                : profileDataContainer(
                                    section: "Education",
                                    onTapAdd: () {
                                      eduController.clearallFields();
                                      Get.to(() => AddEducationScreen(uId: id));
                                    },
                                    onTapEdit: () {
                                      if (data.length < 2) {
                                        eduController.clearallFields();
                                        Get.to(() => AddEducationScreen(
                                            uId: id, edu: data[0]));
                                      } else {
                                        eduController.clearallFields();
                                        Get.to(() => EducationSectionScreen(
                                            uId: id, education: data));
                                      }
                                    },
                                    viewAll: data.length < 2
                                        ? shrinked
                                        : viewAllButton(onPressedViewAll: () {
                                            eduController.clearallFields();
                                            Get.to(() => EducationSectionScreen(
                                                uId: id, education: data));
                                          }),
                                    sectionData: List.generate(
                                      data.length < 2 ? data.length : 2,
                                      (index) {
                                        return sectionDataWidget(
                                            image: "assets/images/upEvent1.png",
                                            secTitle:
                                                data[index].school.toString(),
                                            secSubTitle:
                                                data[index].degree.toString(),
                                            secSubTitle2:
                                                "${parseDateMonthYear(data[index].startDate.toString())} - ${parseDateMonthYear(data[index].endDate.toString())}",
                                            secSubTitle3:
                                                "Grade: ${data[index].grade.toString()}",
                                            secSubTitle4: data[index].skills ==
                                                    null
                                                ? 'Skill: _'
                                                : "Skills: ${data[index].skills.toString()}",
                                            secSubTitle5: data[index]
                                                .description
                                                .toString(),
                                            end: data.length < 2
                                                ? data.length - 1 == index
                                                : index == 1);
                                      },
                                    ),
                                  );
                      }),
                      Obx(() {
                        final data = controller.experience;
                        final exController =
                            Get.put(ProfileExperienceController());
                        return controller.profileDataLoading.value
                            ? shrinked
                            : data.isEmpty
                                ? profileNodataContainer(
                                    headingText: 'Experience',
                                    subText: "No Experience included yet",
                                    onPressed: () {
                                      exController.clearallFieldController();
                                      Get.to(
                                          () => AddExperienceScreen(uId: id));
                                    },
                                  )
                                : profileDataContainer(
                                    section: "Experience",
                                    onTapAdd: () {
                                      exController.clearallFieldController();
                                      Get.to(
                                          () => AddExperienceScreen(uId: id));
                                    },
                                    onTapEdit: () {
                                      exController.clearallFieldController();
                                      if (data.length < 2) {
                                        Get.to(() => AddExperienceScreen(
                                            uId: id, experience: data[0]));
                                      } else {
                                        Get.to(() => ExperienceSectionScreen(
                                            uId: id, experience: data));
                                      }
                                    },
                                    viewAll: data.length < 2
                                        ? shrinked
                                        : viewAllButton(onPressedViewAll: () {
                                            exController
                                                .clearallFieldController();
                                            Get.to(() =>
                                                ExperienceSectionScreen(
                                                    uId: id, experience: data));
                                          }),
                                    sectionData: List.generate(
                                      data.length < 2 ? data.length : 2,
                                      (index) => sectionDataWidget(
                                          image: "assets/images/upEvent1.png",
                                          secTitle:
                                              data[index].title.toString(),
                                          secSubTitle: data[index]
                                              .companyName
                                              .toString(),
                                          secSubTitle2: data[index].endDate ==
                                                  'currently_working'
                                              ? "${parseDateMonthYear(data[index].startDate.toString())} - On-going"
                                              : "${parseDateMonthYear(data[index].startDate.toString())}-${parseDateMonthYear(data[index].endDate.toString())}",
                                          secSubTitle3:
                                              "${data[index].locationType.toString()},${data[index].location.toString()}",
                                          secSubTitle4: data[index].skills ==
                                                  null
                                              ? "Skills:_"
                                              : "Skills:${data[index].skills.toString()}",
                                          secSubTitle5: data[index]
                                              .description
                                              .toString(),
                                          end: data.length < 2
                                              ? data.length - 1 == index
                                              : index == 1),
                                    ),
                                  );
                      }),
                      Obx(() {
                        final data = controller.award;
                        final awController =
                            Get.put(ProfileHonorsAwardsController());
                        return controller.profileDataLoading.value
                            ? shrinked
                            : data.isEmpty
                                ? profileNodataContainer(
                                    headingText: 'Honors & awards',
                                    subText: "No Honors & awards included yet",
                                    onPressed: () {
                                      awController.clearallFieldController();
                                      Get.to(() =>
                                          ProfileAddHonorsandAwardsScreen(
                                              uId: id));
                                    },
                                  )
                                : profileDataContainer(
                                    section: "Honors & awards",
                                    onTapAdd: () {
                                      awController.clearallFieldController();
                                      Get.to(() =>
                                          ProfileAddHonorsandAwardsScreen(
                                              uId: id));
                                    },
                                    onTapEdit: () {
                                      awController.clearallFieldController();
                                      if (data.length < 2) {
                                        Get.to(() =>
                                            ProfileAddHonorsandAwardsScreen(
                                                uId: id, award: data[0]));
                                      } else {
                                        Get.to(() => AwardHonorSectionScreen(
                                            uId: id, award: data));
                                      }
                                    },
                                    viewAll: data.length < 2
                                        ? shrinked
                                        : viewAllButton(onPressedViewAll: () {
                                            awController
                                                .clearallFieldController();
                                            Get.to(() =>
                                                AwardHonorSectionScreen(
                                                    uId: id, award: data));
                                          }),
                                    sectionData: List.generate(
                                      data.length < 2 ? data.length : 2,
                                      (index) => honorWidget(
                                          title: data[index].title.toString(),
                                          date: parseDateMonthYear(
                                              data[index].startDate.toString()),
                                          image: "assets/images/upEvent1.png",
                                          assosiated:
                                              data[index].associated.toString(),
                                          description: data[index]
                                              .description
                                              .toString(),
                                          skills: 'no',
                                          end: data.length < 2
                                              ? data.length - 1 == index
                                              : index == 1),
                                    ),
                                  );
                      }),
                      Obx(() {
                        final data = controller.license;
                        final liController =
                            Get.put(ProfileLicenseCertificationController());
                        return controller.profileDataLoading.value
                            ? shrinked
                            : data.isEmpty
                                ? profileNodataContainer(
                                    headingText: 'Licenses & Certifications',
                                    subText:
                                        "No Licenses & Certifications included yet",
                                    onPressed: () {
                                      liController.clearallFieldController();
                                      Get.to(() =>
                                          AddLicenseCertificationsScreen(
                                              uId: id));
                                    },
                                  )
                                : profileDataContainer(
                                    section: "Licenses & Certifications",
                                    onTapAdd: () {
                                      liController.clearallFieldController();
                                      Get.to(() =>
                                          AddLicenseCertificationsScreen(
                                              uId: id));
                                    },
                                    onTapEdit: () {
                                      liController.clearallFieldController();
                                      if (data.length < 2) {
                                        Get.to(() =>
                                            AddLicenseCertificationsScreen(
                                                uId: id, license: data[0]));
                                      } else {
                                        Get.to(() => LicenseSectionScreen(
                                            uId: id, license: data));
                                      }
                                    },
                                    viewAll: data.length < 2
                                        ? shrinked
                                        : viewAllButton(onPressedViewAll: () {
                                            liController
                                                .clearallFieldController();
                                            Get.to(() => LicenseSectionScreen(
                                                uId: id, license: data));
                                          }),
                                    sectionData: List.generate(
                                      data.length < 2 ? data.length : 2,
                                      (index) => sectionDataWidget(
                                          image: "assets/images/upEvent1.png",
                                          secTitle: data[index].name.toString(),
                                          secSubTitle: data[index]
                                              .organization
                                              .toString(),
                                          color: kblack,
                                          secSubTitle2:
                                              "${parseDateMonthYear(data[index].issueDate.toString())}-${parseDateMonthYear(data[index].expireDate.toString())}",
                                          secSubTitle3: data[index]
                                              .credentialUrl
                                              .toString(),
                                          secSubTitle4:
                                              "Skills: ${data[index].skills.toString()}",
                                          secSubTitle5: edSubText,
                                          end: data.length < 2
                                              ? data.length - 1 == index
                                              : index == 1),
                                    ),
                                  );
                      }),
                      Obx(() {
                        final data = controller.publication;
                        final pbController =
                            Get.put(ProfilePublicationController());
                        return controller.profileDataLoading.value
                            ? shrinked
                            : data.isEmpty
                                ? profileNodataContainer(
                                    headingText: 'Publications',
                                    subText: "No Publications included yet",
                                    onPressed: () {
                                      pbController.clearControllers();
                                      Get.to(() =>
                                          ProfileAddPublicationScreen(uId: id));
                                    },
                                  )
                                : profileDataContainer(
                                    section: "Publications",
                                    onTapAdd: () {
                                      pbController.clearControllers();
                                      Get.to(() =>
                                          ProfileAddPublicationScreen(uId: id));
                                    },
                                    onTapEdit: () {
                                      pbController.clearControllers();
                                      if (data.length < 2) {
                                        Get.to(() =>
                                            ProfileAddPublicationScreen(
                                                uId: id, publication: data[0]));
                                      } else {
                                        Get.to(() => PublicationsSectionScreen(
                                            uId: id, publication: data));
                                      }
                                    },
                                    viewAll: data.length < 2
                                        ? shrinked
                                        : viewAllButton(onPressedViewAll: () {
                                            pbController.clearControllers();
                                            Get.to(() =>
                                                PublicationsSectionScreen(
                                                    uId: id,
                                                    publication: data));
                                          }),
                                    sectionData: List.generate(
                                      data.length < 2 ? data.length : 2,
                                      (index) => sectionDataWidget(
                                          image: "assets/images/upEvent1.png",
                                          secTitle:
                                              data[index].title.toString(),
                                          secSubTitle: data[index]
                                              .publication
                                              .toString(),
                                          secSubTitle2: parseDateMonthYear(
                                              data[index]
                                                  .publicationDate
                                                  .toString()),
                                          secSubTitle3: data[index]
                                              .publicationUrl
                                              .toString(),
                                          secSubTitle4: "no",
                                          secSubTitle5: data[index]
                                              .description
                                              .toString(),
                                          end: data.length < 2
                                              ? data.length - 1 == index
                                              : index == 1),
                                    ),
                                  );
                      }),
                      Obx(() {
                        final data = controller.skills;
                        return controller.profileDataLoading.value
                            ? shrinked
                            : data.isEmpty
                                ? profileNodataContainer(
                                    headingText: 'Skills',
                                    subText: "No Skills included yet",
                                    onPressed: () {
                                      controller.getSuggestedSkillsFunction();
                                      controller.clearallFields();
                                      Get.to(
                                          () => ProfileAddSkillScreen(uId: id));
                                    },
                                  )
                                : profileDataContainer(
                                    section: "Skills",
                                    onTapAdd: () {
                                      controller.getSuggestedSkillsFunction();
                                      controller.clearallFields();
                                      Get.to(
                                          () => ProfileAddSkillScreen(uId: id));
                                    },
                                    onTapEdit: () {
                                      controller.getSuggestedSkillsFunction();
                                      controller.clearallFields();
                                      if (data.length < 2) {
                                        Get.to(() => ProfileAddSkillScreen(
                                            uId: id, skill: data[0]));
                                      } else {
                                        Get.to(() => SkillsSectionScreen(
                                            uId: id, skill: data));
                                      }
                                    },
                                    viewAll: data.length < 2
                                        ? shrinked
                                        : viewAllButton(onPressedViewAll: () {
                                            controller
                                                .getSuggestedSkillsFunction();
                                            controller.clearallFields();
                                            Get.to(() => SkillsSectionScreen(
                                                uId: id, skill: data));
                                          }),
                                    sectionData: List.generate(
                                      data.length < 2 ? data.length : 2,
                                      (index) => skillWidget(
                                        company: "Business Intelligence (BI)",
                                        image: "assets/images/upEvent1.png",
                                        position:
                                            data[index].skillName.toString(),
                                        end: data.length < 2
                                            ? data.length - 1 == index
                                            : index == 1,
                                      ),
                                    ),
                                  );
                      }),
                      Obx(() {
                        final data = controller.project;
                        final prController =
                            Get.put(ProfileProjectController());
                        return controller.profileDataLoading.value
                            ? shrinked
                            : data.isEmpty
                                ? profileNodataContainer(
                                    headingText: 'Projects',
                                    subText: "No Projects included yet",
                                    onPressed: () {
                                      prController.clearallFieldController();
                                      Get.to(() =>
                                          ProfileAddProjectScreen(uId: id));
                                    },
                                  )
                                : profileDataContainer(
                                    section: "Projects",
                                    onTapAdd: () {
                                      prController.clearallFieldController();
                                      Get.to(() =>
                                          ProfileAddProjectScreen(uId: id));
                                    },
                                    onTapEdit: () {
                                      prController.clearallFieldController();
                                      if (data.length < 2) {
                                        Get.to(() => ProfileAddProjectScreen(
                                            uId: id, project: data[0]));
                                      } else {
                                        Get.to(() => ProjectSectionScreen(
                                            uId: id, project: data));
                                      }
                                    },
                                    viewAll: data.length < 2
                                        ? shrinked
                                        : viewAllButton(onPressedViewAll: () {
                                            prController
                                                .clearallFieldController();
                                            Get.to(() => ProjectSectionScreen(
                                                uId: id, project: data));
                                          }),
                                    sectionData: List.generate(
                                      data.length < 2 ? data.length : 2,
                                      (index) => honorWidget(
                                          title: data[index].title.toString(),
                                          date: data[index]
                                                      .endDate
                                                      .toString() ==
                                                  'currently_working'
                                              ? "${parseDateMonthYear(data[index].startDate.toString())} - On-going"
                                              : "${parseDateMonthYear(data[index].startDate.toString())}-${parseDateMonthYear(data[index].endDate.toString())}",
                                          image: "assets/images/upEvent1.png",
                                          assosiated:
                                              data[index].associated.toString(),
                                          description: data[index]
                                              .description
                                              .toString(),
                                          skills:
                                              "Skills: ${data[index].skills.toString()}",
                                          end: data.length < 2
                                              ? data.length - 1 == index
                                              : index == 1),
                                    ),
                                  );
                      }),
                      Obx(() {
                        final data = controller.language;
                        final lancontroller =
                            Get.put(LanguageAndCourseController());
                        return controller.profileDataLoading.value
                            ? shrinked
                            : data.isEmpty
                                ? profileNodataContainer(
                                    headingText: 'Language',
                                    subText: "No Language included yet",
                                    onPressed: () {
                                      lancontroller.clearLanguageControllers();
                                      Get.to(() =>
                                          ProfileAddLanguageScreen(uId: id));
                                    },
                                  )
                                : languageWidget(
                                    section: "Language",
                                    onTapEdit: () {
                                      lancontroller.clearLanguageControllers();
                                      if (data.length < 2) {
                                        Get.to(() => ProfileAddLanguageScreen(
                                            uId: id, language: data[0]));
                                      } else {
                                        Get.to(() => LanguageSectionScreen(
                                            uId: id, language: data));
                                      }
                                    },
                                    onTapAdd: () {
                                      lancontroller.clearLanguageControllers();
                                      Get.to(() =>
                                          ProfileAddLanguageScreen(uId: id));
                                    },
                                    viewAll: data.length < 2
                                        ? shrinked
                                        : viewAllButton(onPressedViewAll: () {
                                            lancontroller
                                                .clearLanguageControllers();
                                            Get.to(() => LanguageSectionScreen(
                                                uId: id, language: data));
                                          }),
                                    languageData: List.generate(
                                      data.length,
                                      (index) => languageDataWidget(
                                          language:
                                              data[index].language.toString(),
                                          level: data[index]
                                              .proficiency
                                              .toString()),
                                    ),
                                  );
                      }),
                      Obx(() {
                        final data = controller.course;
                        final crController =
                            Get.put(LanguageAndCourseController());
                        return controller.profileDataLoading.value
                            ? shrinked
                            : data.isEmpty
                                ? profileNodataContainer(
                                    headingText: 'Courses',
                                    subText: "No Courses included yet",
                                    onPressed: () {
                                      crController.clearCourseController();
                                      Get.to(() =>
                                          ProfileAddCourseScreen(uId: id));
                                    },
                                  )
                                : profileDataContainer(
                                    section: "Courses",
                                    onTapAdd: () {
                                      crController.clearCourseController();
                                      Get.to(() =>
                                          ProfileAddCourseScreen(uId: id));
                                    },
                                    onTapEdit: () {
                                      crController.clearCourseController();
                                      if (data.length < 2) {
                                        Get.to(() => ProfileAddCourseScreen(
                                            uId: id, course: data[0]));
                                      } else {
                                        Get.to(() => CoursesSectionScreen(
                                            uId: id, course: data));
                                      }
                                    },
                                    viewAll: data.length < 2
                                        ? shrinked
                                        : viewAllButton(onPressedViewAll: () {
                                            crController
                                                .clearLanguageControllers();
                                            Get.to(() => CoursesSectionScreen(
                                                uId: id, course: data));
                                          }),
                                    sectionData: List.generate(
                                      data.length < 2 ? data.length : 2,
                                      (index) => courseWidget(
                                        course:
                                            data[index].courseName.toString(),
                                        courseNo:
                                            data[index].courseNumber.toString(),
                                        image: "assets/images/upEvent1.png",
                                        associated: data[index]
                                            .associatedWith
                                            .toString(),
                                        end: data.length < 2
                                            ? data.length - 1 == index
                                            : index == 1,
                                      ),
                                    ),
                                  );
                      }),
                      Obx(() {
                        final data = controller.volExperience;
                        final vlController =
                            Get.put(ProfileVolunteerController());
                        return controller.profileDataLoading.value
                            ? shrinked
                            : data.isEmpty
                                ? profileNodataContainer(
                                    headingText: 'volunteer experiences',
                                    subText:
                                        "No volunteer experiences included yet",
                                    onPressed: () {
                                      vlController.clearControllers();
                                      Get.to(() =>
                                          ProfileAddVolunteerExperienceScreen(
                                              uId: id));
                                    },
                                  )
                                : profileDataContainer(
                                    section: "volunteer experiences",
                                    onTapAdd: () {
                                      vlController.clearControllers();
                                      Get.to(() =>
                                          ProfileAddVolunteerExperienceScreen(
                                              uId: id));
                                    },
                                    onTapEdit: () {
                                      vlController.clearControllers();
                                      if (data.length < 2) {
                                        Get.to(() =>
                                            ProfileAddVolunteerExperienceScreen(
                                                uId: id, volunteer: data[0]));
                                      } else {
                                        Get.to(() => VolunteerSectionScreen(
                                            uId: id, volunteer: data));
                                      }
                                    },
                                    viewAll: data.length < 2
                                        ? shrinked
                                        : viewAllButton(onPressedViewAll: () {
                                            vlController.clearControllers();
                                            Get.to(() => VolunteerSectionScreen(
                                                uId: id, volunteer: data));
                                          }),
                                    sectionData: List.generate(
                                      data.length < 2 ? data.length : 2,
                                      (index) => sectionDataWidget(
                                          image: "assets/images/upEvent1.png",
                                          secTitle: data[index].role.toString(),
                                          secSubTitle: data[index]
                                              .organization
                                              .toString(),
                                          secSubTitle2: data[index].endDate ==
                                                  "currently_working"
                                              ? "${parseDateMonthYear(data[index].startDate.toString())}- ongoing"
                                              : "${parseDateMonthYear(data[index].startDate.toString())}-${parseDateMonthYear(data[index].endDate.toString())}",
                                          secSubTitle3:
                                              "Cause: ${data[index].cause.toString()}",
                                          secSubTitle4:
                                              "Skills: Coach, Training",
                                          secSubTitle5: data[index]
                                              .description
                                              .toString(),
                                          end: data.length < 2
                                              ? data.length - 1 == index
                                              : index == 1),
                                    ),
                                  );
                      }),
                      hMBox
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
