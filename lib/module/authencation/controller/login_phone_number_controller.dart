// lib/module/authencation/controller/login_phone_number_controller.dart
import 'dart:developer';
import 'package:get/get.dart';
import 'package:note_app/config/routes/app_routes.dart';
import 'package:note_app/core/service/client/login_service.dart';

import '../../../core/helpers/snackbar_util.dart';

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
  }) async {
    isLoading.value = true;
    try {
      final result = await _loginEmailService.login(
        dt: "0387195509",
        pa: "Nghia1136@",
      );

      if (result['error'] == 0) {
        // Show success snackbar
        SnackbarUtil.showSuccess("Đăng nhập thành công!");

        Get.toNamed(Routes.root);
      } else {
        // Show error snackbar
        SnackbarUtil.showError(
          result['error_text'] ?? "Đăng nhập không thành công!",
        );
      }
    } catch (e) {
      log("Lỗi đăng nhập: $e");
      SnackbarUtil.showError("Có lỗi xảy ra, vui lòng thử lại!");
    } finally {
      isLoading.value = false;
    }
  }
}
