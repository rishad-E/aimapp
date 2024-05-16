// To parse this JSON data, do
//
//     final profileAlldataModel = profileAlldataModelFromJson(jsonString);

// import 'dart:convert';

// ProfileAlldataModel profileAlldataModelFromJson(String str) => ProfileAlldataModel.fromJson(json.decode(str));

// String profileAlldataModelToJson(ProfileAlldataModel data) => json.encode(data.toJson());

class ProfileAlldataModel {
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

  ProfileAlldataModel({
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

  factory ProfileAlldataModel.fromJson(Map<String, dynamic> json) =>
      ProfileAlldataModel(
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

  Map<String, dynamic> toJson() => {
        "educations": educations == null
            ? []
            : List<dynamic>.from(educations!.map((x) => x.toJson())),
        "experiences": experiences == null
            ? []
            : List<dynamic>.from(experiences!.map((x) => x.toJson())),
        "projects": projects == null
            ? []
            : List<dynamic>.from(projects!.map((x) => x.toJson())),
        "awards": awards == null
            ? []
            : List<dynamic>.from(awards!.map((x) => x.toJson())),
        "publications": publications == null
            ? []
            : List<dynamic>.from(publications!.map((x) => x.toJson())),
        "volunteer_experiences": volunteerExperiences == null
            ? []
            : List<dynamic>.from(volunteerExperiences!.map((x) => x.toJson())),
        "languages": languages == null
            ? []
            : List<dynamic>.from(languages!.map((x) => x.toJson())),
        "courses": courses == null
            ? []
            : List<dynamic>.from(courses!.map((x) => x.toJson())),
        "licenses": licenses == null
            ? []
            : List<dynamic>.from(licenses!.map((x) => x.toJson())),
        "skills": skills == null
            ? []
            : List<dynamic>.from(skills!.map((x) => x.toJson())),
      };
}

class Project {
  int? id;
  int? userId;
  String? type;
  String? title;
  String? description;
  String? skills;
  String? media;
  String? startDate;
  String? endDate;
  String? associated;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? lmsId;

  Project({
    this.id,
    this.userId,
    this.type,
    this.title,
    this.description,
    this.skills,
    this.media,
    this.startDate,
    this.endDate,
    this.associated,
    this.createdAt,
    this.updatedAt,
    this.lmsId,
  });
  factory Project.fromJson(Map<String, dynamic> json) => Project(
        id: json["id"],
        userId: json["user_id"],
        type: json["type"],
        title: json["title"],
        description: json["description"],
        skills: json["skills"],
        media: json["media"],
        startDate: json["start_date"],
        endDate: json["end_date"],
        associated: json["associated"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        lmsId: json["lms_id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "type": type,
        "title": title,
        "description": description,
        "skills": skills,
        "media": media,
        "start_date": startDate,
        "end_date": endDate,
        "associated": associated,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "lms_id": lmsId,
      };
}

class Award {
  int? id;
  int? userId;
  String? type;
  String? title;
  String? description;
  dynamic skills;
  String? media;
  String? startDate;
  dynamic endDate;
  String? associated;
  String? issuer;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? lmsId;

  Award({
    this.id,
    this.userId,
    this.type,
    this.title,
    this.description,
    this.skills,
    this.media,
    this.startDate,
    this.endDate,
    this.associated,
    this.issuer,
    this.createdAt,
    this.updatedAt,
    this.lmsId,
  });

  factory Award.fromJson(Map<String, dynamic> json) => Award(
        id: json["id"],
        userId: json["user_id"],
        type: json["type"],
        title: json["title"],
        description: json["description"],
        skills: json["skills"],
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
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "type": type,
        "title": title,
        "description": description,
        "skills": skills,
        "media": media,
        "start_date": startDate,
        "end_date": endDate,
        "associated": associated,
        "issuer": issuer,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "lms_id": lmsId,
      };
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

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "course_name": courseName,
        "course_number": courseNumber,
        "working_currently": workingCurrently,
        "associated_with": associatedWith,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
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
  String? media;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? lmsId;

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
    this.media,
    this.createdAt,
    this.updatedAt,
    this.lmsId,
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
        media: json["media"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        lmsId: json["lms_id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "school": school,
        "degree": degree,
        "study_field": studyField,
        "start_date": startDate,
        "end_date": endDate,
        "grade": grade,
        "activities": activities,
        "description": description,
        "skills": skills,
        "media": media,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "lms_id": lmsId,
      };
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
  String? media;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? lmsId;

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
    this.media,
    this.createdAt,
    this.updatedAt,
    this.lmsId,
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
        media: json["media"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        lmsId: json["lms_id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "title": title,
        "employment_type": employmentType,
        "company_name": companyName,
        "location": location,
        "location_type": locationType,
        "start_date": startDate,
        "end_date": endDate,
        "description": description,
        "profile": profile,
        "skills": skills,
        "media": media,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "lms_id": lmsId,
      };
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

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "language": language,
        "proficiency": proficiency,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "lms_id": lmsId,
      };
}

class License {
  int? id;
  int? userId;
  String? name;
  String? organization;
  String? issueDate;
  String? expireDate;
  String? credentialId;
  String? credentialUrl;
  String? skills;
  String? media;
  DateTime? createdAt;
  DateTime? updatedAt;

  License({
    this.id,
    this.userId,
    this.name,
    this.organization,
    this.issueDate,
    this.expireDate,
    this.credentialId,
    this.credentialUrl,
    this.skills,
    this.media,
    this.createdAt,
    this.updatedAt,
  });

  factory License.fromJson(Map<String, dynamic> json) => License(
        id: json["id"],
        userId: json["user_id"],
        name: json["name"],
        organization: json["organization"],
        issueDate: json["issue_date"],
        expireDate: json["expire_date"],
        credentialId: json["credential_id"],
        credentialUrl: json["credential_url"],
        skills: json["skills"],
        media: json["media"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "name": name,
        "organization": organization,
        "issue_date": issueDate,
        "expire_date": expireDate,
        "credential_id": credentialId,
        "credential_url": credentialUrl,
        "skills": skills,
        "media": media,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
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

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "title": title,
        "publication": publication,
        "publication_date": publicationDate,
        "publication_url": publicationUrl,
        "description": description,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "lms_id": lmsId,
      };
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
  DateTime? createdAt;
  DateTime? updatedAt;
  int? lmsId;

  VolunteerExperience({
    this.id,
    this.userId,
    this.organization,
    this.role,
    this.cause,
    this.startDate,
    this.endDate,
    this.description,
    this.createdAt,
    this.updatedAt,
    this.lmsId,
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
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        lmsId: json["lms_id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "organization": organization,
        "role": role,
        "cause": cause,
        "start_date": startDate,
        "end_date": endDate,
        "description": description,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "lms_id": lmsId,
      };
}

class Skill {
  int? id;
  int? userId;
  String? skillName;
  String? experiencesId;
  String? educationsId;
  String? licensesId;
  String? projectsId;
  String? coursesId;
  String? awardsId;
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
        experiencesId: json["experiences_id"],
        educationsId: json["educations_id"],
        licensesId: json["licenses_id"],
        projectsId: json["projects_id"],
        coursesId: json["courses_id"],
        awardsId: json["awards_id"],
        followupPermission: json["followup_permission"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "skill_name": skillName,
        "experiences_id": experiencesId,
        "educations_id": educationsId,
        "licenses_id": licensesId,
        "projects_id": projectsId,
        "courses_id": coursesId,
        "awards_id": awardsId,
        "followup_permission": followupPermission,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}
