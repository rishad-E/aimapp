// class ApiResponse {
//   final Map<String, List<Question>> data;
//   final int indexVal;
//   final int questionAttempt;

//   ApiResponse({
//     required this.data,
//     required this.indexVal,
//     required this.questionAttempt,
//   });

//   factory ApiResponse.fromJson(Map<String, dynamic> json) {
//     // Parse the data section
//     Map<String, dynamic> data = json['data'];
//     Map<String, List<Question>> parsedData = {};
//     data.forEach((key, value) {
//       parsedData[key] =
//           List<Question>.from(value.map((x) => Question.fromJson(x)));
//     });

//     return ApiResponse(
//       data: parsedData,
//       indexVal: json['indexval'],
//       questionAttempt: json['question_attempt'],
//     );
//   }
// }

class Question {
  final int id;
  final int userId;
  final int sectionId;
  final String qualification;
  final String question;
  final String answers;
  final String score;
  final String createdAt;
  final String updatedAt;
  final int lmsId;

  Question({
    required this.id,
    required this.userId,
    required this.sectionId,
    required this.qualification,
    required this.question,
    required this.answers,
    required this.score,
    required this.createdAt,
    required this.updatedAt,
    required this.lmsId,
  });

  factory Question.fromJson(Map<String, dynamic> json) {
    return Question(
      id: json['id'],
      userId: json['user_id'],
      sectionId: json['section_id'],
      qualification: json['qualification'],
      question: json['question'],
      answers: json['answers'],
      score: json['score'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      lmsId: json['lms_id'],
    );
  }
}
