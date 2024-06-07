
// ignore_for_file: constant_identifier_names

class TraitReportModel {
    User? user;
    String? learnExplanation;
    String? dinterests;
    String? yourMHaves;
    String? traitType;
    String? traitExplanation;
    TopTwoValues? topTwoValues;
    Riasec? riasec;
    List<String>? topTwoNames;
    List<ClassArray>? classArray;
    int? classind;
    List<String>? veryInterested;
    List<String>? interested;
    List<String>? neutral;
    List<String>? uninterested;
    List<String>? veryInterestedHaves;
    List<String>? importantHaves;
    List<String>? neutralHaves;
    List<String>? takeIt;
    List<String>? dontIt;
    List<String>? highlyPreferred;
    List<String>? preferred;
    BroadPersonality? broadPersonality;
    DetailedPersonality? detailedPersonality;
    int? attemptQuestion;
    int? attemptSection;
    List<String>? classNameArray;

    TraitReportModel({
        this.user,
        this.learnExplanation,
        this.dinterests,
        this.yourMHaves,
        this.traitType,
        this.traitExplanation,
        this.topTwoValues,
        this.riasec,
        this.topTwoNames,
        this.classArray,
        this.classind,
        this.veryInterested,
        this.interested,
        this.neutral,
        this.uninterested,
        this.veryInterestedHaves,
        this.importantHaves,
        this.neutralHaves,
        this.takeIt,
        this.dontIt,
        this.highlyPreferred,
        this.preferred,
        this.broadPersonality,
        this.detailedPersonality,
        this.attemptQuestion,
        this.attemptSection,
        this.classNameArray,
    });

    factory TraitReportModel.fromJson(Map<String, dynamic> json) => TraitReportModel(
        user: json["user"] == null ? null : User.fromJson(json["user"]),
        learnExplanation: json["learnExplanation"],
        dinterests: json["Dinterests"],
        yourMHaves: json["yourMHaves"],
        traitType: json["traitType"],
        traitExplanation: json["traitExplanation"],
        topTwoValues: json["topTwoValues"] == null ? null : TopTwoValues.fromJson(json["topTwoValues"]),
        riasec: json["RIASEC"] == null ? null : Riasec.fromJson(json["RIASEC"]),
        topTwoNames: json["topTwoNames"] == null ? [] : List<String>.from(json["topTwoNames"]!.map((x) => x)),
        classArray: json["classArray"] == null ? [] : List<ClassArray>.from(json["classArray"]!.map((x) => classArrayValues.map[x]!)),
        classind: json["classind"],
        veryInterested: json["veryInterested"] == null ? [] : List<String>.from(json["veryInterested"]!.map((x) => x)),
        interested: json["interested"] == null ? [] : List<String>.from(json["interested"]!.map((x) => x)),
        neutral: json["neutral"] == null ? [] : List<String>.from(json["neutral"]!.map((x) => x)),
        uninterested: json["uninterested"] == null ? [] : List<String>.from(json["uninterested"]!.map((x) => x)),
        veryInterestedHaves: json["veryInterestedHaves"] == null ? [] : List<String>.from(json["veryInterestedHaves"]!.map((x) => x)),
        importantHaves: json["importantHaves"] == null ? [] : List<String>.from(json["importantHaves"]!.map((x) => x)),
        neutralHaves: json["neutralHaves"] == null ? [] : List<String>.from(json["neutralHaves"]!.map((x) => x)),
        takeIt: json["takeIt"] == null ? [] : List<String>.from(json["takeIt"]!.map((x) => x)),
        dontIt: json["dontIt"] == null ? [] : List<String>.from(json["dontIt"]!.map((x) => x)),
        highlyPreferred: json["highlyPreferred"] == null ? [] : List<String>.from(json["highlyPreferred"]!.map((x) => x)),
        preferred: json["preferred"] == null ? [] : List<String>.from(json["preferred"]!.map((x) => x)),
        broadPersonality: json["broadPersonality"] == null ? null : BroadPersonality.fromJson(json["broadPersonality"]),
        detailedPersonality: json["detailedPersonality"] == null ? null : DetailedPersonality.fromJson(json["detailedPersonality"]),
        attemptQuestion: json["attempt_question"],
        attemptSection: json["attempt_section"],
        classNameArray: json["classNameArray"] == null ? [] : List<String>.from(json["classNameArray"]!.map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "user": user?.toJson(),
        "learnExplanation": learnExplanation,
        "Dinterests": dinterests,
        "yourMHaves": yourMHaves,
        "traitType": traitType,
        "traitExplanation": traitExplanation,
        "topTwoValues": topTwoValues?.toJson(),
        "RIASEC": riasec?.toJson(),
        "topTwoNames": topTwoNames == null ? [] : List<dynamic>.from(topTwoNames!.map((x) => x)),
        "classArray": classArray == null ? [] : List<dynamic>.from(classArray!.map((x) => classArrayValues.reverse[x])),
        "classind": classind,
        "veryInterested": veryInterested == null ? [] : List<dynamic>.from(veryInterested!.map((x) => x)),
        "interested": interested == null ? [] : List<dynamic>.from(interested!.map((x) => x)),
        "neutral": neutral == null ? [] : List<dynamic>.from(neutral!.map((x) => x)),
        "uninterested": uninterested == null ? [] : List<dynamic>.from(uninterested!.map((x) => x)),
        "veryInterestedHaves": veryInterestedHaves == null ? [] : List<dynamic>.from(veryInterestedHaves!.map((x) => x)),
        "importantHaves": importantHaves == null ? [] : List<dynamic>.from(importantHaves!.map((x) => x)),
        "neutralHaves": neutralHaves == null ? [] : List<dynamic>.from(neutralHaves!.map((x) => x)),
        "takeIt": takeIt == null ? [] : List<dynamic>.from(takeIt!.map((x) => x)),
        "dontIt": dontIt == null ? [] : List<dynamic>.from(dontIt!.map((x) => x)),
        "highlyPreferred": highlyPreferred == null ? [] : List<dynamic>.from(highlyPreferred!.map((x) => x)),
        "preferred": preferred == null ? [] : List<dynamic>.from(preferred!.map((x) => x)),
        "broadPersonality": broadPersonality?.toJson(),
        "detailedPersonality": detailedPersonality?.toJson(),
        "attempt_question": attemptQuestion,
        "attempt_section": attemptSection,
        "classNameArray": classNameArray == null ? [] : List<dynamic>.from(classNameArray!.map((x) => x)),
    };
}

class BroadPersonality {
    String? conscientiousness;
    String? openness;
    String? socialResponsibility;
    String? extraversion;
    String? agreeableness;

    BroadPersonality({
        this.conscientiousness,
        this.openness,
        this.socialResponsibility,
        this.extraversion,
        this.agreeableness,
    });

    factory BroadPersonality.fromJson(Map<String, dynamic> json) => BroadPersonality(
        conscientiousness: json["Conscientiousness"],
        openness: json["Openness"],
        socialResponsibility: json["Social Responsibility"],
        extraversion: json["Extraversion"],
        agreeableness: json["Agreeableness"],
    );

    Map<String, dynamic> toJson() => {
        "Conscientiousness": conscientiousness,
        "Openness": openness,
        "Social Responsibility": socialResponsibility,
        "Extraversion": extraversion,
        "Agreeableness": agreeableness,
    };
}

enum ClassArray {
    BAR,
    BAR_BLUE_SLIDE,
    BAR_GREEN_SLIDE,
    BAR_YELLOW_SLIDE
}

final classArrayValues = EnumValues({
    "bar": ClassArray.BAR,
    "bar blue-slide": ClassArray.BAR_BLUE_SLIDE,
    "bar green-slide": ClassArray.BAR_GREEN_SLIDE,
    "bar yellow-slide": ClassArray.BAR_YELLOW_SLIDE
});

class DetailedPersonality {
    String? leadership;
    String? concernForOthers;
    String? dependability;
    String? toleranceOfStressAndCriticism;

    DetailedPersonality({
        this.leadership,
        this.concernForOthers,
        this.dependability,
        this.toleranceOfStressAndCriticism,
    });

    factory DetailedPersonality.fromJson(Map<String, dynamic> json) => DetailedPersonality(
        leadership: json["Leadership"],
        concernForOthers: json["Concern for others"],
        dependability: json["Dependability"],
        toleranceOfStressAndCriticism: json["Tolerance of stress and criticism"],
    );

    Map<String, dynamic> toJson() => {
        "Leadership": leadership,
        "Concern for others": concernForOthers,
        "Dependability": dependability,
        "Tolerance of stress and criticism": toleranceOfStressAndCriticism,
    };
}

class Riasec {
    String? realistic;
    String? investigative;
    String? artistic;
    String? social;
    String? enterprising;
    String? conventional;

    Riasec({
        this.realistic,
        this.investigative,
        this.artistic,
        this.social,
        this.enterprising,
        this.conventional,
    });

    factory Riasec.fromJson(Map<String, dynamic> json) => Riasec(
        realistic: json["Realistic"],
        investigative: json["Investigative"],
        artistic: json["Artistic"],
        social: json["Social"],
        enterprising: json["Enterprising"],
        conventional: json["Conventional"],
    );

    Map<String, dynamic> toJson() => {
        "Realistic": realistic,
        "Investigative": investigative,
        "Artistic": artistic,
        "Social": social,
        "Enterprising": enterprising,
        "Conventional": conventional,
    };
}

class TopTwoValues {
    int? social;
    int? realistic;

    TopTwoValues({
        this.social,
        this.realistic,
    });

    factory TopTwoValues.fromJson(Map<String, dynamic> json) => TopTwoValues(
        social: json["Social"],
        realistic: json["Realistic"],
    );

    Map<String, dynamic> toJson() => {
        "Social": social,
        "Realistic": realistic,
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

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
            reverseMap = map.map((k, v) => MapEntry(v, k));
            return reverseMap;
    }
}
