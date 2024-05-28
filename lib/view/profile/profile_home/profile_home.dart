import 'dart:developer';
import 'package:aimshala/controllers/profile_controller/profile_contact_info_controller.dart';
import 'package:aimshala/controllers/profile_controller/profile_education_controller.dart';
import 'package:aimshala/controllers/profile_controller/profile_experience_controller.dart';
import 'package:aimshala/controllers/profile_controller/profile_home_controller.dart';
import 'package:aimshala/controllers/profile_controller/profile_honoraward_controller.dart';
import 'package:aimshala/controllers/profile_controller/profile_license_certification_controller.dart';
import 'package:aimshala/controllers/profile_controller/profile_project_controller.dart';
import 'package:aimshala/controllers/profile_controller/profile_skill_info_controller.dart';
import 'package:aimshala/utils/common/colors_common.dart';
import 'package:aimshala/utils/common/text_common.dart';
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
      log(id, name: 'callback uid');
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
                                  onTap: () {
                                    log('edit personal info');
                                    Get.to(() => ProfilePersonalInfoScreen(
                                        id: id, username: data?.username));
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
                              text1: 'Full Name:',
                              text2: data?.name ?? '_',
                            ),
                            infoText(
                              text1: 'Username:',
                              text2: data?.username ?? '_',
                            ),
                            infoText(
                              text1: 'Date of Birth:',
                              text2: data?.dob ?? '',
                            ),
                            infoText(
                              text1: 'Gender:',
                              text2: data?.gender ?? '',
                            ),
                            hBox,
                            hBox,
                            regularText(data?.about ?? '', 12)
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
                                            id: id, userName: data?.username));
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
                                  text: data?.phone == null
                                      ? "-"
                                      : '+91 ${data?.phone}',
                                  svg: 'assets/images/call.svg',
                                ),
                                contactInfos(
                                  text: data?.email ?? '_',
                                  svg: 'assets/images/email.svg',
                                ),
                                contactInfos(
                                  text: data?.address == null
                                      ? "-"
                                      : "${data?.address}, ${data?.city}, ${data?.state}",
                                  svg: 'assets/images/location.svg',
                                ),
                                contactInfos(
                                  text: data?.instagram == "" ||
                                          data?.instagram == null
                                      ? "_"
                                      : "${data?.instagram}",
                                  svg: 'assets/images/Instagram.svg',
                                ),
                                contactInfos(
                                  text: data?.facebook == "" ||
                                          data?.facebook == null
                                      ? "_"
                                      : "${data?.facebook}",
                                  svg: 'assets/images/facebook.svg',
                                ),
                                contactInfos(
                                  text: data?.twitter == "" ||
                                          data?.twitter == null
                                      ? "_"
                                      : "${data?.twitter}",
                                  svg: 'assets/images/twitter.svg',
                                ),
                              ],
                            ),
                          );
                        },
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
                                      Get.to(() => AddEducationScreen(uId: id));
                                    },
                                  )
                                : profileDataContainer(
                                    section: "Education",
                                    onTapAdd: () {
                                      log('onPress', name: 'onTap Save');
                                      Get.put(ProfileEducationController())
                                          .clearallFields();
                                      Get.to(() => AddEducationScreen(uId: id));
                                    },
                                    onTapEdit: () {
                                      log('onPress', name: 'onTap Edit');
                                      Get.put(ProfileEducationController())
                                          .clearallFields();
                                      Get.to(() => EducationSectionScreen(
                                          uId: id, education: data));
                                    },
                                    onPressedViewAll: () {
                                      log('onPress', name: 'onTap viewall');
                                      Get.put(ProfileEducationController())
                                          .clearallFields();
                                      Get.to(() => EducationSectionScreen(
                                          uId: id, education: data));
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
                                      Get.to(
                                          () => AddExperienceScreen(uId: id));
                                    },
                                  )
                                : profileDataContainer(
                                    section: "Experience",
                                    onTapAdd: () {
                                      log('onPress', name: 'onTap add');
                                      Get.put(ProfileExperienceController())
                                          .clearallFieldController();
                                      Get.to(
                                          () => AddExperienceScreen(uId: id));
                                    },
                                    onTapEdit: () => Get.to(() =>
                                        ExperienceSectionScreen(
                                            uId: id, experience: data)),
                                    onPressedViewAll: () {
                                      log('onPress', name: 'onTap viewall');
                                      Get.to(() => ExperienceSectionScreen(
                                          uId: id, experience: data));
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
                                          secSubTitle2: data[index]
                                                      .endDate
                                                      .toString() ==
                                                  'currently_working'
                                              ? "${parseDateMonthYear(data[index].startDate.toString())} - On-going"
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
                                              uId: id));
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
                                              uId: id));
                                    },
                                    onTapEdit: () => Get.to(() =>
                                        AwardHonorSectionScreen(
                                            uId: id, award: data)),
                                    onPressedViewAll: () => Get.to(() =>
                                        AwardHonorSectionScreen(
                                            uId: id, award: data)),
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
                                              uId: id));
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
                                              uId: id));
                                    },
                                    onTapEdit: () {
                                      log('button pressed', name: 'onTap Edit');
                                      Get.to(() => LicenseSectionScreen(
                                          uId: id, license: data));
                                    },
                                    onPressedViewAll: () {
                                      log('onPress', name: 'onTap viewall');
                                      Get.to(() => LicenseSectionScreen(
                                          uId: id, license: data));
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
                                      Get.to(() =>
                                          ProfileAddPublicationScreen(uId: id));
                                    },
                                  )
                                : profileDataContainer(
                                    section: "Publications",
                                    onTapAdd: () => Get.to(() =>
                                        ProfileAddPublicationScreen(uId: id)),
                                    onTapEdit: () => Get.to(() =>
                                        PublicationsSectionScreen(
                                            uId: id, publication: data)),
                                    onPressedViewAll: () => Get.to(() =>
                                        PublicationsSectionScreen(
                                            uId: id, publication: data)),
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
                                      log('button pressed', name: 'onTap add');
                                    },
                                    onTapEdit: () => Get.to(() =>
                                        SkillsSectionScreen(
                                            uId: id, skill: data)),
                                    onPressedViewAll: () => Get.to(() =>
                                        SkillsSectionScreen(
                                            uId: id, skill: data)),
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
                                    onPressed: () => Get.to(
                                        () => ProfileAddProjectScreen(uId: id)),
                                  )
                                : profileDataContainer(
                                    section: "Projects",
                                    onTapAdd: () {
                                      Get.put(ProfileProjectController())
                                          .clearallFieldController();
                                      Get.to(() =>
                                          ProfileAddProjectScreen(uId: id));
                                    },
                                    onTapEdit: () => Get.to(() =>
                                        ProjectSectionScreen(
                                            uId: id, project: data)),
                                    onPressedViewAll: () {
                                      Get.to(() => ProjectSectionScreen(
                                          uId: id, project: data));
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
                                              uId: id,
                                              language: data,
                                            )),
                                    onTapAdd: () => Get.to(() =>
                                        ProfileAddLanguageScreen(uId: id)),
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
                                    onTapAdd: () => Get.to(
                                        () => ProfileAddCourseScreen(uId: id)),
                                    onTapEdit: () => Get.to(() =>
                                        CoursesSectionScreen(
                                            uId: id, course: data)),
                                    onPressedViewAll: () => Get.to(() =>
                                        CoursesSectionScreen(
                                            uId: id, course: data)),
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
                                            uId: id)),
                                    onTapEdit: () => Get.to(() =>
                                        VolunteerSectionScreen(
                                            uId: id, volunteer: data)),
                                    onPressedViewAll: () => Get.to(() =>
                                        VolunteerSectionScreen(
                                            uId: id, volunteer: data)),
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
