import 'dart:developer';

import 'package:aimshala/utils/common/constant/api_const.dart';
import 'package:dio/dio.dart';

class GPReportService {
  Dio dio = Dio();

  Future<String?> gpReportSubmit(
      {required String token,
      required String personality,
      required String trait}) async {
    String path = Apis().aimUrl + Apis().gpReport;

    try {
      Response response = await dio.post(
        path,
        data: {"personality": personality, "trait": trait},
        options: Options(
          validateStatus: (status) => status! < 599,
          headers: {'Authorization': 'Bearer $token'},
        ),
      );
      if (response.statusCode == 200) {
        log(response.data.toString(), name: 'gp-report');
        return 'sucess';
      } else if (response.statusCode == 422) {
        log(response.data.toString());
        return 'failed';
      }
    } on DioException catch (e) {
      log(e.toString(), name: 'gp report submit error');
      throw 'exception occured';
    }
    return null;
  }
}
