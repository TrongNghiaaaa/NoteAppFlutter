import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:get/get.dart';
import 'package:note_app/core/config/routes.dart';
import 'package:note_app/core/constant/app_colors.dart';
import 'package:note_app/core/constant/common_regex.dart';
import 'package:note_app/module/home/authencation/register_controller.dart';
import 'package:note_app/module/home/ui/login_screen.dart';
import 'package:note_app/module/home/widget/alert_dialog_helper.dart';
import 'package:note_app/module/home/widget/text_form_field_widget.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});
  static const String routeName = '/register';

  @override
  State<RegisterScreen> createState() => RegisterScreenState();
}

class RegisterScreenState extends State<RegisterScreen> {
  final RegisterController controller = Get.put(RegisterController());
  final formKey = GlobalKey<FormState>();

  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController referralPhoneController = TextEditingController();

  String? gender; // Giới tính (1: Nam, 2: Nữ)
  String appBarTitle = "Quay lại đăng nhập"; // Tiêu đề mặc định
  final ScrollController _scrollController = ScrollController();
  bool showRegisterTitle = false; // Trạng thái hiển thị tiêu đề "Đăng ký"

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    RenderBox? registerTextBox =
        registerTextKey.currentContext?.findRenderObject() as RenderBox?;
    if (registerTextBox != null) {
      double textPosition = registerTextBox.localToGlobal(Offset.zero).dy;
      if (textPosition <= kToolbarHeight) {
        if (!showRegisterTitle) {
          setState(() => showRegisterTitle = true);
        }
      } else {
        if (showRegisterTitle) {
          setState(() => showRegisterTitle = false);
        }
      }
    }
  }

  final GlobalKey registerTextKey = GlobalKey(); // Key cho text "Đăng ký"

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: AppColors.primarybase,
        iconTheme: const IconThemeData(color: AppColors.white),
        title:
            Text(showRegisterTitle ? "Đăng ký  " : "Quay lại trang đăng nhập",
                style: const TextStyle(
                  color: AppColors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                )),
        centerTitle: true,
        titleTextStyle: const TextStyle(
          color: AppColors.white,
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Đăng ký",
                  key: registerTextKey, // Gán key cho Text "Đăng ký"
                  style: const TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.w700,
                    color: AppColors.black,
                  ),
                ),
                const Gap(16),
                TextFormFieldWidget(
                  hintText: 'Nguyễn Văn A',
                  labelText: "Họ và Tên",
                  controller: fullNameController,
                  validator: (value) => value == null || value.isEmpty
                      ? 'Vui lòng nhập họ và tên'
                      : null,
                ),
                TextFormFieldWidget(
                  hintText: '0123456789',
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
                const Gap(12),
                const Text(
                  "Giới tính",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
                const Gap(12),
                DropdownButtonFormField<String>(
                  hint: const Text("Chọn giới tính",
                      style: TextStyle(color: AppColors.textColorBaseGrey)),
                  iconEnabledColor: AppColors.primarybase,
                  iconDisabledColor: AppColors.black,
                  dropdownColor: AppColors.white,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                  )),
                  value: gender,
                  items: const [
                    DropdownMenuItem(value: '1', child: Text("Nam")),
                    DropdownMenuItem(value: '2', child: Text("Nữ")),
                  ],
                  onChanged: (value) => setState(() => gender = value),
                  validator: (value) =>
                      value == null ? 'Vui lòng chọn giới tính' : null,
                ),
                TextFormFieldWidget(
                  hintText: 'Nhập địa chỉ của bạn',
                  labelText: "Địa chỉ",
                  controller: addressController,
                  validator: (value) => value == null || value.isEmpty
                      ? 'Vui lòng nhập địa chỉ'
                      : null,
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
                TextFormFieldWidget(
                  hintText: "********",
                  labelText: "Nhập lại mật khẩu",
                  obscureText: true,
                  controller: confirmPasswordController,
                  validator: (value) => value != passwordController.text
                      ? 'Mật khẩu không khớp'
                      : null,
                ),
                TextFormFieldWidget(
                  hintText: 'Số điện thoại người giới thiệu (Không bắt buộc)',
                  labelText: "SĐT người giới thiệu",
                  keyboardType: TextInputType.phone,
                  controller: referralPhoneController,
                ),
                const Gap(40),
                Obx(() => GestureDetector(
                      onTap: controller.isLoading.value
                          ? null
                          : () async {
                              if (formKey.currentState!.validate()) {
                                final result = await controller.register(
                                  fullName: fullNameController.text,
                                  phone: phoneController.text,
                                  password: passwordController.text,
                                  confirmPassword:
                                      confirmPasswordController.text,
                                  address: addressController.text.isNotEmpty
                                      ? addressController.text
                                      : "",
                                  gender: gender!, // Đã fix lỗi null
                                  referrerPhone:
                                      referralPhoneController.text.isNotEmpty
                                          ? (referralPhoneController.text)
                                          : "",
                                );

                                log("Response sau đăng ký: $result");

                                if (result['error'] == 0) {
                                  showAlertDialog(
                                    context,
                                    "Thông báo",
                                    result['error_text'] ??
                                        "Đăng ký thành công!",
                                    () => Navigator.of(context).pop(),
                                    () => Get.toNamed(Routes.login),
                                    "Đóng",
                                    "Đến đăng nhập",
                                  );
                                } else {
                                  Get.snackbar(
                                    "Lỗi",
                                    result['error_text'] ??
                                        "Đăng ký không thành công!",
                                    backgroundColor: Colors.red,
                                    colorText: Colors.white,
                                  );
                                }
                              }
                            },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: controller.isLoading.value
                              ? Colors.grey
                              : AppColors.primarybase,
                        ),
                        height: 54,
                        width: double.infinity,
                        child: Center(
                          child: controller.isLoading.value
                              ? const CircularProgressIndicator(
                                  color: Colors.white)
                              : const Text(
                                  "Đăng ký",
                                  style: TextStyle(
                                      color: AppColors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500),
                                ),
                        ),
                      ),
                    )),
                const Gap(16),
                TextButton(
                  onPressed: () => Get.offAll(() => const LoginScreen()),
                  child: const Text('Đăng nhập tại đây'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
