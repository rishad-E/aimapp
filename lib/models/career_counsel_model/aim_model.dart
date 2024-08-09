
// class GetAimResponseModel {
//   List<Category>? categories;

//   GetAimResponseModel({
//     this.categories,
//   });

//   factory GetAimResponseModel.fromJson(Map<String, dynamic> json) =>
//       GetAimResponseModel(
//         categories: json["Categories"] == null
//             ? []
//             : List<Category>.from(
//                 json["Categories"]!.map((x) => Category.fromJson(x))),
//       );

 
// }

// class Category {
//   int? id;
//   String? categoryName;
//   int? parentId;
//   DateTime? createdAt;
//   int? lmsId;

//   Category({
//     this.id,
//     this.categoryName,
//     this.parentId,
//     this.createdAt,
//     this.lmsId,
//   });

//   factory Category.fromJson(Map<String, dynamic> json) => Category(
//         id: json["id"],
//         categoryName: json["category_name"],
//         parentId: json["parent_id"],
//         createdAt: json["created_at"] == null
//             ? null
//             : DateTime.parse(json["created_at"]),
//         lmsId: json["lms_id"],
//       );

  
// }
