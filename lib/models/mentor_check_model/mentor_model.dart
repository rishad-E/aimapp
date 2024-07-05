// To parse this JSON data, do
//
//     final mentorRegModel = mentorRegModelFromJson(jsonString);

// import 'dart:convert';

// MentorRegModel mentorRegModelFromJson(String str) => MentorRegModel.fromJson(json.decode(str));

// String mentorRegModelToJson(MentorRegModel data) => json.encode(data.toJson());

class MentorRegModel {
  List<QualificationData>? qualifications;
  List<DegreeData>? degreeData;
  List<RelationData>? relationData;
  dynamic existMentor;

  MentorRegModel({
    this.qualifications,
    this.degreeData,
    this.relationData,
    this.existMentor,
  });

  factory MentorRegModel.fromJson(Map<String, dynamic> json) => MentorRegModel(
        qualifications: json["qualifications"] == null
            ? []
            : List<QualificationData>.from(
                json["qualifications"]!.map((x) => QualificationData.fromJson(x))),
        degreeData: json["degreeData"] == null
            ? []
            : List<DegreeData>.from(
                json["degreeData"]!.map((x) => DegreeData.fromJson(x))),
        relationData: json["relationData"] == null
            ? []
            : List<RelationData>.from(
                json["relationData"]!.map((x) => RelationData.fromJson(x))),
        existMentor: json["existMentor"],
      );


}

class QualificationData {
  int? id;
  String? title;
  String? description;
  String? image;
  int? status;
  int? lmsId;
  dynamic updatedAt;
  DateTime? createdAt;

  QualificationData({
    this.id,
    this.title,
    this.description,
    this.image,
    this.status,
    this.lmsId,
    this.updatedAt,
    this.createdAt,
  });

  factory QualificationData.fromJson(Map<String, dynamic> json) => QualificationData(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        image: json["image"],
        status: json["status"],
        lmsId: json["lms_id"],
        updatedAt: json["updated_at"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
      );


}

class Datum {
  int? id;
  String? name;
  dynamic createdAt;
  dynamic updatedAt;
  int? lmsId;

  Datum({
    this.id,
    this.name,
    this.createdAt,
    this.updatedAt,
    this.lmsId,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        name: json["name"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
        lmsId: json["lms_id"],
      );

}

class DegreeData {
  int? id;
  String? name;
  dynamic createdAt;
  dynamic updatedAt;
  int? lmsId;

  DegreeData({
    this.id,
    this.name,
    this.createdAt,
    this.updatedAt,
    this.lmsId,
  });

  factory DegreeData.fromJson(Map<String, dynamic> json) => DegreeData(
        id: json["id"],
        name: json["name"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
        lmsId: json["lms_id"],
      );

}

class RelationData {
  int? id;
  String? name;
  dynamic createdAt;
  dynamic updatedAt;
  int? lmsId;

  RelationData({
    this.id,
    this.name,
    this.createdAt,
    this.updatedAt,
    this.lmsId,
  });

  factory RelationData.fromJson(Map<String, dynamic> json) => RelationData(
        id: json["id"],
        name: json["name"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
        lmsId: json["lms_id"],
      );

  
}
