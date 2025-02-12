import 'dart:developer';
import 'package:get/get.dart';
import 'package:note_app/core/service/client/register_service.dart';

class RegisterController extends GetxController {
  late final RegisterService _registerService;
  final RxBool isLoading = false.obs; // Trạng thái loading

  @override
  void onInit() {
    super.onInit();
    _registerService = RegisterService();
  }

  // Gửi request đăng ký
  Future<Map<String, dynamic>> register({
    required String fullName,
    required String phone,
    required String password,
    required String confirmPassword,
    required String address,
    required String gender,
    String? referrerPhone,
  }) async {
    isLoading.value = true;
    try {
      final result = await _registerService.register(
        name: fullName,
        dt: phone,
        dtgt: referrerPhone ?? "",
        gt: gender,
        pa: password,
        pa2: confirmPassword,
        address: address,
      );

      return result;
    } catch (e) {
      log("Lỗi đăng ký: $e");
      return {"status": "error", "message": "Có lỗi xảy ra, vui lòng thử lại!"};
    } finally {
      isLoading.value = false;
    }
  }
}
