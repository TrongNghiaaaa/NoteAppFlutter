import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:get/get.dart';
import 'package:note_app/config/routes/app_routes.dart';
import 'package:note_app/common/widgets/common_regex.dart';
import 'package:note_app/module/authencation/controller/login_phone_number_controller.dart';
import 'package:note_app/module/home/widget/text_form_field_widget.dart';

import '../controller/login_controller.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final LoginPhoneNumberController ctrl =
        Get.find<LoginPhoneNumberController>();

    final phoneController = TextEditingController();
    final passwordController = TextEditingController();

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 80),
              Text(
                "Đăng nhập",
                style: theme.textTheme.headlineLarge,
              ),
              const Gap(16),
              Text(
                "Ghi lại ý tưởng của bạn",
                style: theme.textTheme.bodyMedium,
              ),
              const Gap(12),
              TextFormFieldWidget(
                  hintText: '0xxxxxxxxx',
                  labelText: "Số điện thoại",
                  keyboardType: TextInputType.phone,
                  controller: phoneController,
                  validator: (v) {
                    if (v == null || v.isEmpty) {
                      if (v == null || v.isEmpty) {
                        return 'Vui lòng nhập số điện thoại';
                      }
                      if (!CommonRegex.phoneRegExp.hasMatch(v)) {
                        return 'Số điện thoại không hợp lệ';
                      }
                      return null;
                    }
                    return null;
                  }),
              const Gap(12),
              TextFormFieldWidget(
                hintText: "********",
                labelText: "Mật khẩu",
                obscureText: true,
                controller: passwordController,
                validator: (v) {
                  if (v == null || v.isEmpty) {
                    return 'Vui lòng nhập mật khẩu';
                  }
                  if (!CommonRegex.passRegExp.hasMatch(v)) {
                    return 'Mật khẩu phải có ít nhất 8 ký tự, bao gồm chữ hoa, chữ thường, số và ký tự đặc biệt';
                  }
                  return null;
                },
              ),
              const Gap(12),
              TextButton(
                onPressed: () => Get.toNamed(Routes.forgotPassword),
                child: Text(
                  'Quên mật khẩu',
                  style: theme.textTheme.bodyMedium!
                      .copyWith(color: theme.colorScheme.onPrimary),
                ),
              ),
              const Gap(40),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: Obx(() {
                  return ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: theme.colorScheme.onPrimary,
                      foregroundColor: theme.colorScheme.primary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        side: BorderSide(
                          color: theme.colorScheme.onPrimary, // màu viền
                          width: 1, // độ dày viền
                        ),
                      ),
                    ),
                    onPressed: ctrl.isLoading.value
                        ? null
                        : () => ctrl.loginAndNavigate(
                              phone: phoneController.text.trim(),
                              password: passwordController.text.trim(),
                            ),
                    child: ctrl.isLoading.value
                        ? CircularProgressIndicator(
                            color: theme.colorScheme.onPrimary)
                        : Text(
                            'Đăng nhập',
                            style: theme.textTheme.labelLarge!
                                .copyWith(color: theme.colorScheme.primary),
                          ),
                  );
                }),
              ),
              const Gap(16),
              Row(
                children: [
                  Expanded(child: Divider(color: theme.dividerColor)),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text('Hoặc', style: theme.textTheme.bodyMedium),
                  ),
                  Expanded(child: Divider(color: theme.dividerColor)),
                ],
              ),
              const Gap(23),
              DecoratedBox(
                decoration: BoxDecoration(
                    color: theme.colorScheme.onPrimary,
                    borderRadius: BorderRadius.circular(8.0),
                    border: Border.all(color: theme.dividerColor)),
                child: SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: OutlinedButton.icon(
                    onPressed: () async {
                      final googleCtrl = Get.put(GoogleAuthController());
                      await googleCtrl.signInWithGoogle();
                      Get.toNamed(Routes.root);
                    },
                    icon: Image.asset('assets/images/icon_gg.png',
                        height: 20, width: 20),
                    label: Text('Đăng nhập bằng Google',
                        style: theme.textTheme.labelLarge!
                            .copyWith(color: theme.colorScheme.primary)),
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(color: theme.dividerColor),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Chưa có tài khoản?",
                      style: theme.textTheme.bodyMedium!),
                  TextButton(
                      onPressed: () => Get.toNamed(Routes.register),
                      child: Text('Đăng ký ngay',
                          style: theme.textTheme.bodyMedium!)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
