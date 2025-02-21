import 'dart:developer';
import 'package:get/get.dart';
import 'package:note_app/core/service/client/api_type_enum.dart';
import 'package:note_app/core/service/client/encode_md5.dart';
import 'package:note_app/module/locator/api_service_path.dart';

class LoginService extends GetConnect {
  Future<Map<String, dynamic>> login({
    required String pa,
    required String dt,
  }) async {
    final key = encodeMD5KeyAPI();
    final Map<String, dynamic> param = {
      "type": ApiType.signIn.type,
      "key": key,
      "pa": pa,
      "dt": dt,
    };
    final response = await post(
      APIServicePath.baseUrl,
      param,
      contentType: "application/x-www-form-urlencoded",
    );

    log("Response từ API: ${response.body}");

    return response.body;
  }
}
