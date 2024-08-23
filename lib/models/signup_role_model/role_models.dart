
class MainList {
    int? id;
    String? title;
    String? description;
    String? image;
    int? status;
    int? lmsId;
    dynamic updatedAt;
    DateTime? createdAt;

    MainList({
        this.id,
        this.title,
        this.description,
        this.image,
        this.status,
        this.lmsId,
        this.updatedAt,
        this.createdAt,
    });

    factory MainList.fromJson(Map<String, dynamic> json) => MainList(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        image: json["image"],
        status: json["status"],
        lmsId: json["lms_id"],
        updatedAt: json["updated_at"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
        "image": image,
        "status": status,
        "lms_id": lmsId,
        "updated_at": updatedAt,
        "created_at": createdAt?.toIso8601String(),
    };
}

class SubList {
    int? id;
    String? name;
    int? qualificationId;
    int? parentId;
    String? qusType;
    DateTime? createdAt;
    DateTime? updatedAt;
    int? lmsId;

    SubList({
        this.id,
        this.name,
        this.qualificationId,
        this.parentId,
        this.qusType,
        this.createdAt,
        this.updatedAt,
        this.lmsId,
    });

    factory SubList.fromJson(Map<String, dynamic> json) => SubList(
        id: json["id"],
        name: json["name"],
        qualificationId: json["qualification_id"],
        parentId: json["parent_id"],
        qusType: json["qus_type"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        lmsId: json["lms_id"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "qualification_id": qualificationId,
        "parent_id": parentId,
        "qus_type": qusType,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "lms_id": lmsId,
    };
}
