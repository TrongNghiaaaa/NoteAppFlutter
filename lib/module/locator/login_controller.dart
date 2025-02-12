import 'dart:convert';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:note_app/module/locator/LoginModel.dart';

class LoginController extends GetxController {
  var isLoading = false.obs;
  var userModel = Rx<UserModel?>(null); // Lưu trữ đối tượng UserModel

  // Khởi tạo GetStorage
  final GetStorage _storage = GetStorage();

  // Hàm đăng nhập
  Future<void> login(String username, String password) async {
    isLoading.value = true; // Bắt đầu quá trình đăng nhập

    try {
      final response = await http.post(
        Uri.parse(
            "https://numbala.com/APIs-Views.htm"), // Thay thế bằng URL API thực tế
        body: {
          'username': username,
          'password': password,
          'apiKey': "9ef9f8c45e1e551233dc4c2661080797", // Thêm API_KEY nếu cần
        },
      );

      isLoading.value = false; // Kết thúc quá trình đăng nhập

      // Kiểm tra mã trạng thái từ API
      if (response.statusCode == 200) {
        var data = json.decode(response.body);

        // Kiểm tra lỗi từ API
        if (data['error'] == 0) {
          // Nếu đăng nhập thành công, tạo đối tượng UserModel
          userModel.value = UserModel.fromJson(data['data']);

          // Lưu thông tin người dùng vào GetStorage
          _storage.write('user', userModel.value?.toJson());

          Get.snackbar('Success', 'Login successful');

          // Điều hướng tới màn hình chính
          Get.toNamed('/home');
        } else {
          // Hiển thị thông báo lỗi từ API
          Get.snackbar('Error', data['error_text'] ?? 'An error occurred');
        }
      } else {
        // Hiển thị thông báo lỗi khi phản hồi từ API không phải 200
        Get.snackbar(
            'Error', 'Failed to login. Status code: ${response.statusCode}');
      }
    } catch (e) {
      // Xử lý lỗi khi có sự cố kết nối API
      isLoading.value = false;
      Get.snackbar('Error', 'An error occurred. Please try again.');
    }
  }

  // Hàm kiểm tra nếu người dùng đã đăng nhập hay chưa
  void checkIfUserLoggedIn() {
    var userData = _storage.read('user');
    if (userData != null) {
      userModel.value = UserModel.fromJson(userData);
      // Điều hướng tới màn hình chính nếu đã đăng nhập
      Get.offNamed('/home');
    }
  }

  // Hàm đăng xuất
  void logout() {
    _storage.remove('user'); // Xóa thông tin người dùng khỏi GetStorage
    userModel.value = null;
    Get.snackbar('Logged Out', 'You have been logged out successfully');
    Get.offNamed('/login'); // Điều hướng về màn hình đăng nhập
  }
}
