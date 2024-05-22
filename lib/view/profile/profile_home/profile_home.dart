import 'dart:developer';
import 'package:aimshala/controllers/login_controller.dart';
import 'package:aimshala/controllers/profile_controller/profile_education_controller.dart';
import 'package:aimshala/controllers/profile_controller/profile_experience_controller.dart';
import 'package:aimshala/controllers/profile_controller/profile_honoraward_controller.dart';
import 'package:aimshala/controllers/profile_controller/profile_license_certification_controller.dart';
import 'package:aimshala/controllers/profile_controller/profile_project_controller.dart';
import 'package:aimshala/controllers/profile_controller/profile_skill_info_controller.dart';
import 'package:aimshala/models/UserModel/user_model.dart';
import 'package:aimshala/utils/common/colors_common.dart';
import 'package:aimshala/utils/widgets/widgets_common.dart';
import 'package:aimshala/view/home/home.dart';
import 'package:aimshala/view/profile/common/widgets/widgets.dart';
import 'package:aimshala/view/profile/profile_add_course_info/add_course_info_screen.dart';
import 'package:aimshala/view/profile/profile_add_skill_section/add_skill_screen.dart';
import 'package:aimshala/view/profile/profile_view_all_section/course_section.dart';
import 'package:aimshala/view/profile/profile_view_all_section/education_section.dart';
import 'package:aimshala/view/profile/profile_view_all_section/experience_section.dart';
import 'package:aimshala/view/profile/profile_view_all_section/honor_award_section.dart';
import 'package:aimshala/view/profile/profile_view_all_section/language_section.dart';
import 'package:aimshala/view/profile/profile_view_all_section/license_section.dart';
import 'package:aimshala/view/profile/profile_view_all_section/project_section.dart';
import 'package:aimshala/view/profile/profile_view_all_section/publication_section.dart';
import 'package:aimshala/view/profile/profile_view_all_section/skills_section.dart';
import 'package:aimshala/view/profile/profile_contact_info/contact_info_screen.dart';
import 'package:aimshala/view/profile/profile_education_section/add_education_screen.dart';
import 'package:aimshala/view/profile/profile_experience_section/add_experience_screen.dart';
import 'package:aimshala/view/profile/profile_home/widgets/section_widgets.dart';
import 'package:aimshala/view/profile/profile_home/widgets/texts.dart';
import 'package:aimshala/view/profile/profile_honorsawards_section/add_honorsawards_screen.dart';
import 'package:aimshala/view/profile/profile_language_section/add_language_screen.dart';
import 'package:aimshala/view/profile/profile_license_certifications_section/add_license_certification_screen.dart';
import 'package:aimshala/view/profile/profile_personal_info/personal_info_screen.dart';
import 'package:aimshala/view/profile/profile_home/widgets/widgets.dart';
import 'package:aimshala/view/profile/profile_project_section/add_project_screen.dart';
import 'package:aimshala/view/profile/profile_publications_section/add_publications_screen.dart';
import 'package:aimshala/view/profile/profile_view_all_section/volunteer_section.dart';
import 'package:aimshala/view/profile/profile_volunteer_info/add_volunteer_experience_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileHomeScreen extends StatelessWidget {
  const ProfileHomeScreen({super.key});
  final double coverHeight = 240;
  final double profileHeight = 130;
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProfileSkillController());
    User? data;
    String? id;
    final UserDataModel? userData = Get.put(LoginController()).userData;
    if (userData != null) {
      data = userData.user;
      id = userData.user?.id.toString();
    }
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      log(id.toString());
      controller.getProfileAlldataFunction(uId: id.toString());
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
                                        id: id.toString(),
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
                                        id: id.toString(),
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
                      Obx(() {
                        final data = controller.education;
                        return controller.profileDataLoading.value
                            ? loadingWidget()
                            : data.isEmpty
                                ? profileNodataContainer(
                                    headingText: 'Education',
                                    subText: 'No Education included yet',
                                    onPressed: () {
                                      Get.put(ProfileEducationController())
                                          .clearallFields();
                                      Get.to(() => AddEducationScreen(
                                          uId: id.toString()));
                                    },
                                  )
                                : profileDataContainer(
                                    section: "Education",
                                    onTapAdd: () {
                                      log('onPress', name: 'onTap Save');
                                      Get.put(ProfileEducationController())
                                          .clearallFields();
                                      Get.to(() => AddEducationScreen(
                                          uId: id.toString()));
                                    },
                                    onTapEdit: () {
                                      log('onPress', name: 'onTap Edit');
                                      Get.put(ProfileEducationController())
                                          .clearallFields();
                                      Get.to(() => EducationSectionScreen(
                                          education: data));
                                    },
                                    onPressedViewAll: () {
                                      log('onPress', name: 'onTap viewall');
                                      Get.put(ProfileEducationController())
                                          .clearallFields();
                                      Get.to(() => EducationSectionScreen(
                                          education: data));
                                    },
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
                                                "${yearFormatter(data[index].startDate.toString())}-${yearFormatter(data[index].endDate.toString())}",
                                            secSubTitle3:
                                                "Grade: ${data[index].grade.toString()}",
                                            secSubTitle4:
                                                "Skills: ${data[index].skills.toString()}",
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
                        return controller.profileDataLoading.value
                            ? shrinked
                            : data.isEmpty
                                ? profileNodataContainer(
                                    headingText: 'Experience',
                                    subText: "No Experience included yet",
                                    onPressed: () {
                                      Get.put(ProfileExperienceController())
                                          .clearallFieldController();
                                      Get.to(() => AddExperienceScreen(
                                          uId: id.toString()));
                                    },
                                  )
                                : profileDataContainer(
                                    section: "Experience",
                                    onTapAdd: () {
                                      log('onPress', name: 'onTap add');
                                      Get.put(ProfileExperienceController())
                                          .clearallFieldController();
                                      Get.to(() => AddExperienceScreen(
                                          uId: id.toString()));
                                    },
                                    onTapEdit: () => Get.to(() =>
                                        ExperienceSectionScreen(
                                            experience: data)),
                                    onPressedViewAll: () {
                                      log('onPress', name: 'onTap viewall');
                                      Get.to(() => ExperienceSectionScreen(
                                          experience: data));
                                    },
                                    sectionData: List.generate(
                                      data.length < 2 ? data.length : 2,
                                      (index) => sectionDataWidget(
                                          image: "assets/images/upEvent1.png",
                                          secTitle: data[index]
                                              .employmentType
                                              .toString(),
                                          secSubTitle: data[index]
                                              .companyName
                                              .toString(),
                                          secSubTitle2: data[index].endDate ==
                                                  null
                                              ? "${parseDateMonthYear(data[index].startDate.toString())}- on-going"
                                              : "${parseDateMonthYear(data[index].startDate.toString())}-${parseDateMonthYear(data[index].endDate.toString())}",
                                          secSubTitle3:
                                              "${data[index].locationType.toString()},${data[index].location.toString()}",
                                          secSubTitle4:
                                              "Skills:${data[index].skills.toString()}",
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
                        return controller.profileDataLoading.value
                            ? shrinked
                            : data.isEmpty
                                ? profileNodataContainer(
                                    headingText: 'Honors & awards',
                                    subText: "No Honors & awards included yet",
                                    onPressed: () {
                                      Get.put(ProfileHonorsAwardsController())
                                          .clearallFieldController();
                                      Get.to(() =>
                                          ProfileAddHonorsandAwardsScreen(
                                              uId: id.toString()));
                                    },
                                  )
                                : profileDataContainer(
                                    section: "Honors & awards",
                                    onTapAdd: () {
                                      log('onPress', name: 'onTap add');
                                      Get.put(ProfileHonorsAwardsController())
                                          .clearallFieldController();
                                      Get.to(() =>
                                          ProfileAddHonorsandAwardsScreen(
                                              uId: id.toString()));
                                    },
                                    onTapEdit: () => Get.to(() =>
                                        AwardHonorSectionScreen(award: data)),
                                    onPressedViewAll: () => Get.to(() =>
                                        AwardHonorSectionScreen(award: data)),
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
                        return controller.profileDataLoading.value
                            ? shrinked
                            : data.isEmpty
                                ? profileNodataContainer(
                                    headingText: 'Licenses & Certifications',
                                    subText:
                                        "No Licenses & Certifications included yet",
                                    onPressed: () {
                                      Get.to(() =>
                                          AddLicenseCertificationsScreen(
                                              uId: id.toString()));
                                    },
                                  )
                                : profileDataContainer(
                                    section: "Licenses & Certifications",
                                    onTapAdd: () {
                                      log('button pressed', name: 'onTap Save');
                                      Get.put(ProfileLicenseCertificationController())
                                          .clearallFieldController();
                                      Get.to(() =>
                                          AddLicenseCertificationsScreen(
                                              uId: id.toString()));
                                    },
                                    onTapEdit: () {
                                      log('button pressed', name: 'onTap Edit');
                                      Get.to(() =>
                                          LicenseSectionScreen(license: data));
                                    },
                                    onPressedViewAll: () {
                                      log('onPress', name: 'onTap viewall');
                                      Get.to(() =>
                                          LicenseSectionScreen(license: data));
                                    },
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
                        return controller.profileDataLoading.value
                            ? shrinked
                            : data.isEmpty
                                ? profileNodataContainer(
                                    headingText: 'Publications',
                                    subText: "No Publications included yet",
                                    onPressed: () {
                                      Get.to(() => ProfileAddPublicationScreen(
                                          uId: id.toString()));
                                    },
                                  )
                                : profileDataContainer(
                                    section: "Publications",
                                    onTapAdd: () => Get.to(() =>
                                        ProfileAddPublicationScreen(
                                            uId: id.toString())),
                                    onTapEdit: () => Get.to(() =>
                                        PublicationsSectionScreen(
                                            publication: data)),
                                    onPressedViewAll: () => Get.to(() =>
                                        PublicationsSectionScreen(
                                            publication: data)),
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
                                          secSubTitle4: "Skills: ",
                                          secSubTitle5: edSubText,
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
                                      Get.to(() => ProfileAddSkillScreen(
                                          uId: id.toString()));
                                    },
                                  )
                                : profileDataContainer(
                                    section: "Skills",
                                    onTapAdd: () {
                                      controller.getSuggestedSkillsFunction();
                                      controller.clearallFields();
                                      Get.to(() => ProfileAddSkillScreen(
                                          uId: id.toString()));
                                      log('button pressed', name: 'onTap add');
                                    },
                                    onTapEdit: () => Get.to(
                                        () => SkillsSectionScreen(skill: data)),
                                    onPressedViewAll: () => Get.to(
                                        () => SkillsSectionScreen(skill: data)),
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
                        return controller.profileDataLoading.value
                            ? shrinked
                            : data.isEmpty
                                ? profileNodataContainer(
                                    headingText: 'Projects',
                                    subText: "No Projects included yet",
                                    onPressed: () {
                                      Get.to(() => ProfileAddProjectScreen(
                                          uId: id.toString()));
                                    },
                                  )
                                : profileDataContainer(
                                    section: "Projects",
                                    onTapAdd: () {
                                      Get.put(ProfileProjectController())
                                          .clearallFieldController();
                                      Get.to(() => ProfileAddProjectScreen(
                                          uId: id.toString()));
                                    },
                                    onTapEdit: () => Get.to(() =>
                                        ProjectSectionScreen(project: data)),
                                    onPressedViewAll: () {
                                      Get.to(() =>
                                          ProjectSectionScreen(project: data));
                                    },
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
                        return controller.profileDataLoading.value
                            ? shrinked
                            : data.isEmpty
                                ? shrinked
                                : languageWidget(
                                    section: "Language",
                                    onTapEdit: () =>
                                        Get.to(() => LanguageSectionScreen(
                                              language: data,
                                            )),
                                    onTapAdd: () => Get.to(() =>
                                        ProfileAddLanguageScreen(
                                            uId: id.toString())),
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
                        return controller.profileDataLoading.value
                            ? shrinked
                            : data.isEmpty
                                ? shrinked
                                : profileDataContainer(
                                    section: "Courses",
                                    onTapAdd: () => Get.to(() =>
                                        ProfileAddCourseScreen(
                                            uId: id.toString())),
                                    onTapEdit: () => Get.to(() =>
                                        CoursesSectionScreen(course: data)),
                                    onPressedViewAll: () => Get.to(() =>
                                        CoursesSectionScreen(course: data)),
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
                        return controller.profileDataLoading.value
                            ? shrinked
                            : data.isEmpty
                                ? shrinked
                                : profileDataContainer(
                                    section: "volunteer experiences",
                                    onTapAdd: () => Get.to(() =>
                                        ProfileAddVolunteerExperienceScreen(
                                            uId: id.toString())),
                                    onTapEdit: () => Get.to(() =>
                                        VolunteerSectionScreen(
                                            volunteer: data)),
                                    onPressedViewAll: () => Get.to(() =>
                                        VolunteerSectionScreen(
                                            volunteer: data)),
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
                      })
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
