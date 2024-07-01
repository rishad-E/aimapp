// To parse this JSON data, do
//
//     final userDataModel = userDataModelFromJson(jsonString);

// import 'dart:convert';

// UserDataModel userDataModelFromJson(String str) => UserDataModel.fromJson(json.decode(str));

// String userDataModelToJson(UserDataModel data) => json.encode(data.toJson());

class UserDataModel {
    UserData? userData;
    String? userRole;
    String? gender;
    String? dob;
    Aim? aim;
    Aim? microAim;
    String? userDataModelClass;
    String? program;
    String? childProgram;
    String? subChildProgram;

    UserDataModel({
        this.userData,
        this.userRole,
        this.gender,
        this.dob,
        this.aim,
        this.microAim,
        this.userDataModelClass,
        this.program,
        this.childProgram,
        this.subChildProgram,
    });

    factory UserDataModel.fromJson(Map<String, dynamic> json) => UserDataModel(
        userData: json["user_data"] == null ? null : UserData.fromJson(json["user_data"]),
        userRole: json["user_role"],
        gender: json["gender"],
        dob: json["DOB"],
        aim: json["aim"] == null ? null : Aim.fromJson(json["aim"]),
        microAim: json["micro_aim"] == null ? null : Aim.fromJson(json["micro_aim"]),
        userDataModelClass: json["class"],
        program: json["program"],
        childProgram: json["child_program"],
        subChildProgram: json["sub_child_program"],
    );

    Map<String, dynamic> toJson() => {
        "user_data": userData?.toJson(),
        "user_role": userRole,
        "gender": gender,
        "DOB": dob,
        "aim": aim?.toJson(),
        "micro_aim": microAim?.toJson(),
        "class": userDataModelClass,
        "program": program,
        "child_program": childProgram,
        "sub_child_program": subChildProgram,
    };
}

class Aim {
    int? id;
    String? name;

    Aim({
        this.id,
        this.name,
    });

    factory Aim.fromJson(Map<String, dynamic> json) => Aim(
        id: json["id"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
    };
}

class UserData {
    int? id;
    int? roleId;
    dynamic ip;
    String? userActive;
    dynamic referralCode;
    String? name;
    String? photo;
    String? image;
    String? avatar;
    dynamic emailVerifiedAt;
    String? notificationPreference;
    int? isActive;
    dynamic username;
    String? email;
    String? emailVerify;
    dynamic headline;
    String? phone;
    dynamic address;
    String? country;
    dynamic zip;
    dynamic dob;
    dynamic about;
    dynamic shortDetails;
    dynamic facebook;
    dynamic twitter;
    dynamic linkedin;
    dynamic instagram;
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
    dynamic gender;
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
    dynamic state;
    dynamic company;
    dynamic otp;
    dynamic city;
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

    UserData({
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

    factory UserData.fromJson(Map<String, dynamic> json) => UserData(
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
