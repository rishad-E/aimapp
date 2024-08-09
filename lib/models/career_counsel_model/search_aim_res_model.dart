// To parse this JSON data, do
//
//     final searchAimResponseModel = searchAimResponseModelFromJson(jsonString);

// import 'dart:convert';

// SearchAimResponseModel searchAimResponseModelFromJson(String str) => SearchAimResponseModel.fromJson(json.decode(str));

// String searchAimResponseModelToJson(SearchAimResponseModel data) => json.encode(data.toJson());

class SearchAimResponseModel {
    List<Aim>? aims;

    SearchAimResponseModel({
        this.aims,
    });

    factory SearchAimResponseModel.fromJson(Map<String, dynamic> json) => SearchAimResponseModel(
        aims: json["aims"] == null ? [] : List<Aim>.from(json["aims"]!.map((x) => Aim.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "aims": aims == null ? [] : List<dynamic>.from(aims!.map((x) => x.toJson())),
    };
}

class Aim {
    int? id;
    String? name;
    int? parentId;
    int? industryId;
    int? status;
    DateTime? createdAt;
    DateTime? updatedAt;

    Aim({
        this.id,
        this.name,
        this.parentId,
        this.industryId,
        this.status,
        this.createdAt,
        this.updatedAt,
    });

    factory Aim.fromJson(Map<String, dynamic> json) => Aim(
        id: json["id"],
        name: json["name"],
        parentId: json["parent_id"],
        industryId: json["industry_id"],
        status: json["status"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "parent_id": parentId,
        "industry_id": industryId,
        "status": status,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
    };
}
