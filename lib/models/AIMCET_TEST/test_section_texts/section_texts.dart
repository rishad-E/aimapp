// To parse this JSON data, do
//
//     final aimcetSecTexts = aimcetSecTextsFromJson(jsonString);

// import 'dart:convert';

// AimcetSecTexts aimcetSecTextsFromJson(String str) => AimcetSecTexts.fromJson(json.decode(str));

// String aimcetSecTextsToJson(AimcetSecTexts data) => json.encode(data.toJson());

class AimcetSecTexts {
    int? status;
    List<Section>? sections;

    AimcetSecTexts({
        this.status,
        this.sections,
    });

    factory AimcetSecTexts.fromJson(Map<String, dynamic> json) => AimcetSecTexts(
        status: json["Status"],
        sections: json["sections"] == null ? [] : List<Section>.from(json["sections"]!.map((x) => Section.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "Status": status,
        "sections": sections == null ? [] : List<dynamic>.from(sections!.map((x) => x.toJson())),
    };
}

class Section {
    int? id;
    String? name;
    int? lmsId;

    Section({
        this.id,
        this.name,
        this.lmsId,
    });

    factory Section.fromJson(Map<String, dynamic> json) => Section(
        id: json["id"],
        name: json["name"],
        lmsId: json["lms_id"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "lms_id": lmsId,
    };
}
