
class SearchMicroaimResponseModel {
    List<MicroAim>? microAims;

    SearchMicroaimResponseModel({
        this.microAims,
    });

    factory SearchMicroaimResponseModel.fromJson(Map<String, dynamic> json) => SearchMicroaimResponseModel(
        microAims: json["Micro Aims"] == null ? [] : List<MicroAim>.from(json["Micro Aims"]!.map((x) => MicroAim.fromJson(x))),
    );

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


}
