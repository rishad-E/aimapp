
class QualificationResponseModel {
    List<Qualification>? qualifications;

    QualificationResponseModel({
        this.qualifications,
    });

    factory QualificationResponseModel.fromJson(Map<String, dynamic> json) => QualificationResponseModel(
        qualifications: json["Qualifications"] == null ? [] : List<Qualification>.from(json["Qualifications"]!.map((x) => Qualification.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "Qualifications": qualifications == null ? [] : List<dynamic>.from(qualifications!.map((x) => x.toJson())),
    };
}

class Qualification {
    int? id;
    String? title;
    String? description;
    String? image;
    int? status;
    DateTime? createdAt;
    DateTime? updatedAt;

    Qualification({
        this.id,
        this.title,
        this.description,
        this.image,
        this.status,
        this.createdAt,
        this.updatedAt,
    });

    factory Qualification.fromJson(Map<String, dynamic> json) => Qualification(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        image: json["image"],
        status: json["status"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
        "image": image,
        "status": status,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
    };
}
