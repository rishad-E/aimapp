import 'dart:developer';

import 'package:aimshala/models/AIMCET_TEST/AIMCET_qualification/qualification_model.dart';
import 'package:aimshala/utils/common/constant/api_const.dart';
import 'package:dio/dio.dart';

class AIMCETQualificationService{
  Dio dio = Dio();
  Future<List<Qualification>>fetchQualification() async{
    String path = Apis().aimUrl +Apis().qualificationapi;

    try {
    Response response = await dio.get(path);
      List<dynamic> data = response.data['Qualifications'];
      final res = data.map((e) => Qualification.fromJson(e)).toList();

      log(res.toString(),name: 'qualifications');
      return res;
    } catch (e) {
      log(e.toString(),name: 'get qualification error');
    }
    return [];
  }
}