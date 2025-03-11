import 'dart:developer';
import 'package:get/get.dart';
import 'package:note_app/common/utils/api_type_enum.dart';
import 'package:note_app/common/utils/encode_md5.dart';
import 'package:note_app/module/locator/api_service_path.dart';

class RegisterService extends GetConnect {
  Future<Map<String, dynamic>> register({
    required String pa,
    required String pa2,
    required String name,
    required String address,
    required String dt,
    required String? dtgt,
    required String? gt,
  }) async {
    final key = encodeMD5KeyAPI();
    final Map<String, dynamic> param = {
      "type": ApiType.signUp.type,
      "key": key,
      "pa": pa,
      "pa2": pa2,
      "te": name,
      "dc": address,
      "gts": gt == "Nam" ? "1" : "2",
      "dtt": dtgt,
      "dt": dt,
    };
    log("signUp param: $param");
    final response = await post(
      APIServicePath.baseUrl,
      param,
      contentType: "application/x-www-form-urlencoded",
    );
    return response.body;
  }
}
