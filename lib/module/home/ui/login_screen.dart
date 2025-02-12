import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:get/get.dart';
import 'package:note_app/core/config/routes.dart';
import 'package:note_app/core/constant/app_colors.dart';
import 'package:note_app/core/constant/common_regex.dart';
import 'package:note_app/module/home/widget/text_form_field_widget.dart';
import 'package:note_app/module/locator/login_controller.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final LoginController loginController = Get.put(LoginController());
    final TextEditingController phoneController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 80),
              const Text(
                "Đăng nhập",
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w700,
                  color: AppColors.black,
                ),
              ),
              const Gap(16),
              const Text(
                "Ghi lại ý tưởng của bạn",
                style: TextStyle(
                  fontSize: 16,
                  color: AppColors.textColorDarkGrey,
                ),
              ),

              const Gap(12),
              TextFormFieldWidget(
                hintText: '0xxxxxxxxx',
                labelText: "Số điện thoại",
                keyboardType: TextInputType.phone,
                controller: phoneController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Vui lòng nhập số điện thoại';
                  }
                  if (!CommonRegex.phoneRegExp.hasMatch(value)) {
                    return 'Số điện thoại không hợp lệ';
                  }
                  return null;
                },
              ),

              TextFormFieldWidget(
                hintText: "********",
                labelText: "Mật khẩu",
                obscureText: true,
                controller: passwordController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Vui lòng nhập mật khẩu';
                  }
                  if (!CommonRegex.passRegExp.hasMatch(value)) {
                    return 'Mật khẩu phải có ít nhất 8 ký tự, bao gồm chữ hoa, chữ thường, số và ký tự đặc biệt';
                  }
                  return null;
                },
              ),

              const Gap(12),
              TextButton(
                onPressed: () {
                  Get.toNamed(Routes.forgotPassword);
                },
                child: const Text(
                  'Quên mật khẩu',
                  style: TextStyle(
                    color: AppColors.primarybase,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const Gap(40),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.purple,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  onPressed: () {
                    String username = phoneController.text.trim();
                    String password = passwordController.text.trim();
                    if (username.isNotEmpty && password.isNotEmpty) {
                      loginController.login(username, password);
                    } else {
                      Get.snackbar(
                          'Lỗi', 'Vui lòng nhập tên đăng nhập và mật khẩu');
                    }
                  },
                  child: Obx(() {
                    return loginController.isLoading.value
                        ? const CircularProgressIndicator(
                            color: Colors.white,
                          )
                        : const Text(
                            'Đăng nhập',
                            style: TextStyle(
                                color: AppColors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w500),
                          );
                  }),
                ),
              ),
              const Gap(16),
              const Row(
                children: [
                  Expanded(
                    child: Divider(color: Color(0xffEFEEF0)),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text(
                      'Hoặc',
                      style: TextStyle(color: AppColors.textColorDarkGrey),
                    ),
                  ),
                  Expanded(
                    child: Divider(color: Color(0xffEFEEF0)),
                  ),
                ],
              ),
              const Gap(23),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: OutlinedButton.icon(
                  onPressed: () {
                    Get.toNamed('/home');
                  },
                  icon: Image.asset(
                    'assets/images/icon_gg.png',
                    height: 20,
                    width: 20,
                  ),
                  label: const Text('Đăng nhập bằng Google'),
                  style: OutlinedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    side: const BorderSide(color: Colors.grey),
                  ),
                ),
              ),
              const SizedBox(height: 16), // Thay Spacer() bằng SizedBox
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Chưa có tài khoản?",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                  ),
                  TextButton(
                    onPressed: () {
                      Get.toNamed(Routes.register);
                    },
                    child: const Text(
                      'Đăng ký ngay',
                      style: TextStyle(
                          color: Colors.blue,
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
