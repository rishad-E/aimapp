// // To parse this JSON data, do
// //
// //     final personalityReportModel = personalityReportModelFromJson(jsonString);

// // import 'dart:convert';

// // PersonalityReportModel personalityReportModelFromJson(String str) => PersonalityReportModel.fromJson(json.decode(str));

// // String personalityReportModelToJson(PersonalityReportModel data) => json.encode(data.toJson());

// // ignore_for_file: unnecessary_type_check

// class PersonalityReportModel {
//   String? userId;
//   String? username;
//   String? learnExplanation;
//   List<String>? learnSkills;
//   String? showSkills;
//   List<String>? learnStrengths;
//   String? showStrengths;
//   String? personalityType;
//   String? personalityDescription;
//   List<String>? topSkills;
//   List<String>? selectedSkills;
//   String? skillsSentence;
//   String? careerTendencies;
//   String? workingStyle;
//   List<String>? strengths;
//   List<String>? selectedStrengths;
//   String? strengthSentence;
//   List<String>? cautiousAreas;
//   List<String>? teamInteraction;
//   List<String>? personalStyle;
//   List<String>? idealWorkEnvironment;
//   List<String>? valueOfPersonalityReport;

//   PersonalityReportModel({
//     this.userId,
//     this.username,
//     this.learnExplanation,
//     this.learnSkills,
//     this.showSkills,
//     this.learnStrengths,
//     this.showStrengths,
//     this.personalityType,
//     this.personalityDescription,
//     this.topSkills,
//     this.selectedSkills,
//     this.skillsSentence,
//     this.careerTendencies,
//     this.workingStyle,
//     this.strengths,
//     this.selectedStrengths,
//     this.strengthSentence,
//     this.cautiousAreas,
//     this.teamInteraction,
//     this.personalStyle,
//     this.idealWorkEnvironment,
//     this.valueOfPersonalityReport,
//   });

//   factory PersonalityReportModel.fromJson(Map<String, dynamic> json) {
//     var valueOfPersonalityReportJson = json["value_of_personality_report"];
//     List<String>? valueOfPersonalityReportList;
//     if (valueOfPersonalityReportJson is List) {
//       valueOfPersonalityReportList =
//           List<String>.from(valueOfPersonalityReportJson.map((x) => x));
//     } else if (valueOfPersonalityReportJson is String) {
//       valueOfPersonalityReportList = [valueOfPersonalityReportJson];
//     }

//     return PersonalityReportModel(
//       userId: json["user_id"],
//       username: json["username"],
//       learnExplanation: json["learn_explanation"],
//       learnSkills: json["learn_skills"] == null
//           ? []
//           : List<String>.from(json["learn_skills"]!.map((x) => x)),
//       showSkills: json["show_skills"],
//       learnStrengths: json["learn_strengths"] == null
//           ? []
//           : List<String>.from(json["learn_strengths"]!.map((x) => x)),
//       showStrengths: json["show_strengths"],
//       personalityType: json["personality_type"],
//       personalityDescription: json["personality_description"],
//       topSkills: json["top_skills"] == null
//           ? []
//           : List<String>.from(json["top_skills"]!.map((x) => x)),
//       selectedSkills: json["selected_skills"] == null
//           ? []
//           : List<String>.from(json["selected_skills"]!.map((x) => x)),
//       skillsSentence: json["skills_sentence"],
//       careerTendencies: json["career_tendencies"],
//       workingStyle: json["working_style"],
//       strengths: json["strengths"] == null
//           ? []
//           : List<String>.from(json["strengths"]!.map((x) => x)),
//       selectedStrengths: json["selected_strengths"] == null
//           ? []
//           : List<String>.from(json["selected_strengths"]!.map((x) => x)),
//       strengthSentence: json["strength_sentence"],
//       cautiousAreas: json["cautious_areas"] == null
//           ? []
//           : List<String>.from(json["cautious_areas"]!.map((x) => x)),
//       teamInteraction: json["team_interaction"] == null
//           ? []
//           : List<String>.from(json["team_interaction"]!.map((x) => x)),
//       personalStyle: json["personal_style"] == null
//           ? []
//           : List<String>.from(json["personal_style"]!.map((x) => x)),
//       idealWorkEnvironment: json["ideal_work_environment"] == null
//           ? []
//           : List<String>.from(json["ideal_work_environment"]!.map((x) => x)),
//       valueOfPersonalityReport: valueOfPersonalityReportList,
//     );
//   }

//   Map<String, dynamic> toJson() {
//     List<dynamic> valueOfPersonalityReportJson;
//     if (valueOfPersonalityReport != null) {
//       if (valueOfPersonalityReport!.length == 1 &&
//           valueOfPersonalityReport!.first is String) {
//         valueOfPersonalityReportJson = valueOfPersonalityReport!;
//       } else {
//         valueOfPersonalityReportJson = valueOfPersonalityReport!;
//       }
//     } else {
//       valueOfPersonalityReportJson = [];
//     }
//     return {
//       "user_id": userId,
//       "username": username,
//       "learn_explanation": learnExplanation,
//       "learn_skills": learnSkills == null
//           ? []
//           : List<dynamic>.from(learnSkills!.map((x) => x)),
//       "show_skills": showSkills,
//       "learn_strengths": learnStrengths == null
//           ? []
//           : List<dynamic>.from(learnStrengths!.map((x) => x)),
//       "show_strengths": showStrengths,
//       "personality_type": personalityType,
//       "personality_description": personalityDescription,
//       "top_skills":
//           topSkills == null ? [] : List<dynamic>.from(topSkills!.map((x) => x)),
//       "selected_skills": selectedSkills == null
//           ? []
//           : List<dynamic>.from(selectedSkills!.map((x) => x)),
//       "skills_sentence": skillsSentence,
//       "career_tendencies": careerTendencies,
//       "working_style": workingStyle,
//       "strengths":
//           strengths == null ? [] : List<dynamic>.from(strengths!.map((x) => x)),
//       "selected_strengths": selectedStrengths == null
//           ? []
//           : List<dynamic>.from(selectedStrengths!.map((x) => x)),
//       "strength_sentence": strengthSentence,
//       "cautious_areas": cautiousAreas == null
//           ? []
//           : List<dynamic>.from(cautiousAreas!.map((x) => x)),
//       "team_interaction": teamInteraction == null
//           ? []
//           : List<dynamic>.from(teamInteraction!.map((x) => x)),
//       "personal_style": personalStyle == null
//           ? []
//           : List<dynamic>.from(personalStyle!.map((x) => x)),
//       "ideal_work_environment": idealWorkEnvironment == null
//           ? []
//           : List<dynamic>.from(idealWorkEnvironment!.map((x) => x)),
//        "value_of_personality_report": valueOfPersonalityReportJson,
//     };
//   }
// }

// To parse this JSON data, do
//
//     final personalityReportModel = personalityReportModelFromJson(jsonString);

import 'dart:convert';

PersonalityReportModel personalityReportModelFromJson(String str) => PersonalityReportModel.fromJson(json.decode(str));

String personalityReportModelToJson(PersonalityReportModel data) => json.encode(data.toJson());

class PersonalityReportModel {
    User? user;
    String? learnExplanation;
    List<String>? learnSkill;
    String? showSkills;
    List<String>? learnStrengths;
    String? showStrengths;
    String? personalityType;
    String? personalityDescription;
    List<String>? topSkills;
    String? careerTendencies;
    String? workingStyle;
    List<String>? strengths;
    List<String>? cautiousAreas;
    List<String>? teamInteraction;
    List<String>? personalStyle;
    List<String>? idealWorkEnvironment;
    List<String>? valueOfPersonalityReport;
    int? attemptQuestion;
    int? attemptSection;

    PersonalityReportModel({
        this.user,
        this.learnExplanation,
        this.learnSkill,
        this.showSkills,
        this.learnStrengths,
        this.showStrengths,
        this.personalityType,
        this.personalityDescription,
        this.topSkills,
        this.careerTendencies,
        this.workingStyle,
        this.strengths,
        this.cautiousAreas,
        this.teamInteraction,
        this.personalStyle,
        this.idealWorkEnvironment,
        this.valueOfPersonalityReport,
        this.attemptQuestion,
        this.attemptSection,
    });

    factory PersonalityReportModel.fromJson(Map<String, dynamic> json) => PersonalityReportModel(
        user: json["user"] == null ? null : User.fromJson(json["user"]),
        learnExplanation: json["learnExplanation"],
        learnSkill: json["learnSkill"] == null ? [] : List<String>.from(json["learnSkill"]!.map((x) => x)),
        showSkills: json["showSkills"],
        learnStrengths: json["learnStrengths"] == null ? [] : List<String>.from(json["learnStrengths"]!.map((x) => x)),
        showStrengths: json["showStrengths"],
        personalityType: json["personalityType"],
        personalityDescription: json["personalityDescription"],
        topSkills: json["topSkills"] == null ? [] : List<String>.from(json["topSkills"]!.map((x) => x)),
        careerTendencies: json["careerTendencies"],
        workingStyle: json["workingStyle"],
        strengths: json["strengths"] == null ? [] : List<String>.from(json["strengths"]!.map((x) => x)),
        cautiousAreas: json["cautiousAreas"] == null ? [] : List<String>.from(json["cautiousAreas"]!.map((x) => x)),
        teamInteraction: json["teamInteraction"] == null ? [] : List<String>.from(json["teamInteraction"]!.map((x) => x)),
        personalStyle: json["personalStyle"] == null ? [] : List<String>.from(json["personalStyle"]!.map((x) => x)),
        idealWorkEnvironment: json["idealWorkEnvironment"] == null ? [] : List<String>.from(json["idealWorkEnvironment"]!.map((x) => x)),
        valueOfPersonalityReport: json["valueOfPersonalityReport"] == null ? [] : List<String>.from(json["valueOfPersonalityReport"]!.map((x) => x)),
        attemptQuestion: json["attempt_question"],
        attemptSection: json["attempt_section"],
    );

    Map<String, dynamic> toJson() => {
        "user": user?.toJson(),
        "learnExplanation": learnExplanation,
        "learnSkill": learnSkill == null ? [] : List<dynamic>.from(learnSkill!.map((x) => x)),
        "showSkills": showSkills,
        "learnStrengths": learnStrengths == null ? [] : List<dynamic>.from(learnStrengths!.map((x) => x)),
        "showStrengths": showStrengths,
        "personalityType": personalityType,
        "personalityDescription": personalityDescription,
        "topSkills": topSkills == null ? [] : List<dynamic>.from(topSkills!.map((x) => x)),
        "careerTendencies": careerTendencies,
        "workingStyle": workingStyle,
        "strengths": strengths == null ? [] : List<dynamic>.from(strengths!.map((x) => x)),
        "cautiousAreas": cautiousAreas == null ? [] : List<dynamic>.from(cautiousAreas!.map((x) => x)),
        "teamInteraction": teamInteraction == null ? [] : List<dynamic>.from(teamInteraction!.map((x) => x)),
        "personalStyle": personalStyle == null ? [] : List<dynamic>.from(personalStyle!.map((x) => x)),
        "idealWorkEnvironment": idealWorkEnvironment == null ? [] : List<dynamic>.from(idealWorkEnvironment!.map((x) => x)),
        "valueOfPersonalityReport": valueOfPersonalityReport == null ? [] : List<dynamic>.from(valueOfPersonalityReport!.map((x) => x)),
        "attempt_question": attemptQuestion,
        "attempt_section": attemptSection,
    };
}

class User {
    int? id;
    int? roleId;
    dynamic ip;
    String? userActive;
    String? referralCode;
    String? name;
    String? photo;
    String? image;
    String? avatar;
    dynamic emailVerifiedAt;
    String? notificationPreference;
    int? isActive;
    String? username;
    String? email;
    String? emailVerify;
    dynamic headline;
    String? phone;
    String? address;
    String? country;
    String? zip;
    String? dob;
    String? about;
    dynamic shortDetails;
    String? facebook;
    String? twitter;
    dynamic linkedin;
    String? instagram;
    dynamic youtube;
    int? subscribe;
    dynamic provider;
    dynamic providerId;
    String? languageId;
    String? languageCode;
    String? languageName;
    int? status;
    int? balance;
    int? currencyId;
    String? specialCommission;
    String? payout;
    String? payoutIcon;
    String? payoutEmail;
    dynamic referralBy;
    int? addedBy;
    dynamic zoomApiKeyOfUser;
    dynamic zoomApiSerectOfUser;
    DateTime? createdAt;
    DateTime? updatedAt;
    dynamic bankName;
    dynamic branchName;
    dynamic bankAccountNumber;
    dynamic accountHolderName;
    dynamic bankType;
    int? lmsId;
    dynamic subscriptionMethod;
    dynamic subscriptionApiKey;
    int? subscriptionApiStatus;
    int? languageRtl;
    String? gender;
    dynamic studentType;
    dynamic identificationNumber;
    dynamic jobTitle;
    dynamic companyId;
    dynamic studentGroupId;
    DateTime? lastActivityAt;
    int? teachVia;
    dynamic accessToken;
    dynamic deviceToken;
    dynamic policyId;
    String? state;
    dynamic company;
    dynamic otp;
    String? city;
    int? gamificationPoints;
    int? gamificationTotalPoints;
    int? gamificationTotalSpentPoints;
    int? userLevel;
    int? userLevelCourseComplete;
    String? comeBy;
    dynamic token;
    dynamic userStatus;
    dynamic connectionId;
    String? firstName;
    String? lastName;
    dynamic blockedByMe;

    User({
        this.id,
        this.roleId,
        this.ip,
        this.userActive,
        this.referralCode,
        this.name,
        this.photo,
        this.image,
        this.avatar,
        this.emailVerifiedAt,
        this.notificationPreference,
        this.isActive,
        this.username,
        this.email,
        this.emailVerify,
        this.headline,
        this.phone,
        this.address,
        this.country,
        this.zip,
        this.dob,
        this.about,
        this.shortDetails,
        this.facebook,
        this.twitter,
        this.linkedin,
        this.instagram,
        this.youtube,
        this.subscribe,
        this.provider,
        this.providerId,
        this.languageId,
        this.languageCode,
        this.languageName,
        this.status,
        this.balance,
        this.currencyId,
        this.specialCommission,
        this.payout,
        this.payoutIcon,
        this.payoutEmail,
        this.referralBy,
        this.addedBy,
        this.zoomApiKeyOfUser,
        this.zoomApiSerectOfUser,
        this.createdAt,
        this.updatedAt,
        this.bankName,
        this.branchName,
        this.bankAccountNumber,
        this.accountHolderName,
        this.bankType,
        this.lmsId,
        this.subscriptionMethod,
        this.subscriptionApiKey,
        this.subscriptionApiStatus,
        this.languageRtl,
        this.gender,
        this.studentType,
        this.identificationNumber,
        this.jobTitle,
        this.companyId,
        this.studentGroupId,
        this.lastActivityAt,
        this.teachVia,
        this.accessToken,
        this.deviceToken,
        this.policyId,
        this.state,
        this.company,
        this.otp,
        this.city,
        this.gamificationPoints,
        this.gamificationTotalPoints,
        this.gamificationTotalSpentPoints,
        this.userLevel,
        this.userLevelCourseComplete,
        this.comeBy,
        this.token,
        this.userStatus,
        this.connectionId,
        this.firstName,
        this.lastName,
        this.blockedByMe,
    });

    factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        roleId: json["role_id"],
        ip: json["ip"],
        userActive: json["user_active"],
        referralCode: json["referral_code"],
        name: json["name"],
        photo: json["photo"],
        image: json["image"],
        avatar: json["avatar"],
        emailVerifiedAt: json["email_verified_at"],
        notificationPreference: json["notification_preference"],
        isActive: json["is_active"],
        username: json["username"],
        email: json["email"],
        emailVerify: json["email_verify"],
        headline: json["headline"],
        phone: json["phone"],
        address: json["address"],
        country: json["country"],
        zip: json["zip"],
        dob: json["dob"],
        about: json["about"],
        shortDetails: json["short_details"],
        facebook: json["facebook"],
        twitter: json["twitter"],
        linkedin: json["linkedin"],
        instagram: json["instagram"],
        youtube: json["youtube"],
        subscribe: json["subscribe"],
        provider: json["provider"],
        providerId: json["provider_id"],
        languageId: json["language_id"],
        languageCode: json["language_code"],
        languageName: json["language_name"],
        status: json["status"],
        balance: json["balance"],
        currencyId: json["currency_id"],
        specialCommission: json["special_commission"],
        payout: json["payout"],
        payoutIcon: json["payout_icon"],
        payoutEmail: json["payout_email"],
        referralBy: json["referral_by"],
        addedBy: json["added_by"],
        zoomApiKeyOfUser: json["zoom_api_key_of_user"],
        zoomApiSerectOfUser: json["zoom_api_serect_of_user"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        bankName: json["bank_name"],
        branchName: json["branch_name"],
        bankAccountNumber: json["bank_account_number"],
        accountHolderName: json["account_holder_name"],
        bankType: json["bank_type"],
        lmsId: json["lms_id"],
        subscriptionMethod: json["subscription_method"],
        subscriptionApiKey: json["subscription_api_key"],
        subscriptionApiStatus: json["subscription_api_status"],
        languageRtl: json["language_rtl"],
        gender: json["gender"],
        studentType: json["student_type"],
        identificationNumber: json["identification_number"],
        jobTitle: json["job_title"],
        companyId: json["company_id"],
        studentGroupId: json["student_group_id"],
        lastActivityAt: json["last_activity_at"] == null ? null : DateTime.parse(json["last_activity_at"]),
        teachVia: json["teach_via"],
        accessToken: json["access_token"],
        deviceToken: json["device_token"],
        policyId: json["policy_id"],
        state: json["state"],
        company: json["company"],
        otp: json["otp"],
        city: json["city"],
        gamificationPoints: json["gamification_points"],
        gamificationTotalPoints: json["gamification_total_points"],
        gamificationTotalSpentPoints: json["gamification_total_spent_points"],
        userLevel: json["user_level"],
        userLevelCourseComplete: json["user_level_course_complete"],
        comeBy: json["come_by"],
        token: json["token"],
        userStatus: json["user_status"],
        connectionId: json["connection_id"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        blockedByMe: json["blocked_by_me"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "role_id": roleId,
        "ip": ip,
        "user_active": userActive,
        "referral_code": referralCode,
        "name": name,
        "photo": photo,
        "image": image,
        "avatar": avatar,
        "email_verified_at": emailVerifiedAt,
        "notification_preference": notificationPreference,
        "is_active": isActive,
        "username": username,
        "email": email,
        "email_verify": emailVerify,
        "headline": headline,
        "phone": phone,
        "address": address,
        "country": country,
        "zip": zip,
        "dob": dob,
        "about": about,
        "short_details": shortDetails,
        "facebook": facebook,
        "twitter": twitter,
        "linkedin": linkedin,
        "instagram": instagram,
        "youtube": youtube,
        "subscribe": subscribe,
        "provider": provider,
        "provider_id": providerId,
        "language_id": languageId,
        "language_code": languageCode,
        "language_name": languageName,
        "status": status,
        "balance": balance,
        "currency_id": currencyId,
        "special_commission": specialCommission,
        "payout": payout,
        "payout_icon": payoutIcon,
        "payout_email": payoutEmail,
        "referral_by": referralBy,
        "added_by": addedBy,
        "zoom_api_key_of_user": zoomApiKeyOfUser,
        "zoom_api_serect_of_user": zoomApiSerectOfUser,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "bank_name": bankName,
        "branch_name": branchName,
        "bank_account_number": bankAccountNumber,
        "account_holder_name": accountHolderName,
        "bank_type": bankType,
        "lms_id": lmsId,
        "subscription_method": subscriptionMethod,
        "subscription_api_key": subscriptionApiKey,
        "subscription_api_status": subscriptionApiStatus,
        "language_rtl": languageRtl,
        "gender": gender,
        "student_type": studentType,
        "identification_number": identificationNumber,
        "job_title": jobTitle,
        "company_id": companyId,
        "student_group_id": studentGroupId,
        "last_activity_at": lastActivityAt?.toIso8601String(),
        "teach_via": teachVia,
        "access_token": accessToken,
        "device_token": deviceToken,
        "policy_id": policyId,
        "state": state,
        "company": company,
        "otp": otp,
        "city": city,
        "gamification_points": gamificationPoints,
        "gamification_total_points": gamificationTotalPoints,
        "gamification_total_spent_points": gamificationTotalSpentPoints,
        "user_level": userLevel,
        "user_level_course_complete": userLevelCourseComplete,
        "come_by": comeBy,
        "token": token,
        "user_status": userStatus,
        "connection_id": connectionId,
        "first_name": firstName,
        "last_name": lastName,
        "blocked_by_me": blockedByMe,
    };
}
