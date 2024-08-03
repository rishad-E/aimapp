// To parse this JSON data, do
//
//     final aimcetReviewData = aimcetReviewDataFromJson(jsonString);

// import 'dart:convert';

// AimcetReviewData aimcetReviewDataFromJson(String str) => AimcetReviewData.fromJson(json.decode(str));

// String aimcetReviewDataToJson(AimcetReviewData data) => json.encode(data.toJson());

class AimcetReviewData {
    List<AlltestReview>? allReviews;

    AimcetReviewData({
        this.allReviews,
    });

    factory AimcetReviewData.fromJson(Map<String, dynamic> json) => AimcetReviewData(
        allReviews: json["allReviews"] == null ? [] : List<AlltestReview>.from(json["allReviews"]!.map((x) => AlltestReview.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "allReviews": allReviews == null ? [] : List<dynamic>.from(allReviews!.map((x) => x.toJson())),
    };
}

class AlltestReview {
    Review? review;
    String? userName;
    String? nameinitials;
    String? timeElapsed;

    AlltestReview({
        this.review,
        this.userName,
        this.nameinitials,
        this.timeElapsed,
    });

    factory AlltestReview.fromJson(Map<String, dynamic> json) => AlltestReview(
        review: json["review"] == null ? null : Review.fromJson(json["review"]),
        userName: json["userName"],
        nameinitials: json["Nameinitials"],
        timeElapsed: json["timeElapsed"],
    );

    Map<String, dynamic> toJson() => {
        "review": review?.toJson(),
        "userName": userName,
        "Nameinitials": nameinitials,
        "timeElapsed": timeElapsed,
    };
}

class Review {
    int? id;
    int? userId;
    int? testId;
    int? ratings;
    String? review;
    DateTime? createdAt;
    DateTime? updatedAt;
    int? lmsId;

    Review({
        this.id,
        this.userId,
        this.testId,
        this.ratings,
        this.review,
        this.createdAt,
        this.updatedAt,
        this.lmsId,
    });

    factory Review.fromJson(Map<String, dynamic> json) => Review(
        id: json["id"],
        userId: json["user_id"],
        testId: json["test_id"],
        ratings: json["ratings"],
        review: json["review"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        lmsId: json["lms_id"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "test_id": testId,
        "ratings": ratings,
        "review": review,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "lms_id": lmsId,
    };
}
