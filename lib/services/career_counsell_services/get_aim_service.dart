import 'dart:developer';
import 'package:aimshala/models/career_counsel_model/search_aim_res_model.dart';
import 'package:aimshala/models/career_counsel_model/search_microaim_res_model.dart';
import 'package:aimshala/utils/common/constant/api_const.dart';
import 'package:dio/dio.dart';

class CareerAimService {
  Dio dio = Dio();

  /*------------ Get Aim service ---------*/
  /*------------ not used till now Get Aim service ---------*/
  // Future<List<Category>?> getAimService() async {
  //   String path = Apis().aimUrl + Apis().getAim;
  //   try {
  //     Response response = await dio.get(path);
  //     // log(response.data.toString(), name: 'get aim res');

  //     List<dynamic> data = response.data['Categories'];

  //     final res = data.map((e) => Category.fromJson(e)).toList();
  //     return res;
  //   } catch (e) {
  //     log(e.toString(), name: 'get aim error');
  //   }
  //   return null;
  // }
  /*------------ Get Micro Aim service ---------*/
  /*------------  not used till now   Get Micro Aim service ---------*/
  // Future<List<SubCategory>?> getMicroAim({required String aimId}) async {
  //   String path = Apis().aimUrl + Apis().getMicroAim;

  //   try {
  //     Response response = await dio.post(path, data: {"parent_id": aimId});
  //     // log(response.data.toString(), name: 'get microaim res');
  //     List<dynamic> data = response.data['subCategories'];

  //     final res = data.map((json) => SubCategory.fromJson(json)).toList();
  //     return res;
  //   } catch (e) {
  //     log(e.toString(), name: 'get microaim error');
  //   }
  //   return null;
  // }


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
        List<dynamic> data = response.data['Aims'];
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
