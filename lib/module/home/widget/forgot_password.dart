import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:note_app/core/constant/app_colors.dart';
import 'package:note_app/module/home/ui/login_screen.dart';
import 'package:note_app/module/home/widget/alert_dialog_helper.dart';
import 'package:note_app/module/home/widget/snack_bar_widget.dart';
import 'package:note_app/module/home/widget/text_form_field_widget.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final TextEditingController emailController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.white,
        iconTheme: const IconThemeData(color: AppColors.primarybase),
        title: const Text('Quay lại đăng nhập'),
        titleTextStyle: const TextStyle(
            color: AppColors.primarybase,
            fontSize: 16,
            fontWeight: FontWeight.w500),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Gap(300),
                const Text(
                  "Quên mật khẩu",
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.w700,
                    color: AppColors.black,
                  ),
                ),
                const Gap(16),
                const Text(
                  "Nhập địa chỉ email của bạn để nhận mã tạo mật khẩu mới",
                  style: TextStyle(
                    fontSize: 16,
                    color: AppColors.textColorDarkGrey,
                  ),
                ),
                TextFormFieldWidget(
                  textInputAction: TextInputAction.next,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  hintText: 'Johndoe@gmail.com',
                  labelText: "Địa chỉ Email",
                  keyboardType: TextInputType.emailAddress,
                  controller: emailController,
                  validator: (value) {
                    if (value == null || !value.contains('@')) {
                      return 'Vui lòng nhập địa chỉ email hợp lệ';
                    }
                    return null;
                  },
                ),
                const Gap(32),
                GestureDetector(
                  onTap: () {
                    if (formKey.currentState!.validate()) {
                      showAlertDialog(context, "Thông báo",
                          "Chúc mừng! Bạn đã lấy lại mật khẩu thành công", () {
                        Navigator.of(context).pop();
                      }, () {
                        Navigator.push(
                            context,
                            PageRouteBuilder(
                              pageBuilder:
                                  (context, animation, secondaryAnimation) =>
                                      const LoginScreen(),
                            ));
                      }, "Đóng", "Đi đến đăng nhập");
                    } else {
                      const SnackBarPage();
                    }
                  },
                  child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: AppColors.primarybase),
                      height: 54,
                      width: double.infinity,
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Gap(16),
                          Spacer(),
                          Text(
                            "Gửi mã",
                            style: TextStyle(
                                color: AppColors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w500),
                          ),
                          Spacer(),
                          Icon(
                            Icons.arrow_forward_ios,
                            color: AppColors.white,
                            size: 20,
                          ),
                          Gap(20)
                        ],
                      )),
                ),
                const Gap(32)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
