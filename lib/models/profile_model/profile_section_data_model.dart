

class ProfileSectiondataModel {
  List<Education>? educations;
  List<Experience>? experiences;
  List<Project>? projects;
  List<Award>? awards;
  List<Publication>? publications;
  List<VolunteerExperience>? volunteerExperiences;
  List<Language>? languages;
  List<Course>? courses;
  List<License>? licenses;
  List<Skill>? skills;

  ProfileSectiondataModel({
    this.educations,
    this.experiences,
    this.projects,
    this.awards,
    this.publications,
    this.volunteerExperiences,
    this.languages,
    this.courses,
    this.licenses,
    this.skills,
  });

  factory ProfileSectiondataModel.fromJson(Map<String, dynamic> json) =>
      ProfileSectiondataModel(
        educations: json["educations"] == null
            ? []
            : List<Education>.from(
                json["educations"]!.map((x) => Education.fromJson(x))),
        experiences: json["experiences"] == null
            ? []
            : List<Experience>.from(
                json["experiences"]!.map((x) => Experience.fromJson(x))),
        projects: json["projects"] == null
            ? []
            : List<Project>.from(
                json["projects"]!.map((x) => Project.fromJson(x))),
        awards: json["awards"] == null
            ? []
            : List<Award>.from(json["awards"]!.map((x) => Award.fromJson(x))),
        publications: json["publications"] == null
            ? []
            : List<Publication>.from(
                json["publications"]!.map((x) => Publication.fromJson(x))),
        volunteerExperiences: json["volunteer_experiences"] == null
            ? []
            : List<VolunteerExperience>.from(json["volunteer_experiences"]!
                .map((x) => VolunteerExperience.fromJson(x))),
        languages: json["languages"] == null
            ? []
            : List<Language>.from(
                json["languages"]!.map((x) => Language.fromJson(x))),
        courses: json["courses"] == null
            ? []
            : List<Course>.from(
                json["courses"]!.map((x) => Course.fromJson(x))),
        licenses: json["licenses"] == null
            ? []
            : List<License>.from(
                json["licenses"]!.map((x) => License.fromJson(x))),
        skills: json["skills"] == null
            ? []
            : List<Skill>.from(json["skills"]!.map((x) => Skill.fromJson(x))),
      );

}

class Project {
  int? id;
  int? userId;
  String? type;
  String? title;
  String? description;
  String? skills;
  String? mediaTitle;
  String? mediaDescription;
  String? mediaLink;
  String? media;
  String? startDate;
  String? endDate;
  String? associated;
  dynamic issuer;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? lmsId;
  String? imagePath;

  Project({
    this.id,
    this.userId,
    this.type,
    this.title,
    this.description,
    this.skills,
    this.mediaTitle,
    this.mediaDescription,
    this.mediaLink,
    this.media,
    this.startDate,
    this.endDate,
    this.associated,
    this.issuer,
    this.createdAt,
    this.updatedAt,
    this.lmsId,
    this.imagePath,
  });

  factory Project.fromJson(Map<String, dynamic> json) => Project(
        id: json["id"],
        userId: json["user_id"],
        type: json["type"],
        title: json["title"],
        description: json["description"],
        skills: json["skills"],
        mediaTitle: json["media_title"],
        mediaDescription: json["media_description"],
        mediaLink: json["media_link"],
        media: json["media"],
        startDate: json["start_date"],
        endDate: json["end_date"],
        associated: json["associated"],
        issuer: json["issuer"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        lmsId: json["lms_id"],
        imagePath: json["image_path"],
      );

 
}

class Award {
  int? id;
  int? userId;
  String? type;
  String? title;
  String? description;
  dynamic skills;
  String? mediaTitle;
  String? mediaDescription;
  String? mediaLink;
  String? media;
  String? startDate;
  dynamic endDate;
  String? associated;
  String? issuer;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? lmsId;
  String? imagePath;

  Award({
    this.id,
    this.userId,
    this.type,
    this.title,
    this.description,
    this.skills,
    this.mediaTitle,
    this.mediaDescription,
    this.mediaLink,
    this.media,
    this.startDate,
    this.endDate,
    this.associated,
    this.issuer,
    this.createdAt,
    this.updatedAt,
    this.lmsId,
    this.imagePath,
  });

  factory Award.fromJson(Map<String, dynamic> json) => Award(
        id: json["id"],
        userId: json["user_id"],
        type: json["type"],
        title: json["title"],
        description: json["description"],
        skills: json["skills"],
        mediaTitle: json["media_title"],
        mediaDescription: json["media_description"],
        mediaLink: json["media_link"],
        media: json["media"],
        startDate: json["start_date"],
        endDate: json["end_date"],
        associated: json["associated"],
        issuer: json["issuer"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        lmsId: json["lms_id"],
        imagePath: json["image_path"],
      );

 
}

class Course {
  int? id;
  int? userId;
  String? courseName;
  String? courseNumber;
  String? workingCurrently;
  dynamic associatedWith;
  DateTime? createdAt;
  DateTime? updatedAt;

  Course({
    this.id,
    this.userId,
    this.courseName,
    this.courseNumber,
    this.workingCurrently,
    this.associatedWith,
    this.createdAt,
    this.updatedAt,
  });

  factory Course.fromJson(Map<String, dynamic> json) => Course(
        id: json["id"],
        userId: json["user_id"],
        courseName: json["course_name"],
        courseNumber: json["course_number"],
        workingCurrently: json["working_currently"],
        associatedWith: json["associated_with"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );


}

class Education {
  int? id;
  int? userId;
  String? school;
  String? degree;
  String? studyField;
  String? startDate;
  String? endDate;
  String? grade;
  String? activities;
  String? description;
  String? skills;
  String? mediaLink;
  String? mediaTitle;
  String? mediaDescription;
  String? media;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? lmsId;
  String? imagePath;

  Education({
    this.id,
    this.userId,
    this.school,
    this.degree,
    this.studyField,
    this.startDate,
    this.endDate,
    this.grade,
    this.activities,
    this.description,
    this.skills,
    this.mediaLink,
    this.mediaTitle,
    this.mediaDescription,
    this.media,
    this.createdAt,
    this.updatedAt,
    this.lmsId,
    this.imagePath,
  });

  factory Education.fromJson(Map<String, dynamic> json) => Education(
        id: json["id"],
        userId: json["user_id"],
        school: json["school"],
        degree: json["degree"],
        studyField: json["study_field"],
        startDate: json["start_date"],
        endDate: json["end_date"],
        grade: json["grade"],
        activities: json["activities"],
        description: json["description"],
        skills: json["skills"],
        mediaLink: json["media_link"],
        mediaTitle: json["media_title"],
        mediaDescription: json["media_description"],
        media: json["media"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        lmsId: json["lms_id"],
        imagePath: json["image_path"],
      );

}

class Experience {
  int? id;
  int? userId;
  String? title;
  String? employmentType;
  String? companyName;
  String? location;
  String? locationType;
  String? startDate;
  String? endDate;
  String? description;
  String? profile;
  String? skills;
  String? mediaLink;
  String? mediaTitle;
  String? mediaDescription;
  String? media;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? lmsId;
  String? imagePath;

  Experience({
    this.id,
    this.userId,
    this.title,
    this.employmentType,
    this.companyName,
    this.location,
    this.locationType,
    this.startDate,
    this.endDate,
    this.description,
    this.profile,
    this.skills,
    this.mediaLink,
    this.mediaTitle,
    this.mediaDescription,
    this.media,
    this.createdAt,
    this.updatedAt,
    this.lmsId,
    this.imagePath,
  });

  factory Experience.fromJson(Map<String, dynamic> json) => Experience(
        id: json["id"],
        userId: json["user_id"],
        title: json["title"],
        employmentType: json["employment_type"],
        companyName: json["company_name"],
        location: json["location"],
        locationType: json["location_type"],
        startDate: json["start_date"],
        endDate: json["end_date"],
        description: json["description"],
        profile: json["profile"],
        skills: json["skills"],
        mediaLink: json["media_link"],
        mediaTitle: json["media_title"],
        mediaDescription: json["media_description"],
        media: json["media"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        lmsId: json["lms_id"],
        imagePath: json["image_path"],
      );

}

class Language {
  int? id;
  int? userId;
  String? language;
  String? proficiency;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? lmsId;

  Language({
    this.id,
    this.userId,
    this.language,
    this.proficiency,
    this.createdAt,
    this.updatedAt,
    this.lmsId,
  });

  factory Language.fromJson(Map<String, dynamic> json) => Language(
        id: json["id"],
        userId: json["user_id"],
        language: json["language"],
        proficiency: json["proficiency"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        lmsId: json["lms_id"],
      );

}

class License {
  int? id;
  int? userId;
  String? name;
  String? organization;
  dynamic issuer;
  String? issueDate;
  String? expireDate;
  String? credentialId;
  String? credentialUrl;
  String? skills;
  String? mediaTitle;
  String? mediaDescription;
  String? mediaLink;
  String? media;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? lmsId;
  String? imagePath;

  License({
    this.id,
    this.userId,
    this.name,
    this.organization,
    this.issuer,
    this.issueDate,
    this.expireDate,
    this.credentialId,
    this.credentialUrl,
    this.skills,
    this.mediaTitle,
    this.mediaDescription,
    this.mediaLink,
    this.media,
    this.createdAt,
    this.updatedAt,
    this.lmsId,
    this.imagePath,
  });

  factory License.fromJson(Map<String, dynamic> json) => License(
        id: json["id"],
        userId: json["user_id"],
        name: json["name"],
        organization: json["organization"],
        issuer: json["issuer"],
        issueDate: json["issue_date"],
        expireDate: json["expire_date"],
        credentialId: json["credential_id"],
        credentialUrl: json["credential_url"],
        skills: json["skills"],
        mediaTitle: json["media_title"],
        mediaDescription: json["media_description"],
        mediaLink: json["media_link"],
        media: json["media"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        lmsId: json["lms_id"],
        imagePath: json["image_path"],
      );

}

class Publication {
  int? id;
  int? userId;
  String? title;
  String? publication;
  String? publicationDate;
  String? publicationUrl;
  String? description;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? lmsId;

  Publication({
    this.id,
    this.userId,
    this.title,
    this.publication,
    this.publicationDate,
    this.publicationUrl,
    this.description,
    this.createdAt,
    this.updatedAt,
    this.lmsId,
  });

  factory Publication.fromJson(Map<String, dynamic> json) => Publication(
        id: json["id"],
        userId: json["user_id"],
        title: json["title"],
        publication: json["publication"],
        publicationDate: json["publication_date"],
        publicationUrl: json["publication_url"],
        description: json["description"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        lmsId: json["lms_id"],
      );

}

class VolunteerExperience {
  int? id;
  int? userId;
  String? organization;
  String? role;
  String? cause;
  String? startDate;
  String? endDate;
  String? description;
  String? mediaTitle;
  String? mediaDescription;
  String? mediaLink;
  String? media;
  dynamic profileHeadline;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? lmsId;
  String? imagePath;

  VolunteerExperience({
    this.id,
    this.userId,
    this.organization,
    this.role,
    this.cause,
    this.startDate,
    this.endDate,
    this.description,
    this.mediaTitle,
    this.mediaDescription,
    this.mediaLink,
    this.media,
    this.profileHeadline,
    this.createdAt,
    this.updatedAt,
    this.lmsId,
    this.imagePath,
  });

  factory VolunteerExperience.fromJson(Map<String, dynamic> json) =>
      VolunteerExperience(
        id: json["id"],
        userId: json["user_id"],
        organization: json["organization"],
        role: json["role"],
        cause: json["cause"],
        startDate: json["start_date"],
        endDate: json["end_date"],
        description: json["description"],
        mediaTitle: json["media_title"],
        mediaDescription: json["media_description"],
        mediaLink: json["media_link"],
        media: json["media"],
        profileHeadline: json["profile_headline"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        lmsId: json["lms_id"],
        imagePath: json["image_path"],
      );

}

class Skill {
  int? id;
  int? userId;
  String? skillName;
  List<String>? experiencesId;
  List<String>? educationsId;
  List<String>? licensesId;
  List<String>? projectsId;
  List<String>? coursesId;
  List<String>? awardsId;
  String? followupPermission;
  DateTime? createdAt;
  DateTime? updatedAt;

  Skill({
    this.id,
    this.userId,
    this.skillName,
    this.experiencesId,
    this.educationsId,
    this.licensesId,
    this.projectsId,
    this.coursesId,
    this.awardsId,
    this.followupPermission,
    this.createdAt,
    this.updatedAt,
  });

  factory Skill.fromJson(Map<String, dynamic> json) => Skill(
        id: json["id"],
        userId: json["user_id"],
        skillName: json["skill_name"],
        experiencesId: json["experiences_id"] == null
            ? []
            : List<String>.from(json["experiences_id"]!.map((x) => x)),
        educationsId: json["educations_id"] == null
            ? []
            : List<String>.from(json["educations_id"]!.map((x) => x)),
        licensesId: json["licenses_id"] == null
            ? []
            : List<String>.from(json["licenses_id"]!.map((x) => x)),
        projectsId: json["projects_id"] == null
            ? []
            : List<String>.from(json["projects_id"]!.map((x) => x)),
        coursesId: json["courses_id"] == null
            ? []
            : List<String>.from(json["courses_id"]!.map((x) => x)),
        awardsId: json["awards_id"] == null
            ? []
            : List<String>.from(json["awards_id"]!.map((x) => x)),
        followupPermission: json["followup_permission"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

}
