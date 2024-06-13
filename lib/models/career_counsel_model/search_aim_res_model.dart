class SearchAimResponseModel {
  List<Aim>? aims;

  SearchAimResponseModel({
    this.aims,
  });

  factory SearchAimResponseModel.fromJson(Map<String, dynamic> json) =>
      SearchAimResponseModel(
        aims: json["Aims"] == null
            ? []
            : List<Aim>.from(json["Aims"]!.map((x) => Aim.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "Aims": aims == null
            ? []
            : List<dynamic>.from(aims!.map((x) => x.toJson())),
      };
}

class Aim {
  int? id;
  String? categoryName;
  int? parentId;
  DateTime? createdAt;
  int? lmsId;

  Aim({
    this.id,
    this.categoryName,
    this.parentId,
    this.createdAt,
    this.lmsId,
  });

  factory Aim.fromJson(Map<String, dynamic> json) => Aim(
        id: json["id"],
        categoryName: json["category_name"],
        parentId: json["parent_id"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        lmsId: json["lms_id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "category_name": categoryName,
        "parent_id": parentId,
        "created_at": createdAt?.toIso8601String(),
        "lms_id": lmsId,
      };
}
