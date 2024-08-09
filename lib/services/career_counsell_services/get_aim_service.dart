import 'dart:developer';
import 'package:aimshala/models/career_counsel_model/search_aim_res_model.dart';
import 'package:aimshala/models/career_counsel_model/search_microaim_res_model.dart';
import 'package:aimshala/utils/common/constant/api_const.dart';
import 'package:dio/dio.dart';

class CareerAimService {
  Dio dio = Dio();

  /*------------ Get search Aim result service ---------*/
  Future<List<Aim>> getAimSearchResult({required String query}) async {
    String path = Apis().aimUrl + Apis().searchAim;
    try {
      Response response = await dio.post(
        path,
        data: {"aim_category": query},
        options: Options(
          validateStatus: (status) => status! < 599,
        ),
      );
      // log(response.data.toString(), name: 'search aim res');
      if (response.statusCode == 200) {
        List<dynamic> data = response.data['aims'];
        final res = data.map((json) => Aim.fromJson(json)).toList();
        return res;
      } else {
        return [];
      }
    } catch (e) {
      log(e.toString(), name: 'search aim error');
      return [];
    }
  }

  Future<List<MicroAim>> getMicroAimSearchResult(
      {required String query, required String parentId}) async {
    String path = Apis().aimUrl + Apis().searchMicro;

    try {
      Response response = await dio.post(
        path,
        data: {"micro_aim": query, "parent_id": parentId},
      );
      // log(response.data.toString(), name: 'search micoraim res');
      if (response.statusCode == 200) {
        List<dynamic> data = response.data['Micro Aims'];
        final res = data.map((json) => MicroAim.fromJson(json)).toList();
        return res;
      } else {
        return [];
      }
    } catch (e) {
      log(e.toString(), name: 'search microaim error');
      return [];
    }
  }
}
