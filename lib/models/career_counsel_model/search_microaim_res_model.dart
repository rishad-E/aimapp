
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
    String? name;
    int? parentId;
    DateTime? createdAt;
    int? lmsId;

    MicroAim({
        this.id,
        this.name,
        this.parentId,
        this.createdAt,
        this.lmsId,
    });

    factory MicroAim.fromJson(Map<String, dynamic> json) => MicroAim(
        id: json["id"],
        name: json["name"],
        parentId: json["parent_id"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        lmsId: json["lms_id"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "parent_id": parentId,
        "created_at": createdAt?.toIso8601String(),
        "lms_id": lmsId,
    };
}