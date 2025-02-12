import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:note_app/module/locator/LoginModel.dart';
import 'package:note_app/module/locator/api_service_path.dart';

class ApiService {
  static Future<UserModel?> login(String email, String password) async {
    try {
      final url = Uri.parse(APIServicePath.baseUrl);
      final body = jsonEncode({
        "action": "login",
        "email": email,
        "password": password,
        "token": APIServicePath.token,
      });

      final response = await http.post(
        url,
        headers: {"Content-Type": "application/json"},
        body: body,
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        if (data["success"] == true) {
          return UserModel.fromJson(data["user"]);
        } else {
          throw Exception(data["message"]);
        }
      } else {
        throw Exception("Failed to login: ${response.statusCode}");
      }
    } catch (e) {
      print("Error: $e");
      rethrow;
    }
  }
}
