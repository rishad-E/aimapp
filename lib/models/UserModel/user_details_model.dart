// To parse this JSON data, do
//
//     final mentorRegModel = mentorRegModelFromJson(jsonString);

// import 'dart:convert';

// MentorRegModel mentorRegModelFromJson(String str) => MentorRegModel.fromJson(json.decode(str));

// String mentorRegModelToJson(MentorRegModel data) => json.encode(data.toJson());

class MentorRegModel {
    String? userRole;
    String? gender;
    String? dob;
    UserDetails? userDetails;

    MentorRegModel({
        this.userRole,
        this.gender,
        this.dob,
        this.userDetails,
    });

    factory MentorRegModel.fromJson(Map<String, dynamic> json) => MentorRegModel(
        userRole: json["user_role"],
        gender: json["gender"],
        dob: json["DOB"],
        userDetails: json["user_details"] == null ? null : UserDetails.fromJson(json["user_details"]),
    );

    Map<String, dynamic> toJson() => {
        "user_role": userRole,
        "gender": gender,
        "DOB": dob,
        "user_details": userDetails?.toJson(),
    };
}

class UserDetails {
    int? id;
    int? userId;
    dynamic topDegrees;
    dynamic careerResult;
    dynamic personalityReport;
    dynamic traitReport;
    dynamic learnpReport;
    dynamic learntReport;
    dynamic pResult;
    dynamic resultScreenshot;
    String? fqs;
    String? gender;
    String? dob;
    String? userRole;
    dynamic userDetailsClass;
    dynamic programs;
    dynamic childPrograms;
    dynamic subChildPrograms;
    String? industry;
    String? aim;
    dynamic role;
    String? longTermGoals;
    String? shortTermGoals;
    dynamic hobbies;
    dynamic freeTime;
    dynamic skill;
    dynamic interestedSkill;
    dynamic dreamCompany;
    dynamic newLearning;
    DateTime? updatedAt;
    DateTime? createdAt;
    int? lmsId;
    Qualification? qualification;

    UserDetails({
        this.id,
        this.userId,
        this.topDegrees,
        this.careerResult,
        this.personalityReport,
        this.traitReport,
        this.learnpReport,
        this.learntReport,
        this.pResult,
        this.resultScreenshot,
        this.fqs,
        this.gender,
        this.dob,
        this.userRole,
        this.userDetailsClass,
        this.programs,
        this.childPrograms,
        this.subChildPrograms,
        this.industry,
        this.aim,
        this.role,
        this.longTermGoals,
        this.shortTermGoals,
        this.hobbies,
        this.freeTime,
        this.skill,
        this.interestedSkill,
        this.dreamCompany,
        this.newLearning,
        this.updatedAt,
        this.createdAt,
        this.lmsId,
        this.qualification,
    });

    factory UserDetails.fromJson(Map<String, dynamic> json) => UserDetails(
        id: json["id"],
        userId: json["user_id"],
        topDegrees: json["top_degrees"],
        careerResult: json["career_result"],
        personalityReport: json["personality_report"],
        traitReport: json["trait_report"],
        learnpReport: json["learnp_report"],
        learntReport: json["learnt_report"],
        pResult: json["p_result"],
        resultScreenshot: json["result_screenshot"],
        fqs: json["fqs"],
        gender: json["gender"],
        dob: json["dob"],
        userRole: json["user_role"],
        userDetailsClass: json["class"],
        programs: json["programs"],
        childPrograms: json["child_programs"],
        subChildPrograms: json["sub_child_programs"],
        industry: json["industry"],
        aim: json["aim"],
        role: json["role"],
        longTermGoals: json["long_term_goals"],
        shortTermGoals: json["short_term_goals"],
        hobbies: json["hobbies"],
        freeTime: json["free_time"],
        skill: json["skill"],
        interestedSkill: json["interested_skill"],
        dreamCompany: json["dream_company"],
        newLearning: json["new_learning"],
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        lmsId: json["lms_id"],
        qualification: json["qualification"] == null ? null : Qualification.fromJson(json["qualification"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "top_degrees": topDegrees,
        "career_result": careerResult,
        "personality_report": personalityReport,
        "trait_report": traitReport,
        "learnp_report": learnpReport,
        "learnt_report": learntReport,
        "p_result": pResult,
        "result_screenshot": resultScreenshot,
        "fqs": fqs,
        "gender": gender,
        "dob": dob,
        "user_role": userRole,
        "class": userDetailsClass,
        "programs": programs,
        "child_programs": childPrograms,
        "sub_child_programs": subChildPrograms,
        "industry": industry,
        "aim": aim,
        "role": role,
        "long_term_goals": longTermGoals,
        "short_term_goals": shortTermGoals,
        "hobbies": hobbies,
        "free_time": freeTime,
        "skill": skill,
        "interested_skill": interestedSkill,
        "dream_company": dreamCompany,
        "new_learning": newLearning,
        "updated_at": updatedAt?.toIso8601String(),
        "created_at": createdAt?.toIso8601String(),
        "lms_id": lmsId,
        "qualification": qualification?.toJson(),
    };
}

class Qualification {
    int? id;
    String? title;
    dynamic description;
    dynamic image;
    int? status;
    int? lmsId;
    dynamic updatedAt;
    dynamic createdAt;

    Qualification({
        this.id,
        this.title,
        this.description,
        this.image,
        this.status,
        this.lmsId,
        this.updatedAt,
        this.createdAt,
    });

    factory Qualification.fromJson(Map<String, dynamic> json) => Qualification(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        image: json["image"],
        status: json["status"],
        lmsId: json["lms_id"],
        updatedAt: json["updated_at"],
        createdAt: json["created_at"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
        "image": image,
        "status": status,
        "lms_id": lmsId,
        "updated_at": updatedAt,
        "created_at": createdAt,
    };
}
