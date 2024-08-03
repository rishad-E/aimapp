// To parse this JSON data, do
//
//     final aimcetTestResDetails = aimcetTestResDetailsFromJson(jsonString);

// import 'dart:convert';

// AimcetTestResDetails aimcetTestResDetailsFromJson(String str) => AimcetTestResDetails.fromJson(json.decode(str));

// String aimcetTestResDetailsToJson(AimcetTestResDetails data) => json.encode(data.toJson());

class AimcetTestResDetails {
    TestuserDetails? testuserDetails;

    AimcetTestResDetails({
        this.testuserDetails,
    });

    factory AimcetTestResDetails.fromJson(Map<String, dynamic> json) => AimcetTestResDetails(
        testuserDetails: json["testuserDetails"] == null ? null : TestuserDetails.fromJson(json["testuserDetails"]),
    );

    Map<String, dynamic> toJson() => {
        "testuserDetails": testuserDetails?.toJson(),
    };
}

class TestuserDetails {
    int? id;
    int? userId;
    String? topDegrees;
    String? careerResult;
    String? personalityReport;
    String? traitReport;
    String? learnpReport;
    String? learntReport;
    String? pResult;
    String? resultScreenshot;
    String? fqs;
    String? gender;
    String? dob;
    String? userRole;
    String? testuserDetailsClass;
    dynamic programs;
    dynamic childPrograms;
    dynamic subChildPrograms;
    dynamic professionalCurrent;
    dynamic employeeCurrent;
    dynamic entrepreneurCurrent;
    dynamic currentRoleTime;
    dynamic houseMakerCurrent;
    dynamic careerStage;
    String? career;
    String? longTermGoals;
    String? shortTermGoals;
    String? hobbies;
    String? strength;
    String? newLearning;
    DateTime? updatedAt;
    DateTime? createdAt;
    int? lmsId;

    TestuserDetails({
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
        this.testuserDetailsClass,
        this.programs,
        this.childPrograms,
        this.subChildPrograms,
        this.professionalCurrent,
        this.employeeCurrent,
        this.entrepreneurCurrent,
        this.currentRoleTime,
        this.houseMakerCurrent,
        this.careerStage,
        this.career,
        this.longTermGoals,
        this.shortTermGoals,
        this.hobbies,
        this.strength,
        this.newLearning,
        this.updatedAt,
        this.createdAt,
        this.lmsId,
    });

    factory TestuserDetails.fromJson(Map<String, dynamic> json) => TestuserDetails(
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
        testuserDetailsClass: json["class"],
        programs: json["programs"],
        childPrograms: json["child_programs"],
        subChildPrograms: json["sub_child_programs"],
        professionalCurrent: json["professional_current"],
        employeeCurrent: json["employee_current"],
        entrepreneurCurrent: json["entrepreneur_current"],
        currentRoleTime: json["current_role_time"],
        houseMakerCurrent: json["house_maker_current"],
        careerStage: json["career_stage"],
        career: json["career"],
        longTermGoals: json["long_term_goals"],
        shortTermGoals: json["short_term_goals"],
        hobbies: json["hobbies"],
        strength: json["strength"],
        newLearning: json["new_learning"],
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        lmsId: json["lms_id"],
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
        "class": testuserDetailsClass,
        "programs": programs,
        "child_programs": childPrograms,
        "sub_child_programs": subChildPrograms,
        "professional_current": professionalCurrent,
        "employee_current": employeeCurrent,
        "entrepreneur_current": entrepreneurCurrent,
        "current_role_time": currentRoleTime,
        "house_maker_current": houseMakerCurrent,
        "career_stage": careerStage,
        "career": career,
        "long_term_goals": longTermGoals,
        "short_term_goals": shortTermGoals,
        "hobbies": hobbies,
        "strength": strength,
        "new_learning": newLearning,
        "updated_at": updatedAt?.toIso8601String(),
        "created_at": createdAt?.toIso8601String(),
        "lms_id": lmsId,
    };
}
