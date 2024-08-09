
// class GetMicroAimResponseModel {
//     List<SubCategory>? subCategories;

//     GetMicroAimResponseModel({
//         this.subCategories,
//     });

//     factory GetMicroAimResponseModel.fromJson(Map<String, dynamic> json) => GetMicroAimResponseModel(
//         subCategories: json["subCategories"] == null ? [] : List<SubCategory>.from(json["subCategories"]!.map((x) => SubCategory.fromJson(x))),
//     );

// }

// class SubCategory {
//     int? id;
//     String? categoryName;
//     int? parentId;
//     DateTime? createdAt;
//     int? lmsId;

//     SubCategory({
//         this.id,
//         this.categoryName,
//         this.parentId,
//         this.createdAt,
//         this.lmsId,
//     });

//     factory SubCategory.fromJson(Map<String, dynamic> json) => SubCategory(
//         id: json["id"],
//         categoryName: json["category_name"],
//         parentId: json["parent_id"],
//         createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
//         lmsId: json["lms_id"],
//     );

//     // Map<String, dynamic> toJson() => {
//     //     "id": id,
//     //     "category_name": categoryName,
//     //     "parent_id": parentId,
//     //     "created_at": createdAt?.toIso8601String(),
//     //     "lms_id": lmsId,
//     // };
// }
