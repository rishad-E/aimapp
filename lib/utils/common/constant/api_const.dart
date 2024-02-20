class Apis{
  String baseUrlOtp = 'https://api.msg91.com/api/v5/';
  String aimUrl = 'http://154.26.130.161/elearning/api';

  final String getAim = '/get-aims';
  final String getMicroAim = '/get-micro-aims';
  final String searchAim ='/search-aims';
  final String searchMicro ='/search-micro-aims';
  final String getDate = '/get-seven-dates';
  final String getTime = '/get-slots-and-booked';
  final String saveSlote = '/slot';
}


/*  


All Slot API's----

Get Aims(Method-get) -- 
http://154.26.130.161/elearning/api/get-aims

Get Micro Aims(Method-post) -- 
http://154.26.130.161/elearning/api/get-micro-aims
required params -- parent_id

search aims --
http://154.26.130.161/elearning/api/search-aims (post method)
required params -- aim_category

search mircoaims --
http://154.26.130.161/elearning/api/search-micro-aims (post method)
required params -- micro_aim , parent_id

Slot Date Api -- 
http://154.26.130.161/elearning/api/get-seven-dates (get method)

Slot Time Api -- 
http://154.26.130.161/elearning/api/get-slots-and-booked (post method) 
required params -- date (13/02/2024)

Slot save --
http://154.26.130.161/elearning/api/slot (Post method)
required params -- name , email ,phone , appoint_date , appoint_time , role,aim_category

Abhishek sir

 */