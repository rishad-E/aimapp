// To parse this JSON data, do
//
//     final traitReportModel = traitReportModelFromJson(jsonString);

// import 'dart:convert';

// TraitReportModel traitReportModelFromJson(String str) => TraitReportModel.fromJson(json.decode(str));

// String traitReportModelToJson(TraitReportModel data) => json.encode(data.toJson());

class TraitReportModel {
    String? userId;
    String? username;
    String? learnExplanation;
    String? yourMustHavesSentence;
    String? detailedInterests;
    String? traitType;
    Riasec? riasec;
    String? detailedInterestsSentence;
    List<String>? traitReportModelMustHaves;
    List<String>? topRiasec;
    List<ClassArray>? classArray;
    List<String>? veryInterested;
    String? workActivitiesSentence;
    List<String>? firstThreeInterests;
    List<String>? interested;
    List<String>? neutral;
    List<String>? uninterested;
    List<String>? yourMustHaves;
    String? yourHaves;
    List<String>? importantHaves;
    List<String>? neutralHaves;
    List<String>? dislikeWorkEnvTakeIt;
    List<String>? dislikeWorkEnvDontMindIt;
    List<String>? skillsHighlyPreferred;
    List<String>? skillsPreferred;
    BroadPersonality? broadPersonality;
    DetailedPersonality? detailedPersonality;
    Skills? skills;
    DisLikes? disLikes;
    MustHaves? mustHaves;
    Activities? activities;
    Hollads? hollads;
    String? traitExplanation;
    TopTwoValues? topTwoValues;
    LearnInfo? learnInfo;

    TraitReportModel({
        this.userId,
        this.username,
        this.learnExplanation,
        this.yourMustHavesSentence,
        this.detailedInterests,
        this.traitType,
        this.riasec,
        this.detailedInterestsSentence,
        this.traitReportModelMustHaves,
        this.topRiasec,
        this.classArray,
        this.veryInterested,
        this.workActivitiesSentence,
        this.firstThreeInterests,
        this.interested,
        this.neutral,
        this.uninterested,
        this.yourMustHaves,
        this.yourHaves,
        this.importantHaves,
        this.neutralHaves,
        this.dislikeWorkEnvTakeIt,
        this.dislikeWorkEnvDontMindIt,
        this.skillsHighlyPreferred,
        this.skillsPreferred,
        this.broadPersonality,
        this.detailedPersonality,
        this.skills,
        this.disLikes,
        this.mustHaves,
        this.activities,
        this.hollads,
        this.traitExplanation,
        this.topTwoValues,
        this.learnInfo,
    });

    factory TraitReportModel.fromJson(Map<String, dynamic> json) => TraitReportModel(
        userId: json["user_id"],
        username: json["username"],
        learnExplanation: json["learn_explanation"],
        yourMustHavesSentence: json["your_must_haves_sentence"],
        detailedInterests: json["detailed_interests"],
        traitType: json["trait_type"],
        riasec: json["RIASEC"] == null ? null : Riasec.fromJson(json["RIASEC"]),
        detailedInterestsSentence: json["detailed_interests_sentence"],
        traitReportModelMustHaves: json["must_haves"] == null ? [] : List<String>.from(json["must_haves"]!.map((x) => x)),
        topRiasec: json["top_riasec"] == null ? [] : List<String>.from(json["top_riasec"]!.map((x) => x)),
        classArray: json["classArray"] == null ? [] : List<ClassArray>.from(json["classArray"]!.map((x) => classArrayValues.map[x]!)),
        veryInterested: json["very_interested"] == null ? [] : List<String>.from(json["very_interested"]!.map((x) => x)),
        workActivitiesSentence: json["work_activities_sentence"],
        firstThreeInterests: json["first_Three_Interests"] == null ? [] : List<String>.from(json["first_Three_Interests"]!.map((x) => x)),
        interested: json["interested"] == null ? [] : List<String>.from(json["interested"]!.map((x) => x)),
        neutral: json["neutral"] == null ? [] : List<String>.from(json["neutral"]!.map((x) => x)),
        uninterested: json["uninterested"] == null ? [] : List<String>.from(json["uninterested"]!.map((x) => x)),
        yourMustHaves: json["your_must_haves"] == null ? [] : List<String>.from(json["your_must_haves"]!.map((x) => x)),
        yourHaves: json["yourHaves"],
        importantHaves: json["important_haves"] == null ? [] : List<String>.from(json["important_haves"]!.map((x) => x)),
        neutralHaves: json["neutral_haves"] == null ? [] : List<String>.from(json["neutral_haves"]!.map((x) => x)),
        dislikeWorkEnvTakeIt: json["dislike_work_env_take_it"] == null ? [] : List<String>.from(json["dislike_work_env_take_it"]!.map((x) => x)),
        dislikeWorkEnvDontMindIt: json["dislike_work_env_dont_mind_it"] == null ? [] : List<String>.from(json["dislike_work_env_dont_mind_it"]!.map((x) => x)),
        skillsHighlyPreferred: json["skills_highly_preferred"] == null ? [] : List<String>.from(json["skills_highly_preferred"]!.map((x) => x)),
        skillsPreferred: json["skills_preferred"] == null ? [] : List<String>.from(json["skills_preferred"]!.map((x) => x)),
        broadPersonality: json["broad_personality"] == null ? null : BroadPersonality.fromJson(json["broad_personality"]),
        detailedPersonality: json["detailed_personality"] == null ? null : DetailedPersonality.fromJson(json["detailed_personality"]),
        skills: json["skills"] == null ? null : Skills.fromJson(json["skills"]),
        disLikes: json["disLikes"] == null ? null : DisLikes.fromJson(json["disLikes"]),
        mustHaves: json["mustHaves"] == null ? null : MustHaves.fromJson(json["mustHaves"]),
        activities: json["activities"] == null ? null : Activities.fromJson(json["activities"]),
        hollads: json["hollads"] == null ? null : Hollads.fromJson(json["hollads"]),
        traitExplanation: json["traitExplanation"],
        topTwoValues: json["topTwoValues"] == null ? null : TopTwoValues.fromJson(json["topTwoValues"]),
        learnInfo: json["learnInfo"] == null ? null : LearnInfo.fromJson(json["learnInfo"]),
    );

    Map<String, dynamic> toJson() => {
        "user_id": userId,
        "username": username,
        "learn_explanation": learnExplanation,
        "your_must_haves_sentence": yourMustHavesSentence,
        "detailed_interests": detailedInterests,
        "trait_type": traitType,
        "RIASEC": riasec?.toJson(),
        "detailed_interests_sentence": detailedInterestsSentence,
        "must_haves": traitReportModelMustHaves == null ? [] : List<dynamic>.from(traitReportModelMustHaves!.map((x) => x)),
        "top_riasec": topRiasec == null ? [] : List<dynamic>.from(topRiasec!.map((x) => x)),
        "classArray": classArray == null ? [] : List<dynamic>.from(classArray!.map((x) => classArrayValues.reverse[x])),
        "very_interested": veryInterested == null ? [] : List<dynamic>.from(veryInterested!.map((x) => x)),
        "work_activities_sentence": workActivitiesSentence,
        "first_Three_Interests": firstThreeInterests == null ? [] : List<dynamic>.from(firstThreeInterests!.map((x) => x)),
        "interested": interested == null ? [] : List<dynamic>.from(interested!.map((x) => x)),
        "neutral": neutral == null ? [] : List<dynamic>.from(neutral!.map((x) => x)),
        "uninterested": uninterested == null ? [] : List<dynamic>.from(uninterested!.map((x) => x)),
        "your_must_haves": yourMustHaves == null ? [] : List<dynamic>.from(yourMustHaves!.map((x) => x)),
        "yourHaves": yourHaves,
        "important_haves": importantHaves == null ? [] : List<dynamic>.from(importantHaves!.map((x) => x)),
        "neutral_haves": neutralHaves == null ? [] : List<dynamic>.from(neutralHaves!.map((x) => x)),
        "dislike_work_env_take_it": dislikeWorkEnvTakeIt == null ? [] : List<dynamic>.from(dislikeWorkEnvTakeIt!.map((x) => x)),
        "dislike_work_env_dont_mind_it": dislikeWorkEnvDontMindIt == null ? [] : List<dynamic>.from(dislikeWorkEnvDontMindIt!.map((x) => x)),
        "skills_highly_preferred": skillsHighlyPreferred == null ? [] : List<dynamic>.from(skillsHighlyPreferred!.map((x) => x)),
        "skills_preferred": skillsPreferred == null ? [] : List<dynamic>.from(skillsPreferred!.map((x) => x)),
        "broad_personality": broadPersonality?.toJson(),
        "detailed_personality": detailedPersonality?.toJson(),
        "skills": skills?.toJson(),
        "disLikes": disLikes?.toJson(),
        "mustHaves": mustHaves?.toJson(),
        "activities": activities?.toJson(),
        "hollads": hollads?.toJson(),
        "traitExplanation": traitExplanation,
        "topTwoValues": topTwoValues?.toJson(),
        "learnInfo": learnInfo?.toJson(),
    };
}

class Activities {
    List<String>? veryInterested;
    List<String>? interested;
    List<String>? neutral;
    List<String>? uninterested;

    Activities({
        this.veryInterested,
        this.interested,
        this.neutral,
        this.uninterested,
    });

    factory Activities.fromJson(Map<String, dynamic> json) => Activities(
        veryInterested: json["Very Interested"] == null ? [] : List<String>.from(json["Very Interested"]!.map((x) => x)),
        interested: json["Interested"] == null ? [] : List<String>.from(json["Interested"]!.map((x) => x)),
        neutral: json["Neutral"] == null ? [] : List<String>.from(json["Neutral"]!.map((x) => x)),
        uninterested: json["Uninterested"] == null ? [] : List<String>.from(json["Uninterested"]!.map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "Very Interested": veryInterested == null ? [] : List<dynamic>.from(veryInterested!.map((x) => x)),
        "Interested": interested == null ? [] : List<dynamic>.from(interested!.map((x) => x)),
        "Neutral": neutral == null ? [] : List<dynamic>.from(neutral!.map((x) => x)),
        "Uninterested": uninterested == null ? [] : List<dynamic>.from(uninterested!.map((x) => x)),
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
        concernForOthers: json["Concern for Others"],
        dependability: json["Dependability"],
        toleranceOfStressAndCriticism: json["Tolerance of Stress and Criticism"],
    );

    Map<String, dynamic> toJson() => {
        "Leadership": leadership,
        "Concern for Others": concernForOthers,
        "Dependability": dependability,
        "Tolerance of Stress and Criticism": toleranceOfStressAndCriticism,
    };
}

class DisLikes {
    List<String>? takeIt;
    List<String>? donTMindIt;

    DisLikes({
        this.takeIt,
        this.donTMindIt,
    });

    factory DisLikes.fromJson(Map<String, dynamic> json) => DisLikes(
        takeIt: json["Take It"] == null ? [] : List<String>.from(json["Take It"]!.map((x) => x)),
        donTMindIt: json["Don't Mind It"] == null ? [] : List<String>.from(json["Don't Mind It"]!.map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "Take It": takeIt == null ? [] : List<dynamic>.from(takeIt!.map((x) => x)),
        "Don't Mind It": donTMindIt == null ? [] : List<dynamic>.from(donTMindIt!.map((x) => x)),
    };
}

class Hollads {
    int? social;
    int? investigative;
    int? enterprising;
    int? realistic;
    int? artistic;
    int? conventional;

    Hollads({
        this.social,
        this.investigative,
        this.enterprising,
        this.realistic,
        this.artistic,
        this.conventional,
    });

    factory Hollads.fromJson(Map<String, dynamic> json) => Hollads(
        social: json["Social"],
        investigative: json["Investigative"],
        enterprising: json["Enterprising"],
        realistic: json["Realistic"],
        artistic: json["Artistic"],
        conventional: json["Conventional"],
    );

    Map<String, dynamic> toJson() => {
        "Social": social,
        "Investigative": investigative,
        "Enterprising": enterprising,
        "Realistic": realistic,
        "Artistic": artistic,
        "Conventional": conventional,
    };
}

class LearnInfo {
    String? explanation;
    List<String>? detailedInterests;
    List<String>? mustHaves;

    LearnInfo({
        this.explanation,
        this.detailedInterests,
        this.mustHaves,
    });

    factory LearnInfo.fromJson(Map<String, dynamic> json) => LearnInfo(
        explanation: json["Explanation"],
        detailedInterests: json["Detailed Interests"] == null ? [] : List<String>.from(json["Detailed Interests"]!.map((x) => x)),
        mustHaves: json["Must Haves"] == null ? [] : List<String>.from(json["Must Haves"]!.map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "Explanation": explanation,
        "Detailed Interests": detailedInterests == null ? [] : List<dynamic>.from(detailedInterests!.map((x) => x)),
        "Must Haves": mustHaves == null ? [] : List<dynamic>.from(mustHaves!.map((x) => x)),
    };
}

class MustHaves {
    List<String>? veryInterested;
    List<String>? important;
    List<String>? neutral;

    MustHaves({
        this.veryInterested,
        this.important,
        this.neutral,
    });

    factory MustHaves.fromJson(Map<String, dynamic> json) => MustHaves(
        veryInterested: json["Very Interested"] == null ? [] : List<String>.from(json["Very Interested"]!.map((x) => x)),
        important: json["Important"] == null ? [] : List<String>.from(json["Important"]!.map((x) => x)),
        neutral: json["Neutral"] == null ? [] : List<String>.from(json["Neutral"]!.map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "Very Interested": veryInterested == null ? [] : List<dynamic>.from(veryInterested!.map((x) => x)),
        "Important": important == null ? [] : List<dynamic>.from(important!.map((x) => x)),
        "Neutral": neutral == null ? [] : List<dynamic>.from(neutral!.map((x) => x)),
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

class Skills {
    List<String>? highlyPreferred;
    List<String>? preferred;

    Skills({
        this.highlyPreferred,
        this.preferred,
    });

    factory Skills.fromJson(Map<String, dynamic> json) => Skills(
        highlyPreferred: json["Highly Preferred"] == null ? [] : List<String>.from(json["Highly Preferred"]!.map((x) => x)),
        preferred: json["Preferred"] == null ? [] : List<String>.from(json["Preferred"]!.map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "Highly Preferred": highlyPreferred == null ? [] : List<dynamic>.from(highlyPreferred!.map((x) => x)),
        "Preferred": preferred == null ? [] : List<dynamic>.from(preferred!.map((x) => x)),
    };
}

class TopTwoValues {
    int? social;
    int? investigative;

    TopTwoValues({
        this.social,
        this.investigative,
    });

    factory TopTwoValues.fromJson(Map<String, dynamic> json) => TopTwoValues(
        social: json["Social"],
        investigative: json["Investigative"],
    );

    Map<String, dynamic> toJson() => {
        "Social": social,
        "Investigative": investigative,
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
