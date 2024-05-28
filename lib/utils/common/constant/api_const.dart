class Apis {
  String baseUrlOtp = 'https://api.msg91.com/api/v5/';
  String aimUrl = 'http://154.26.130.161/elearning/api';

  final String getAim = '/get-aims';
  final String getMicroAim = '/get-micro-aims';
  final String searchAim = '/search-aims';
  final String searchMicro = '/search-micro-aims';
  final String getDate = '/get-seven-dates';
  final String getTime = '/get-slots-and-booked';
  final String saveSlote = '/slot';
  final String qualificationapi = "/get-qualification";
  final String aimcetTest = '/take-test';
  final String sumbitTest = '/submit-test';
  final String careerresultsubmit = '/career-result';
  final String aimcetResult = '/test-result';
  final String gpReport = '/gp-report';
  final String personalityReport = '/personality-report';
  final String traitReport = '/trait-report';
  final String checkAimcet = '/test-check';
  final String checkCounsellcall = '/slot-check';
  final String savepersonalInfo = '/add-personal-info';
  final String saveContactInfo = '/add-contact-info';
  final String saveEducation = '/add-education';
  final String saveExperience = '/add-experience';
  final String saveHonorAwards = '/add-awards';
  final String saveLicense = '/add-license-certificate';
  final String savePublication = '/add-publications';
  final String saveProject = '/add-project';
  final String saveLanguage = '/add-language';
  final String saveVolunteer = '/add-volunteer-experience';
  final String saveCourse = '/add-courses';
  final String suggestedSkills = '/skills-suggestions';
  final String getProfileAlldata = '/get-user-info';
  final String saveSkill = '/add-skills';
  final String updateProfilePic = "/add-profile";
  final String getCountryStates = '/get-countries-states';
  final String getCities = '/get-cities';

  /*-------- apis for delete sections */
  final String deleteProfilePic = '/remove-profile';


  /*
  http://154.26.130.161/elearning/api/destroy-publication -- publication_id
  http://154.26.130.161/elearning/api/destroy-language -- language_id
  http://154.26.130.161/elearning/api/destroy-course -- course_id
  http://154.26.130.161/elearning/api/destroy-skill -- skill_id
  http://154.26.130.161/elearning/api/destroy-education -- education_id
  http://154.26.130.161/elearning/api/destroy-experience --  experience_id
  http://154.26.130.161/elearning/api/destroy-award -- award_id
  http://154.26.130.161/elearning/api/destroy-project -- peoject_id
  http://154.26.130.161/elearning/api/destroy-license -- license_id
  http://154.26.130.161/elearning/api/destroy-volunteer-experience -- volunteer_experience_id
  http://154.26.130.161/elearning/api/remove-profile -- user_id

  POST Method in all apis

  */
}
