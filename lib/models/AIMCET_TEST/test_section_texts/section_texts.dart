// To parse this JSON data, do
//
//     final aimcetSecTexts = aimcetSecTextsFromJson(jsonString);

// import 'dart:convert';

// AimcetSecTexts aimcetSecTextsFromJson(String str) => AimcetSecTexts.fromJson(json.decode(str));

// String aimcetSecTextsToJson(AimcetSecTexts data) => json.encode(data.toJson());

class AimcetSecTexts {
    int? status;
    List<SectionName>? sections;

    AimcetSecTexts({
        this.status,
        this.sections,
    });

    factory AimcetSecTexts.fromJson(Map<String, dynamic> json) => AimcetSecTexts(
        status: json["Status"],
        sections: json["sections"] == null ? [] : List<SectionName>.from(json["sections"]!.map((x) => SectionName.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "Status": status,
        "sections": sections == null ? [] : List<dynamic>.from(sections!.map((x) => x.toJson())),
    };
}

class SectionName {
    int? id;
    String? name;
    String? parentId;
    String? subSectionCount;
    String? totalQuestion;
    int? status;
    int? lmsId;

    SectionName({
        this.id,
        this.name,
        this.parentId,
        this.subSectionCount,
        this.totalQuestion,
        this.status,
        this.lmsId,
    });

    factory SectionName.fromJson(Map<String, dynamic> json) => SectionName(
        id: json["id"],
        name: json["name"],
        parentId: json["parent_id"],
        subSectionCount: json["sub_section_count"],
        totalQuestion: json["total_question"],
        status: json["status"],
        lmsId: json["lms_id"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "parent_id": parentId,
        "sub_section_count": subSectionCount,
        "total_question": totalQuestion,
        "status": status,
        "lms_id": lmsId,
    };
}

