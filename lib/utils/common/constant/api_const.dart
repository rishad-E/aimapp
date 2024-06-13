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

  /*-------- apis for save profile sections */
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
  final String deleteEducations = '/destroy-education';
  final String deleteExperiences = '/destroy-experience';
  final String deleteAwards = '/destroy-award';
  final String deleteLicenses = '/destroy-license';
  final String deletePublications = '/destroy-publication';
  final String deleteSkills = '/destroy-skill';
  final String deleteProjects = '/destroy-project';
  final String deleteLanguages = '/destroy-language';
  final String deleteCourses = '/destroy-course';
  final String deleteVolunteerEX = '/destroy-volunteer-experience';

  final String educator= '/educator';
  final String mentor= '/mentor';
}
