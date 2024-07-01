// To parse this JSON data, do
// final userDataModel = userDataModelFromJson(jsonString);
// import 'dart:convert';
// UserDataModel userDataModelFromJson(String str) => UserDataModel.fromJson(json.decode(str));
// String userDataModelToJson(UserDataModel data) => json.encode(data.toJson());

class UserModel {
    String? token;
    User? user;

    UserModel({
        this.token,
        this.user,
    });

    factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        token: json["token"],
        user: json["user"] == null ? null : User.fromJson(json["user"]),
    );

    Map<String, dynamic> toJson() => {
        "token": token,
        "user": user?.toJson(),
    };
}

class User {
    int? id;
    int? roleId;
    dynamic ip;
    dynamic userActive;
    dynamic referralCode;
    String? name;
    String? photo;
    String? image;
    String? avatar;
    DateTime? emailVerifiedAt;
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
    String? referralBy;
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
    dynamic lastActivityAt;
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
        emailVerifiedAt: json["email_verified_at"] == null ? null : DateTime.parse(json["email_verified_at"]),
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
        lastActivityAt: json["last_activity_at"],
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
        "email_verified_at": emailVerifiedAt?.toIso8601String(),
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
        "last_activity_at": lastActivityAt,
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
        "first_name": firstName,
        "last_name": lastName,
        "blocked_by_me": blockedByMe,
    };
}
