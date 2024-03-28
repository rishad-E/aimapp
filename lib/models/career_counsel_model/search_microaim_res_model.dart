// To parse this JSON data, do
//     final searchMicroaimResponseModel = searchMicroaimResponseModelFromJson(jsonString);
// import 'dart:convert';
// SearchMicroaimResponseModel searchMicroaimResponseModelFromJson(String str) => SearchMicroaimResponseModel.fromJson(json.decode(str));
// String searchMicroaimResponseModelToJson(SearchMicroaimResponseModel data) => json.encode(data.toJson());

class SearchMicroaimResponseModel {
    List<MicroAim>? microAims;

    SearchMicroaimResponseModel({
        this.microAims,
    });

    factory SearchMicroaimResponseModel.fromJson(Map<String, dynamic> json) => SearchMicroaimResponseModel(
        microAims: json["Micro Aims"] == null ? [] : List<MicroAim>.from(json["Micro Aims"]!.map((x) => MicroAim.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "Micro Aims": microAims == null ? [] : List<dynamic>.from(microAims!.map((x) => x.toJson())),
    };
}

class MicroAim {
    int? id;
    String? categoryName;
    int? parentId;
    DateTime? createdAt;
    int? lmsId;

    MicroAim({
        this.id,
        this.categoryName,
        this.parentId,
        this.createdAt,
        this.lmsId,
    });

    factory MicroAim.fromJson(Map<String, dynamic> json) => MicroAim(
        id: json["id"],
        categoryName: json["category_name"],
        parentId: json["parent_id"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
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
