import 'dart:developer';

import 'package:aimshala/models/career_aim_model/aim_model.dart';
import 'package:aimshala/models/career_aim_model/micro_aim_model.dart';
import 'package:aimshala/utils/common/constant/api_const.dart';
import 'package:dio/dio.dart';

class CareerAimService {
  Dio dio = Dio();

  /*------------ Get Aim service ---------*/
  Future<List<Category>?> getAimService() async {
    String path = Apis().aimUrl + Apis().getAim;

    try {
      Response response = await dio.get(path);
      // log(response.data.toString(), name: 'get aim res');

      List<dynamic> data = response.data['Categories'];

      final res = data.map((e) => Category.fromJson(e)).toList();
      return res;
    } catch (e) {
      log(e.toString(), name: 'get aim error');
    }
    return null;
  }

  /*------------ Get Micro Aim service ---------*/
  Future<List<SubCategory>?> getMicroAim({required String aimId}) async {
    String path = Apis().aimUrl + Apis().getMicroAim;

    try {
      Response response = await dio.post(path, data: {"parent_id": aimId});
      // log(response.data.toString(), name: 'get microaim res');
      List<dynamic> data = response.data['subCategories'];

      final res = data.map((json) => SubCategory.fromJson(json)).toList();
      return res;
    } catch (e) {
      log(e.toString(), name: 'get microaim error');
    }
    return null;
  }
}
