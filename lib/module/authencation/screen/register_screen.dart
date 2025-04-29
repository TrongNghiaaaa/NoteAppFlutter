import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:get/get.dart';
import 'package:note_app/config/routes/app_routes.dart';
import 'package:note_app/common/widgets/common_regex.dart';
import 'package:note_app/module/authencation/controller/register_controller.dart';
import 'package:note_app/module/authencation/screen/login_screen.dart';
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
  final fullNameController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final addressController = TextEditingController();
  final referralPhoneController = TextEditingController();

  String? gender;
  bool showRegisterTitle = false;
  final ScrollController _scrollController = ScrollController();
  final registerTextKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    final box =
        registerTextKey.currentContext?.findRenderObject() as RenderBox?;
    if (box != null) {
      final pos = box.localToGlobal(Offset.zero).dy;
      setState(() => showRegisterTitle = pos <= kToolbarHeight);
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final cs = theme.colorScheme;

    return Scaffold(
      backgroundColor: cs.primary,
      appBar: AppBar(
        backgroundColor: cs.primary,
        iconTheme: IconThemeData(color: cs.onPrimary),
        title: Text(
          "Đăng ký",
          style: theme.textTheme.titleMedium?.copyWith(color: cs.onPrimary),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        controller: _scrollController,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: Form(
          key: formKey,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              "Đăng ký",
              key: registerTextKey,
              style: theme.textTheme.headlineMedium,
            ),
            const Gap(16),
            TextFormFieldWidget(
              hintText: 'Nguyễn Văn A',
              labelText: "Họ và Tên",
              controller: fullNameController,
              validator: (v) => v!.isEmpty ? 'Vui lòng nhập họ và tên' : null,
            ),
            const Gap(12),
            TextFormFieldWidget(
              hintText: '0123456789',
              labelText: "Số điện thoại",
              keyboardType: TextInputType.phone,
              controller: phoneController,
              validator: (v) {
                if (v == null || v.isEmpty)
                  return 'Vui lòng nhập số điện thoại';
                if (!CommonRegex.phoneRegExp.hasMatch(v))
                  return 'Số điện thoại không hợp lệ';
                return null;
              },
            ),
            const Gap(12),
            Text("Giới tính", style: theme.textTheme.bodyMedium),
            const Gap(8),
            DropdownButtonFormField<String>(
              hint: Text("Chọn giới tính",
                  style: theme.textTheme.bodyMedium
                      ?.copyWith(color: cs.onSurface.withOpacity(0.6))),
              decoration: InputDecoration(
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
              ),
              dropdownColor: cs.surface,
              value: gender,
              items: const [
                DropdownMenuItem(value: '1', child: Text("Nam")),
                DropdownMenuItem(value: '2', child: Text("Nữ")),
              ],
              onChanged: (v) => setState(() => gender = v),
              validator: (v) => v == null ? 'Vui lòng chọn giới tính' : null,
            ),
            const Gap(12),
            TextFormFieldWidget(
              hintText: 'Nhập địa chỉ của bạn',
              labelText: "Địa chỉ",
              controller: addressController,
              validator: (v) => v!.isEmpty ? 'Vui lòng nhập địa chỉ' : null,
            ),
            const Gap(12),
            TextFormFieldWidget(
              hintText: "********",
              labelText: "Mật khẩu",
              obscureText: true,
              controller: passwordController,
              validator: (v) {
                if (v == null || v.isEmpty) return 'Vui lòng nhập mật khẩu';
                if (!CommonRegex.passRegExp.hasMatch(v))
                  return 'Mật khẩu phải có ít nhất 8 ký tự, bao gồm chữ hoa, chữ thường, số và ký tự đặc biệt';
                return null;
              },
            ),
            const Gap(12),
            TextFormFieldWidget(
              hintText: "********",
              labelText: "Nhập lại mật khẩu",
              obscureText: true,
              controller: confirmPasswordController,
              validator: (v) =>
                  v != passwordController.text ? 'Mật khẩu không khớp' : null,
            ),
            const Gap(12),
            TextFormFieldWidget(
              hintText: 'Số điện thoại người giới thiệu (Không bắt buộc)',
              labelText: "SĐT người giới thiệu",
              keyboardType: TextInputType.phone,
              controller: referralPhoneController,
            ),
            const Gap(40),
            Obx(() {
              final loading = controller.isLoading.value;
              return SizedBox(
                width: double.infinity,
                height: 54,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        loading ? cs.onSurface.withOpacity(0.3) : cs.onPrimary,
                    foregroundColor: cs.onPrimary,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100)),
                  ),
                  onPressed: loading
                      ? null
                      : () async {
                          if (formKey.currentState!.validate()) {
                            final result = await controller.register(
                              fullName: fullNameController.text,
                              phone: phoneController.text,
                              password: passwordController.text,
                              confirmPassword: confirmPasswordController.text,
                              address: addressController.text,
                              gender: gender!,
                              referrerPhone: referralPhoneController.text,
                            );
                            if (result['error'] == 0) {
                              showAlertDialog(
                                context,
                                "Thông báo",
                                result['error_text'] ?? "Đăng ký thành công!",
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
                  child: loading
                      ? CircularProgressIndicator(color: cs.onPrimary)
                      : Text("Đăng ký",
                          style: theme.textTheme.labelLarge
                              ?.copyWith(color: cs.primary, fontSize: 16)),
                ),
              );
            }),
            const Gap(16),
            TextButton(
              onPressed: () => Get.offAll(() => const LoginScreen()),
              child: Text('Đăng nhập tại đây',
                  style: theme.textTheme.bodyMedium
                      ?.copyWith(color: cs.onPrimary)),
            ),
          ]),
        ),
      ),
    );
  }
}
