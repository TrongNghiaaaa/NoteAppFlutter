import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:intl/intl.dart';
import 'package:note_app/module/locator/api_service_path.dart';

String encodeMD5KeyAPI({String token = APIServicePath.baseUrl}) {
  String currentDate = DateFormat('yyyyMMdd').format(DateTime.now());
  String concatString = currentDate + token;
  var bytes = utf8.encode(concatString);
  return md5.convert(bytes).toString();
}
