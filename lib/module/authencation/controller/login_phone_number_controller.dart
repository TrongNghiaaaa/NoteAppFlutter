import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:note_app/config/routes/app_routes.dart';
import 'package:note_app/core/service/client/login_service.dart';
import 'package:note_app/module/home/widget/alert_dialog_helper.dart';

class LoginPhoneNumberController extends GetxController {
  late final LoginService _loginEmailService;
  final RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    _loginEmailService = LoginService();
  }

  Future<void> loginAndNavigate({
    required String password,
    required String phone,
    required BuildContext context,
  }) async {
    isLoading.value = true;
    try {
      final result = await _loginEmailService.login(
        dt: phone,
        pa: password,
      );

      if (result['error'] == 0) {
        await showAlertDialog(
          context,
          "Thông báo",
          result['error_text'] ?? "Đăng nhập thành công!",
          () => Get.back(),
          () => Get.toNamed(Routes.appbar),
          "Đến trang chủ",
          "Đóng",
        );
      } else {
        showErrorSnackbar(
            result['error_text'] ?? "Đăng nhập không thành công!");
      }
    } catch (e) {
      log("Lỗi đăng nhập: $e");
      showErrorSnackbar("Có lỗi xảy ra, vui lòng thử lại!");
    } finally {
      isLoading.value = false;
    }
  }

  void showErrorSnackbar(String message) {
    Get.snackbar("Lỗi", message,
        backgroundColor: Colors.red,
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM);
  }
}
