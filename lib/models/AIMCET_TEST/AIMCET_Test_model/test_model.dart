
// class Question {
//   final int id;
//   final int userId;
//   final int sectionId;
//   final String qualification;
//   final String question;
//   final String answers;
//   final String score;
//   final String createdAt;
//   final String updatedAt;
//   final int lmsId;

//   Question({
//     required this.id,
//     required this.userId,
//     required this.sectionId,
//     required this.qualification,
//     required this.question,
//     required this.answers,
//     required this.score,
//     required this.createdAt,
//     required this.updatedAt,
//     required this.lmsId,
//   });

//   factory Question.fromJson(Map<String, dynamic> json) {
//     return Question(
//       id: json['id'],
//       userId: json['user_id'],
//       sectionId: json['section_id'],
//       qualification: json['qualification'],
//       question: json['question'],
//       answers: json['answers'],
//       score: json['score'],
//       createdAt: json['created_at'],
//       updatedAt: json['updated_at'],
//       lmsId: json['lms_id'],
//     );
//   }
// }


class Question {
    int? id;
    int? userId;
    int? sectionId;
    int? subSectionId;
    String? subSection;
    String? qualification;
    String? question;
    String? answers;
    String? score;
    DateTime? createdAt;
    DateTime? updatedAt;
    int? lmsId;

    Question({
        this.id,
        this.userId,
        this.sectionId,
        this.subSectionId,
        this.subSection,
        this.qualification,
        this.question,
        this.answers,
        this.score,
        this.createdAt,
        this.updatedAt,
        this.lmsId,
    });

    factory Question.fromJson(Map<String, dynamic> json) => Question(
        id: json["id"],
        userId: json["user_id"],
        sectionId: json["section_id"],
        subSectionId: json["sub_section_id"],
        subSection: json["sub_section"],
        qualification: json["qualification"],
        question: json["question"],
        answers: json["answers"],
        score: json["score"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        lmsId: json["lms_id"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "section_id": sectionId,
        "sub_section_id": subSectionId,
        "sub_section": subSection,
        "qualification": qualification,
        "question": question,
        "answers": answers,
        "score": score,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "lms_id": lmsId,
    };
}