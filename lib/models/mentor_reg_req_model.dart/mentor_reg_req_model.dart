

class MentorRegistrationFormData {
  final String name;
  final String email;
  final String phone;
  final String address;
  final String highDegree;
  final String otherDegree;
  final String experties;
  final String experience;
  final String institute;
  final String earnReward;
  final String earnRewardDes;
  final String preferMode;
  final List<String> mentorField;
  final List<String> specificTopics;
  final List<String> preferDays;
  final List<String> preferTimeslot;
  final List<String> qus;
  final List<String> ans;
  final List<String> refName;
  final List<String> refRelation;
  final List<String> refPhone;
  final List<String?> otherRelation;
  final String linkedInLink;
  final String videoLink;

  MentorRegistrationFormData({
    required this.name,
    required this.email,
    required this.phone,
    required this.address,
    required this.highDegree,
    required this.otherDegree,
    required this.experties,
    required this.experience,
    required this.institute,
    required this.earnReward,
    required this.earnRewardDes,
    required this.preferMode,
    required this.mentorField,
    required this.specificTopics,
    required this.preferDays,
    required this.preferTimeslot,
    required this.qus,
    required this.ans,
    required this.refName,
    required this.refRelation,
    required this.refPhone,
    required this.otherRelation,
    required this.linkedInLink,
    required this.videoLink,
  });

  Map<String, dynamic> toMap() {
    return {
      "name": name,
      "email": email,
      "phone": phone,
      "address": address,
      "high_degree": highDegree,
      "other_degree": otherDegree,
      "expertise": experties,
      "experience": experience,
      "current_employer": institute,
      "earning_rewards": earnReward,
      "earning_award_des": earnRewardDes,
      "prefer_mode": preferMode,
      "mentor_field[]": mentorField,
      "specific_topics[]": specificTopics,
      "prefer_days[]": preferDays,
      "prefer_timeslot[]": preferTimeslot,
      "qus[]": qus,
      "ans[]": ans,
      "ref_name[]": refName,
      "ref_relation[]": refRelation,
      "ref_phone[]": refPhone,
      "other_relation[]": otherRelation,
      "linkedin_link": linkedInLink,
      "video_link": videoLink,
    };
  }
}
