class PersonalityReportModel {
  String? userId;
  String? username;
  String? learnExplanation;
  List<String>? learnSkills;
  String? showSkills;
  List<String>? learnStrengths;
  String? showStrengths;
  String? personalityType;
  String? personalityDescription;
  List<String>? topSkills;
  List<String>? selectedSkills;
  String? skillsSentence;
  String? careerTendencies;
  String? workingStyle;
  List<String>? strengths;
  List<String>? selectedStrengths;
  String? strengthSentence;
  List<String>? cautiousAreas;
  List<String>? teamInteraction;
  List<String>? personalStyle;
  List<String>? idealWorkEnvironment;
  String? valueOfPersonalityReport;

  PersonalityReportModel({
    this.userId,
    this.username,
    this.learnExplanation,
    this.learnSkills,
    this.showSkills,
    this.learnStrengths,
    this.showStrengths,
    this.personalityType,
    this.personalityDescription,
    this.topSkills,
    this.selectedSkills,
    this.skillsSentence,
    this.careerTendencies,
    this.workingStyle,
    this.strengths,
    this.selectedStrengths,
    this.strengthSentence,
    this.cautiousAreas,
    this.teamInteraction,
    this.personalStyle,
    this.idealWorkEnvironment,
    this.valueOfPersonalityReport,
  });

  factory PersonalityReportModel.fromJson(Map<String, dynamic> json) =>
      PersonalityReportModel(
        userId: json["user_id"],
        username: json["username"],
        learnExplanation: json["learn_explanation"],
        learnSkills: json["learn_skills"] == null
            ? []
            : List<String>.from(json["learn_skills"]!.map((x) => x)),
        showSkills: json["show_skills"],
        learnStrengths: json["learn_strengths"] == null
            ? []
            : List<String>.from(json["learn_strengths"]!.map((x) => x)),
        showStrengths: json["show_strengths"],
        personalityType: json["personality_type"],
        personalityDescription: json["personality_description"],
        topSkills: json["top_skills"] == null
            ? []
            : List<String>.from(json["top_skills"]!.map((x) => x)),
        selectedSkills: json["selected_skills"] == null
            ? []
            : List<String>.from(json["selected_skills"]!.map((x) => x)),
        skillsSentence: json["skills_sentence"],
        careerTendencies: json["career_tendencies"],
        workingStyle: json["working_style"],
        strengths: json["strengths"] == null
            ? []
            : List<String>.from(json["strengths"]!.map((x) => x)),
        selectedStrengths: json["selected_strengths"] == null
            ? []
            : List<String>.from(json["selected_strengths"]!.map((x) => x)),
        strengthSentence: json["strength_sentence"],
        cautiousAreas: json["cautious_areas"] == null
            ? []
            : List<String>.from(json["cautious_areas"]!.map((x) => x)),
        teamInteraction: json["team_interaction"] == null
            ? []
            : List<String>.from(json["team_interaction"]!.map((x) => x)),
        personalStyle: json["personal_style"] == null
            ? []
            : List<String>.from(json["personal_style"]!.map((x) => x)),
        idealWorkEnvironment: json["ideal_work_environment"] == null
            ? []
            : List<String>.from(json["ideal_work_environment"]!.map((x) => x)),
        valueOfPersonalityReport: json["value_of_personality_report"],
      );

  Map<String, dynamic> toJson() => {
        "user_id": userId,
        "username": username,
        "learn_explanation": learnExplanation,
        "learn_skills": learnSkills == null
            ? []
            : List<dynamic>.from(learnSkills!.map((x) => x)),
        "show_skills": showSkills,
        "learn_strengths": learnStrengths == null
            ? []
            : List<dynamic>.from(learnStrengths!.map((x) => x)),
        "show_strengths": showStrengths,
        "personality_type": personalityType,
        "personality_description": personalityDescription,
        "top_skills": topSkills == null
            ? []
            : List<dynamic>.from(topSkills!.map((x) => x)),
        "selected_skills": selectedSkills == null
            ? []
            : List<dynamic>.from(selectedSkills!.map((x) => x)),
        "skills_sentence": skillsSentence,
        "career_tendencies": careerTendencies,
        "working_style": workingStyle,
        "strengths": strengths == null
            ? []
            : List<dynamic>.from(strengths!.map((x) => x)),
        "selected_strengths": selectedStrengths == null
            ? []
            : List<dynamic>.from(selectedStrengths!.map((x) => x)),
        "strength_sentence": strengthSentence,
        "cautious_areas": cautiousAreas == null
            ? []
            : List<dynamic>.from(cautiousAreas!.map((x) => x)),
        "team_interaction": teamInteraction == null
            ? []
            : List<dynamic>.from(teamInteraction!.map((x) => x)),
        "personal_style": personalStyle == null
            ? []
            : List<dynamic>.from(personalStyle!.map((x) => x)),
        "ideal_work_environment": idealWorkEnvironment == null
            ? []
            : List<dynamic>.from(idealWorkEnvironment!.map((x) => x)),
        "value_of_personality_report": valueOfPersonalityReport,
      };
}
